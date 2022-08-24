# Discordにファイルを送るシェルスクリプト
- 環境
  - macOS Monterey
  - zsh

- セットアップ 
  - 依存ライブラリのインストール
    -  [jq](https://stedolan.github.io/jq/)
        ~~~zsh
        $ brew install jq
        ~~~ 
    - 本リポジトリをクローン
      - [discord.sh](https://github.com/ChaoticWeg/discord.sh)を使用
        - zshだと`shopt`コマンドが使えなかったので該当箇所をコメントアウトした 
        ~~~zsh
        $ git clone https://github.com/yarakigit/discord_send_file.git ~/.discord_send_file
        ~~~
    - ファイルを送りたいDicordのチャンネルの`Webhook URL`を取得, `settings.json`の`webhook_url`の欄に記載する
      - スクリプトを任意のディレクトリに配置する際は`script_path`も変更 
        ~~~JSON
        {
        "webhook_url":"Your Webhook URL",
        "script_path":"$HOME/.discord_send_file"
        }
        ~~~
    - エイリアスを設定 (`~/.zshrc`に下記の1行を追加)
      -  上記の`script_path`を変更した場合は適宜読み替えてください 
        ~~~zsh
        alias discord_send_file='zsh $HOME/.discord_send_file/script.sh'
        ~~~
- 実行
  - `第一引数` : 送信するファイル (相対パスでも可)
  - `第二引数` : 送信するファイルの説名
    ~~~zsh
    $ discord_send_file README.md "README.md を添付します" 
    ~~~ 

- Reference
  - [GitHub, ChaoticWeg, discord.sh](https://github.com/ChaoticWeg/discord.sh)

