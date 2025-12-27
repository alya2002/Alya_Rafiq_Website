#!/bin/bash

echo "Rebuilding site..."


rm -rf public
mkdir public


cp -r assets/* public/


for page in pages/*.html; do
    FILE="${page#pages/}"
    echo -n "> building ${FILE}... "
    scripts/buildpage.sh "$page"
    echo "done."
done

echo "Finished!"
quel