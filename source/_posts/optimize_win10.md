---
title: Windows 10 軽量化・個人的な最適化メモ
date: '2020/03/11 7:50'
categories:
  - Windows
  - 軽量化
author: yude
---

タイトルの通り。すべて自己責任でお願いします。
<!--more-->

# 最適化項目
## 不要なサービス - 「サービス名」 - 「説明」
* `ActiveX Installer (AxInstSV)` - 使ってるWebサイトあるんですかね？
* `FAX` - 言わずもがな
* `Geolocation Service` - マップ使う人は有効のままで
* `PNRP Machine Name Publication Service` - P2P ネットワークにおいて、コンピュータ名を提供します。必要か？
* `Remote Registry` - 遠隔地からPC内のレジストリを操作します。やばくね？
* `Smart Card` - PCにSuica等のICカードを読み取る装置が付いている場合は有効のままで。
* `Smart Card Device Enumeration Service` - 上に同じく
* `Smart Card Removal Policy` - 上と同じく
* `Windows Media Player Network Sharing Service` - WMPに付属している共有機能を使う人は有効のままで。
* `Xbox Accessory Management Service`, `Xbox Live Auth Manager`, `Xbox Live セーブ データ`, `Xbox Live ネットワーキング サービス` - XboxやMicrosoft Store にあるゲームを遊ぶ人は有効のままで。
* `市販デモ サービス（RetailDemo）` - 普通は有効ではないが一応。普段使いでデモモードにするなんで一部の変態なんで...
* `データ使用状況（DusmSvc）` - `設定`アプリ内でデータ使用量が確認できるようになりますが、デスクトップPCでそんなものは必要ないので...
* `Superfetch` - ストレージを最適化してくれますが、経験上かえって遅くなる気がします。
→ アップデートで、サービスの名前が `SysMain` に変わりました。

## 不要な機能を無効化する
### バックグラウンド アプリの無効化
`設定`アプリから、`プライバシー`、`バックグラウンド アプリ`を開き、必要のないバックグラウンドアプリを オフ にします。
![](https://i.vgy.me/qzrQHV.png "朕はこんな感じにしたよ")
### スタートアップ 項目の削減
`タスク マネージャー`を開き、`スタートアップ`タブを開いてください。  
必要のないものを無効化してください。  
![](https://i.vgy.me/reY5f9.png "多すぎでは？")

## DNS の変更 
まず`コントロール パネル`を開き、`ネットワークとインターネット`、`ネットワークと共有センター`、自分の使用している接続の名前をクリックします。（下図のように）
![](https://i.vgy.me/rrL8cV.png "ShootingStar ってなに？")
`プロパティ`を開き、`インターネット プロトコル バージョン 4 (TCP/IPv4)`を**ダブル**クリックする。下図のようにして、`OK`をクリックします。
![](https://i.vgy.me/SLdZwM.png "Cloudflare DNS サイコー")

## Windows Update の提供方法の変更
デフォルトでは、他のPCにアップデートのためのデータを提供するような設定になっていますが、朕はこれが気に入らないので、変更します。  
まず`設定`を開き、`更新とセキュリティ`、`配信の最適化`と進みます。  
`他の PC からダウンロードを許可する`をオフにし、`ローカル ネットワーク上の PC`を選びます。  
お察しの通り完全には無効化できないわけですが、インターネット上の馬の骨に配信するよりかはマシです。
## OneDrive 無効化、トラッキングを削除 などなど
ここでのトラッキングとは、Microsoftがユーザーの起動したアプリケーションを収集していることを言います。これを無効化するためのソフトウェア、`DisableWinTracking`を使用します。ダウンロードは下記のリンクからできます。  
[Releases · 10se1ucgo/DisableWinTracking](https://github.com/10se1ucgo/DisableWinTracking/releases)  
最新版のzipファイルを落としてください。  
![](https://i.vgy.me/wxnDkw.png "このように")  
解凍して、`DisableWinTracking.exe`を開くと、下のような画面が現れます。
![](https://i.vgy.me/u5mTnz.png "なんだお前？！")  
![](https://i.vgy.me/tWVbMV.png "これでも保守的な感じ")  
上のようにチェックを入れて、`Go!`をクリックしてからしばらく待ち、後方で待ち構えているコマンド プロンプトに下記のような表示が出たら処置完了です。ウィンドウを閉じてください。  
**OneDrive を使用する人は、`Uninstall OneDrive`にチェックを入れないでください！**
![後方彼氏面をするコマンド プロンプト](https://i.vgy.me/UrumRF.png "後方彼氏面をするコマンド プロンプト")

# 参考
* [【2020最新】Windows10 不要サービス停止で高速化・軽量化！ | ノム犬式](https://nomuinu.net/pc-noservices/)
* [【レビュー】Windows 10のトラッキング機能をワンクリックでまとめて停止「Spybot Anti-Beacon」 - 窓の杜](https://forest.watch.impress.co.jp/docs/review/720508.html)
