DIR=/var/lib/dpatch/pattern/cocci/defined/

if [ ! -d "$DIR" ]; then
	echo '$DIR does not exists'
	exit 1
fi

NPCNT=0
UPCNT=0

PATTERNS=`find $DIR -name *.cocci`

for p in $PATTERNS
do
	bp=`basename $p`
	DST=`find . -name $bp`
	if [ "$DST" != "" ]; then
		diff $p $DST > /dev/null
		if [ $? -ne 0 ]; then
			echo "[P] UPDATE $bp"
			cp -rf $p $DST
			UPCNT=$((UPCNT+1))
		fi
	else
		echo "[P] NEW    $p"
		NPCNT=$((NPCNT+1))
	fi
done

echo
echo "Total Patch  UPDATE: $UPCNT, NEW: $NPCNT"

