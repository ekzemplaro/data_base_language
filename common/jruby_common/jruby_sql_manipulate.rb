# -*- coding: utf-8 -*-
#
#	jruby_sql_manipulate.rb
#					Jun/09/2011
#
# --------------------------------------------------------
include Java
#
# --------------------------------------------------------
def sql_read_proc (conn)
	st = conn.prepareStatement(
		"select * from cities order by ID")
	rs = st.executeQuery()
	while rs.next()
		out_str = rs.getString("id") + "\t"
		out_str += rs.getString("name") + "\t"
		out_str += rs.getInt("population").to_s + "\t"
		out_str += rs.getString("date_mod")

		System.out.println(out_str);
	end
end

# --------------------------------------------------------
def sql_update_proc (conn,id,population)
	date_mod=Date.today
#	sql_str="UPDATE cities SET population='#{population}', DATE_MOD='#{date_mod}' where ID = '#{id}'"
	sql_str="UPDATE cities SET population=#{population}, DATE_MOD='#{date_mod}' where ID = '#{id}'"
	puts sql_str

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
def sql_delete_proc (conn,id)
	sql_str="delete from cities where ID = '#{id}'"
	puts sql_str

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
def sql_drop_table_proc (conn)
	sql_str="drop table cities"
	puts sql_str

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
def sql_create_table_proc (conn)
	sql_str="create table cities (id varchar(10), name varchar(20)," \
		+ " population int, date_mod date)"

	puts sql_str

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
def sql_insert_record_proc (conn,id_in,name_in,population_in,date_mod_in)
	str_ins = "insert into cities (id,name,population,date_mod) values ("
	str_data = "'" + id_in + "','" + name_in + "'," \
		+ population_in.to_s + ",'" + date_mod_in + "')"

	sql_str=str_ins + str_data

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
def mysql_utf8_proc (conn)
	sql_str = "SET NAMES utf8";
	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end
# --------------------------------------------------------
