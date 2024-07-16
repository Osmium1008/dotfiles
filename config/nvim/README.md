## dotfiles\#Neovim

シェル上で動いてくれるエディタ。 `Vim` を幾分かリッチにしたバリアントの類。

### Requirements
- [Neovim](https://neovim.io) 
    どうにも少なくともOSXとかだと自前でビルドした方がよさそう
- [Deno](https://deno.com)
    令和最新版`TypeScript`実行環境。割と早いらしい。`denops`ファミリーが使う。
- [Git](https://git-scm.com)
    現代 `Vim` プラグインはその大半が `GitHub` 上にありそうでなくとも `Git` で管理されたリポジトリ上にあるため、プラグインマネージャーが `Git` を求めてくる。
- [GitHub CLI](https://cli.github.com)
    GitHubの設定とかSSH鍵登録とかこれ使うと大分楽になるらしい。
- [OpenSSH Client](https://www.openssh.com)
    GitHubへのログイン用。多分OSに付いてる。
- [fzy](https://github.com/jhawthorn/fzy)
    早い `Fuzzy Finder`。ファイルを開く時に重宝する。
- [Rust](https://www.rust-lang.org)
    ripgrepを入れるためにCargoが必要(いらないかもしれないけどあって損はないと思う)。
- Cargo Package: [ripgrep](https://crates.io/crates/ripgrep)
    爆速で動くgrepクローン。`Telescope.nvim`のgrepモードが使ってたはず
- 適当なSKK Server([yaskkserv2](https://github.com/wachikun/yaskkserv2)とか[AquaSKK](https://github.com/codefirst/aquaskk)とか)
    現状skkeletonに辞書を流しこむのにAquaSKKを利用している。いずれローカルで使えるブランチ生やすかも。
- Nerd Font対応フォントを適用したTC対応ターミナルかneovim-qtか
    後者は設定ファイル書きかえないといけないかもしれない。とりあえず **Alacritty** 使っておけば間違いはない。

### Usage
1. 必要パッケージ群をインストールする
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

### Settings
およそ全てをLua言語で書くように設定してある。
とりあえず `:h` とか `:h lua` とか実行して読み込めば大体は分かるはず。

パッケージマネージャ独特の記法は [lazy.nvim](https://lazy.folke.io) を見て書くとよい。

`lua/local_settings_pre.lua` や `lua/local_settings_post.lua` を作成し書くことでローカル設定を読み込ませることができる。

### その他
入っているプラグイン一覧は `Plugins.md` に、キーバインドチートシートは `KeyBindings.md` に...書いてあればいいなぁ...(TODO)
