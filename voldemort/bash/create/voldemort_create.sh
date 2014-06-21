/home/uchida/dbm/voldemort/voldemort-1.3.0/bin/voldemort-shell.sh cities tcp://localhost:6666 << EOF
put 't3051' '{"name":"和歌山","population":"95127","date_mod":"2001-4-11"}'
put 't3052' '{"name":"海南","population":"97152","date_mod":"2001-5-12"}'
put 't3053' '{"name":"橋本","population":"35316","date_mod":"2001-7-21"}'
put 't3054' '{"name":"有田","population":"74683","date_mod":"2001-8-30"}'
put 't3055' '{"name":"御坊","population":"86294","date_mod":"2001-9-14"}'
put 't3056' '{"name":"田辺","population":"65124","date_mod":"2001-2-18"}'
put 't3057' '{"name":"新宮","population":"53782","date_mod":"2001-1-9"}'
put 't3058' '{"name":"紀の川","population":"41598","date_mod":"2001-3-15"}'
put 't3059' '{"name":"岩出","population":"23176","date_mod":"2001-7-14"}'
get 't3051'
get 't3052'
get 't3053'
exit
EOF
