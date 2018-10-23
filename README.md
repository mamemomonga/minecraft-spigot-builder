# Spigot ビルドユーティリティー

Spigotをビルドして、リモートサーバにコピーします。

事前に公開鍵でリモートサーバにログインできるようにしておく必要があります。

# 実行環境

ローカルに必要なツール

docker, bash, ssh

Ubuntu 18.04, Docker 18.06にて動作確認

# 実行

    $ cp .env.example .env
    $ vim .env
    $ ./run.sh

