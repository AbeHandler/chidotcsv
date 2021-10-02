echo $1
grep -e "inproceedings" -e 'article' -A 3 $1 | egrep '^title' | grep -v booktitle | wc -l
egrep "^year" $1 | wc -l 
