set -ex

ssh isucon13 "
    ./notify.sh 'start deploy' && git fetch origin && git checkout $2 && git pull origin $2 && sudo cp ./mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf && sudo cp ./nginx/nginx.conf /etc/nginx/nginx.conf && sudo systemctl restart mysql && sudo systemctl restart $1-go.service && sudo systemctl restart nginx && sudo sysctl -p && ./notify.sh 'end deploy'
"
