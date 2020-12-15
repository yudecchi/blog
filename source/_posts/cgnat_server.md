---
title: 絶望的な回線環境でWebサーバを建てる
date: '2020/09/17 20:10'
categories:
  - nginx
  - Cloudflare
  - CGNAT
author: yude
---
# 概要
今回の記事はレイテンシを重視する人を対象としていません。  
今回は以下のような回線環境でWebサーバを構築します。
* CGNAT (キャリアグレードNAT)
* IPv4 のみのインターネット接続

終わってるだろ
<!--more-->
# 必要なもの

* Webサーバを建てるに耐えうる性能を持つコンピュータ
* Cloudflare (無料アカウントでOK)
* nginx (または他のWebサーバソフトウェア)
* ufw (ファイアウォール)
* Teredo (IPv6 to IPv4 トンネリング) ← 肝
* 独自ドメイン

# 検証環境
* Ubuntu 18.04 LTS
* ufw 0.36
* nginx 1.14.0
* Miredo 1.2.6

# 手順
以下を飛ばします。
* Cloudflare のアカウント作成やドメイン登録
* サーバのセットアップ

1. ufw を設定する (すでに設定されている場合は飛ばしてください。)
    ```
    sudo ufw default deny
    sudo ufw allow 80
    sudo ufw enable
    ```
    また、個人的にここで SSH ポート を開放するのはおすすめしません。もし開放する場合は、接続元を限定して設定してください。
1. Miredo をインストールする
    ```
    sudo apt install miredo
    ```
    インストールするだけで動きます。しあわせ～
1. Miredo で手に入れた IPv6 アドレス を確認し、Cloudflare に登録する
    ```
    curl --interface teredo ifconfig.io
    ```
    的な感じでやればいいです。  
    コマンドの実行結果を Cloudflare に AAAA レコード として登録してください。  
    (「プロキシ済み」表示となっていることを確認してください。)
1. nginx のバーチャルホストを登録  
    以下は例です。
    ```
    $ cat /etc/nginx/sites-enabled/example.com.conf
    ```
    ```
    server {
        listen [::]:80;

        server_name example.com;
        root /var/www/html;
        index index.html;
    }
    ```
    **IPv6 の** 80 番ポートを Listen していることを確認してください。  
    設定ファイルを書き込んだら `sudo nginx -s reload` で反映させてください。

    以上で完成です。楽しんでください。
# その他
## なぜ Cloudflare を使うのですか？
* 生の IPv6 アドレス を隠すため。
* IPv4 だけでしか接続できない人がアクセスしても閲覧できるようにするため。
## 何か間違いを見つけたら？
GitHub の [Issues](https://github.com/yudete/blog/issues) や [Pull requests](https://github.com/yudete/blog/pulls) よりお願いします。
