## dotfiles\#Neovim

シェル上で動いてくれるエディタ。 `Vim` を幾分かリッチにしたバリアントの類。

### Requirements
- [Neovim](https://neovim.io) 
    はい
- [Deno](https://deno.com)
    令和最新版 `TypeScript` 実行環境。割と早いらしい。 `denops` ファミリーが使う。
- [Git](https://git-scm.com)
    現代 Vim プラグインはその大半が GitHub 上にありそうでなくとも Git で管理されたリポジトリ上にあるため、プラグインマネージャーが Git を求めてくる。
- [GitHub CLI](https://cli.github.com)
    GitHub の設定とか SSH 鍵登録とかこれ使うと大分楽になるらしい。
- [OpenSSH Client](https://www.openssh.com)
    GitHub へのログイン用。多分 OS に付いてる。
- [fzy](https://github.com/jhawthorn/fzy)
    早い Fuzzy Finder。ファイルを開く時に重宝する。
- [Rust](https://www.rust-lang.org)
    ripgrep を入れるために Cargo が必要(いらないかもしれないけどあって損はないと思う)。
- Cargo Package: [ripgrep](https://crates.io/crates/ripgrep)
    爆速で動く grep クローン。 `Telescope.nvim` の grep モードが使ってたはず
- 適当な SKK Server ([yaskkserv2](https://github.com/wachikun/yaskkserv2) とか [AquaSKK](https://github.com/codefirst/aquaskk) とか)
    現状 skkeleton に辞書を流しこむのに AquaSKK を利用している。いずれローカルで使えるブランチ生やすかも。
- Nerd Font 対応フォントを適用した True Color 対応ターミナルか neovim-qt か
    後者は設定ファイル書きかえないといけないかもしれない。とりあえず **Alacritty** 使っておけば間違いはない。

### Usage
1. 必要パッケージ群をインストールする
1. `config/nvim` のシンボリックリンクを適切な場所に張る
  (Unix なら `~/.config/nvim`)
  (Windows なら `~/AppData/Local/nvim`)
1. `config/skk_general` のシンボリックリンクを `~/.config/skk_general` に張る
1. SKK Server に辞書ファイルを流し込んで起動する
1. 
```sh
gh auth login
```
を実行して SSH 鍵を生成するモードで GitHub にログインする

### Settings
およそ全てを Lua 言語で書くように設定してある。
とりあえず `:h` とか `:h lua` とか実行して読み込めば大体は分かるはず。

パッケージマネージャ独特の記法は [lazy.nvim](https://lazy.folke.io) を見て書くとよい。

`lua/local_settings_pre.lua` や `lua/local_settings_post.lua` を作成し書くことでローカル設定を読み込ませることができる。

### その他
入っているプラグイン一覧は `Plugins.md` に、キーバインドチートシートは `KeyBindings.md` に...書いてあればいいなぁ...(TODO)
