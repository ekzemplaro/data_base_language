#
#	text_manipulate.l
#
#					Dec/09/2013
#
# -----------------------------------------------------------------
(de record_display_proc_exec (body delimit)
	(prin (car body))
	(prin delimit)
	(prin (cdr (assoc "name" body)))
	(prin delimit)
	(prin (cdr (assoc "population" body)))
	(prin delimit)
	(prinl (cdr (assoc "date_mod" body)))
)
# -----------------------------------------------------------------
(de record_display_proc_execxx (body delimit)
	(prin (car body))
	(prin delimit)
	(prin (cdr (assoc 'name body)))
	(prin delimit)
	(prin (cdr (assoc 'population body)))
	(prin delimit)
	(prinl (cdr (assoc 'date_mod body)))
)
# -----------------------------------------------------------------
(de record_display_proc (body delimit)
	(setq key_aa (car body))
	(if (< 1 (length key_aa))
		(record_display_proc_exec body delimit)
	)
)

# -----------------------------------------------------------------
(de dict_display_proc (dict_aa)
	(setq delimit "^I")
	(for unit_aa dict_aa (record_display_proc unit_aa delimit))
)

# -----------------------------------------------------------------
(de dict_display_csv_proc (dict_aa)
	(setq delimit ",")
	(for unit_aa dict_aa (record_display_proc unit_aa delimit))
)

# -----------------------------------------------------------------
(de dict_append_proc (dict_aa key_in name_in population_in date_mod_in)
	(push 'dict_aa (cons key_in
		(list
		(cons "name"  name_in)
		(cons "population"  population_in)
		(cons "date_mod"  date_mod_in))
		))

	dict_aa
)
# -----------------------------------------------------------------
(de dict_append_procxxx (dict_aa key_in name_in population_in date_mod_in)
	(push 'dict_aa (cons key_in
		(list
		(cons 'name  name_in)
		(cons 'population  population_in)
		(cons 'date_mod  date_mod_in))
		))

	dict_aa
)

# -----------------------------------------------------------------
(de text_read_proc (file_text)
(in file_text
	(until (eof)
		(setq key_in (read))
		(setq name_in (read))
		(setq population_in (read))
		(setq date_mod_in (read))
#
		(setq dict_aa (dict_append_proc dict_aa key_in name_in population_in date_mod_in))
	)
)
	dict_aa
)

# -----------------------------------------------------------------
(de dict_update_proc (dict_in key_in population_in)
	(prinl (assoc key_in dict_in))
	(prinl (assoc 'population (assoc key_in dict_in)))
	(prinl (cdr (assoc 'population (assoc key_in dict_in))))
	(setq name_tt  (cdr (assoc 'name (assoc key_in dict_in))))
	(prinl name_tt)
	(setq today_aa (date (date)))
	(setq today (pack (car today_aa) "-" (cadr today_aa) "-" (caddr today_aa)))
	(prinl today)
	(setq dict_in (delete (assoc key_in dict_in) dict_in))
	(setq dict_in (dict_append_proc dict_in key_in name_tt population_in today))
	dict_in
)

# -----------------------------------------------------------------
