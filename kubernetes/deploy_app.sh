#!/bin/bash

# usage: ./deploy_app.sh <app name> <path to whanos.yaml> <image>
if [ $# -ne 3 ]; then
    echo "You must provide 3 arguments: <app name> <path to whanos.yaml> <image>"
    exit 1
fi

SHABSOLUTE=$(
    cd "$(dirname "$0")"
    pwd
)
EXECPATH=$(pwd)

rm -f "$SHABSOLUTE/mychart/values.yaml"
touch "$SHABSOLUTE/mychart/values.yaml"
cat "$2" >>"$SHABSOLUTE/mychart/values.yaml"
echo "" >>"$SHABSOLUTE/mychart/values.yaml"
echo "image: $3" >>"$SHABSOLUTE/mychart/values.yaml"

helm install "$1" "$SHABSOLUTE/mychart"
