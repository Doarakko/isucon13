source ./.env

MESSAGE=$1
CHANNEL="#test-room"
USERNAME="donchan"
ICON_EMOJI=":dog:"

payload="payload={
    \"channel\": \"${CHANNEL}\",
    \"username\": \"${USERNAME}\",
    \"icon_emoji\": \"${ICON_EMOJI}\",
    \"text\": \"${MESSAGE}\"
}"

curl -X POST --data-urlencode "${payload}" "$SLACK_WEBHOOK_URL"
