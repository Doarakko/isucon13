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
```
```

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
mysql -u isucon -pisucon
mysql> DROP DATABASE isupipe;
mysql> CREATE DATABASE isupipe;

cat ~/webapp/sql/initdb.d/10_schema.sql | sudo mysql isupipe
./webapp/sql/init.sh
```

https://gist.github.com/kazeburo/bccc2d2b2b9dc307b5640ae855f3e0bf#isupipe-%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%AD%E3%83%BC%E3%83%9E%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6

## References

- https://isucon-workshop.trap.show/
- https://github.com/isucon/isucon13
- https://github.com/matsuu/aws-isucon
