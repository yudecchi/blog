---
title: nginx の index を女子高生みたいに盛る方法
date: '2020/10/08 18:00'
categories:
  - h5ai
  - nginx
  - 自宅サーバー
  - PHP
author: yude
---
nginx のインデックスページ、こんな感じだと思うんですけど  
![Before](../assets/images/h5ai/1.png)  
これが、このように盛れます  
![After](../assets/images/h5ai/2.png)  
以下方法  
<!--more-->
## How to setup THIS
1. h5ai をダウンロード  
[ここ](https://larsjung.de/h5ai/) から最新バージョンの h5ai が含まれた zip ファイルをダウンロードして、サーバーに設置してください。  
![CLICK THIS](../assets/images/h5ai/3.png)
1. nginx の設定をする  
私はこのようにしておりますので、適宜変更してください。  
```
upstream php-fpm {
  server unix:/run/php/php-fpm.sock;
}

server{
  listen 80;
  server_name your.domain;
  root /path/to/root/of/your/files;
  index  /_h5ai/public/index.php;
  location ~ \.(php)$ {
    include fastcgi_params;
    fastcgi_index index.php;
    fastcgi_param   SCRIPT_FILENAME         $document_root$fastcgi_script_name;
    fastcgi_pass php-fpm;
  }
}
```
上の root に指定するパスには、公開したいファイル群と、`_h5ai` ディレクトリが設置されている必要があります。  
具体的には `files.yude.moe` の環境において、`ls` コマンドを実行したとき、以下のように表示されます。  
![result](../assets/images/h5ai/4.png)  
参考にしてください。

以上の設定を行った後、アクセスができるようになるはずです。