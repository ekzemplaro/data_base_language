#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
# --------------------------------------------------------------
(load "@lib/import.l")
# --------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
(load '/var/www/data_base/common/pico_common/json_manipulate.l)
# --------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_json (car (argv)))
(setq json_str (in file_json (till)))
(setq dict_aa (pipe (prinl json_str) (readJson)))
(dict_display_proc dict_aa)
#
(prinl "")
(for unit_aa dict_aa
	(setq key (car unit_aa))
	(setq name (cdadr unit_aa))
	(setq population (cdaddr unit_aa))
	(prin key)
	(prin "^I")
	(prin name)
	(prin "^I")
	(prin population)
	(prin "^I")
	(prin "^Idate_mod^I")
	(prinl (cdddr unit_aa))
	)
#
(prinl "*** 終了 ***")
(bye)
# --------------------------------------------------------------
