grep require */*.js | grep common | awk '{print $5}' | grep common | sort -u | \
	sed 's/(//g' | \
	sed 's/)//g' | \
	sed 's/;//g' | \
	sed 's/"//g' | \
	sed "s/'//g" | \
	sed "s/\/var\/www//g" | \
	sort -u > reference.txt
#
