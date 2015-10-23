# ------------------------------------------------------------------
#
#	text_create.exs
#
#						Jul/24/2015
# ------------------------------------------------------------------
defmodule MyModule do
    def write(file_out, word ) do
        case File.open file_out, [:write] do          # 開く
            {:ok, file} -> writeStr( file, word )    # 書き込む
                           File.close file           # 閉じる
            {:error, posix } -> IO.puts posix
        end
    end
 
    def writeStr( file, word ) do
        IO.binwrite file, word
    end
end

# ------------------------------------------------------------------
IO.puts "*** 開始 ***"
file_out = hd System.argv()
IO.puts file_out
aa = "t2381\t名古屋\t93514\t1910-5-17\n"
bb = "t2382	豊橋	31298	1910-9-10\n"
cc = "t2383	岡崎	28458	1910-2-14\n"
dd = "t2384	一宮	62542	1910-7-9\n"
ee = "t2385	蒲郡	42619	1910-8-4\n"
ff = "t2386	常滑	35182	1910-1-21\n"
gg = "t2387	大府	81247	1910-7-23\n"
hh = "t2388	瀬戸	25798	1910-10-26\n"
ii = "t2389	犬山	84135	1910-12-15\n"
str_out = Enum.join([aa,bb,cc,dd,ee,ff,gg,hh,ii])
MyModule.write(file_out,str_out)
IO.puts "*** 終了 ***"
# ------------------------------------------------------------------
