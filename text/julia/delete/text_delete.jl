#! /usr/bin/julia
#
#	text_delete.jl
#
#					Jul/05/2018
# --------------------------------------------------------------------
include("text_manipulate.jl")
#
# --------------------------------------------------------------------
println("*** 開始 ***")
fname_text = ARGS[1]
key_in = ARGS[2]
println(fname_text)
println(key_in)
#
dict_aa = text_to_dict_proc(fname_text)
#
if ( haskey(dict_aa,key_in))
	delete!(dict_aa, key_in)
	dict_to_text_proc(dict_aa,fname_text)
end
#
println("*** 終了 ***")
# --------------------------------------------------------------------
