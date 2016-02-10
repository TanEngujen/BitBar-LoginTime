#!/bin/bash

# Get the first and latest login time of the day.
# This plugin refresh every 1 hour.
#
# by Tan Nhat Nguyen me@tan-nguyen.de
#
# Tweak it for your benefits.

# Metadata for BitBar
# <bitbar.title>Login Time</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Tan Nhat Nguyen</bitbar.author>
# <bitbar.author.github>TanNhatNguyen</bitbar.author.github>
# <bitbar.desc>Shows the first and the latest login time of the day.</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/TanNhatNguyen/BitBar-LoginTime/master/logintime_screenshot.png</bitbar.image>
# <bitbar.abouturl>https://github.com/TanNhatNguyen/BitBar-LoginTime</bitbar.abouturl>

LOGFILEPATH="/var/log/accountpolicy.log"

function getLoginData
{
    if [ "$1" == "first" ] ; then
        head -n1 $LOGFILEPATH | tr -s ' ' | cut -d " " -f3
    elif [ "$1" == "last" ] ; then
        tail -n1 $LOGFILEPATH | tr -s ' ' | cut -d " " -f3
    fi
}

echo "LoginTime"

echo "---"
echo "First Login: | $FONT color=orange"
getLoginData first
echo "---"

echo "---"
echo "Last Login:| $FONT color=orange"
getLoginData last
echo "---"