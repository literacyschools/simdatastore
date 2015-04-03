BASEDIR=$( cd $(dirname $0) ; pwd -P )/instance
HOSTNAME=localhost

for tabletid1 in $(seq 1 3) 
do 
  for tabletid2 in $(seq 1 3)
  do
    if [ "$tabletid1" -eq "$tabletid2" ]; then
      continue
    fi
    SOURCE_TABLETNAME="tablet$tabletid1"
    TARGET_TABLETNAME="tablet$tabletid2"
    # assuming hostname tablet$tabletid is in /etc/hosts
    TABLETDIR=$BASEDIR/$SOURCE_TABLETNAME
    TABLETDATA=$TABLETDIR/data
    cd $TABLETDATA
    REMOTE="ssh://$HOSTNAME/$BASEDIR/$TARGET_TABLETNAME/data"
    echo $REMOTE
    git remote add $TARGET_TABLETNAME $REMOTE
  done
  git annex sync
done
