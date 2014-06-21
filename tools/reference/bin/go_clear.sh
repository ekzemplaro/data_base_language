#! /bin/bash
#
#	go_clear.sh
#
sort -u | \
	sed 's/(//g' | \
	sed 's/)//g' | \
	sed 's/;//g' | \
	sed 's/"//g' | \
	sed "s/'//g" | \
	sed "s/\/var\/www//g" | \
	sort -u
#
