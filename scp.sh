#!/bin/bash

ip=$1
port=$2
pwd=$3


/usr/bin/expect << EOF
set timeout 900
spawn scp -P $port root@$ip:/etc/v2-ui/v2-ui.db  /etc/v2-ui/v2-ui.db
expect {
"*yes/no" { send "yes\r"; exp_continue}
"*password:" {send "$pwd\r"}
}



interact
expect eof
EOF

systemctl restart v2-ui 


