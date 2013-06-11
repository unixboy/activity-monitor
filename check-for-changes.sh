#!/bin/sh
# To execute this script:
# 	./check-for-changes.sh john@doe.de "http://foo.bar/" 
#
# To preprocess the fetched content use
# 	./check-for-changes.sh john@doe.de "http://foo.bar/" "./yourscript.sh"
#

# the bash of the configuration-file in ${2} is used 
# as a name for temporary files
if [ "$(uname)" = "Linux" ]; 
then
	md5path=`which md5sum`
	tmpfilename=`echo ${2} | $md5path | cut -f1 -d' '`
else
	# only tested on Darwin, should work on other *BSDs too
	md5path=`which md5`
	tmpfilename=`$md5path -q -s ${2}`
fi

localcopy="./tmp/$tmpfilename".html
onlinecopy="./tmp/$tmpfilename"_new.html

if [ $# -eq 3 ]; then
	curl -L ${2} | $3 > $onlinecopy;
else
	curl -L ${2} > $onlinecopy
fi

# temporary local copy already exists?
if [ ! -f $localcopy ]
then
	echo "initializing..."
	cp $onlinecopy $localcopy
fi

# are the files different?
if ! cmp -s $onlinecopy $localcopy; 
then
	echo "sending mail.."
	diff $onlinecopy $localcopy | mail -s "[Notification] Changes ${2}" ${1}
else
	echo "no changes..."
fi

rm $localcopy
mv $onlinecopy $localcopy
