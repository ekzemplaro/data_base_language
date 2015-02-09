#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	redis_create.l
#
#					Jan/20/2015
#
#
# -------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -------------------------------------------------------------
(de data_prepare_proc ()
	(setq dict_aa nil)
	(setq dict_aa (dict_append_proc dict_aa "t1851" "福井" "19762" "1931-5-16"))
	(setq dict_aa (dict_append_proc dict_aa "t1852" "敦賀" "29148" "1931-8-9"))
	(setq dict_aa (dict_append_proc dict_aa "t1853" "小浜" "42931" "1931-2-12"))
	(setq dict_aa (dict_append_proc dict_aa "t1854" "大野" "83245" "1931-6-25"))
	(setq dict_aa (dict_append_proc dict_aa "t1855" "勝山" "35418" "1931-7-30"))
	(setq dict_aa (dict_append_proc dict_aa "t1856" "鯖江" "49175" "1931-1-8"))
	(setq dict_aa (dict_append_proc dict_aa "t1857" "あわら" "21596" "1931-8-12"))
	(setq dict_aa (dict_append_proc dict_aa "t1858" "越前" "38427" "1931-10-24"))
	(setq dict_aa (dict_append_proc dict_aa "t1859" "坂井" "12584" "1931-6-17"))

	dict_aa
)

# -------------------------------------------------------------
(de json_tag_gen_proc (tag value)
	(pack "\"" tag "\": \"" value "\"")
)
; -------------------------------------------------------------------
(de unit_string_gen_proc (name population date_mod)
	(pack "{"
		(json_tag_gen_proc "name" name) ","
		(json_tag_gen_proc "population" population) ","
		(json_tag_gen_proc "date_mod" date_mod) "}"
		)
)
# -------------------------------------------------------------
(prinl "*** 開始 ***")
#
(setq dict_aa (data_prepare_proc))
#
(when (connect "host_dbase" 6379)
(for unit_aa dict_aa
	(setq name (cdr (assoc 'name unit_aa)))
	(setq population (cdr (assoc 'population unit_aa)))
	(setq date_mod (cdr (assoc 'date_mod unit_aa)))
	(setq value_out (unit_string_gen_proc name population date_mod))
	(setq key_out (car unit_aa))
	(setq command (pack "set " key_out " '" value_out "'^M"))
#	(setq command (pack "del " key_out "^M"))
	(println command)
	(out @ (prinl command))
	(in @ (prinl (read)))
)
(close @)
)
#
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
