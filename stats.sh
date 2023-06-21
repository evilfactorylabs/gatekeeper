#!/usr/bin/env bash

echo \n "" > stats.out

for TAG_DATE in $(git tag --sort=creatordate  --format='%(refname:short),%(creatordate:short)'); do
  # echo "$TAG_DATE"
  split=(${TAG_DATE//,/ })
  # echo ${split[0]}
  git checkout tags/${split[0]} readmeData.json
  entries=$(jq '.base.entries' readmeData.json)
  echo ${split[1]},${entries} >> stats.out
done
