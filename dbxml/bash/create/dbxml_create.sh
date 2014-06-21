#! /usr/local/bin/dbxml -s
#
createContainer "cities.dbxml"
putDocument t0821 '<t0821><name>山形</name>
	<population>95872</population><date_mod>2001-9-25</date_mod></t0821>' 
putDocument t0822 '<t0822><name>米沢</name>
	<population>61593</population><date_mod>2001-8-12</date_mod></t0822>' 
putDocument t0823 '<t0823><name>酒田</name>
	<population>87267</population><date_mod>2001-3-25</date_mod></t0823>' 
putDocument t0824 '<t0824><name>鶴岡</name>
	<population>54791</population><date_mod>2001-9-8</date_mod></t0824>' 
putDocument t0825 '<t0825><name>寒河江</name>
	<population>45268</population><date_mod>2001-2-18</date_mod></t0825>' 
putDocument t0826 '<t0826><name>天童</name>
	<population>26715</population><date_mod>2001-6-17</date_mod></t0826>' 
putDocument t0827 '<t0827><name>新庄</name>
	<population>68914</population><date_mod>2001-1-24</date_mod></t0827>' 
putDocument t0828 '<t0828><name>南陽</name>
	<population>91762</population><date_mod>2001-3-12</date_mod></t0828>' 
putDocument t0829 '<t0829><name>尾花沢</name>
	<population>15348</population><date_mod>2001-10-9</date_mod></t0829>' 
query 'collection("cities.dbxml")'
print
quit
