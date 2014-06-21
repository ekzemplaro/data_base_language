#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	json_create.lsp
;
;					Oct/16/2013
;
; -------------------------------------------------------------------
(define (tag_gen_proc tag value)
	(append "\"" tag "\": \"" value "\"")
)
; -------------------------------------------------------------------
(define (string_gen_proc id name population date_mod delimit)
	(append "\"" id "\": {"
		(tag_gen_proc "name" name) ","
		(tag_gen_proc "population" population) ","
		(tag_gen_proc "date_mod" date_mod) "}"
		delimit
		"\n"
		)
)
; -------------------------------------------------------------------
(define (data_prepare_proc)
(setf out_aa (string_gen_proc "t0921" "宇都宮" "73215" "1933-3-15" ","))
(setf out_bb (string_gen_proc "t0922" "小山" "21387" "1933-9-9" ","))
(setf out_cc (string_gen_proc "t0923" "佐野" "58749" "1933-8-12" ","))
(setf out_dd (string_gen_proc "t0924" "足利" "79461" "1933-6-21" ","))
(setf out_ee (string_gen_proc "t0925" "日光" "46258" "1933-5-15" ","))
(setf out_ff (string_gen_proc "t0926" "下野" "21875" "1933-2-24" ","))
(setf out_gg (string_gen_proc "t0927" "さくら" "83514" "1933-8-5" ","))
(setf out_hh (string_gen_proc "t0928" "矢板" "46719" "1933-10-4" ","))
(setf out_ii (string_gen_proc "t0929" "真岡" "78651" "1933-2-7" ","))
(setf out_jj (string_gen_proc "t0930" "栃木" "65723" "1933-5-12" ","))
(setf out_kk (string_gen_proc "t0931" "大田原" "12547" "1933-8-2" ","))
(setf out_ll (string_gen_proc "t0932" "鹿沼" "47356" "1933-5-9" ","))
(setf out_mm (string_gen_proc "t0933" "那須塩原" "24391" "1933-9-21" ","))
(setf out_nn (string_gen_proc "t0934" "那須烏山" "41982" "1933-10-12" "}"))

(append out_aa out_bb out_cc out_dd out_ee out_ff out_gg
	 out_hh out_ii out_jj out_kk out_ll out_mm out_nn)
)
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_out (main-args 2))
(println file_out)
;
(setf out_str (append "{\n" (data_prepare_proc) "\n"))
(write-file file_out out_str)
;
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
