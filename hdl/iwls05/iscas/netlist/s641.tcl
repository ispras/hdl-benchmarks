set_attr max_print 1 VLOGPT/VLOGPT-35

set_attribute library ../../library/GSCLib_3.0.lib
set inv_out INVX2/Y

load ../rtl/s641.v
elaborate

redirect /dev/null {
  set clock [define_clock -p 0 -n clock [clock_ports]]
  external_delay -i 0 -c $clock /designs/*/ports_in/*
  external_delay -o 0 -c $clock /designs/*/ports_out/*
  if {[info exists std_load]} {
    set_attr external_wire_cap [expr 6 * $std_load] /des*/*/ports_out/*
  }

  set allins [find / -port ports_in/*]
  set clks [lsearch -glob $allins [clock_ports]]
  set noclksin [lreplace $allins $clks $clks]
  set_attr external_driver $inv_out $noclksin
}

set errorInfo ""

ungroup -flatten -all

synthesize -to_mapped -effort low
synthesize -incremental -effort high

report timing
report gates

write -mapped > s641.v

quit
