#!/bin/bash

#
# Copyright 2019 ISP RAS (http://www.ispras.ru), UniTESK Lab (http://www.unitesk.com)
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#

# This script recursively walks through sub-directories
# of the current one and runs Yosys-SMTBMC on every Verilog module.
#
# Author: Sergey Smolov (smolov@ispras.ru)
#

# Executes command with a timeout
# Params:
#   $1 timeout in seconds
#   $2 command
# Returns 1 if timed out 0 otherwise
timeout() {

  time=$1

  # start the command in a subshell to avoid problem with pipes
  # (spawn accepts one command)
  command="/bin/sh -c \"$2\""

  expect -c "set echo \"-noecho\"; set timeout $time; spawn -noecho $command; expect timeout { exit 1 } eof { exit 0 }"

  if [ $? = 1 ] ; then
    printf "\nTimeout after ${time} second(s)\n"
  fi
}

# 1 hour timeout
TIMEOUT_SEC=3600

VLOG_EXT="*.v"

if [ -z "${SBY_HOME}" ]; then
  echo "Error: SBY_HOME env variable is not set!"
  exit -1
fi

NAME="sby"
TOOL="${SBY_HOME}"/"${NAME}"

if [ ! -e "${TOOL}" ]; then
  echo "Error: no '${TOOL}' found at SBY_HOME directory!"
  exit -1
fi

# Run sby on every Verilog module
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
VLOG_DIR="${PWD}"

FIND_VLOG=`find "${VLOG_DIR}" -type f -name "${VLOG_EXT}"`

if [ -n "${FIND_VLOG}" ]; then
  for f in ${FIND_VLOG}; do
    printf "\nStart elaboration of ${f} ... \n"
    printf "Start time: $(date +"%x %r")\n"

    eval "file_name_with_ext=${f##*/}"
    eval "file_name=${file_name_with_ext%.*}"
    printf "Filename: ${file_name}\n"
    file_path="$(dirname "${f}")"
    sby_file="${file_path}"/"${file_name}".sby
    
    if [ -f "${sby_file}" ]; then
      printf "Use the generated SBY file.\n"
      #timeout ${TIMEOUT_SEC} "${TOOL} -t ${sby_file}"
    else

      # Get first module name
      while read -r line
      do
        if [[ $line == "module"* ]]; then
          echo "\"${line}\""
          top_name=$(echo "${line}" | sed -n 's/^module \([a-zA-Z0-9_]*\)[ |(||;].*$/\1/p')
          echo "Top name: \"${top_name}\""

          if [[ -z "${top_name}" ]]; then
            echo "Error: top level module name is empty!"
            break
          fi

          echo "${file_path}"
          cat > "${sby_file}" << EOF
[options]
mode bmc
depth 100

[engines]
smtbmc

[script]
read -formal ${f}
prep -top ${top_name}

[files]
${f}
EOF
          break
        fi

      done < "${f}"

      #timeout ${TIMEOUT_SEC} "${TOOL} -t ${sby_file}"

    fi
    printf "Stop time: $(date +"%x %r")\n"
    printf "done.\n"
  done
else
  echo "No Verilog modules have been found."
fi
