## dotfiles\#Fish

馴染みやすくあとちょっとレトロな POSIX **非** 互換シェル。 ~だが設定を適用すると大分モダンな見た目になる~

### Requirements
- [Fish shell](https://fishshell.com) 
    最近の OSX だと標準で入っているらしい。入ってなかったら入れよう。
- [Fisher](https://github.com/jorgebucaran/fisher/) 
    Fish 向けパッケージマネージャーのデファクトスタンダード。
- [Rust](https://www.rust-lang.org) 
    モダンな互換コマンド群を入れるのに Cargo が必要になる。
- Cargo Packages:
    - [bat](https://crates.io/crates/bat)
        シンタックスハイライトとか貼ってくれる cat クローン
    - [fd](https://crates.io/crates/fd-find)
        gitignore とかのサポートがありまた早い find クローン
    - [lsd](https://crates.io/crates/lsd)
        カラフルでアイコンとかもついてて見やすい ls クローン
    - [ripgrep(rg)](https://crates.io/crates/ripgrep)
        爆速 grep クローン いろんなプログラムが前提で求めてくる
- [fzy](https://github.com/jhawthorn/fzy)
    早くて割といい感じに動く Fuzzy Finder ~あんまり使ってない~
- True Colorに対応していて Nerd Font 系を適用したターミナルエミュレータ
    (dotfiles を適用した **Alacritty** など)

### Usage
1. `Fisher` を除いた必要パッケージをすべてインストールする。
1. このディレクトリへのシンボリックリンクを `.config/fish` に張る。
1. `Fisher` をインストールする。
1. `fish_plugins` の変更を取り消す。
1. `fisher update` を実行してプラグインを復旧する

### Settings
普通にシェルスクリプトなので設定コマンドを羅列する。
環境変数なら `set` か `fish_add_path` を叩かせるとよい。

シェルスクリプトの書き方は [ここ](https://fishshell.com/docs/current/index.html) を読めばだいたい書いてあるはず。
たまに前提知識として `bash script` の書き方を要求してくるが気合で読む。

`local_config.fish` というファイルを作成するとそれを読み出してローカル向けの設定を適用してくれる。
