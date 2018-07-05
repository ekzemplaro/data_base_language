#! /usr/bin/julia
#
#	csv_update.jl
#
#					Jul/05/2018
# --------------------------------------------------------------------
include("text_manipulate.jl")
#
# --------------------------------------------------------------------
println("*** 開始 ***")
fname_csv = ARGS[1]
key_in = ARGS[2]
population_in = ARGS[3]
println(fname_csv)
println(key_in,'\t',population_in)
#
dict_aa = csv_to_dict_proc(fname_csv)
#
if ( haskey(dict_aa,key_in))
	dict_aa = dict_update_proc(dict_aa,key_in,population_in)
	dict_display_proc(dict_aa)
	dict_to_csv_proc(dict_aa,fname_csv)
end
#
println("*** 終了 ***")
# --------------------------------------------------------------------
