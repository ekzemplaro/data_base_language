;;; -----------------------------------------------------------
;;;	xml_create.el
;;;
;;;					Jul/25/2012
;;;
;;; -----------------------------------------------------------
(defun tag_out_proc (tag value)
	(insert "\t<")
	(insert tag)
	(insert ">")
	(insert value)
	(insert "</")
	(insert tag)
	(insert ">\n")
;;	(insert (pack '</ tag '>))
	)

;;; -----------------------------------------------------------
(defun print_proc (id name population date_mod)
	(insert "<")
	(insert id)
	(insert ">")
	(tag_out_proc "name" name)
	(tag_out_proc "population" (number-to-string population))
	(tag_out_proc "date_mod" date_mod)
	(insert "</")
	(insert id)
	(insert ">\n")
	)

;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(with-current-buffer (get-buffer-create "tmp_buffer"))
(erase-buffer)
(insert "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n")
(insert "<root>\n")

(print_proc "t2261" "静岡" 89536 "1932-3-21")
(print_proc "t2262" "浜松" 52184 "1932-8-9" )
(print_proc "t2263" "沼津" 61563 "1932-5-18")
(print_proc "t2264" "三島" 75914 "1932-9-5" )
(print_proc "t2265" "富士" 98526 "1932-10-9" )
(print_proc "t2266" "熱海" 85213 "1932-1-27" )
(print_proc "t2267" "富士宮" 25749 "1932-4-14" )
(print_proc "t2268" "藤枝" 75618 "1932-3-11" )
(print_proc "t2269" "御殿場" 28792 "1932-12-5" )
(print_proc "t2270" "島田" 63281 "1932-11-27" )


(insert "</root>\n")
(print argv)
(write-region (point-min) (point-max) (car argv))
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
