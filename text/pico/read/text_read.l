#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	text_read.l
#
#					Aug/24/2011
#
# -----------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_text (car (argv)))
(prinl file_text)
#
(setq dict_aa (text_read_proc file_text))
(dict_display_proc dict_aa)
#
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
