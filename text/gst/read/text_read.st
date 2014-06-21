#! /usr/bin/gst
"	text.read.st				"
"						"
"			Oct/21/2011		"
" ---------------------------------------------	"
Transcript show: '*** 開始 ***'; nl.
file_in := Smalltalk getArgv: 1.
Transcript show: file_in;nl.
| in out |
in := FileStream open: file_in mode: FileStream read.
[ in atEnd ]
  whileFalse: [
     Transcript show: in.
  ].
Transcript show: '*** 終了 ***'; nl.

" ---------------------------------------------	"
