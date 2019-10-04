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

# This script iterates over SMV models
# and runs NuSMV on them.
#
# Author: Sergey Smolov (smolov@ispras.ru)
#

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

EXT="*.smv"

if [ -z "${MC_PATH}" ]; then
  echo "Error: MC_PATH env variable is not set!"
  exit -1
fi

NAME="NuSMV"
TOOL="${MC_PATH}"/"${NAME}"

if [ ! -e "${TOOL}" ]; then
  echo "Error: no '${TOOL}' found at MC_HOME directory!"
  exit -1
fi

# Run NuSMV on every SMV module
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

FIND=`find "${SCRIPT_DIR}" -type f -name "${EXT}"`

if [ -n "${FIND}" ]; then
  for f in ${FIND}; do
    printf "\nStart elaboration of ${f} ... \n"
    printf "Start time: $(date +"%x %r")\n"


    timeout ${TIMEOUT_SEC} "${TOOL} -source ${SCRIPT_DIR}/smv_commands.txt ${f}"
    printf "Stop time: $(date +"%x %r")\n"
    printf "done."
  done
else
  echo "No SMV modules have been found."
fi
