#!/bin/bash

# usage: ./deploy_app.sh <app name> <path to whanos.yaml> <repository image> <repository name> <repository tag>
if [ $# -ne 5 ]; then
    echo "You must provide 5 arguments: <app name> <path to whanos.yaml> <repository image> <repository name> <repository tag>"
    exit 1
fi

SHABSOLUTE=$(cd "$(dirname "$0")"; pwd)
echo $SHABSOLUTE

EXECPATH=$(pwd)
echo $EXECPATH

rm -f $SHABSOLUTE/mychart/values.yaml
touch $SHABSOLUTE/mychart/values.yaml
cat $2 >> $SHABSOLUTE/mychart/values.yaml
echo "" >> $SHABSOLUTE/mychart/values.yaml
echo "image: $3/$4:$5" >> $SHABSOLUTE/mychart/values.yaml

helm install $1 $SHABSOLUTE/mychart