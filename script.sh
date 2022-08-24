#!/bin/zsh
WEBHOOK=`cat settings.json | jq '.webhook_url'`
WEBHOOK=`echo ${WEBHOOK} | sed -e 's/\"//g'`
SEND_FILE_PATH=$(cd $(dirname $1) && pwd)
SEND_FILE_NAME=$(basename $1)
SEND_FILE="$SEND_FILE_PATH/$SEND_FILE_NAME"
SCRIPT_PATH=`cat settings.json | jq '.script_path'`
SCRIPT_PATH=`echo ${SCRIPT_PATH} | sed -e 's/\"//g'`
if [[ "$SCRIPT_PATH" == \$HOME* ]]; then
  SCRIPT_PATH=$(echo ${SCRIPT_PATH} | sed -e "s;\$HOME;${HOME};g")
fi

echo "webhook url : $WEBHOOK"
echo "send file : $SEND_FILE"
bash $SCRIPT_PATH/discord.sh --webhook-url=$WEBHOOK --title "**$2**" --color 0xFF00FF --author "posted by $USERNAME" --timestamp
bash $SCRIPT_PATH/discord.sh --webhook-url=$WEBHOOK --file "$SEND_FILE"
echo "complete send"