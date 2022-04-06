source_dir="../diaryshare-qys"

git checkout pages
git pull

cp -rf $source_dir/pages/* ./pages

cp -rf $source_dir/logseq/* ./logseq

sed -i 's/\.\.\/assets\//https:\/\/nas.qysit.com:2046\/geekpanshi\/diaryshare\/-\/raw\/main\/assets\//g' ./pages/*.org

currentdate=$(date '+%Y-%m-%d %H:%M:%S')

git add pages/*.org

git commit -am "auto commit on ""$currentdate"

git push

cd -
