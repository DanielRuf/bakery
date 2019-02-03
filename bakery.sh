#!/bin/bash

if ! [ -x "$(command -v brotli)" ]; then
BAKERY_DIRECTORY="bakery"
BROTLI_DOWNLOAD="https://dl.bintray.com/eustas/brotli/brotli-linux-2018-11-12.zip"

  # create bakery directory if it does not exist
  if [ ! -d "$BAKERY_DIRECTORY" ]; then
    mkdir $BAKERY_DIRECTORY
  fi

  # download brotli binary if it does not exist
  if [ ! -f "$BAKERY_DIRECTORY/brotli" ]; then
    rm -f $BAKERY_DIRECTORY/*
    curl -#SL $BROTLI_DOWNLOAD > brotli.zip
    unzip brotli.zip -d $BAKERY_DIRECTORY
    rm brotli.zip
  fi

fi

for f in $1/*.{css,js}
do
  echo "Processing $f file..."
  brotli -5 $f
done

echo "Done"