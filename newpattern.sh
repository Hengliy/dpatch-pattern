COCCI=$1

MSG=`sh cocci2msg.sh $1`
git add $1
git commit -s -m "$MSG"
git log -n 1
