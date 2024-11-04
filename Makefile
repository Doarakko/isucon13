USER:=isucon
BIN_NAME:=isupipe
SERVICE_NAME:=$(BIN_NAME).go.service

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

setup:
	./setup.sh

bench:
	./bench run --enable-ssl

.PHONY: watch-service-log
watch-service-log:
	sudo journalctl -u $(SERVICE_NAME) -n10 -f
