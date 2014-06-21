#! /usr/bin/gst
"	json_create.st				"
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
	delimit := arr at: 5.

	ttx := String with: Character tab.
	ttz := String with: Character nl.

	str_out := '"', key, '":', 
		'{"name": "' , name, '",' ,
		'"population": ' , population, ',' ,
		'"date_mod": "' , date_mod, '"}' , delimit.
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
file nextPutAll: '{'; nl.
record_out_proc value: #('t0921' '宇都宮' '46912' '1965-11-15' ',').
record_out_proc value: #('t0922' '小山' '15438' '1965-9-21' ',').
record_out_proc value: #('t0923' '佐野' '92361' '1965-4-8' ',').
record_out_proc value: #('t0924' '足利' '75832' '1965-3-12' ',').
record_out_proc value: #('t0925' '日光' '54298' '1965-1-20' ',').
record_out_proc value: #('t0926' '下野' '98136' '1965-5-24' ',').
record_out_proc value: #('t0927' 'さくら' '35672' '1965-8-21' ',').
record_out_proc value: #('t0928' '矢板' '19823' '1965-9-16' ',').
record_out_proc value: #('t0929' '真岡' '45276' '1965-10-8' ',').
record_out_proc value: #('t0930' '栃木' '82561' '1965-3-12' ',').
record_out_proc value: #('t0931' '大田原' '61527' '1965-4-26' ',').
record_out_proc value: #('t0932' '鹿沼' '47852' '1965-7-8' ',').
record_out_proc value: #('t0933' '那須塩原' '39156' '1965-8-9' ',').
record_out_proc value: #('t0934' '那須烏山' '61592' '1965-2-14' '}').

file close.
Transcript show: '*** 終了 ***'; nl.
" ---------------------------------------------	"
