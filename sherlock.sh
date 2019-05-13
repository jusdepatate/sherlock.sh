#!/usr/bin/env bash
#
# Jus de Patate <yaume@ntymail.com>
# First release :       2019.01.18-01
               VERSION="2019.01.01-30indev"
#                       yyyy.mm.dd
# In-dev version : https://repl.it/@YaumeXen/sherlocksh / https://sherlocksh.yaumexen.repl.run
#
# Tested on Bash 4.4 on Debian 9
# Based on https://github.com/TheYahya/sherlock and https://github.com/jusdepatate/info.sh
#
# License : MIT
#
# Arguments :
# --update : update sherlock.sh
# -v : output version of info.sh

if [ "$(which tput 2>/dev/null)" ]; then
    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)
    GREY=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    WHITE=$(tput setaf 7)
else
    BOLD="\e[1m"
    NORMAL="\e[0m"
    RED="\e[31;41m"
    GREEN="\e[32;42m"
    YELLOW="\e[33;43m"
    WHITE="\e[97;107m"
fi

echo "${NORMAL}${WHITE}                                       _"
echo " ___ _            _         _      ___| |__  "
echo "/ __| |_  ___ _ _| |___  __| |__  / __| '_ \ "
echo "\__ \ ' \/ -_) '_| / _ \/ _| / / _\__ \ | | |"
echo "|___/_||_\___|_| |_\___/\__|_\_\\(_)___/_| |_|"
echo
echo

# Arguments (update / v) :
if [ "$1" = "--update" ]; then
    curl "https://raw.githubusercontent.com/jusdepatate/sherlock.sh/master/sherlock.sh"
    echo -e "Update done,\n$(chmod +x sherlock.sh &>/dev/null && bash sherlock.sh -v) was downloaded"
    exit 0
elif [ "$1" = "-v" ]; then
    echo "sherlock.sh $VERSION"
    exit 0
fi

if [ ! $(which curl 2>/dev/null) ]; then
    echo "Install curl please"
    exit 1
fi

# Set a custom user-agent for cURL, I took the same as original sherlock
ua="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:55.0) Gecko/20100101 Firefox/55.0"

# FUNCTIONS :
# this will be changed to 1 function per website to do cool arguments
tests () {
   echo "${GREEN}${BOLD}[${WHITE}*${GREEN}] Checking username ${WHITE}$1${GREEN} on:"
   if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/"$1"?hl=en -H 'DNT: 1' | grep "HTTP/2 200")" ]; then echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Instagram:${WHITE}${NORMAL} https://www.instagram.com/$1"; else echo "IG: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://www.twitter.com/$1 | grep "HTTP/2 200")" ]; then echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Twitter:${WHITE}${NORMAL} https://www.twitter.com/$1"; else echo "TWI: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://facebook.com/$1 | grep "HTTP/2 200")" ]; then echo "FB: yes"; else echo "FB: no"; fi
   if [ ! "$(curl -s -A "$ua" -L https://www.youtube.com/$1 -H 'Origin: https://www.youtube.com' | grep "Not Found")" ]; then echo "YT: yes"; else echo "YT: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://$1.blogspot.com/ | grep "HTTP/2 200")" ]; then echo "BLOGGER: yes"; else echo "blogger: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://plus.google.com/+$1 | grep "HTTP/2 200")" ]; then echo "GPLUS: yes"; else echo "GPLUS: no"; fi
   if [ ! "$(curl -s -A "$ua" -L https://www.reddit.com/user/$1 | grep "page not found")" ]; then echo "Reddit: yes"; else echo "Reddit: no"; fi
   if [ ! "$(curl -s -A "$ua" -I -L https://www.pinterest.com/$1 | grep "https://www.pinterest.com/?show_error=true")" ]; then echo "PT: yes"; else echo "PT: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://www.github.com/$1 | grep "HTTP/1.1 200")" ]; then echo "GH: yes"; else echo "GH: no"; fi
   if [ ! "$(curl -s -A "$ua" -I -L https://www.steamcommunity.com/id/$1 | grep "The specified profile could not be found")" ]; then echo "Steam: yes"; else echo "Steam: no"; fi
   if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "Vimeo: yes"; else echo "Vimeo: no"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
   #if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/$1 | grep "405")" ]; then echo "IG: yes"; fi
}

if [ "$1" ]; then
    tests $1
else
    echo "No argument,"
    echo "Please type who you want to scan"
    read name
    tests $name
fi
