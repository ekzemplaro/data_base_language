#
#	mcached_manipulate.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
proc mcached_set_proc {io key value} {
	set llx [string bytelength $value]
	puts $llx
	puts $value
	set command [join [list "set " $key " 0 0 " $llx] {}]
	puts $command
	puts $io $command
	puts $io $value
	flush $io
	set res [gets $io]
	puts $res
}
# ---------------------------------------------------------------
