DIR=/var/lib/dpatch/pattern/cocci/defined/

PATTERNS=`find $DIR -name $1`
COCCI=$2

for name in $PATTERNS
do
	bname=`basename $name`
	DST=`find . -name $bname`
	if [ "$DST" != "" ]; then
		echo "SKIP: $name exists: $DST"
	else
		cp $name $COCCI/
		MSG=`sh cocci2msg.sh $COCCI/$name`
		git add $COCCI/$name
		git commit -s -m "$MSG"
		git log -n 1
	fi
done
