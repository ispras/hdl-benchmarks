# hdl-benchmarks

Collection of HDL modules, subsystems and microprocessors (benchmarks)
that are used for related tools testing.

## Structure

The project has the following catalog structure:

 - `bash` - Bash scripts directory
 - `hdl` - HDL benchmarks directory
   - `iwls05` - IWLS'2005 benchmarks
   - `quip` - Quartus University Interface Program (QUIP) benchmarks
   - `texas97` - Texas-97 benchmarks
   - `vcegar` - VCEGAR benchmarks
   - `verilog2smv` - Verilog2SMV benchmarks

## Benchmarks

The following public benchmarks are updated (several bugs and formatting issues
are fixed) and are used in this project:

 - [IWLS 2005 benchmarks](https://iwls.org/iwls2005/benchmarks.html) are collected
 by Christoph Albrecht, Cadence Research Laboratories at [Berkeley](https://www.berkeley.edu/)
 in June 2005 for the sake of [IWLS](iwls.org) conference;

 - [QUIP benchmarks](https://github.com/neilisaac/ece496/tree/master/reference/quip_toolkit-9.0/benchmarks) are developed in Altera (now [Intel](https://www.intel.com/content/www/us/en/homepage.html))
 company as a part of freely distributed [QUIP toolkit](https://github.com/neilisaac/ece496/tree/master/reference/quip_toolkit-9.0);

 - [Texas-97 Benchmarks](https://ptolemy.berkeley.edu/projects/embedded/research/vis/texas-97)
 are developed at the [University of Texas](https://www.utexas.edu/) as a part
 of the formal verification course of Dr. Adnan Aziz;

 - [VCEGAR Benchmarks](http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz)
 are developed at the [University of Oxford](http://www.ox.ac.uk/) by the system
 verification team led by Daniel Kroening as a test suite for the VCEGAR
 (now [EBMC](http://www.cprover.org/ebmc/)) tool;

 - [Verilog2SMV Benchmarks](https://es-static.fbk.eu/tools/verilog2smv/dload/date2016-experiments.tar.bz2)
 are developed at the [Bruno Kessler Foundation](https://www.fbk.eu/en/) by a team
 of researchers as a test suite for the [Verilog2SMV](https://es-static.fbk.eu/tools/verilog2smv/) tool.
