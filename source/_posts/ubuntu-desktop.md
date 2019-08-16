---
title: Ubuntu デスクトップ環境メモ
date: '2019/08/16 13:10:55'
categories:
  - Linux
  - Ubuntu
  - Unity
  - GNOME
author: yude
---

# Ubuntu デスクトップ環境メモ
都度調べるのが面倒なのでまとめました。

<!--more-->

## スクリーンショットを撮る
<kbd>Printscreen</kbd> 単押しで画面全体
<kbd>Shift</kbd> + <kbd>Printscreen</kbd> で特定領域

## Chromium またはその派生ブラウザでも GNOME Extensions をいじれるようにする
[ここ](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep) から拡張機能をぶち込む
![GNOME Shell Integration](https://i.imgur.com/M2FtlA9.png)

## GNOMEのパネルの時計表示フォーマットを変更する
1. **Firefoxで** [このページ](https://extensions.gnome.org/extension/1173/datetime-format/) を開き、
![ON](https://i.imgur.com/3QKcR6C.png)
これをONに切り替えたあと、[インストールする] をクリックする。
![インストールする をクリックする](https://i.imgur.com/HrTbgd2.png)
2. [Installed Extensions](https://extensions.gnome.org/local/) ページにおいて、歯車をクリックし「Datetime Format」ウィンドウを表示する(Shell 拡張機能)
![右の方に歯車がある](https://i.imgur.com/RNron66.png)
3. フォーマットを変更する
![この画面で](https://i.imgur.com/QyHGmQf.png)
朕はこのようにしました:
	* 日付メニュー：日付 `%Y/%-m/%e`
	* ステータスバー `%-m/%e (%a) %-k:%M`
GNOME は書式を一緒に表示してくれるので、優しいですね！
### 補足
Unityに慣れすぎて時計が中心にあるの違和感ある...
[ここ](https://extensions.gnome.org/extension/2/move-clock/) からGNOMEの拡張を入れてください。
![Frippery Move Clock](https://i.imgur.com/zfmcRgj.png)

## GNOME のいらんプロセスを○す
* tracker を無効化
```
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
```
再起動後反映される。

## ibus-mozc が突然外国人になった
別途パッケージが必要だが、以下のコマンドで解決できるかもしれない
```
setxkbmap -rules evdev -model jp106 -layout jp
```
または
```
sudo nano /usr/share/ibus/component/mozc.xml
```
から
```
<layout>default</layout>
```
の行を
```
<layout>jp</layout>
```
へ変更後、再起動する。

## Unity ローグラフィックスモード
```
gsettings set com.canonical.Unity lowgfx true
```
なぜかこれ実行するとUnity デスクトップが落ちるので、なんとかして再起動してください。

## GTKテーマ「Paper」
1. PPAリポジトリを追加し、無心でインストールを実行
```
sudo add-apt-repository ppa:snwh/pulp
sudo apt update
sudo apt intall paper-icon-theme paper-gtk-theme
```
2. Unity Tweak Tool からテーマを適用する
```
sudo apt install unity-tweak-tool
```
![メニューの「テーマ」をクリックし、このように](https://i.imgur.com/yyDbsRL.png)
3. Done
![Paper の見た目](https://i.imgur.com/RritBT0.png)

## Unityのパネルのインジケーターアプレットの時計フォーマットを変更する
デフォルトだとこのようになっています
![は？](https://i.imgur.com/ykS1odn.png)

### コマンドラインでやる場合
```
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "'(設定したいフォーマット)'"
# おれはこのようにしています
gsettings set com.canonical.indicator.datetime custom-time-format "'%Y/%-m/%-d (%a) %p %l:%M:%S'"
```
![このようになります](https://i.imgur.com/yhpwIjf.png)

## GUIでやる場合
1. dconf エディター が必要です。インストールしてください。
`sudo apt install dconf-editor`
2. dconf エディターを開き、何階層か潜ります。
パス: `/com/canonical/indicator/datetime/custom-time-format`
3. 「Use default value」を無効化し、値を変更します。
![このように](https://i.imgur.com/iZzAfgm.png)
### 補足
* 現在の設定値を確認する
`gsettings get com.canonical.indicator.datetime custom-time-format`
* フォーマットの一覧
`date --list` でそれっぽいものが表示されます。参考にしてください。

## いい感じのエディター
* [Visual Studio Code: マジの環境 だが重い](https://code.visualstudio.com/download)
* Geany: 一部のプラグインが謎の理由により使用不可だが、軽い
` sudo apt install geany`
* [Remarkable: Geany のMarkdownプレビューが使えないので 代用](https://remarkableapp.github.io/linux/download.html)

## いい感じのブラウザー
* [FlshPeak Slimjet](https://www.slimjet.com/jp/)
	* デザインが古いからアップデート終わってるのかと思ったらまだ続いていた
	* Windows/Mac で言う [Brave Browser](https://brave.com/ja/) のようなもの (Brave は[一応Linuxにも対応している](https://brave.com/download/)が、なんとなく重い)
* [Midori](https://www.midori-browser.org/download/ubuntu/)
	* 動作自体は Slimjet より軽いが、YouTube 等のサイトでは他ブラウザに劣る
	* というかアップデートが止まっているのでセキュリティー的には微妙
	* snap 版は日本語環境において文字化けするのでインストールするべきではない
```
sudo add-apt-repository ppa:midori
sudo add-apt-repository ppa:webkit-team
sudo apt update && sudo apt install midori
```

## その他 自分が必要なパッケージ
* [Simplenote](https://github.com/Automattic/simplenote-electron/releases)
* VLC media player (最強メディアプレイヤー)
`sudo apt install vlc`
* htop (おしゃれなtop)
`sudo apt install htop`
* neofetch (おしゃれにシステム情報を表示させる)
`sudo apt install neofetch`
* Krita (画像編集のため)
`sudo apt intall krita`

## 全体を通したメモ
* snap 版パッケージ は日本語環境において文字化けする場合が多く、なるべく deb 版パッケージ を使用するべきである
* `sudo dpkg -i hoge.deb` で依存関係のエラーが出た場合
`sudo apt --fix-broken install` で解決できる場合がある
	* そもそも依存関係のエラーを出したくない場合
	`gdebi` を使用すれば良い。
```
sudo apt install gdebi
sudo gdebi fuga.deb
```

# 参考文献 / 引用元
* [Paper - Ubuntu 16.04のデスクトップをマテリアルデザインに変更するテーマとアイコン | Ubuntuアプリのいいところ](https://ubuntuapps.net/blog-entry-846.html)
* [おれ](https://twitter.com/yudete)
* [Ubuntu, インジケーターアプレットの日付と時刻のフォーマットをカスタマイズする : Serendip – Webデザイン・プログラミング](https://www.serendip.ws/archives/6100)
* [GNOME Shellのカスタマイズに必須！拡張機能をインストールする方法 | LFI](https://linuxfan.info/setup-gnome-shell-extensions)
* [GNOME Shellのパネルに日付を表示する方法 | LFI](https://linuxfan.info/gnome-shell-clock-show-date)
* [gnome-flashback メモリ削減　軽量化 - Qiita](https://qiita.com/fygar256/items/57d632635429d9ba6bb5)
* [GNOMEのtrackerを無効化する方法 | 普段使いのArch Linux](https://www.archlinux.site/2018/07/gnometracker.html)