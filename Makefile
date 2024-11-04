USER:=isucon
BIN_NAME:=isupipe
SERVICE_NAME:=$(BIN_NAME).go.service
MYSQL_USERNAME:=isucon
MYSQL_PASSWORD:=isucon
MYSQL_DB_NAME:=isupipe

# local host
.PHONY: deploy
deploy:
	./deploy.sh main

.PHONY: deploy-%
deploy-%:
	./deploy.sh $*

# remote host
.PHONY: slowq
slowq:
	sudo pt-query-digest /var/log/mysql/mysql-slow.log > /home/$(USER)/log/mysql-slow.log-$(shell date +%Y-%m-%d-%H-%M-%S)
	sudo rm /var/log/mysql/mysql-slow.log

.PHONY: alp
alp:
	sudo cat /var/log/nginx/access.log | alp ltsv --config=/home/$(USER)/config/alp.yml > /home/$(USER)/log/access.log-$(shell date +%Y-%m-%d-%H-%M-%S)
	sudo rm /var/log/nginx/access.log

.PHONY: setup
setup:
	./setup.sh

.PHONY: bench
bench:
	./bench run --enable-ssl

.PHONY: watch-service-log
watch-service-log:
	sudo journalctl -u $(SERVICE_NAME) -n10 -f

.PHONY: check-service-status
check-service-status:
	systemctl list-unit-files mysql.service nginx.service ${BIN_NAME}*

.PHONY: mysql
mysql:
	mysql -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} ${MYSQL_DB_NAME}
