#!/bin/sh

i=0
icon=''
arr=('|' '/' '-' '\')
index=0

cur_year=`date +%Y`
cur_time_stamp=`date +%s`

cur_year_str=`date -d @$cur_time_stamp "+%Y"`"-01-01 00:00:00"
cur_year_start=`date -d "$cur_year_str" +%s`

next_year_str=$((`date -d @$cur_time_stamp "+%Y"` + 1))"-01-01 00:00:00"
next_year_start=`date -d "$next_year_str" +%s`

percentage=$(($(($(($cur_time_stamp - $cur_year_start)) * 100))/ $(($next_year_start - $cur_year_start))))

echo -e ""
while [ $i -le 50 ]
do
  ((i++))
  index=`echo $cur_time_stamp%4`
  if [ $i -le $((50 - $(($percentage / 2)))) ]; then
    icon='.'$icon
  else
    icon=':'$icon
  fi
done
printf "[\033[32m%-50s\033[0m] %d 年进度条 [ \033[31m%d%%\033[0m ] [%c]\r" "$icon" "$cur_year" "$percentage" "${arr[$index]}"
echo -e "\n"

week_info=`echo \`TZ=Asia/Shanghai date +%W\` | awk '{print int($0)}'`

printf "%d 年进度条 [ %s%% ]，第 [ %d ] 周。\n" "$cur_year" "$percentage" "$(($week_info + 1))"
