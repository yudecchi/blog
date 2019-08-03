---
title: Hexo 記法メモ
date: '2019/05/19 11:18:00'
categories:
  - ブログ
  - Hexo
author: yude
---
# Hexo 記法メモ
**※ 自分用メモ**
<!--more-->
## Markdown / HTML
* キーボード `kbd`  
`<kbd>Shift</kbd>`  
__プレビュー:__ <kbd>Shift</kbd>
* 引用  
`> ああああ`  
__プレビュー:__  
> ああああ

## Hexo プラグインによるもの
* hexo-tag-twitter  
`｛％ twitter ツイートURL ％｝`  
{% twitter https://twitter.com/jack/status/20 %}
* hexo-tag-link-preview  
`｛％ linkPreview ページURL _blank nofollow ％｝`  
{% linkPreview http://www.takamagahara.com/printin/ _blank nofollow %}

※ `｛％` は半角に変換.