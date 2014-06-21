#
#	json_manipulate.l
#
#					Dec/09/2013
#
# --------------------------------------------------------------
(de checkJson (X Item)
   (unless (= X Item)
      (quit "Bad JSON" Item) ) )
 
# --------------------------------------------------------------
(de readJson ()
   (case (read "_")
      ("{"
         (make
            (for (X (readJson)  T  (readJson))
               (checkJson ":" (readJson))
               (link (cons X (readJson)))
               (T (= "}" (setq X (readJson))))
               (checkJson "," X) ) ) )
      ("["
         (make
            (link T)  # Array marker
            (for (X (readJson)  T  (readJson))
               (link X)
               (T (= "]" (setq X (readJson))))
               (checkJson "," X) ) ) )
      (T @) ) )
 
# --------------------------------------------------------------
(de printJson (Item)
	(cond
      ((atom Item) (print Item))
      ((=T (car Item))
         (prin "[")
         (map
            '((X)
               (printJson (car X))
               (and (cdr X) (prin ", ")) )
            (cdr Item) )
         (prin "]") )
      (T
         (prin "{")
         (map
            '((X)
               (print (caar X))
               (prin ": ")
               (printJson (cdar X))
               (and (cdr X) (prin ", ")) )
            Item )
		(prin "}") ) ) )

# --------------------------------------------------------------
