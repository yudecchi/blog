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
# 機能
nginx のインデックスページ、こんな感じだと思うんですけど  
![](../assets/images/h5ai/1.png)  
これが、このように盛れます  
![](../assets/images/h5ai/2.png)  
以下方法  
<!--more-->
# 導入
## h5ai をダウンロード  
[](https://larsjung.de/h5ai/) から最新バージョンの h5ai が含まれた zip ファイルをダウンロードして、サーバーに設置してください。  
![](../assets/images/h5ai/3.png)

## nginx の設定をする  
下記の内容を、適宜変更して使用してください。

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

上の root に指定するパスには、公開したいファイル群と、`_h5ai` ディレクトリが設置されている必要があります。  
具体的には `files.yude.moe` の環境において、`ls` コマンドを実行したとき、以下のように表示されます。  
![](../assets/images/h5ai/4.png)  
参考にしてください。

以上の設定を行った後、アクセスができるようになるはずです。