-- ----------------------------------------------------
--	sql_manipulate.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
function mysql_utf8_proc (con)
	local sql_str="SET NAMES utf8"
	con:execute(sql_str)
end
-- ----------------------------------------------------
function sql_display_proc (con)

	local cur = con:execute("SELECT id, name, population,date_mod from cities order by id")
	local row = cur:fetch({}, "a")
	while row do
		print(string.format("%s\t%s\t%d\t%s",
			row.id,row.name,row.population,row.date_mod))
		row = cur:fetch({}, "a")
	end

cur:close()
end

-- ----------------------------------------------------
function sql_update_proc (con,id_in,population_in)
	local today = get_current_date_proc ()

	local ft_aa=string.format ("update cities set POPULATION = %d, ",
			population_in)
	local ft_bb=string.format ("DATE_MOD='%s' " , today)
	local ft_cc=string.format ("where ID = '%s'" , id_in)
	local sql_str=ft_aa .. ft_bb .. ft_cc

	con:execute (sql_str)
end
-- ----------------------------------------------------
function sql_delete_proc (con,id_in)
	local sql_str=string.format ("delete from cities where ID = '%s'",id_in)
	con:execute (sql_str)
end
-- ----------------------------------------------------
function sql_insert_proc (con,id_in,name_in,population_in,date_mod_in)

	local ft_aa=string.format ("insert into cities (id, Name, Population, date_mod) values ( '%s', ",id_in)
	local ft_bb=string.format ("'%s', " , name_in)
	local ft_cc=string.format ("%d," , population_in)
	local ft_dd=string.format ("'%s')" , date_mod_in)
	local sql_str=ft_aa .. ft_bb .. ft_cc .. ft_dd

	con:execute (sql_str)
end
-- ----------------------------------------------------
function sql_drop_table_proc (con)
	local sql_str="drop table cities"
	con:execute (sql_str)
end
-- ----------------------------------------------------
function sql_create_table_proc (con)
	local sql_str="create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,population int,date_mod text)"
	con:execute (sql_str)
end
-- ----------------------------------------------------
function mysql_utf8_proc (con)
	local sql_str="SET NAMES utf8"
	con:execute (sql_str)
end
-- ----------------------------------------------------
