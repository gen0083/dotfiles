# install

# デフォルトアプリケーションの変更

Finderから変更ができるように`.`を`_`に変更しているが、ファイルの更新をMacVimで行うたびに既定のプログラムが書き換わってしまう。（規定のプログラムがテキストエディットになってしまう）

## 対策：RCDefaultAppを利用する

[RCDefaultApp](http://www.rubicode.com/Software/Bundles.html#RCDefaultApp)を利用して規定のプログラムを書き換える。（Finder→情報を見るからではファイル単位の書き換えになり、しかも更新のたびに元に戻ってしまうため）

RCDefaultApp→UTI→public.txtを変更する。（恐らくこれだけ変えればいけるはず）
