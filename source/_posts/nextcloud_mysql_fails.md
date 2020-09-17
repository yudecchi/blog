---
title: Nextcloud で MySQL のパスワードが合っているにも関わらず接続に失敗する
date: '2020/08/15 2:13:00'
categories:
  - Nextcloud
  - MySQL
author: yude
---
# なんで？
バージョンが新しすぎて、何かがあるらしい  

# 解決法
以下のコマンドを mysql に入った後実行する。（セキュリティ的にアレなら適宜変更する。）
`grant all privileges on *.* to 'user'@'localhost' with grant option;`

おわり
