---
title: Windows XP で ソフト電池 の認証を行う
date: '2020/09/20 18:00'
categories:
  - ソフト電池
  - Windows XP
author: yude
---
# ソフト電池とは？
ソフト電池は FANZA 等で購入できるノベルゲームなどに使用されている認証ソフトウェアです。[ソフト電池 UserGuide](http://www.soft-denchi.jp/comdocs/index.htm)
<!--more-->
# 問題点
Windows XP は Service Pack 3 をインストールした状態であっても TLS 1.2 に対応していません。ですから、ソフト電池の認証の際にサーバーに接続しようとすると、証明書エラーが発生します。
# 解決する
Windows XP に Windows Embedded POSReady 2009 をインストールすることによって TLS 1.2 に対応させます。
## 必要なファイル
* [WindowsXP-KB2584577-v0.4-x86-JPN.wlu](http://blog.livedoor.jp/blackwingcat/archives/1706829.html)
* [wlupdate v1.4](http://blog.livedoor.jp/blackwingcat/archives/1995327.html)
* [WES09 および POSReady 2009 用 Internet Explorer 8 の累積的なセキュリティ更新プログラム（KB4493435）](http://download.windowsupdate.com/d/msdownload/update/software/secu/2019/03/ie8-windowsxp-kb4493435-x86-embedded-jpn_85d50ff63d09f6efcb8afd799edf8811f9feaec7.exe)
* [KB4019276](http://download.windowsupdate.com/c/msdownload/update/software/updt/2017/10/windowsxp-kb4019276-x86-embedded-jpn_4ec532baa4a67d2906359d8852681baf41b742ec.exe)

以上のファイルを、ネットワークドライブなどといった特殊なフォルダーではない同一のフォルダーに配置します。
## 手順
1. wlupdate v1.4 の cab ファイルを解凍し、中身の vbs ファイルに wlu 形式のファイルをドラッグ＆ドロップします。その後、インストールを進めてください。
1. 他の実行可能形式のファイルを実行し、インストールします。
1. PC を再起動します。
1. Internet Explorer の インターネット オプション から、詳細設定 の TLS 1.2 の使用 にチェックを入れます。

以上です。後はソフト電池をインストールし、認証すれば良いです。  
[Windows 2000/XP/Vista/7 向け ソフト電池 バージョン 4.2.8.5](http://acf.paltio.co.jp/sdrt/old/sdrt4285j.exe)