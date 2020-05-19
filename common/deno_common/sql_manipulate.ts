// ---------------------------------------------------------------
//	sql_manipulate.ts
//
//					May/18/2020
//
// ---------------------------------------------------------------
import { get_current_date_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
export function update_command_gen (id_in:string,population_in:number)
{
	const today:string = get_current_date_proc()
	var command:string = "update cities set population = " + population_in
	command += " , date_mod = '" + today + "'"
	command += " where id = '" + id_in + "'"
	console.log (command)

	return	command
}

// ---------------------------------------------------------------
export function delete_command_gen (id_in:string)
{
	const command:string = "delete from cities where id = '" + id_in + "'"

	return	command
}

// ---------------------------------------------------------------
export function insert_command_gen (key:string,unit_aa:{[key: string]: any})
{
	var sql_str: string  = "insert into cities (id,name,population,date_mod) values ("

	var str_data: string = "'" + key + "','" + unit_aa.name + "',"
		+ unit_aa.population + ",'" + unit_aa.date_mod + "')"

	sql_str += str_data

	return sql_str
}

// ---------------------------------------------------------------
