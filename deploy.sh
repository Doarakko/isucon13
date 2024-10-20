set -ex

ssh isucon13 "
    git pull origin $1 && exit && sudo systemctl restart mysql && sudo systemctl restart isupipe-go.service && sudo systemctl restart nginx && sudo sysctl -p
"
 