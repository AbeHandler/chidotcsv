#!/usr/bin/env bash

# some kind of issue w/ 87 bib file
cat bib/87.bib | tr 'year = {1986}' 'year = {1987}' > /tmp/a && mv /tmp/a bib/87.bib


cat bib/*bib | grep -e "@inproceedings" -e "article" -A 3 | egrep "^title" > titles.txt
#cat *bib | egrep "^url" | grep "https[^}]*" -o > doi.txt
cat bib/*bib | egrep "^year =" | egrep '[0-9]{4}' -o > years.txt



find html/2009/*html | parallel -j 1 "python 2009parser.py {}" > 2009titles.txt
cat 2009titles.txt >> titles.txt
loops=$(cat 2009titles.txt | wc -l)
for l in $(seq 1 $loops);
do
    echo "2009" >> years.txt;
done


cat html/2010/*html | grep '<span[^//]*' -o | grep small-caps | awk -F">" '{print $2}' | tr -d "<" > 2010titles.txt
cat 2010titles.txt >> titles.txt
loops=$(cat 2010titles.txt | wc -l)
for l in $(seq 1 $loops);
do
    echo "2010" >> years.txt;
done

python 2011processor.py 'html/11.html'  >> titles.txt
loops=$(python 2011processor.py 'html/11.html' | wc -l)
for l in $(seq 1 $loops);
do
    echo "2011" >> years.txt;
done

python 2012processor.py 'html/12.html' 'title' >> titles.txt
loops=$(python 2012processor.py 'html/12.html' 'title' | wc -l)
for l in $(seq 1 $loops);
do
    echo "2012" >> years.txt;
done

# 2013
python 2013processor.py 'html/13.html' 'title' >> titles.txt
loops=$(python 2013processor.py 'html/13.html' 'title' | wc -l)
for l in $(seq 1 $loops);
do
    echo "2013" >> years.txt;
done

python 2015processor.py html/2015/manual.html "paper-title" > 2015titles.txt
cat 2015titles.txt >> titles.txt
loops=$(cat 2015titles.txt | wc -l)
for l in $(seq 1 $loops);
do
    echo "2015" >> years.txt;
done

for j in 14 16 17 18 19
    do
    python title_processor.py html/$j.html DLtitleLink >> titles.txt
    loops=$(python title_processor.py html/$j.html DLtitleLink | wc -l)
    for l in $(seq 1 $loops);
    do
        echo "20"$j >> years.txt;
    done
done

cat xml/20.xml | grep title | awk -F">" '{print $2}' | awk -F"<" '{print $1}' >> titles.txt
cat xml/20.xml | grep title | awk -F">" '{print $2}' | awk -F"<" '{print 2020}' >> years.txt

wc -l titles.txt years.txt *col

paste titles.txt years.txt > chi.tsv
