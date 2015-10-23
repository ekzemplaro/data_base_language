#! /usr/bin/tclsh8.5
#
#	show_xml.tcl
#
#					Feb/16/2012
#
# ---------------------------------------------------------------
package require xml
#
# ---------------------------------------------------------------
proc clearlog {} { set fout [open "/tmp/tclxml.log" w]; close $fout }
# ---------------------------------------------------------------
proc loglog msg {
    set fout [open "/tmp/tclxml.log" a]
    puts $fout $msg; close $fout
}

# ---------------------------------------------------------------
proc estartCmd {hvar ename args} {
    upvar $hvar h
    lappend h $ename
    loglog "ESTART: $ename / $args"
	if {$ename != "name"} {
		if {$ename != "population"} {
			if {$ename != "date_mod"} {
#				if {$ename != "root"} {
#			puts -nonewline "$ename\t"
#				}
			}
		}
	}
}

# ---------------------------------------------------------------
proc eendCmd {hvar ename args} {
    upvar $hvar h
    set h [lreplace $h end end]
    loglog "EEND: $ename / $args"
	set hantei [string compare $ename "date_mod"]
#	if {! $hantei} {
#	puts	""
#	puts $rr
#	}
}

# ---------------------------------------------------------------
proc cdataCmd {hvar data } {
	upvar $hvar hh
	global	dict_aa

	if {[string length [string trim $data]] > 0} {
		loglog "CDATA: $data"
#		set elementPath [join $hh .]
#		set llx  [string length $data]
#
	set ll [llength $hh]
	set key [lindex $hh [expr $ll - 2]]
	set tag [lindex $hh [expr $ll - 1]]
	if {[dict exists $dict_aa $key]} {
		set unit_aa [dict get $dict_aa $key]
	} else {
		set unit_aa [dict create] }

	dict set unit_aa $tag $data
	dict set dict_aa $key $unit_aa
	}
}
# ---------------------------------------------------------------
proc defaultCmd {args} { puts "DEFAULT: $args" }
#
# ---------------------------------------------------------------
