# Hard block instantiations

This test suite comprises of a set of tests written on Verilog which use hard
block instantiations (both defined and undefined). Top modules named
hard_block_(un)known_use(_cat) instantiates hard_block_(un)known module. If a
hard_block is known the file has to be included among the source files. Files
`hard_block_known_sim_model.v` & `hard_block_unknown_sim_model.v` are needed for
the further simulation.
