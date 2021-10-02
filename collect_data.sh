#!/usr/bin/env bash

mkdir -p html
mkdir -p xml
mkdir -p bib

./collect2009.sh
./collect2010.sh

wget http://www.chi2010.org/attending/advance-program.html -O 10.html
wget http://chi2011.org/program/program.html -O 11.html
wget https://chi2012.acm.org/program/desktop/program.html -O 12.html
wget https://chi2013.acm.org/program/by-venues/papers-and-notes/ -O 13.html
wget https://chi2014.acm.org/proceedings -O 14.html


# for 2015 I had to copy the html by hand from some mIT project
# the 2015 site is not able to show all the papers
# https://confer.csail.mit.edu/chi2015/papers
# pbpaste > html/2015/manual.html 

wget https://chi2016.acm.org/wp/chi-2016-proceedings/ -O 16.html
wget https://chi2017.acm.org/proceedings.html -O 17.html
wget https://chi2018.acm.org/attending/proceedings/ -O 18.html
wget https://chi2019.acm.org/for-attendees/proceedings/ -O 19.html

# 2020
wget -O 20.xml https://chi2020.acm.org/wp-content/uploads/2020/04/data.xml_.zip
unzip -o 20.xml
mv data.xml xml/20.xml
rm 20.xml

mv *html html/
mv *bib bib/
