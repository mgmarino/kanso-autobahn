#!/bin/bash
MODULENAME=autobahn
CWD=`pwd`
PUBLISHDIR=${CWD}/publish
VERSION="0.9.6"
URL="http:\/\/autobahn.ws"
REPONAME=$MODULENAME
DOWNLOAD_URL=https://autobahn.s3.amazonaws.com/autobahnjs/$VERSION/$MODULENAME.js
curl -L -O $DOWNLOAD_URL
for var in README.md kanso.json
do
  sed -e s/@VERSION@/$VERSION/g \
      -e s/@MODULENAME@/$MODULENAME/g \
      -e s/@URL@/$URL/g \
             $var.in > $var 
done
rm -rf ${PUBLISHDIR}
mkdir ${PUBLISHDIR} 
mv README.md kanso.json $MODULENAME.js ${PUBLISHDIR} 
cd ${PUBLISHDIR}
kanso publish
cd ${CWD} 
