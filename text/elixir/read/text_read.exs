# ------------------------------------------------------------------
#
#	text_read.exs
#
#						Jul/24/2015
# ------------------------------------------------------------------
IO.puts "*** 開始 ***"
file_in = hd System.argv()
contents = File.read! file_in
words = String.split(contents,["\n"])
Enum.each( words, fn x -> IO.puts x end )
IO.puts "*** 終了 ***"
# ------------------------------------------------------------------
