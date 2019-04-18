#!/bin/bash

USERNAME="nuretan"
IPADDRESS="127.0.0.1"
LOGIN_PW="loginpw"

expect -c "

set timeout 5

spawn ssh ${USERNAME}@${IPADDRESS}

expect \"(yes/no)?\" {
  send \"yes\n\"
  expect \"password:\"
  send \"${LOGIN_PW}\n\"
} \"password:\" {
      send \"${LOGIN_PW}\n\"
}
expect \"> \"
send \"set cli screen-length 0\n\"
expect \"> \"

interact
"
