#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	csv_read.l
#
#					Sep/21/2011
#
# -----------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_csv (car (argv)))
(prinl file_csv)
#
(setq dict_aa (text_read_proc file_csv))
(dict_display_proc dict_aa)
#
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
