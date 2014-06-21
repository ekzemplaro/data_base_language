#! /usr/bin/picolisp /usr/lib/picolisp/lib.l
#
#	text_delete.l
#
#					Sep/21/2011
#
# -----------------------------------------------------------------
(load '/var/www/data_base/common/pico_common/text_manipulate.l)
# -----------------------------------------------------------------
(prinl "*** 開始 ***")
(setq file_text (car (argv)))
(setq key (cadr (argv)))
(prinl file_text)
(prinl key)
(prinl "*** ssss ***")
(prinl key)
#
(setq dict_aa (text_read_proc file_text))
(prinl (length dict_aa))
(prinl "*** ppp ***")
(prinl (assoc key dict_aa))
(prinl "*** qqq ***")
#
(prinl (length dict_aa))
(setq dict_aa (delete (assoc key dict_aa) dict_aa))
(prinl (length dict_aa))
#
(dict_display_proc dict_aa)
(out file_text
(dict_display_proc dict_aa)
)
#
(prinl "*** 終了 ***")
(bye)
# -----------------------------------------------------------------
