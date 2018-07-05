#! /usr/bin/julia
#
#	text_read.jl
#
#					Jun/05/2018
# --------------------------------------------------------------------
include("text_manipulate.jl")
#
# --------------------------------------------------------------------
println("*** 開始 ***")
fname_in = ARGS[1]
println(fname_in)
#
dict_aa = text_to_dict_proc(fname_in)
dict_display_proc(dict_aa)
#
println("*** 終了 ***")
# --------------------------------------------------------------------
