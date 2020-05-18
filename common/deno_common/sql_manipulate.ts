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
