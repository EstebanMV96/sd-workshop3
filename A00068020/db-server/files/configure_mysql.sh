#!/usr/bin/expect -f
set timeout 2000
spawn apt-get install mysql-server -y
expect ":"
send -- "root\r"
expect ":"
send -- "root\r"
expect eof