; -------------------------------------------------------------------
;
;	xml_create.clj
;
;					Sep/23/2013
;
; -------------------------------------------------------------------
(use 'clojure.contrib.prxml)
;
(println "*** 開始 ***")
(spit (first *command-line-args*) (str "<?xml version='1.0' encoding='utF-8'?>"
 (with-out-str (binding [*prxml-indent* 4]
  (prxml [:root
          [:t2261 [:name "静岡"]
		 [:population "25174"] [:date_mod "1970-5-21"]]
          [:t2262 [:name "浜松"]
		 [:population "93813"] [:date_mod "1970-8-26"]]
          [:t2263 [:name "沼津"]
		 [:population "32821"] [:date_mod "1970-7-15"]]
          [:t2264 [:name "三島"]
		 [:population "15364"] [:date_mod "1970-3-24"]]
          [:t2265 [:name "富士"]
		 [:population "28369"] [:date_mod "1970-9-21"]]
          [:t2266 [:name "熱海"]
		 [:population "41957"] [:date_mod "1970-4-12"]]
          [:t2267 [:name "富士宮"]
		 [:population "52761"] [:date_mod "1970-5-18"]]
          [:t2268 [:name "藤枝"]
		 [:population "49387"] [:date_mod "1970-6-27"]]
          [:t2269 [:name "御殿場"]
		 [:population "42375"] [:date_mod "1970-7-1"]]
          [:t2270 [:name "島田"]
		 [:population "63917"] [:date_mod "1970-8-19"]]
		])))))
(println "*** 終了 ***")
;
; -------------------------------------------------------------------
