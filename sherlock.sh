#!/usr/bin/env bash
#
# Jus de Patate <yaume@ntymail.com>
# First release :         2019.01.18-01
                    VERSION="2019.11.24"
#                              yyyy.mm.dd
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

# FUNCTION :
tests () {
    echo "${GREEN}${BOLD}[${WHITE}*${GREEN}] Checking username ${WHITE}$1${GREEN} on:"
    # Instagram :
    if [ "$(curl -s -A "$ua" -I -L https://www.instagram.com/"$1"?hl=en -H 'DNT: 1' | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Instagram:${WHITE}${NORMAL} https://www.instagram.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Instagram:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Twitter :
    if [ "$(curl -s -A "$ua" -I -L https://www.twitter.com/$1 | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Twitter:${WHITE}${NORMAL} https://www.twitter.com/$1"
    else
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Twitter:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Facebook
    if [ "$(curl -s -A "$ua" -I -L https://facebook.com/$1 | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Facebook:${WHITE}${NORMAL} https://www.facebook.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Facebook:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # YouTube :
    if [ ! "$(curl -s -A "$ua" -L https://www.youtube.com/$1 -H 'Origin: https://www.youtube.com' | grep "Not Found")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} YouTube:${WHITE}${NORMAL} https://www.youtube.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} YouTube:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Blogspot
    if [ "$(curl -s -A "$ua" -I -L https://$1.blogspot.com/ | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Blogspot:${WHITE}${NORMAL} https://$1.blogspot.com/"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Blogspot:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Reddit:
    if [ ! "$(curl -s -A "$ua" -L https://www.reddit.com/user/$1 | grep "page not found")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Reddit:${WHITE}${NORMAL} https://www.reddit.com/u/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Reddit:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Pinterest
    if [ ! "$(curl -s -A "$ua" -I -L https://www.pinterest.com/$1 | grep "https://www.pinterest.com/?show_error=true")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Pinterest :${WHITE}${NORMAL} https://www.pinterest.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Pinterest:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # GitHub
    if [ "$(curl -s -A "$ua" -I -L https://www.github.com/$1 | grep "HTTP/1.1 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} GitHub:${WHITE}${NORMAL} https://www.github.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} GitHub:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Steam
    if [ ! "$(curl -s -A "$ua" -I -L https://www.steamcommunity.com/id/$1 | grep "The specified profile could not be found")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Steam:${WHITE}${NORMAL} https://www.steamcommunity.com/id/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Steam:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Vimeo
    if [ ! "$(curl -s -A "$ua" -I -L https://www.vimeo.com/$1 | grep "HTTP/1.1 404")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Vimeo:${WHITE}${NORMAL} https://www.vimeo.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Vimeo:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # SoundCloud
    if [ "$(curl -s -A "$ua" -I -L https://www.soundcloud.com/$1 | grep "HTTP/1.1 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Soundcloud:${WHITE}${NORMAL} https://www.soundcloud.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Soundcloud:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Disqus
    if [ "$(curl -s -A "$ua" -I -L https://www.disqus.com/$1 | grep "HTTP/1.1 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Disqus:${WHITE}${NORMAL} https://www.disqus.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Disqus:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Medium
    if [ "$(curl -s -A "$ua" -I -L https://www.medium.com/@$1 | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Medium:${WHITE}${NORMAL} https://www.medium.com/@$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Medium:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # DeviantART
    if [ "$(curl -s -A "$ua" -I -L https://$1.deviantart.com/ | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} DeviantART:${WHITE}${NORMAL} https://$1.deviantart.com/"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} DeviantART:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # VK
    if [ ! "$(curl -s -A "$ua" -L https://www.vk.com/$1 | grep "404 Not Found")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} VKontakte:${WHITE}${NORMAL} https://vk.com/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} VKontakte:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # aboutme
    if [ "$(curl -s -A "$ua" -I -L https://www.about.me/$1 | grep "HTTP/2 200")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} About.Me:${WHITE}${NORMAL} https://about.me/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} About.Me:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # imgur
    if [  "$(curl -s -A "$ua" -L https://www.imgur.com/user/$1 | grep "$1")" ]; then
        echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} Imgur:${WHITE}${NORMAL} https://www.imgur.com/user/$1"
    else
        echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} Imgur:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    fi

    # Flipboard
    #if [ "$(curl -s -A "$ua" -I -L https://$1.deviantart.com/ | grep "HTTP/2 200")" ]; then
    #    echo "${BOLD}${WHITE}[${GREEN}+${WHITE}]${GREEN} DeviantART:${WHITE}${NORMAL} https://$1.deviantart.com/"
    #else
    #    echo "${BOLD}${WHITE}[${RED}-${WHITE}]${GREEN} DeviantART:${WHITE}${NORMAL} ${YELLOW}Not Found${NORMAL}"
    #fi
}

if [ "$1" ]; then
    tests $1
else
    echo "No argument,"
    echo "Please type who you want to scan"
    read name
    tests $name
fi
