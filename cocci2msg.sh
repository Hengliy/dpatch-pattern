COCCI=$1
if [ ! -f $COCCI ]; then
	echo $COCCI does not exists!
fi
NAME=`basename $COCCI`
DNAME=`dirname $COCCI`
DNAME=`dirname $DNAME`
if [ "$DNAME" == "reports" ]; then
echo "report: new report pattern $NAME"
else
echo "patch: new patch pattern $NAME"
fi
echo
#DESC=`grep /// $COCCI | sed -e 's/\/\/\/ Fixed: .*//' | sed -e 's/\/\/\/ Except File: .*//'`
grep /// $COCCI | sed -e 's/\/\/\/ Fixed: .*//' | sed -e 's/\/\/\/ Except File: .*//' | sed -e 's/\/\/\/ //' | sed -e 's/\/\/\///' |  while read line
do
	if [ "$line" == "" ]; then
		echo "blank" > /dev/null
		export BLANK=1
	else
		if [ "${BLANK}" == "1" ]; then
			echo ""
		fi
		echo $line
		export BLANK=0
	fi
done
echo
