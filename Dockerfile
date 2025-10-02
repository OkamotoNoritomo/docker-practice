# このイメージをべースにする。
# FROMはDockerの最初に必ずあり、そこからレイヤーが積み上がる
FROM node:20-alpine

# 以降の命令の作業ディレクトリを設定する
# ディレクトリが存在しなければ自動で作られる
# ./はこのWORKDIRを意味する
WORKDIR /usr/src/app

# doker buildを実行したフォルダからpackage.jsonとpackage-look.jsonを作業ディレクトリにコピーする
# *をつけることでlockファイルも含められる
# lockファイルのコピーによって依存関係のバージョンが固定され、環境の再現性が高まる
# このコードでは /usr/src/app にコピーされる
COPY package*.json ./

# 依存関係をインストールしてその結果をイメージに残す
RUN npm install

# プロジェクトの全ファイルをイメージ内にコピーする
COPY . .

# 以降の実行をrootではなく指定ユーザー（ここではnode）で行う
USER node

# このコンテナが利用するポートを宣言する
EXPOSE 3000

# コンテナが起動された時に実行されるデフォルトのコマンドを指定
CMD ["npm", "start"]
