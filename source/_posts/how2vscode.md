---
title: VSCode でC言語を書く
date: '2020/10/08 15:47'
categories:
  - Visual Studio Code
  - MinGW
  - gcc
  - C
author: yude
---
**この記事は初学者向けで、かつ Eclipse を使うよう推奨された広島市立大学の学生を主な対象としています。**  

<!--more-->
# Visual Studio Code 何？
Visual Studio Code、略して "VSCode" は、""天下のMicrosoft"" が作ったコードエディターです。

## Eclipse とどう違うの？
Eclipse には、最初からプログラミング言語を操るツールが付属しています。一般的にこれらのソフトウェアを「統合開発環境 (IDE)」と言います。  
対してVSCodeは「エディター」です。初期状態ではビルドしたりだとか、間違いを警告する機能が付いていません。  
まぁ入ってなければ入れればいいだけの話です。やっていきましょう。  

# 導入
## 目次
1. MinGW のインストール  
1. Visual Studio Code のインストール  
1. Visual Studio Code の設定  
1. 簡単にコンパイルできるようにする  

## 1. MinGW のインストール
まず、[/68260/mingw-get-setup.exeをダウンロード - MinGW - Minimalist GNU for Windows - OSDN ](https://ja.osdn.net/projects/mingw/downloads/68260/mingw-get-setup.exe/) を開いて、「MinGW-Get」というソフトウェアをダウンロードします。
![a?!](https://i.imgur.com/2KmxDSO.png)  
`Install` をクリックして、インストールを始めます。  
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

## 3. Visual Studio Code の設定
Visual Studio Code では、「拡張機能」というものをインストールして自由にカスタマイズすることができます。  
今回は以下の拡張機能を導入します。  
* C/C++  
C言語を書いたときに "シンタックスハイライト" というものを効かせ、コードを見やすくすることができます。また、構文が間違っている際に指摘してくれます。
* Japanese Language Pack for Visual Studio Code  
Visual Studio Code を日本語化します。  

手順  
1. 「拡張機能」のタブを開きます。Japanese Language Pack の導入前だと英語で表示されるかもしれませんが、アイコンなどで判断してください。  
![](https://i.imgur.com/cRZccC1.png)  
そして、ここに導入したい拡張機能の名前を入力し、Enter を押すと検索が始まります。  
![](https://i.imgur.com/FzeTZ7z.png)  
上で示した拡張機能を見つけ、「インストール」または「Install」をクリックします。  
![](https://i.imgur.com/oIhI1oy.png)  

以上で拡張機能のインストールができたはずです。

## 4. 簡単にコンパイルできるようにする
このままの状態では、度々 コマンド プロンプト を呼び出してコマンドを実行する必要があります。面倒なので、ショートカットキーでコンパイルできるようにしてしまいましょう。  

1. 作業フォルダの作成
まず、書いたコードを設置するフォルダを作成します。今回は `src` とします。  
![](https://i.imgur.com/skmSx8h.png)

2. 作成したフォルダを Visual Studio Code で開く
![](https://i.imgur.com/X6pM7ji.png)  
メニューから選んで、フォルダを指定すればよいです。

3. コンパイルするための設定ファイルを作成する  
まず、左のパネルを右クリックし、新規ファイルを作成、名前を `(適当に決める).c` とします。  
![](https://i.imgur.com/tOfb7mi.png)  
そして、以下のコードをコピー & ペーストしてください。
    ```c
    #include <stdio.h>
    int main(void){
      printf("Hello world!\n");
    }
    ```
    `Ctrl` + `S` で保存した後、`Ctrl` + `Shift` + `B` を押します。
    ![](https://i.imgur.com/DDrZEYs.png)  
    このような画面が現れるはずなので、画像の歯車をクリックします。  
    **このとき、選んでいる項目が `C/C++: gcc.exe build active file` となっていることを確認してください。**  
    すると、以下のようなファイルが生成されるはずです。(細部は異なることがあるかもしれません。)  
    これで完了です。  
    ![](https://i.imgur.com/SMSclAF.png)  
4. コンパイルしてみる
    さて、ようやくコンパイルします。先程作った `(適当に決める).c` に戻って、`Ctrl` + `Shift` + `B` を押します。  
    表示のようにメニューが表示されたことを確認して、`Enter` を押します。  
    ![](https://i.imgur.com/kK7LrYd.png)  
    すると、コンパイルが始まり、少し待つと同じディレクトリに `exe` ファイルが生成されるはずです。  

## コンパイルした `exe` ファイルを実行する
C言語のソースファイルを開いた状態で、`Ctrl` + `Shift` + `@` を押すと、下に「ターミナル」が現れるはずです。  
![](https://i.imgur.com/CbqXjBg.png)  
ここで、`.\(ファイル名)` と入力して Enter を押すと、実行されます。  
![](https://i.imgur.com/fRJRmZ9.png)  
ファイル名について: ソースコードのファイル名が例えば `test.c` だった場合、入力するのは `.\test.exe` となります。

以上で Visual Studio Code を C 言語の開発に使う方法の説明を終わります。  
不明な点があった場合、Twitter: [@yudete](https://twitter.com/yudete) (大学向け: [@DestroyTeXLive](https://twitter.com/DestroyTeXLive)) までリプライや DM を送ってもらえれば、可能な範囲でお答えします。  

では！