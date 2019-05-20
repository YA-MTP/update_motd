#!/bin/sh
upSeconds=`/usr/bin/cut -d. -f1 /proc/uptime`
secs=$(($upSeconds%60))
mins=$(($upSeconds/60%60))
hours=$(($upSeconds/3600%24))
days=$(($upSeconds/86400))
UPTIME=`printf "%d days, %02dh %02dm %02ds " "$days" "$hours" "$mins" "$secs"`

echo "\e[94m
____   ______________  _________
\   \ /   /\______   \/   _____/        \033[0;37mLinux..............: `uname -srmo`\e[94m
 \   Y   /  |     ___/\_____  \         \033[0;37mDate...............: `date +"%A, %e %B %Y, %R"`\e[94m
  \     /   |    |    /        \        \033[0;37mUptime.............: $UPTIME\e[94m
   \___/    |____|   /_______  /        \033[0;37mMemory.............: $((`cat /proc/meminfo | grep MemFree | awk {'print $2'}`/1024))MB (Free)  / $((`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`/1024))MB (Total)\e[94m
                             \/         \033[0;37mRunning Processes..: `ps ax | wc -l | tr -d " "`
\e[94m" > /etc/motd
