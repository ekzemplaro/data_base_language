#! /usr/bin/gst
"	text.create.st				"
"						"
"			Aug/30/2013		"
" ---------------------------------------------	"
record_out_proc :=
	[:arr |
	key := arr at: 1.
	name := arr at: 2.
	population := arr at: 3.
	date_mod := arr at: 4.
	ttx := String with: Character tab.
	str_out := key, ttx, name, ttx, population, ttx, date_mod.
	Transcript show: str_out;nl.
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
record_out_proc value: #('t2381' '名古屋' '46815' '1965-4-15').
record_out_proc value: #('t2382' '豊橋' '85132' '1965-2-21').
record_out_proc value: #('t2383' '岡崎' '92367' '1965-8-8').
record_out_proc value: #('t2384' '一宮' '15872' '1965-3-12').
record_out_proc value: #('t2385' '蒲郡' '54198' '1965-1-20').
record_out_proc value: #('t2386' '常滑' '98436' '1965-5-24').
record_out_proc value: #('t2387' '大府' '35672' '1965-8-21').
record_out_proc value: #('t2388' '瀬戸' '19823' '1965-9-16').
record_out_proc value: #('t2389' '犬山' '45718' '1965-10-8').

file close.
Transcript show: '*** 終了 ***'; nl.
" ---------------------------------------------	"
