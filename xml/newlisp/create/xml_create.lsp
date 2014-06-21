#! /usr/bin/newlisp
; -------------------------------------------------------------------
;	xml_create.lsp
;
;					Dec/04/2013
;
; -------------------------------------------------------------------
(define (tag_gen_proc tag value)
	(append "\t<" tag ">" value "</" tag ">" "\n")
)
; -------------------------------------------------------------------
(define (string_gen_proc id name population date_mod)
	(append "<" id ">"
		(tag_gen_proc "name" name)
		(tag_gen_proc "population" population)
		(tag_gen_proc "date_mod" date_mod)
		"</" id ">\n"
		)
)
; -------------------------------------------------------------------
(define (data_prepare_proc)
(setf out_aa (string_gen_proc "t2261" "静岡" "73594" "1933-12-15"))
(setf out_bb (string_gen_proc "t2262" "浜松" "21928" "1933-2-9"))
(setf out_cc (string_gen_proc "t2263" "沼津" "58421" "1933-8-12"))
(setf out_dd (string_gen_proc "t2264" "三島" "79123" "1933-6-21"))
(setf out_ee (string_gen_proc "t2265" "富士" "46257" "1933-5-15"))
(setf out_ff (string_gen_proc "t2266" "熱海" "72815" "1933-9-24"))
(setf out_gg (string_gen_proc "t2267" "富士宮" "51762" "1933-8-5"))
(setf out_hh (string_gen_proc "t2268" "藤枝" "46719" "1933-10-4"))
(setf out_ii (string_gen_proc "t2269" "御殿場" "78651" "1933-2-7"))
(setf out_jj (string_gen_proc "t2270" "島田" "61728" "1933-5-12"))

(append out_aa out_bb out_cc out_dd out_ee out_ff out_gg out_hh out_ii out_jj)
)
; -------------------------------------------------------------------
(println "*** 開始 ***")
(setf file_out (main-args 2))
(println file_out)
;
(setf out_str "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
(setf out_str (append out_str "<root>\n" (data_prepare_proc) "</root>\n"))
(write-file file_out out_str)
;
(println "*** 終了 ***")
(exit)
; -------------------------------------------------------------------
