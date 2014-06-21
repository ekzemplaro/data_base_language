; -----------------------------------------------------------------
;
;	text_create.clj
;
;						Oct/28/2013
; -----------------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(defn data_prepare_proc []
(def dict_aa nil)
(def dict_aa (dict_append_proc dict_aa :t2381 "名古屋" 48621 "1970-9-17"))
(def dict_aa (dict_append_proc dict_aa :t2382 "豊橋" 21573 "1970-2-9"))
(def dict_aa (dict_append_proc dict_aa :t2383 "岡崎" 58431 "1970-4-12"))
(def dict_aa (dict_append_proc dict_aa :t2384 "一宮" 72819 "1970-6-21"))
(def dict_aa (dict_append_proc dict_aa :t2385 "蒲郡" 43784 "1970-5-15"))
(def dict_aa (dict_append_proc dict_aa :t2386 "常滑" 27145 "1970-9-24"))
(def dict_aa (dict_append_proc dict_aa :t2387 "大府" 83961 "1970-8-5"))
(def dict_aa (dict_append_proc dict_aa :t2388 "瀬戸" 46759 "1970-10-4"))
(def dict_aa (dict_append_proc dict_aa :t2389 "犬山" 78152 "1970-2-7"))
	dict_aa
)

; -----------------------------------------------------------------
(println "*** 開始 ***")

(def dict_aa (data_prepare_proc))

(println (class dict_aa))

(dict_display_proc dict_aa)

(text_write_proc (first *command-line-args*) dict_aa)

(println (keys dict_aa))

(println "*** 終了 ***")

; -----------------------------------------------------------------
