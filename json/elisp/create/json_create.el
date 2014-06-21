;;; -----------------------------------------------------------
;;;	json_create.el
;;;
;;;					Jul/25/2012
;;;
;;; -----------------------------------------------------------
(defun tag_out_proc (tag value)
	(insert "\"")
	(insert tag)
	(insert "\": \"")
	(insert value)
	(insert "\"")
;;	(insert (pack '</ tag '>))
	)

;;; -----------------------------------------------------------
(defun print_proc (id name population date_mod delimit)
	(insert "\"")
	(insert id)
	(insert "\": {")
	(tag_out_proc "name" name)
	(insert ",")
	(tag_out_proc "population" (number-to-string population))
	(insert ",")
	(tag_out_proc "date_mod" date_mod)
	(insert "}")
	(insert delimit)
	(insert "\n")
	)

;;; -----------------------------------------------------------
(princ "*** 開始 ***\n")
(with-current-buffer (get-buffer-create "tmp_buffer"))
(erase-buffer)
(insert "{\n")

(print_proc "t0921" "宇都宮" 29146 "1932-10-21" ",")
(print_proc "t0922" "小山" 78528 "1932-4-9" ",")
(print_proc "t0923" "佐野" 61562 "1932-3-18" ",")
(print_proc "t0924" "足利" 75918 "1932-4-5" ",")
(print_proc "t0925" "日光" 95852 "1932-5-9" ",")
(print_proc "t0926" "下野" 85213 "1932-1-27" ",")
(print_proc "t0927" "さくら" 25749 "1932-4-14" ",")
(print_proc "t0928" "矢板" 75618 "1932-3-11" ",")
(print_proc "t0929" "真岡" 28791 "1932-2-25" ",")
(print_proc "t0930" "栃木" 57632 "1932-10-27" ",")
(print_proc "t0931" "大田原" 63785 "1932-8-14" ",")
(print_proc "t0932" "鹿沼" 37851 "1932-5-21" ",")
(print_proc "t0933" "那須塩原" 78541 "1932-9-18" ",")
(print_proc "t0934" "那須烏山" 72536 "1932-3-19" "}")


(insert "\n")
(print argv)
(write-region (point-min) (point-max) (car argv))
(princ "*** 終了 ***\n")
;;; -----------------------------------------------------------
