#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	csv_delete.l
#
#					Oct/28/2014
#
# -----------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_csv (car (argv)))
(setq key (cadr (argv)))
(prinl file_csv)
(prinl key)
#
(setq dict_aa (text_read_proc file_csv))
(prinl (assoc key dict_aa))
#
(setq dict_aa (delete (assoc key dict_aa) dict_aa))
#
(dict_display_proc dict_aa)
(out file_csv
(dict_display_csv_proc dict_aa)
)
#
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
