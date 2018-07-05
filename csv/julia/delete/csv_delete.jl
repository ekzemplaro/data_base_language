#! /usr/bin/julia
#
#	csv_delete.jl
#
#					Jul/05/2018
# --------------------------------------------------------------------
include("text_manipulate.jl")
#
# --------------------------------------------------------------------
println("*** 開始 ***")
fname_csv = ARGS[1]
key_in = ARGS[2]
println(fname_csv)
println(key_in)
#
dict_aa = csv_to_dict_proc(fname_csv)
#
if ( haskey(dict_aa,key_in))
	delete!(dict_aa, key_in)
	dict_to_csv_proc(dict_aa,fname_csv)
end
#
println("*** 終了 ***")
# --------------------------------------------------------------------
