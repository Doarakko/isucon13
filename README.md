# isucon13

## Manual

- [本選当日マニュアル](https://github.com/isucon/isucon13/blob/main/docs/cautionary_note.md)
- [アプリケーションマニュアル](https://github.com/isucon/isucon13/blob/main/docs/isupipe.md)
- [コード](https://github.com/isucon/isucon13)

## Rules

- 1つの修正ごとにブランチを切ってベンチマークを実行する
- ブランチ名はアルファベット・数字のみで記号は含めない
- 以下を PR に添付する
  - ベンチマークの実行結果
  - スロークエリの解析結果
  - アクセスログの解析結果

## Getting Started

### ssh

各種コマンドは isucon ユーザーで SSH 接続する想定で作られています。
isucon ユーザーで SSH できるように、以下を参考に公開鍵を登録してください。
https://isucon-workshop.trap.show/text/chapter-2/2-EnterServerAndSomeSetting.html

`~/.ssh/config`

```
Host isucon13
  HostName ec2-18-179-36-166.ap-northeast-1.compute.amazonaws.com
  User isucon
  IdentityFile ~/.ssh/doarakko.pem
```

### GitHub

https://isucon-workshop.trap.show/text/chapter-3/0-Github.html

### setup tools

```sh
ssh isucon13
make setup
```

### New Relic

```sh
cp /home/isucon/webapp/go/.env.example /home/isucon/webapp/go/.env
sudo systemctl restart isupipe-go.service
```

https://newrelic.com/jp/blog/how-to-relic/isucon-go-agent


### pprof

https://isucon-workshop.trap.show/text/chapter-3/3-pprof.html

## Usage

### ssh

```sh
ssh isucon13
```

### CPU 使用率・メモリ使用率等の確認

リアルタイムで更新されるため基本的に常に起動しておく

```sh
ssh isucon13
top
```

### DB 接続

```sh
ssh isucon13
make mysql
```

### ベンチマーク実行

```sh
ssh isucon13
make bench
```

### スロークエリの解析

```sh
ssh isucon13
make slowq
```

### アクセスログの解析

```sh
ssh isucon13
make alp
```

### デプロイ

メインブランチ

```sh
make deploy
```

特定ブランチ

```sh
make deploy-<branch name>
```

以下がデプロイ対象で、リスタートも自動で行なっているため追加作業は不要

- アプリケーション
- `nginx.conf`
- `mysqld.cnf`

### サービスステータスの確認

```sh
ssh isucon13
make check-service-status
```

### サービスログの確認

```sh
ssh isucon13
make watch-service-log
```

## References

- [ISUCON初心者向け講習会](https://isucon-workshop.trap.show/)
- [matsuu/aws-isucon](https://github.com/matsuu/aws-isucon)
- [south37/00_timeline.md](https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a)
- [ISUCON入門以前_ISUNARABE_LT#1](https://speakerdeck.com/sadnessojisan/isuconru-men-yi-qian-isunarabe-lt-number-1)
- [壁を感じたISUCON12本戦](https://poyo.hatenablog.jp/entry/2022/08/28/191329)
- [ISUCON予選突破を支えたオペレーション技術](https://blog.yuuk.io/entry/web-operations-isucon)
- [Linuxサーバにログインしたらいつもやっているオペレーション](https://blog.yuuk.io/entry/linux-server-operations)
- [ISUCON4 予選でアプリケーションを変更せずに予選通過ラインを突破するの術](https://kazeburo.hatenablog.com/entry/2014/10/14/170129)
- [ISUCONで学ぶ Webアプリケーションのパフォーマンス向上のコツ 実践編 完全版](https://www.slideshare.net/slideshow/isucon-summerclass2014action2final/38224673)
- [ISUCONの勝ち方 YAPC::Asia Tokyo 2015](https://www.slideshare.net/slideshow/isucon-yapcasia-tokyo-2015/51993443)
- [ISUCON予選突破を支えるオペレーション技術 / Web Operations about ISUCON](https://speakerdeck.com/yuukit/web-operations-about-isucon)
- [Ansible playbooks for isucon](https://github.com/pddg/isu12f)
- [[ISUCON用] 複数台同時デプロイスクリプト(Golang)](https://qiita.com/momotaro98/items/694000dfb736d0316441)
- [MEMORYストレージエンジンでMySQLのパフォーマンスをあげよう](https://qiita.com/hirose-ma/items/c4a10d31a47a5421bb9c)
- [traP-isucon-newbie-handson2022](https://github.com/oribe1115/traP-isucon-newbie-handson2022)
- [matsuu/kataribe](https://github.com/matsuu/kataribe)
- [jpr5/ngrep](https://github.com/jpr5/ngrep/)
- [netdata/netdata](https://github.com/netdata/netdata)
- [単独のサーバーの「負荷」の正体を突き止める](https://tetsuyai.hatenablog.com/entry/20120105/1325750731)
- [MySQLのストレージエンジンについて](https://qiita.com/ishishow/items/280a9d049b8f7bcbc14a)
