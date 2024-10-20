set -ex

ssh isucon13 "
    ./notify.sh 'start deploy' && git fetch origin && git checkout $1 && git pull origin $1 && sudo systemctl restart mysql && sudo systemctl restart isupipe-go.service && sudo systemctl restart nginx && sudo sysctl -p && ./notify.sh 'end deploy'
"
