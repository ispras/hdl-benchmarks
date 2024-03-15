# hdl-benchmarks

Collection of HDL modules, subsystems and microprocessors (benchmarks)
that are used for related tools testing.

## Structure

The project has the following catalog structure:

 - `bash` - Bash scripts directory
 - `hdl` - HDL benchmarks directory
   - `iscas85` - ISCAS'85 benchmarks
   - `iwls05` - IWLS'2005 benchmarks
   - `lgsynth91` - LGSynth'1991 benchmarks
   - `mcnc` - MCNC'91 benchmarks
   - `quip` - Quartus University Interface Program (QUIP) benchmarks
   - `texas97` - Texas-97 benchmarks
   - `vcegar` - VCEGAR benchmarks
   - `verilog2smv` - Verilog2SMV benchmarks

## Benchmarks

The following public benchmarks are updated (several bugs and formatting issues
are fixed) and are used in this project:

 - [ISCAS'85 benchmarks](https://sportlab.usc.edu/~msabrishami/benchmarks.html) was proposed
 by M. Hansen, H. Yalcin, and J. P. Hayes, at the paper "Unveiling the ISCAS-85 Benchmarks:
 A Case Study in Reverse Engineering," IEEE Design and Test, vol. 16, no. 3, pp. 72-80, July-Sept. 1999.
 The current version was published by [SPORT Lab, University of Southern California](https://sportlab.usc.edu/~msabrishami/benchmarks.html).

 - [IWLS 2005 benchmarks](https://iwls.org/iwls2005/benchmarks.html) were collected
 by Christoph Albrecht, Cadence Research Laboratories at [Berkeley](https://www.berkeley.edu/)
 in June 2005 for the sake of [IWLS](iwls.org) conference;

 - [LGSynth'91 benchmarks](https://ddd.fit.cvut.cz/www/prj/Benchmarks/LGSynth91.7z) (sometimes
 called as IWLS'91) is a collection of examples used in conjunction with the 1991
 Microelectronics Center of North Carolina (MCNC) International Workshop on Logic Synthesis
 and the extension of the 1989 Logic Synthesis and Optimization Benchmarks User Guide, that were
 collected by [Petr Fišer](https://ddd.fit.cvut.cz/www/prj/Benchmarks/index.php?page=contact),
 Czech Technical University in Prague;

 - [MCNC benchmarks](https://ddd.fit.cvut.cz/www/prj/Benchmarks/MCNC.7z) were published
 for Microelectronics Center of North Carolina (MCNC) International Workshop on Logic Synthesis,
 1991, and were collected by [Petr Fišer](https://ddd.fit.cvut.cz/www/prj/Benchmarks/index.php?page=contact),
 Czech Technical University in Prague;

 - [QUIP benchmarks](https://github.com/neilisaac/ece496/tree/master/reference/quip_toolkit-9.0/benchmarks)
 were developed in Altera (now [Intel](https://www.intel.com/content/www/us/en/homepage.html))
 company as a part of freely distributed [QUIP toolkit](https://github.com/neilisaac/ece496/tree/master/reference/quip_toolkit-9.0);

 - [Texas-97 Benchmarks](https://ptolemy.berkeley.edu/projects/embedded/research/vis/texas-97)
 were developed at the [University of Texas](https://www.utexas.edu/) as a part
 of the formal verification course of Dr. Adnan Aziz;

 - [VCEGAR Benchmarks](http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz)
 were developed at the [University of Oxford](http://www.ox.ac.uk/) by the system
 verification team led by Daniel Kroening as a test suite for the VCEGAR
 (now [EBMC](http://www.cprover.org/ebmc/)) tool;

 - [Verilog2SMV Benchmarks](https://es-static.fbk.eu/tools/verilog2smv/dload/date2016-experiments.tar.bz2)
 were developed at the [Bruno Kessler Foundation](https://www.fbk.eu/en/) by a team
 of researchers as a test suite for the [Verilog2SMV](https://es-static.fbk.eu/tools/verilog2smv/) tool.

Several benchmarks are included as submodules:

 - [EPFL benchmarks](https://www.epfl.ch/labs/lsi/page-102566-en-html/benchmarks)
 were developed at [École Polytechnique Fédérale de Lausanne](https://www.epfl.ch/en/)
 and consist of 23 natively combinational circuits designed to challenge
 modern logic optimization tools. The benchmark suite is divided into arithmetic,
 random/control and MtM (More than ten Milion gates) parts. Each circuit
 is distributed in Verilog, VHDL, BLIF and AIGER formats.
