; -----------------------------------------------------------------------
;
;	exist_read.clj
;
;						Jul/29/2010
; -----------------------------------------------------------------------
(use '[clojure.contrib.duck-streams])
(def uri "http://cpt003:8086/exist/rest/db/cities/cities.xml")
(doseq [line (read-lines uri)] 
(println line))
; -----------------------------------------------------------------------
