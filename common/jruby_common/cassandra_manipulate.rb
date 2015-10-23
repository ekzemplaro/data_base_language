# -*- encoding: utf-8 -*-
#
#	jruby_common/cassandra_manipulate.rb
#
#					Sep/06/2013
#
# ---------------------------------------------------------------------
def cassandra_to_dict_proc (conn)
#
puts ("*** cassandra_to_dict_proc ***")
#
dict_aa={}
#
sql_str="select key,name,population,date_mod from cities;"
st = conn.createStatement()
rset = st.executeQuery (sql_str)
#
while (rset.next())
	key = rset.getString(1)
	name = rset.getString(2)
	population = rset.getString (3)
	date_mod = rset.getString (4)
	dict_aa = dict_append_proc(dict_aa,key,name,population,date_mod)
	end
#
return dict_aa
#
end
# ---------------------------------------------------------------------
def dict_to_cassandra_proc (dict_aa,conn)
#
puts ("*** dict_to_cassandra_proc ***")
#
sql_str="drop table cities;"
st = conn.createStatement()
st.execute (sql_str);
#
sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);"
st.execute (sql_str)
#
dict_aa.each {|key, value|
	name = value["name"]
	population = value["population"].to_s
	date_mod = value["date_mod"]
#
	str_aa = "insert into cities (key,name,population,date_mod) values "
	str_bb = "('" + key + "','" + name + "'," + population + ",'" + date_mod + "')"
	sql_str = str_aa + str_bb
	st.execute (sql_str)
	}
#
st.close()
#
end
#
# ---------------------------------------------------------------------
def cassandra_update_proc (conn,key,population_in)
#
puts ("*** cassandra_update_proc ***")
#
str_ddx = Date.today.to_s
sql_str="update cities set population =" + population_in.to_s
sql_str += ", date_mod = '" + str_ddx + "'"
sql_str += " where key = '" + key + "';"

st = conn.createStatement()
st.execute (sql_str)
st.close()
#
end
# ---------------------------------------------------------------------
def cassandra_delete_proc (conn,key)
#
puts ("*** cassandra_delete_proc ***")
#
sql_str="delete from cities where key = '" + key + "';"

st = conn.createStatement()
st.execute (sql_str)
st.close()
#
end
# ---------------------------------------------------------------------
