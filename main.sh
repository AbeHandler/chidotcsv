#!/usr/bin/env bash

mkdir -p html
mkdir -p html/2009
mkdir -p html/2010
mkdir -p html/2015
mkdir -p bib
mkdir -p xml

./collect_data.sh
./process_data.sh
./validate_data.sh 
