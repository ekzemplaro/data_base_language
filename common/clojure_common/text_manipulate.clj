; -----------------------------------------------------------------
;
;	text_manipulate.clj
;
;						Oct/28/2013
; -----------------------------------------------------------------------
(import '(java.util Date))
(import '(java.text SimpleDateFormat))
; -----------------------------------------------------------------
; [4-6-8-4]:
(defn  unit_define_proc [name_in population_in date_mod_in]
	{:name name_in, :population population_in, :date_mod date_mod_in}
)

; -----------------------------------------------------------------
; [4-6-8]:
(defn  dict_append_proc [dict_aa key name_in population_in date_mod_in]
	(assoc dict_aa key (unit_define_proc name_in population_in date_mod_in))
)

; -----------------------------------------------------------------
; [4-6]:
(defn text_read_proc_exec [file_text delimit]
	(def strings_in (slurp file_text))
	(def lines_in (clojure.string/split strings_in #"\n"))
	(def dict_aa nil)
	(doseq  [line lines_in]
		(def aa (clojure.string/split line delimit))
		(def bb (rest aa))
		(def cc (rest bb))
		(def key_id (keyword (first aa)))
		(def dict_aa (dict_append_proc dict_aa key_id (second aa) (first cc) (second cc)))
	)
	dict_aa
)

; -----------------------------------------------------------------
; [4]:
(defn text_read_proc [file_text]
	(def delimit #"\t")
	(text_read_proc_exec file_text delimit)
)

; -----------------------------------------------------------------
(defn new_unit_gen_proc [dict_aa key_in population_in]
	(def unit_aa (key_in dict_aa))
	(def name_aa (:name unit_aa))
	(def today  (. (new SimpleDateFormat "yyyy-MM-dd") format (new Date)))
	(unit_define_proc name_aa population_in today)
)

; -----------------------------------------------------------------
(defn single_row_out_proc [dict_in key delimit]
	(def unit (dict_in key))
	(print (clojure.string/join delimit [(name key) (unit  :name)
		(unit :population) (unit :date_mod)]))
	(newline)
)
	
; -----------------------------------------------------------------
(defn string_row_gen_proc [dict_in key delimit]
	(def unit (dict_in key))
	(str (clojure.string/join delimit [(name key) (unit  :name)
		(unit :population) (unit :date_mod)]) "\n")
)

; -----------------------------------------------------------------
(defn dict_display_proc [dict_aa]
	(def delimit "\t")
	(doseq [key (keys dict_aa)] 
	(single_row_out_proc dict_aa key delimit)
	)
)

; -----------------------------------------------------------------
; [6-4]:
(defn text_write_proc_exec [file_out dict_aa delimit]
	(spit file_out "")
	(doseq [key (keys dict_aa)]
		(spit file_out (string_row_gen_proc dict_aa key delimit) :append true)
	)
)

; -----------------------------------------------------------------
; [6]:
(defn text_write_proc [file_out dict_aa]
	(def delimit "\t")
	(text_write_proc_exec file_out dict_aa delimit)
)

; -----------------------------------------------------------------
; [8]:
(defn csv_read_proc [file_text]
	(def delimit #",")
	(text_read_proc_exec file_text delimit)
)

; -----------------------------------------------------------------
; [10]:
(defn csv_write_proc [file_out dict_aa]
	(def delimit ",")
	(text_write_proc_exec file_out dict_aa delimit)
)

; -----------------------------------------------------------------
