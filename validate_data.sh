cat acm_acceptance.txt | tr -d "CHI" | tr -d "'" | awk -F" " '{print $1,$3}' | tr -d "," | grep -v Over > acm.csv
cat years.txt |sort -n | uniq -c | tac | grep -v 2020 | grep -v 81 > years_check.csv 

wc -l titles.txt years.txt *col

paste years_check.csv acm.csv
