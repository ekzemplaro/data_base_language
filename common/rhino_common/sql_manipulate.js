// ------------------------------------------------------------------
//
//	sql_manipulate.js
//
//						Aug/25/2015
//
// ------------------------------------------------------------------
function disp_proc (conn)
{
	var stmt = conn.createStatement();
	var sql  = "SELECT * FROM cities";
	var rs   = stmt.executeQuery(sql);

	while ( rs.next() ) {
		var out_str = rs.getString("id") + "\t";
		out_str += rs.getString("name") + "\t";
		out_str += rs.getString("population") + "\t";
		out_str += rs.getString("date_mod");
		print(out_str);
	}
}
// ------------------------------------------------------------------
function update_proc (conn,id_in,population_in)
{
	var today = get_current_date_proc ();

	var stmt = conn.createStatement();
	var sql  = "update cities set population=" + population_in
		+ ",DATE_MOD='" + today +  "'  where ID= '" + id_in + "'";

	print (sql);

	var rs   = stmt.executeUpdate(sql);

}

// ------------------------------------------------------------------
function delete_proc (conn,id_in)
{

	print ("*** delete_proc ***");

	var stmt = conn.createStatement();
	var sql  = "delete from cities where ID= '" + id_in + "'";

	print (sql);

	var rs   = stmt.executeUpdate(sql);

}

// ------------------------------------------------------------------
function dict_to_db_proc (conn,dict_aa)
{
	for (var key in dict_aa)
		{
		var unit_aa = dict_aa[key]
	insert_record_proc (conn,key,unit_aa["name"],unit_aa["population"],unit_aa["date_mod"])
		}
}

// ------------------------------------------------------------------
function insert_record_proc (conn,id_in,name_in,population_in,date_mod_in)
{
	var stmt = conn.createStatement();
	var sql_str  = "insert into cities (id,name,population,date_mod) values (";

	var str_data = "'" + id_in + "','" + name_in + "',"
		+ population_in + ",'" + date_mod_in + "')";

	sql_str += str_data;

//	print (sql_str);

	var rs   = stmt.executeUpdate(sql_str);
}

// ------------------------------------------------------------------
function create_table_proc (conn)
{
	var stmt = conn.createStatement();
	var sql_str = "create table cities (id varchar(10), name varchar(20),"
		+ " population int, date_mod date)";
	stmt.execute(sql_str);
}

// ------------------------------------------------------------------
function drop_table_proc (conn)
{
	var stmt = conn.createStatement();
	stmt.execute ("drop table cities");
}

// ------------------------------------------------------------------
