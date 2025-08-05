# Hard block instantiations

This test suite comprises of a set of tests written on Verilog which use hard
block instantiations (both defined and undefined). Top modules named
hard_block_(un)known_use(_cat) instantiates hard_block_(un)known module. Top
modules named hard_block_(un)known_use_part_con instantiates
hard_block_(un)known and partially connects it. If a hard_block is known the
file has to be included among the source files. File `hard_block_sim_model.v` is
needed for the further simulation.
