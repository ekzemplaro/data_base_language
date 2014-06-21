#! /usr/bin/gst
"	xml.create.st				"
"						"
"			Aug/30/2013		"
" ---------------------------------------------	"
|record_out_proc key name population date_mod str_out ttx ttz|
record_out_proc :=
	[:arr |
	key := arr at: 1.
	name := arr at: 2.
	population := arr at: 3.
	date_mod := arr at: 4.

	ttx := String with: Character tab.
	ttz := String with: Character nl.

	str_out := '<', key, '>', ttz ,
		'<name>' , name, '</name>' ,
		'<population>' , population, '</population>' ,
		'<date_mod>' , date_mod, '</date_mod>' ,
		ttz, '</', key, '>'.
Transcript show: key,ttx.
Transcript show: name,ttx.
Transcript show: population,ttx.
Transcript show: date_mod;nl.
	file nextPutAll: str_out; nl.
	].

" ---------------------------------------------	"
file_out := Smalltalk getArgv: 1.
Transcript show: file_out;nl.
| file |
file := FileStream open: file_out mode: FileStream write.
Transcript show: '*** 開始 ***'; nl.
Transcript show: Date today printString; nl.
ttx := String with: Character tab.
file nextPutAll: '<?xml version="1.0"?>'; nl.
file nextPutAll: '<root>'; nl.
record_out_proc value: #('t2261' '静岡' '46217' '1965-10-15').
record_out_proc value: #('t2262' '浜松' '85934' '1965-9-21').
record_out_proc value: #('t2263' '沼津' '92365' '1965-8-8').
record_out_proc value: #('t2264' '三島' '15832' '1965-3-12').
record_out_proc value: #('t2265' '富士' '54198' '1965-1-20').
record_out_proc value: #('t2266' '熱海' '98436' '1965-5-24').
record_out_proc value: #('t2267' '富士宮' '35672' '1965-8-21').
record_out_proc value: #('t2268' '藤枝' '19823' '1965-9-16').
record_out_proc value: #('t2269' '御殿場' '45276' '1965-10-8').
record_out_proc value: #('t2270' '島田' '82561' '1965-3-12').
file nextPutAll: '</root>'; nl.

file close.
Transcript show: '*** 終了 ***'; nl.
" ---------------------------------------------	"
