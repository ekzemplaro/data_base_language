#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	text_create.l
#
#					Sep/05/2011
#
#
# -------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -------------------------------------------------------------
(de data_prepare_proc ()
	(setq dict_aa nil)
	(setq dict_aa (dict_append_proc dict_aa "t2381" "名古屋" 35812 "1931-5-16"))
	(setq dict_aa (dict_append_proc dict_aa "t2382" "豊橋" 81291 "1931-8-9"))
	(setq dict_aa (dict_append_proc dict_aa "t2383" "岡崎" 54231 "1931-2-12"))
	(setq dict_aa (dict_append_proc dict_aa "t2384" "一宮" 37832 "1931-6-25"))
	(setq dict_aa (dict_append_proc dict_aa "t2385" "蒲郡" 92354 "1931-7-30"))
	(setq dict_aa (dict_append_proc dict_aa "t2386" "常滑" 23145 "1931-1-8"))
	(setq dict_aa (dict_append_proc dict_aa "t2387" "大府" 81296 "1931-8-12"))
	(setq dict_aa (dict_append_proc dict_aa "t2388" "瀬戸" 43587 "1931-10-24"))
	(setq dict_aa (dict_append_proc dict_aa "t2389" "犬山" 39124 "1931-6-17"))

	dict_aa
)

# -------------------------------------------------------------
(prinl "*** 開始 ***")
#
#
(setq file_text (car (argv)))
(prinl file_text)
(setq dict_aa (data_prepare_proc))
(prinl (length dict_aa))
(out file_text
#
(dict_display_proc dict_aa)
)
#
(prinl "*** 終了 ***")
(bye)
# -------------------------------------------------------------
