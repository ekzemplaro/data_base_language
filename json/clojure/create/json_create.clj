; ------------------------------------------------------------------
;
;	json_create.clj
;
;					Jul/03/2011
;
; ------------------------------------------------------------------
(use '[clojure.contrib.duck-streams])
;(use '[clojure.data.json.read])
;(use '[clojure.data.json.write])
;(use 'clojure.data.json)
(use 'clojure.data.json.read)
; ------------------------------------------------------------------
(defn data_prepare_proc []
{"t0921" {:name "宇都宮" :population 34657 :date_mod "1970-1-5"},
"t0922" {:name "小山" :population 65718 :date_mod "1970-4-15"},
"t0923" {:name "佐野" :population 87594 :date_mod "1970-3-8"},
"t0924" {:name "足利" :population 79182 :date_mod "1970-6-12"},
"t0925" {:name "日光" :population 68263 :date_mod "1970-11-29"},
"t0926" {:name "下野" :population 51475 :date_mod "1970-9-25"},
"t0927" {:name "さくら" :population 34528 :date_mod  "1970-8-7"},
"t0928" {:name "矢板" :population 42179 :date_mod  "1970-10-25"},
"t0929" {:name "真岡" :population 24937 :date_mod  "1970-6-15"},
"t0930" {:name "栃木" :population 73891 :date_mod  "1970-9-22"},
"t0931" {:name "大田原" :population 27157 :date_mod  "1970-3-14"},
"t0932" {:name "鹿沼" :population 47251 :date_mod  "1970-7-29"},
"t0933" {:name "那須塩原" :population 43827 :date_mod  "1970-5-4"},
"t0934" {:name "那須烏山" :population 98538 :date_mod  "1970-2-18"}}
)
; ------------------------------------------------------------------
(println "*** 開始 ***")
(def dict_aa (data_prepare_proc))
;
(spit (first *command-line-args*) (json-str dict_aa))
(println "*** 終了 ***")
; ------------------------------------------------------------------
