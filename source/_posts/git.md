---
title: Git についての覚書
date: '2020/04/11 14:02:00'
categories:
  - Git
author: yude
---

# Git についての覚書
自分用まとめ
<!--more-->
## コミットに署名する
1. chocolatey等から __Gpg4Win__ をインストールする。  
`choco install gpg4win`  
1. 鍵を生成する。  
`gpg --gen-key` ▶ 表示されたものに従う。
1. PC に入っている鍵の一覧を表示させる。   
`gpg --list-keys` --> 鍵のIDを確認する。  
1. git で指定した鍵を使うようにする。   
`git config --global user.signingkey [先の手順で確認した鍵のID]`
1. commit 時に署名するようにする。   
git config --global commit.gpgsign true  
1. 【重要】GitHub 等に鍵を登録する。   
`gpg --armor --export [鍵のID]` でサイトに登録するべき文字列が表示されるので、コピペする。

## GitHub, GitLab 等で、2段階認証をしていてもgit pushをする。
Personal Access Token を生成する。 ▶ パスワードとして用いる。

## git のグローバル設定を一括で表示する
`git config --list --global`

## 署名付きコミットをしようとしたときに secret key not available と怒られる
`git config --global gpg.program (path to gpg.exe)`
として、gpg.exe へのパスを直接指定してやればよい。

# 参考文献 / 引用元
* [Git Commit で OpenPGP 署名を行う — OpenPGP の実装 | http://text.Baldanders.info](https://text.baldanders.info/openpgp/git-commit-with-openpgp-signature/)