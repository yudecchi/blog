---
title: コマンド プロンプトでTab補完が効くようにする
date: '2020/08/15 2:04:00'
categories:
  - コマンドプロンプト
  - Windows
author: yude
---

# 参考
[コマンドプロンプトでTABキーが入力補完じゃなくて困った時の対応 - Qiita](https://qiita.com/kinzen/items/bf20f1fbcd8224b4f80d)  

# 解決法
## レジストリをいじる
パス:  
全ユーザー: `\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor`  
ユーザー毎: `\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor`  

|  キー  |  値  |
| ---- | ---- | 
|  CompletionChar  |  4 または 6 または 9  | 
|  PathCompletionChar  |  4 または 6 または 9  |

補足: それぞれ 4: Ctrl + D、6: Ctrl + F、9: Tab で入力補完となる。

いじょう