#!/bin/bash

# import statements
# note: telethon, colorama, and termcolor need to be installed prior to running the script

# clear the terminal
clear

# display art
echo -e "\e[35m"
echo -e "█▄▀ ▄▀█ █▄▀ ▄▀█ █▀▄▀█"
echo -e "█░█ █▀█ █░█ █▀█ █░▀░█"
echo -e ""
echo -e "█▀█ █░█░█ █▀▀ ▀█▀"
echo -e "█▀▀ ▀▄▀▄▀ ██▄ ░█░"
echo -e "\e[0m"

# read API credentials from file
if [ -f "api.txt" ]; then
    readarray -t apis < "api.txt"
    if [ ${#apis[@]} -eq 3 ]; then
        api_id=${apis[0]}
        api_hash=${apis[1]}
        string=${apis[2]}

        # create session file
        echo $string > "ASUR_SINCHAN.session"

    elif [ ${#apis[@]} -eq 2 ]; then
        api_id=${apis[0]}
        api_hash=${apis[1]}

        # create new session
        python3 -c "from telethon.sync import TelegramClient; from telethon.sessions import StringSession; client = TelegramClient(StringSession(), $api_id, '$api_hash'); client.start(); print(client.session.save())" > "ASUR_SINCHAN.session"
    else
        # prompt user for API credentials
        echo -e "\e[35m"
        read -p "ApiId: " api_id
        read -p "ApiHash: " api_hash
        echo -e "\e[0m"

        # create new session
        python3 -c "from telethon.sync import TelegramClient; from telethon.sessions import StringSession; client = TelegramClient(StringSession(), $api_id, '$api_hash'); client.start(); print(client.session.save())" > "ASUR_SINCHAN.session"

        # save API credentials to file
        echo $api_id > "api.txt"
        echo $api_hash >> "api.txt"
    fi
else
    # prompt user for API credentials
    echo -e "\e[35m"
    read -p "ApiId: " api_id
    read -p "ApiHash: " api_hash
    echo -e "\e[0m"

    # create new session
    python3 -c "from telethon.sync import TelegramClient; from telethon.sessions import StringSession; client = TelegramClient(StringSession(), $api_id, '$api_hash'); client.start(); print(client.session.save())" > "ASUR_SINCHAN.session"

    # save API credentials to file
    echo $api_id > "api.txt"
    echo $api_hash >> "api.txt"
fi

# get number of days to scrape messages
echo -e "\e[35m"
read -p "Enter the number of days to scrape messages: " num_days
echo -e "\e[0m"

# create output directory
