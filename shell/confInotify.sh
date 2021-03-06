#!/bin/bash

MAX_NUM=9999999
if [ `cat /proc/sys/fs/inotify/max_user_watches` -lt $MAX_NUM ];then
	echo $MAX_NUM > /proc/sys/fs/inotify/max_user_watches

	IS_KILL_WATCHER=1
fi

if [ `cat /proc/sys/fs/inotify/max_queued_events` -lt $MAX_NUM ];then
	echo $MAX_NUM > /proc/sys/fs/inotify/max_queued_events
	IS_KILL_WATCHER=1
fi

if [ $IS_KILL_WATCHER ];then
	`dirname $0`/stopWatcher.sh
	LOG_PATH=d:/test/log;
	echo 'kill watcher,config inotify' >> $LOG_PATH/conf_inotify_$(date +%Y-%m-%d).log
fi