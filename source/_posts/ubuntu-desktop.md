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
一々調べるのが面倒なのでまとめました。
あと、インターネット上では Unity デスクトップ が嫌われている感じがしたので、あえて言及します。
<!--more-->

## スクリーンショットを撮る
<kbd>Printscreen</kbd> 単押しで画面全体
<kbd>Shift</kbd> + <kbd>Printscreen</kbd> で特定領域

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

## パネルのインジケーターアプレットの時計フォーマットを変更する
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
* [FlashPeak Slimjet](https://www.slimjet.com/jp/)
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
* VLC media player
`sudo apt install vlc`
* htop
`sudo apt install htop`
* neofetch
`sudo apt install neofetch`
* Krita
`sudo apt intall krita`


## 全体を通したメモ
* snap 版パッケージ は日本語環境において文字化けする場合が多く、なるべく deb 版パッケージ を使用するべきである
* `sudo dpkg -i hoge.deb` で依存関係のエラーが出た場合
`sudo apt --fix-broken install` で解決できる場合がある
# 引用元
* { % linkPreview https://ubuntuapps.net/blog-entry-846.html _blank nofollow %}
* [おれ](https://twitter.com/yudete)
* { % linkPreview https://www.serendip.ws/archives/6100 _blank nofollow %}
