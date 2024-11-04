# local host
.PHONY: deploy
deploy:
	./deploy.sh main

.PHONY: deploy-%
deploy-%:
	./deploy.sh $*

# remote host
.PHONY: analyze-slow-query
asq:
	sudo pt-query-digest /var/log/mysql/mysql-slow.log > ~/log/mysql-slow.log-$(shell date +%Y-%m-%d-%H-%M-%S)
	sudo rm /var/log/mysql/mysql-slow.log

.PHONY: analyze-access-log
aal:
	sudo cat /var/log/nginx/access.log | alp ltsv -m"/api/livestream/\d+/livecomment","/api/livestream/\d+/reaction","/api/user/.+/icon","/api/livestream/\d+/livecomment/\d+/report","/api/livestream/\d+/moderate","/api/livestream/\d+/statistics","/api/livestream/\d+/ngwords","/api/livestream/\d+/enter","/api/user/.+/statistics","/api/user/.+/theme","/api/livestream/\d+/exit","/api/livestream/\d+/report","/api/livestream/\d+" --sort sum -r > ~/log/access.log-$(shell date +%Y-%m-%d-%H-%M-%S)
	sudo rm /var/log/nginx/access.log

setup:
	./setup.sh
