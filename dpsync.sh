DIR=/var/lib/dpatch/pattern/cocci/

if [ ! -d "$DIR" ]; then
	echo '$DIR does not exists'
	exit 1
fi

NPCNT=0
UPCNT=0

PATTERNS=`cd $DIR/patchs; ls *.cocci`

for p in $PATTERNS
do
	DST=`find patchs -name $p`
	if [ "$DST" != "" ]; then
		diff $DIR/patchs/$p $DST > /dev/null
		if [ $? -ne 0 ]; then
			echo "[P] UPDATE $p"
			cp -rf $DIR/patchs/$p $DST
			UPCNT=$((UPCNT+1))
		fi
	else
			echo "[P] NEW    $p"
			NPCNT=$((NPCNT+1))
	fi
done

NRCNT=0
URCNT=0

PATTERNS=`cd $DIR/reports; ls *.cocci`

for p in $PATTERNS
do
	DST=`find reports -name $p`
	if [ "$DST" != "" ]; then
		diff $DIR/reports/$p $DST > /dev/null
		if [ $? -ne 0 ]; then
			echo "[R] UPDATE $p"
			cp -rf $DIR/reports/$p $DST
			URCNT=$((URCNT+1))
		fi
	else
			echo "[R] NEW    $p"
			NRCNT=$((NRCNT+1))
	fi
done

echo
echo "Total Patch  UPDATE: $UPCNT, NEW: $NPCNT"
echo "Total Eeport UPDATE: $URCNT, NEW: $NRCNT"

