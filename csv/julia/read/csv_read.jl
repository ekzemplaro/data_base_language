#! /usr/bin/julia
#
#	csv_read.jl
#
#					Oct/27/2014
# --------------------------------------------------------------------
include ("text_manipulate.jl")
#
# --------------------------------------------------------------------
println ("*** 開始 ***")
fname_in = ARGS[1]
println (fname_in)
#
dict_aa = csv_to_dict_proc (fname_in)
dict_display_proc (dict_aa)
#
println ("*** 終了 ***")
# --------------------------------------------------------------------
