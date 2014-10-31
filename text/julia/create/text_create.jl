#! /usr/bin/julia
#
#	text_create.jl
#
#					Oct/27/2014
# --------------------------------------------------------------------
#
include ("text_manipulate.jl")
#
# --------------------------------------------------------------------
function data_prepare_proc ()
	dict_aa = Dict()
#
	dict_aa = dict_append_proc (dict_aa,"t2381","名古屋",92761,"2013-5-30")
	dict_aa = dict_append_proc (dict_aa,"t2382","豊橋",37295,"2013-9-10")
	dict_aa = dict_append_proc (dict_aa,"t2383","岡崎",81674,"2013-2-14")
	dict_aa = dict_append_proc (dict_aa,"t2384","一宮",73612,"2013-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2385","蒲郡",52391,"2013-8-4")
	dict_aa = dict_append_proc (dict_aa,"t2386","常滑",95187,"2013-1-21")
	dict_aa = dict_append_proc (dict_aa,"t2387","大府",31246,"2013-7-23")
	dict_aa = dict_append_proc (dict_aa,"t2388","瀬戸",85791,"2013-11-26")
	dict_aa = dict_append_proc (dict_aa,"t2389","犬山",24139,"2013-10-15")
#
	
	return	dict_aa
end
# --------------------------------------------------------------------
println ("*** 開始 ***")
fname_out = ARGS[1]
println (fname_out)
#
dict_aa = data_prepare_proc ()
# dict_display_proc (dict_aa)
dict_to_text_proc (dict_aa,fname_out)
#
println ("*** 終了 ***")
# --------------------------------------------------------------------
