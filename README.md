# isucon13

## Getting Started

### ssh

`~/.ssh/config`

```
Host isucon13
  HostName ec2-18-179-36-166.ap-northeast-1.compute.amazonaws.com
  User ubuntu
  IdentityFile ~/.ssh/doarakko.pem
```

### GitHub

https://isucon-workshop.trap.show/text/chapter-3/0-Github.html

### スロークエリの出力設定

```
slow_query_log         = 1
slow_query_log_file    = /var/log/mysql/mysql-slow.log
long_query_time = 0
```

```sh
sudo systemctl restart mysql
mysql -u isucari -pisucon
mysql> show variables like 'slow%';
+---------------------+-------------------------------+
| Variable_name       | Value                         |
+---------------------+-------------------------------+
| slow_launch_time    | 2                             |
| slow_query_log      | ON                            |
| slow_query_log_file | /var/log/mysql/mysql-slow.log |
+---------------------+-------------------------------+
3 rows in set (0.01 sec)
```

スロークエリの分析ツール「pt-query-digest」のインストール

```sh
mkdir ~/tools
cd ~/tools
wget https://github.com/percona/percona-toolkit/archive/refs/tags/v3.5.5.tar.gz
tar zxvf v3.5.5.tar.gz
./percona-toolkit-3.5.5/bin/pt-query-digest --version
sudo install ./percona-toolkit-3.5.5/bin/pt-query-digest /usr/local/bin
pt-query-digest --version
```

解析実行

```sh
sudo pt-query-digest /var/log/mysql/mysql-slow.log
```

https://isucon-workshop.trap.show/text/chapter-3/1-SlowQueryLog.html

### New Relic

```sh
cp ~/webapp/go/.env.example ~/webapp/go/.env
sudo systemctl restart isupipe-go.service
```

https://newrelic.com/jp/blog/how-to-relic/isucon-go-agent

### アクセスログ

```sh
sudo cat /var/log/nginx/access.log | alp ltsv -m"/api/livestream/\d+/livecomment","/api/livestream/\d+/reaction","/api/user/.+/icon","/api/livestream/\d+/livecomment/\d+/report","/api/livestream/\d+/moderate","/api/livestream/\d+/statistics","/api/livestream/\d+/ngwords","/api/livestream/\d+/enter","/api/user/.+/statistics","/api/user/.+/theme","/api/livestream/\d+/exit","/api/livestream/\d+/report","/api/livestream/\d+" --sort sum -r
```

https://isucon-workshop.trap.show/text/chapter-3/2-AccessLog.html

## Usage

### ssh

```sh
ssh isucon13
sudo su - isucon
```

### ベンチマーク実行

```sh
ssh isucon13
cd ~/
./bench run --enable-ssl
```

### DB 初期化

```sh
cd ~/
mysql -u isucon -pisucon isupipe
mysql> use isupipe;
mysql> DROP DATABASE isupipe;
mysql> CREATE DATABASE isupipe;

cat ~/webapp/sql/initdb.d/10_schema.sql | sudo mysql isupipe
./webapp/sql/init.sh
```

https://gist.github.com/kazeburo/bccc2d2b2b9dc307b5640ae855f3e0bf#isupipe-%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%AD%E3%83%BC%E3%83%9E%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6

### プロセス確認

```sh
systemctl list-unit-files --type=service
```

## References

- [ISUCON初心者向け講習会](https://isucon-workshop.trap.show/)
- https://github.com/isucon/isucon13
- https://github.com/matsuu/aws-isucon
- https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a
- https://speakerdeck.com/sadnessojisan/isuconru-men-yi-qian-isunarabe-lt-number-1
- https://poyo.hatenablog.jp/entry/2022/08/28/191329
- https://blog.yuuk.io/entry/web-operations-isucon
- https://blog.yuuk.io/entry/linux-server-operations
- https://kazeburo.hatenablog.com/entry/2014/10/14/170129
- https://www.slideshare.net/slideshow/isucon-summerclass2014action2final/38224673
- https://www.slideshare.net/slideshow/isucon-yapcasia-tokyo-2015/51993443
- https://speakerdeck.com/yuukit/web-operations-about-isucon
- [Ansible playbooks for isucon](https://github.com/pddg/isu12f)
- [[ISUCON用] 複数台同時デプロイスクリプト(Golang)](https://qiita.com/momotaro98/items/694000dfb736d0316441)
