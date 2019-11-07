create_project project_1 /tmp/uvm_example/vivado/project_1 -part xc7z020clg484-1
add_files -norecurse /tmp/uvm_example/design/design.sv
update_compile_order -fileset sources_1
set_property -name {xsim.compile.xvlog.more_options} -value {-L uvm} -objects [get_filesets sim_1]
set_property -name {xsim.elaborate.xelab.more_options} -value {-L uvm} -objects [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {} -objects [get_filesets sim_1]
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse /tmp/uvm_example/dv/testbench.sv
update_compile_order -fileset sim_1
launch_simulation
source test.tcl
run all
close_sim
exit
