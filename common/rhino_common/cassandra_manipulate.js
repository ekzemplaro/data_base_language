// -------------------------------------------------------------- 
//
//	rhino_common/cassandra_manipulate.js
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
importPackage (java.sql)

// -------------------------------------------------------------- 
function cassandra_to_dict_proc (conn)
{
	var sql_str="select key,name,population,date_mod from cities;";
	var st = conn.createStatement();
	var rset = st.executeQuery (sql_str);

	var dict_aa = new Object ();

	while (rset.next())
		{
		var key = rset.getString (1);
		var name = rset.getString (2);
		var population = Integer.parseInt (rset.getString (3));
		var date_mod = rset.getString (4);

		dict_aa = dict_append_proc (dict_aa,key,name,population,date_mod)
		}

	rset.close();
	st.close();

	return	dict_aa;
}

// -------------------------------------------------------------- 
function dict_to_cassandra_proc (dict_aa,conn)
{
	var sql_str="drop table cities;";
	var st = conn.createStatement();
	st.execute (sql_str);

	sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);";
	st.execute (sql_str);

	for (var key in dict_aa)
		{
		print ("key = " + key);

		var name = dict_aa[key]["name"];
		var population = dict_aa[key]["population"];
		var date_mod = dict_aa[key]["date_mod"];

		var str_aa = "insert into cities (key,name,population,date_mod) values ";

		var str_bb = "('" + key + "','" + name + "',"
			+ population + ",'" + date_mod + "')";

		sql_str = str_aa + str_bb;

		st.execute (sql_str);
		}

	st.close();
}

// -------------------------------------------------------------- 
function cassandra_update_proc (conn,key,population_in)
{
	print ("*** cassandra_update_proc ***\t" + key);
	print ("\t" + population_in);

	var str_pp = Integer.toString (population_in)

	var str_ddx = get_current_date_proc ();

	var sql_str="update cities set population =" + population_in;
	sql_str += ", date_mod = '" + str_ddx + "'";
	sql_str += " where key = '" + key + "';";
	print (sql_str);
	var st = conn.createStatement();
	st.execute (sql_str);

	st.close();
}

// -------------------------------------------------------------- 
function cassandra_delete_proc (conn,key)
{
	print ("*** cassandra_delete_proc ***\t" + key);


	var sql_str="delete from cities ";
	sql_str += " where key = '" + key + "';";
	print (sql_str);
	var st = conn.createStatement();
	st.execute (sql_str);

	st.close();
}
// -------------------------------------------------------------- 
