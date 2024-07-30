# dotfiles

かなり適当な設定集

## Features

### \*_installed_packages
基本環境 (多分 Macbook Air) でのインストール済みパッケージの一覧
うまく動かない時の参考に...

### Alacritty
### Neovim
### Fish
詳しくは各サブフォルダの `README.md` を

### Emacs
### Vim
まだ整備中

## 設定を追加するには
ファイル管理をホワイトリスト制で行うようにしている(した)のでリポジトリに新たに設定ファイルを含めるにはホワイトリストへの記入が必要となる

具体的な方法:
1. (フォルダを追加する場合) 親フォルダの `.gitignore` に `!/(フォルダ名)/` を追加する
1. (フォルダを追加した場合) `.gitignore` を作成し `*` と `!/.gitignore` の二行を追加する
1. ファイルを追加したフォルダの `.gitignore` に `!/(ファイル名)` を追加する

各フォルダに入っている `.gitignore` も参照

## ToDo
- Dark deno-powered シリーズを用いて Vim の設定を書く
- (たぶん) Arch Linux 機に埋まっている Sway の設定を引っ張り出してくる
- VM 上の Fedora に乗ってる諸々の設定も引っ張ってくる
- satysfi_ls を消した版のブランチを切る
- etc...

## License
このリポジトリ上の全てのコードには `MITライセンス` が適用されます。詳しくは `LICENSE.md` をご確認ください。
