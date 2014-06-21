#! /opt/j/j64_701/bin/jconsole
NB. -----------------------------------------------------------
NB.	text_create.ijs
NB.
NB.					Sep/19/2013
NB.
NB. -----------------------------------------------------------
require 'files'
require 'strings'
echo '*** 開始 ***'
fn =. < '/var/tmp/plain_text/cities.txt'
contents =. 't2381	名古屋	76531	1947-9-12'
contents =. contents , LF , 't2382	豊橋	82149	1947-8-25'
contents =. contents , LF, 't2383	岡崎	91236	1947-2-8'
contents =. contents , LF, 't2384	一宮	78324	1947-5-16'
contents =. contents , LF, 't2385	蒲郡	53761	1947-8-19'
contents =. contents , LF, 't2386	常滑	49256	1947-7-23'
contents =. contents , LF, 't2387	大府	18972	1947-2-7'
contents =. contents , LF, 't2388	瀬戸	93257	1947-1-28'
contents =. contents , LF, 't2389	犬山	52691	1947-4-21'
contents fwrites fn
echo '*** 終了 ***'
exit ''
NB. -----------------------------------------------------------
