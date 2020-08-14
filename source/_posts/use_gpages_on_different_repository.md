---
title: 別リポジトリにあるディレクトリを他のリポジトリで既に使用中のドメインのサブディレクトリとしてGitHub Pagesで公開する
date: '2020/08/15 2:08:00'
categories:
  - GitHub Pages
  - Git
author: yude
---

# 参考
なし

# 解決法
* gh-pages ブランチ (または公開したいブランチ) を submodule として追加する。  

1. まず、使用中のドメインのディレクトリに入る。

1. コマンド: `git submodule add -b gh-pages (別リポジトリにあるディレクトリ) ./(公開するサブディレクトリの名前)` を実行する

いじょうだよ
