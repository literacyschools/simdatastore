BASEDIR=ls/sim/
HOSTNAME=localhost
HOMEDIR=/Users/$USER

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
    TABLETDIR=$HOMEDIR/$BASEDIR/$SOURCE_TABLETNAME
    TABLETDATA=$TABLETDIR/data
    cd $TABLETDATA
    git remote add $TARGET_TABLETNAME ssh://$HOSTNAME/$HOMEDIR/$BASEDIR/$TARGET_TABLETNAME/data
  done
  git annex sync
done
