#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	json_create.l
#
#					Dec/09/2013
#
# --------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
(load '/var/www/data_base/common/pico_common/json_manipulate.l)
# --------------------------------------------------------------
(de data_prepare_proc ()
#	(setq dict_aa nil)
	(setq dict_aa (dict_append_proc dict_aa "t0921" "宇都宮" 35872 "1931-5-16"))
	(setq dict_aa (dict_append_proc dict_aa "t0922" "小山" 81794 "1931-8-9"))
	(setq dict_aa (dict_append_proc dict_aa "t0923" "佐野" 54139 "1931-2-12"))
	(setq dict_aa (dict_append_proc dict_aa "t0924" "足利" 37482 "1931-6-25"))
	(setq dict_aa (dict_append_proc dict_aa "t0925" "日光" 97314 "1931-7-30"))
	(setq dict_aa (dict_append_proc dict_aa "t0926" "下野" 23175 "1931-1-8"))
	(setq dict_aa (dict_append_proc dict_aa "t0927" "さくら" 81296 "1931-8-12"))
	(setq dict_aa (dict_append_proc dict_aa "t0928" "矢板" 43187 "1931-10-24"))
	(setq dict_aa (dict_append_proc dict_aa "t0929" "真岡" 12485 "1931-6-17"))
	(setq dict_aa (dict_append_proc dict_aa "t0930" "栃木" 32794 "1931-5-21"))
	(setq dict_aa (dict_append_proc dict_aa "t0931" "大田原" 75182 "1931-1-8"))
	(setq dict_aa (dict_append_proc dict_aa "t0932" "鹿沼" 73589 "1931-8-10"))
	(setq dict_aa (dict_append_proc dict_aa "t0933" "那須塩原" 14395 "1931-9-23"))
	(setq dict_aa (dict_append_proc dict_aa "t0934" "那須烏山" 37521 "1931-4-18"))

	dict_aa
)

# --------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_json (car (argv)))
(setq dict_aa (data_prepare_proc))
(out file_json
	(printJson dict_aa)
	)
(prinl "*** 終了 ***")
(bye)
# --------------------------------------------------------------
