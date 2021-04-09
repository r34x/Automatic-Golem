#!/bin/bash
if cat $HOME/.local/share/yagna/yagna_rCURRENT.log | grep -q ERROR; then
for i in $(ps -ef | grep golem-provider | grep -v grep | awk '{print $2}')
do
kill -9 $i
done
sleep 5s
golemsp run > /dev/null 2>&1 &
fi
