BASEDIR=~/ls/sim/
for tabletid in $(seq 1 3) 
do 
  TABLETNAME="tablet$tabletid"
  TABLETDIR=$BASEDIR/tablet$tabletid
  TABLETDATA=$TABLETDIR/data
  mkdir -p $TABLETDATA

  for i in $(seq 1 10)
  do 
    touch $TABLETDATA/`uuidgen`
  done

  cd $TABLETDATA/
  git init 
  git annex init 
  git annex add .
  git commit -a -m "added on $TABLETNAME"

done
