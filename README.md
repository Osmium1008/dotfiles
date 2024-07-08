# dotfiles

かなり適当な設定集

## Features and Requirements

### \*_installed_packages
基本環境(多分Macbook Air)でのインストール済みパッケージの一覧
うまく動かない時の参考に...

### Alacritty

#### Requirements
- [Alacritty](https://alacritty.org)
- [UDEV Gothic](https://github.com/yuru7/udev-gothic)

#### Usage
1. 必要パッケージ群をインストールする
1. `config/alacritty` のシンボリックリンクを適切な場所に張る
  (Unix系統であれば `~/.config/alacritty`)
  (Windowsであれば `~/AppData/Roaming/alacritty`)

### Fish

#### Requirements
- [Fish](https://fishshell.com)
- [Fisher](https://github.com/jorgebucaran/fisher/)
- [Rust](https://www.rust-lang.org)
- Cargo Packages:
  - [bat](https://crates.io/crates/bat)
  - [fd-find](https://crates.io/crates/fd-find)
  - [lsd](https://crates.io/crates/lsd)
  - [ripgrep](https://crates.io/crates/ripgrep)
- [fzy](https://github.com/jhawthorn/fzy)
- True Color対応でNerd Font対応フォントを適用したターミナルエミュレータ
  (**Alacritty**は条件を満たしています)

#### Usage
1. 必要パッケージ群をインストールする
1. `config/fish` のシンボリックリンクを `~/.config/fish`に張る
```sh
ln -s "$REPOS_PATH/config/fish" ~/.config/fish
```

### Neovim

#### Requirements
- [Neovim](https://neovim.io)
- [Deno](https://deno.com)
- [Git](https://git-scm.com)
- [GitHub CLI](https://cli.github.com)
- [OpenSSH](https://www.openssh.com)
- fzy
- Rust
- Cargo Package: ripgrep
- 適当なSKK Server([yaskkserv2](https://github.com/wachikun/yaskkserv2)とか[AquaSKK](https://github.com/codefirst/aquaskk)とか)
- Nerd Font対応フォント

#### Usage
1. 必要パッケージ群をインストールする
1. 使わない場合 `config/nvim/lua/extensions/complete.lua` の `satysfi_ls` の行をコメントアウトする
1. `config/nvim`のシンボリックリンクを適切な場所に張る
  (Unixなら~/.config/nvim)
  (Windowsなら~/AppData/Local/nvim)
1. `config/skk_general`のシンボリックリンクを`~/.config/skk_general`に張る
1. SKK Serverに辞書ファイルを流し込んで起動する
1. 
```sh
gh auth login
```
を実行してSSH鍵を生成するモードでGitHubにログインする

### Vim
まだ整備中

## 設定を追加するには
ファイル管理をホワイトリスト制で行うようにしている(した)のでリポジトリに新たに設定ファイルを含めるにはホワイトリストへの記入が必要となります

具体的な方法:
1. (フォルダを追加する場合) 親フォルダの `.gitignore` に `!/(フォルダ名)/` を追加する
1. (フォルダを追加した場合) `.gitignore` を作成し `*` と `!/.gitignore` の二行を追加する
1. ファイルを追加したフォルダの `.gitignore` に `!/(ファイル名)` を追加する

各フォルダに入っている `.gitignore` も参照

## ToDo
- Dark deno-poweredシリーズを用いてVimの設定を書く
- (たぶん)Arch Linux機に埋まっているSwayの設定を引っ張り出してくる
- VM上のFedoraに乗ってる諸々の設定も引っ張ってくる
- satysfi_lsを消した版のブランチを切る
- etc...
