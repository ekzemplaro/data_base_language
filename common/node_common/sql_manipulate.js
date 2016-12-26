#! /usr/bin/node
// ---------------------------------------------------------------
//	sql_manipulate.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------
var text_manipulate= require ('./text_manipulate')

// ---------------------------------------------------------------
exports.update_command_gen = function (id_in,population_in)
{
	const today = text_manipulate.get_current_date_proc()
	var command = "update cities set population = " + population_in
	command += " , date_mod = '" + today + "'"
	command += " where id = '" + id_in + "'"
	console.log (command)

	return	command
}

// ---------------------------------------------------------------
exports.delete_command_gen = function (id_in)
{
	const command = "delete from cities where id = '" + id_in + "'"

	return	command
}

// ---------------------------------------------------------------
