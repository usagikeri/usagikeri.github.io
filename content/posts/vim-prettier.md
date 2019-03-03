---
title: "Markdownの表を整形するVim Plugin"
author: "usagikeri"
date: 2019-03-03T14:48:33+09:00
draft: false
toc: true
images:
categories:
  - vim
tags:
  - vim
  - vim-plugin
---


Markdownで表を書く場合は，以下のように書きます．

```
|x|y|z|
|-|-|-|
|asdf|ghjk|l;'|
```

これがプレビューされると次のようになります．

| x    | y    | z   |
| ---- | ---- | --- |
| asdf | ghjk | l;' |

プレビューされれば，なんの問題もありませんが，コードでみると可読性が低いです．
そこで，vim-Prettierを使い，以下のように整形されたテーブルを自動生成できるようにします．

```
| x    | y    | z   |
| ---- | ---- | --- |
| asdf | ghjk | l;' |
```

# 環境

|         用途         | ソフトウェア名 | version |
| :------------------: | :------------: | :-----: |
|          os          |  macosmojave   | 10.14.2 |
| パッケージマネージャ |    homebrew    |  2.0.2  |
|      エディター      |      nvim      |  0.3.4  |
| プラグインマネージャ |    vim-plug    |  不明   |

# PrettierのInstall

まず，Prettierのインストールを行います．

Homebrewを使ってインストールをします．

```
$ brew install prettier
```

[Pretter](https://prettier.io/)はコードフォーマッター（コードをいい感じに整形してくれる）で，公式サイトによると以下の特徴があるようです．

- An opinionated code formatter
- Supports many languages
- Integrates with most editors
- Has few options


対応しているファイル形式は以下のものがあるようです．

- JavaScript
- TypeScript
- CSS
- Less
- SCSS
- Json
- GraphQL
- Markdown
- Vue
- Lua
- PHP
- Python
- Ruby
- HTML
- Swift


# vim-prettierのインストール

Vimのプラグインマネージャに[vim-plug](https://github.com/junegunn/vim-plug)を使っているため，vim-plugでのインストール方法について説明します．

[vim-prettier](https://github.com/prettier/vim-prettier)にREADMEにvim-plugでのインスール方法について書かれているため，これに従います．

Vimなら.vimrc，NVIMならinit.vimに以下の設定を書き込みます．

```
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
```

私はMarkdown以外でPrettierを利用するつもりはないので，以下のようにしています．

```
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': 'markdown'}
```

設定を書き込み終えたら，保存し，プラグインをインストールします．

```
$ vim +PlugInstall +qa
```

エラーがでなければインストールは完了です．


# vim-prettierを使う

vim-prettierを使ってみます．まずは適当なMarkdownファイルを作成します．

```test.md
# vim-prettierテスト

* xxx
* yyy
* zzz

|x|y|z|
|-|-|-|
|asdf|ghjk|l;'|
```

そして，

```
:Prettier
```

を実行します．すると以下のようになると思います．

```
# vim-prettier テスト

- xxx
- yyy
- zzz

| x    | y    | z   |
| ---- | ---- | --- |
| asdf | ghjk | l;' |
```

テーブルは正しく整形されていますが，他の部分も意図しない変更がされています．
これはPrettierがMarkdownファイルを整形する際に，

- リストの先頭を-にする
- 英単語の前後にはスペースを入れる

というルールがあるからだそうです．

リストの先頭を-にするのは問題ありませんが英単語の前後にスペースが入るのは，日本語と英語が混ざる文章では邪魔に感じます．

私は，テーブルの整形だけにPrettierを使おうと思っているので，ヴィジュアルモードで選択してからPrettierを使うことにします．


<script id="asciicast-231252" src="https://asciinema.org/a/231252.js" async></script>

