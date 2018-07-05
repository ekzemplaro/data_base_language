#! /usr/bin/julia
#
#	csv_create.jl
#
#					Jul/05/2018
# --------------------------------------------------------------------
#
include("text_manipulate.jl")
#
# --------------------------------------------------------------------
function data_prepare_proc()
	dict_aa = Dict()
#
	dict_aa = dict_append_proc(dict_aa,"t1271","千葉",73561,"2013-7-30")
	dict_aa = dict_append_proc(dict_aa,"t1272","勝浦",24895,"2013-8-10")
	dict_aa = dict_append_proc(dict_aa,"t1273","市原",67294,"2013-1-14")
	dict_aa = dict_append_proc(dict_aa,"t1274","流山",73612,"2013-5-9")
	dict_aa = dict_append_proc(dict_aa,"t1275","八千代",63491,"2013-8-4")
	dict_aa = dict_append_proc(dict_aa,"t1276","我孫子",41827,"2013-1-21")
	dict_aa = dict_append_proc(dict_aa,"t1277","鴨川",12946,"2013-7-23")
	dict_aa = dict_append_proc(dict_aa,"t1278","銚子",79128,"2013-11-26")
	dict_aa = dict_append_proc(dict_aa,"t1279","市川",13572,"2013-10-15")
#
	
	return	dict_aa
end
# --------------------------------------------------------------------
println("*** 開始 ***")
fname_out = ARGS[1]
println(fname_out)
#
dict_aa = data_prepare_proc()
dict_to_csv_proc(dict_aa,fname_out)
#
println("*** 終了 ***")
# --------------------------------------------------------------------
