; -----------------------------------------------------------------
;
;	tyrant_delete.clj
;
;					Jan/28/2014
;
; -----------------------------------------------------------------
(ns mcached_delete
	(:import (java.net Socket)
           (java.io PrintWriter)
)
)
 
; -----------------------------------------------------------------
(defn send-data [host port msg]
	(with-open [sock (Socket. host port)
		printer (PrintWriter. (.getOutputStream sock))]
	(.println printer msg)))
; -----------------------------------------------------------------

(println "*** 開始 ***") 
(let [key_in (first *command-line-args*)
	hostname "localhost"
	port 1978
	]
(println key_in)
(def command (clojure.string/join "" ["delete " key_in "\r\n"]))
(println command)
(send-data hostname port command)
)
(println "*** 終了 ***")
; -----------------------------------------------------------------
