#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	csv_create.l
#
#					Dec/09/2013
#
#
# -------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -------------------------------------------------------------
(de data_prepare_proc ()
	(setq dict_aa nil)
	(setq dict_aa (dict_append_proc dict_aa "t1271" "千葉" 81573 "1931-3-16"))
	(setq dict_aa (dict_append_proc dict_aa "t1272" "勝浦" 91248 "1931-6-9"))
	(setq dict_aa (dict_append_proc dict_aa "t1273" "市原" 54791 "1931-2-12"))
	(setq dict_aa (dict_append_proc dict_aa "t1274" "流山" 37142 "1931-8-25"))
	(setq dict_aa (dict_append_proc dict_aa "t1275" "八千代" 91354 "1931-7-30"))
	(setq dict_aa (dict_append_proc dict_aa "t1276" "我孫子" 23145 "1931-1-8"))
	(setq dict_aa (dict_append_proc dict_aa "t1277" "鴨川" 81296 "1931-8-12"))
	(setq dict_aa (dict_append_proc dict_aa "t1278" "銚子" 43587 "1931-10-24"))
	(setq dict_aa (dict_append_proc dict_aa "t1279" "市川" 39124 "1931-6-17"))

	dict_aa
)

# -------------------------------------------------------------
(prinl "*** 開始 ***")
#
#
(setq file_csv (car (argv)))
(prinl file_csv)
(setq dict_aa (data_prepare_proc))
(prinl (length dict_aa))
(out file_csv
#
(dict_display_csv_proc dict_aa)
)
#
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
