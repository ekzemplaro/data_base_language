awk '{print $2}' installed_target.txt > tmp010
dpkg -l > installed_cur.txt
awk '{print $2}' installed_cur.txt > tmp020
#
./pick_package.py tmp010 tmp020 > tmp050
#
awk '{print "sudo apt-get -y install",$1}' tmp050 > go_install
#
wc go_install
