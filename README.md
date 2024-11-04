# isucon13

## Rules

- 1つの修正ごとにブランチを切ってベンチマークを実行する
- ブランチ名はアルファベット・数字のみで記号は含めない
- 以下を PR に添付する
  - ベンチマークの実行結果
  - スロークエリの解析結果
  - アクセスログの解析結果

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

### setup tools

```sh
ssh isucon13
make setup
```

### New Relic

```sh
cp ~/webapp/go/.env.example ~/webapp/go/.env
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

### アクセスログ

```sh
ssh isucon13
make alp
```

### DB 接続

```sh
ssh isucon13
mysql -u isucon -pisucon isupipe
```

### プロセス確認

```sh
systemctl list-unit-files --type=service
```

## References

- [ISUCON初心者向け講習会](https://isucon-workshop.trap.show/)
- [isucon/isucon13](https://github.com/isucon/isucon13)
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
