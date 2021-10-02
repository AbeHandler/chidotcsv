# pbpaste  > acm_acceptance.txt (paste from acm website)
cat acm_acceptance.txt | tr -d "CHI" | tr -d "'" | awk -F" " '{print $1,$2}' | tr -d ","
