
url=$(cat $1 | jq ".archived_snapshots | .closest | .url" | tr -d '"')

base=$(echo $1 | sed "s/.json//")

wget $url -O $base'.html'
