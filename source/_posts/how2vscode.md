---
title: VSCode で C言語 書きません？
date: '2020/07/15 4:00'
categories:
  - ブログ
  - Visual Studio Code
  - gcc
  - C
author: yude
---
** この記事は初学者向けで、かつ Eclipse を使うよう指示された広島市立大学の学生を主な対象としています。 **  
# #Eclipse反対
こんにちは yude です。皆さん、どのような方法でC言語のプログラムを書いていますか？  
![Pleiades Eclipse](https://i.imgur.com/0tSLtob.png)  
こういうやつだと思います 講義通りにやると  
いや正直、こんなゴチャゴチャしたもんはよく分からんし、そもそも初学者向けじゃないんですよね [僕も環境構築できなかったし...](https://twitter.com/DestroyTeXLive/status/1277834088410275841) てかプロⅠの内容でIDE使うメリット、何...?  
(いや、GUIだけでビルドできるとかそういうことはあるかもしれませんが)
## じゃあ
別のやつ使いません？ **Visual Studio Code** とか...
<!--more-->
# Visual Studio Code 何？
Visual Studio Code、略して "VSCode" は、""天下のMicrosoft"" が作ったコードエディターです。
## Eclipse とどう違うの？
Eclipse には、最初からプログラミング言語を操るツールが付属しています。一般的にこれらのソフトウェアを「統合開発環境 (IDE)」と言います。  
で、VSCodeは、**ただの**「エディター」です。初期状態ではビルドしたりだとか、間違いを警告する機能が付いてないんですね。  
まぁ入ってなければ入れればいいだけの話です。やっていきましょう。  

# 導入
## 目次
1. MinGW のインストール  
2. Visual Studio Code のインストール  

## 1. MinGW のインストール
まず、[/68260/mingw-get-setup.exeをダウンロード - MinGW - Minimalist GNU for Windows - OSDN ](https://ja.osdn.net/projects/mingw/downloads/68260/mingw-get-setup.exe/) を開いて、「MinGW-Get」というソフトウェアをダウンロードします。すると...
![なんだお前?!](https://i.imgur.com/2KmxDSO.png)  
なんか威圧感高いウィンドウが表示されましたね。`Install` をクリックして、早速インストールしていきましょう。  
![Step 1](https://i.imgur.com/aRPPR9K.png)
この画面では、特に何もいじらず `Continue` をクリックすればOKです。
![Step 2](https://i.imgur.com/FjEwUmx.png)
ダウンロードが始まりました。少し待てば終わります。  
![こうなればOK](https://i.imgur.com/v3SQwZD.png)
⬆終わるとこんな感じになるので、`Continue` をクリックしましょう。  
![MinGW Installation Manager](https://i.imgur.com/mFQOrLO.png)  
さっきの画面から一転、何やらゴチャゴチャしたウィンドウが開きます。ここから MinGW をインストールできる訳です。  
`mingw32-base-bin` と `mingw32-gcc-g++-bin` のチェックボックスをクリックして、下の画像のように操作します。  
![チェックボックス、入れていきましょう](https://i.imgur.com/W9UBPBS.png)  
その後、メニューバーから `Installation` をクリックして、`Apply Changes` をクリックします。
![メニューバー --> Apply Changes](https://i.imgur.com/aAkBzp0.png)  
すると... 確認画面が現れます。`Apply` をクリックするとインストールが始まります。
![Okay to proceed?](https://i.imgur.com/mc8ttH6.png)
がんばれ～
![Applying Scheduled Changes](https://i.imgur.com/Uv4FeI0.png)
終わると下のような表示になります。これで `MinGW Installation Manager` でやる作業は終わりなので、閉じてしまいましょう。  
![All changes were applied successfully](https://i.imgur.com/RKUAu6J.png)

## 2. Visual Studio Code のインストール
まず、[Download Visual Studio Code - Mac, Linux, Windows](https://code.visualstudio.com/download) からVisual Studio Codeをダウンロードします。  
サイトは英語ですが、VSCode 自体は日本語化できるので安心してください。
![ココ](https://i.imgur.com/0X0vrxp.png)  
ここですね。  

適当にインストールしていきましょう。
![installpic_1](https://i.imgur.com/nXtyTRf.png)  
下の画面で、  
* エクスプローラーのファイル コンテキスト メニューに [Code で開く] アクションを追加する
* エクスプローラーのディレクトリ コンテキスト メニューに [Code で開く] アクションを追加する  

にチェックを入れておくと便利です。
![installpic_2](https://i.imgur.com/Z47mIJE.png)  


メモ
VSCode 日本語化
MinGW のパスを通す