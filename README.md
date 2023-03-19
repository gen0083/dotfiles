# install

ホームディレクトリでdotfilesリポジトリをクローンする

```
git clone https://github.com/gen0083/dotfiles
```

その後、`~/dotfiles/dotfilesInstall.sh`を実行する。

# dotfilesInstall.sh

dotfilesディレクトリ下にあるドットファイルへのシンボリックリンクを作成する。

既にホームディレクトリかでドットファイルをカスタマイズしている場合、.oldにリネームして退避する。・・・はず。

カスタマイズしていた場合、シェルスクリプト実行後に退避したファイルから設定をサルベージすること。

Vimのプラグインマネージャーに[dein.vim](https://github.com/Shougo/dein.vim)を利用しており、この初期設定も行うようになっている。

ただしdeinはvimを開いて`:call dein#install()`を呼び出さないとプラグインのインストールが完了しないので忘れないように。
（一応.vimrcに初回読み込み時にインストールするように設定してはいるけれど）

## インストールしているvim plugin

### dein.vim

<https://github.com/Shougo/dein.vim>

Vimプラグインの管理ツール。

### NERDtree

:NERDtreeでファイルツリーを表示する。

### fugitive

:Gwrite　→　git add

:Gstatus　→　git status
なお、Gstatus表示中に`C`で`git commit`に移行するることができる。やってることは`:Gcommit`と同じ。

:Gcommit　→　git commit
コミットメッセージを記入して、:wq等でファイルの書き込み＆閉じるを行うことでgit commitが実行される。なお、`#`で始まる行は全て無視される（コミットメッセージに含まれない）。

### surround.vim

ビジュアルモードで選択して`S<p>`とかすると、選択範囲を`<p>`タグで囲ってくれる。

[vim の text-object をより便利に使えるプラグイン - surround.vim](http://secondlife.hatenablog.jp/entry/20061225/1167032528)

選択範囲を`()`で囲う場合→ビジュアルモードで選択したあと`S(`で囲う。

`a'hoge'`のhoge内にカーソルがある状態で`ds'`で`ahoge`になる(`''`の囲いを削除する)。同様に`cs'"`で`a"hoge"`と囲い文字を変更する。

### emmet-vim

VimでEmmetを使えるようにするプラグイン。`<C-Y><C-,>`でタグに展開する。

[Emmet-vim](https://github.com/mattn/emmet-vim)

### tcomment_vim

ビジュアルモードで複数行選択した後`gc`とコマンドを打つことでコメントがトグルされる。（コメントアウト←→通常の切り替え）
また、ノーマルモードで`gcc`と入力することで、カーソル行がコメントアウトされる。


### vim-indent-guides

インデントに色をつけて見やすくする。

### vim-trailing-whitespace

行末の半角スペースを可視化する。

### Syntax-plugins

vim-css3-syntax
scss-syntax.vim
vim-javascript-syntax

### RuboCop

rubyの静的コード解析を行うプラグイン。
`:RuboCop`で実行。
別途`gem install rubocop`でRubocopをインストールしておかないと動かない。

# (参考)デフォルトアプリケーションの変更

Finderから変更ができるように`.`を`_`に変更しているが、ファイルの更新をMacVimで行うたびに既定のプログラムが書き換わってしまう。（規定のプログラムがテキストエディットになってしまう）

## 対策：RCDefaultAppを利用する

[RCDefaultApp](http://www.rubicode.com/Software/Bundles.html#RCDefaultApp)を利用して規定のプログラムを書き換える。（Finder→情報を見るからではファイル単位の書き換えになり、しかも更新のたびに元に戻ってしまうため）

RCDefaultApp→UTI→public.txtを変更する。（恐らくこれだけ変えればいけるはず）

## Vim関係以外で別途インストールが必要なもの

.bash_profileを入れても有効にならないので、別途インストールが必要。マシン切替時などにはこれらは別途インストールすること。

## homebrewでインストールするもの

- peco

### nodenv

<https://github.com/nodenv/nodenv>

nodeのバージョン管理

### enhancd

<https://github.com/b4b4r07/enhancd>

cdコマンド拡張

# githooks

例: .git/hooks/pre-commitにmainブランチでのコミットを禁止するgithooksを入れる

```sh
#!/bin/sh

. ~/dotfiles/githooks/pre-commit-disallow-commit-main
```

注意：実行権限を与えるのを忘れないこと
