set -ex

ssh isucon13 "
    ./notify.sh 'start deploy' && git fetch origin && git checkout $1 && git pull origin $1 && sudo cp ./mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf && sudo cp ./nginx/nginx.conf /etc/nginx/nginx.conf && sudo systemctl restart mysql && sudo systemctl restart isupipe-go.service && sudo systemctl restart nginx && sudo sysctl -p && ./notify.sh 'end deploy'
"
