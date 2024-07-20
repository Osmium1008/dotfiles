## dotfiles\#Alacritty

とにかく爆速で動く(そういうコンセプトの)ターミナルエミュレータ。余計な機能は一切ないが設定は少し面倒かも?

### Requirements
- [Alacritty](https://alacritty.org) 
    どうにも少なくともOSXとかだと自前でビルドした方がよさそう
- [UDEV Gothic Nerd Font](https://github.com/yuru7/udev-gothic) 
    BIZ UDとかベースの等幅フォントでなかなか見やすい。Nerd Fontのパッチが時々足りてないのが玉に瑕?

### Usage
1. 必要パッケージ群をインストールする
1. `config/alacritty` のシンボリックリンクを適切な場所に張る
  (Unix系統であれば `~/.config/alacritty`)
  (Windowsであれば `~/AppData/Roaming/alacritty`)

### Settings
基本的には [Alacritty Configuration](https://alacritty.org/config-alacritty.html) を参照すればよい。
古いQ&Aとか他人の設定とかだとたまに yaml で書かれたのが残っているのでこのサイトを見ながら移行しなければならない。やりましょう。
