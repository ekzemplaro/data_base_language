; -----------------------------------------------------------------
;
;	csv_create.clj
;
;						Oct/28/2013
; -----------------------------------------------------------------------
(load-file "/var/www/data_base/common/clojure_common/text_manipulate.clj")
; -----------------------------------------------------------------
(defn data_prepare_proc []
(def dict_aa nil)
(def dict_aa (dict_append_proc dict_aa :t1271 "千葉" 48257 "1970-4-17"))
(def dict_aa (dict_append_proc dict_aa :t1272 "勝浦" 57382 "1970-9-9"))
(def dict_aa (dict_append_proc dict_aa :t1273 "市原" 51436 "1970-8-12"))
(def dict_aa (dict_append_proc dict_aa :t1274 "流山" 29871 "1970-6-21"))
(def dict_aa (dict_append_proc dict_aa :t1275 "八千代" 63714 "1970-5-15"))
(def dict_aa (dict_append_proc dict_aa :t1276 "我孫子" 28145 "1970-9-24"))
(def dict_aa (dict_append_proc dict_aa :t1277 "鴨川" 83961 "1970-8-5"))
(def dict_aa (dict_append_proc dict_aa :t1278 "銚子" 46719 "1970-10-4"))
(def dict_aa (dict_append_proc dict_aa :t1279 "市川" 78627 "1970-2-7"))
	dict_aa
)

; -----------------------------------------------------------------
(println "*** 開始 ***")

(def dict_aa (data_prepare_proc))

(println (class dict_aa))

(dict_display_proc dict_aa)

(csv_write_proc (first *command-line-args*) dict_aa)

(println (keys dict_aa))

(println "*** 終了 ***")

; -----------------------------------------------------------------
