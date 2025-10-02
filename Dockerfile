# このイメージをべースにする。
# FROMはDockerの最初に必ずあり、そこからレイヤーが積み上がる
FROM node:20-alpine

# 以降の命令の作業ディレクトリを設定する
# ディレクトリが存在しなければ自動で作られる
# ./はこのWORKDIRを意味する
WORKDIR /usr/src/app

# doker buildを実行したフォルダからpackage.jsonを作業ディレクトリにコピーする
# このコードでは /usr/src/app にコピーされる
COPY package*.json ./

# 実行時にコマンドを実行してその結果をイメージに残す
RUN npm install --production

# プロジェクトの全ファイルをイメージ内にコピーする
COPY . .

# 以降の実行をrootではなく指定ユーザー（ここではnode）で行う
USER node

# Fastifyポート3000番を使うことを宣言
EXPOSE 3000

# コンテナが起動された時に実行されるデフォルトのコマンドを指定
CMD ["npm", "start"]
