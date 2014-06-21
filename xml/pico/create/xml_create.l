#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	xml_create.l
#
#					Sep/23/2013
#
#
# -------------------------------------------------------------
(de tag_out_proc (tag value)
	(pack '< tag '> value '</ tag '>)
	)
# -------------------------------------------------------------
(de print_proc (id name population date_mod)
	(setq out_str '<)
	(setq out_str (pack out_str id '>))
	(setq out_str (pack out_str (tag_out_proc 'name name)))
	(setq out_str (pack out_str (tag_out_proc 'population population)))
	(setq out_str (pack out_str (tag_out_proc 'date_mod date_mod)))
	(setq out_str (pack out_str '</ id '>))
	(prinl out_str)
	)
# -------------------------------------------------------------
(prinl "*** 開始 ***")
#(out "/var/tmp/xml_file/cities.xml" 
(out (car (argv))
	(println '<?xml 'version="1.0" 'encoding="UTF-8" '?>)
	(println '<root>)

	(print_proc "t2261" "静岡" 83654 "1931-11-12")
	(print_proc "t2262" "浜松" 21475 "1931-2-29" )
	(print_proc "t2263" "沼津" 56398 "1931-8-17")
	(print_proc "t2264" "三島" 75914 "1931-4-5" )
	(print_proc "t2265" "富士" 94852 "1931-5-9" )
	(print_proc "t2266" "熱海" 87213 "1931-1-27" )
	(print_proc "t2267" "富士宮" 28749 "1931-4-14" )
	(print_proc "t2268" "藤枝" 73618 "1931-3-11" )
	(print_proc "t2269" "御殿場" 54291 "1931-2-25" )
	(print_proc "t2270" "島田" 21537 "1931-11-17" )
	(println '</root>)
)
(prinl "*** 終了 ***")
(bye)
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
