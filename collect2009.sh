for i in $(seq 1  300)
do
    wget 'https://archive.org/wayback/available?url=chi2009.org/Attending/AdvanceProgram/'$i'.html&timestamp=20080101' -O html/2009/$i.json
done

find html/2009/*json | parallel -j 6 "./2009helper.sh {}"
