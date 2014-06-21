#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	csv_update.l
#
#					Sep/21/2011
#
# -----------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_csv (car (argv)))
(setq key (cadr (argv)))
(setq population (caddr (argv)))
(prinl file_csv)
(prin key)
(prin "^I")
(prinl population)
#
(setq dict_aa (text_read_proc file_csv))
#
(prinl (assoc key dict_aa))
(prinl "*** qqq ***")
(setq dict_aa (dict_update_proc dict_aa key population))
(prinl "*** rrr ***")
#
(dict_display_proc dict_aa)
(out file_csv
(dict_display_csv_proc dict_aa)
)
#
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
