#!/bin/bash
jq '. | split("\n") | map( {"{#DOMAIN}": .} ) | {data: .} ' -R -s 1.txt
