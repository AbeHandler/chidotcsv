mkdir -p html/2010
max=$(cat html/10.html| grep "advance" | egrep "[0-9]*.html" -o | sed "s/.html//" | sort -n | tail -1)


for i in $(seq 1  $max)
do
    wget 'http://www.chi2010.org/attending/advance-program/'$i'.html' -O html/2010/$i.html
done

find html/2010/*html | grep '<span[^//]*' -o | grep small-caps | awk -F">" '{print $2}' | tr -d "<"
