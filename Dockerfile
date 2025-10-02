# Node.js
FROM node:20-alpine

# 作業ディレクトリ
WORKDIR /usr/src/app

# 依存関係ファイルのコピー
COPY package*.json ./

# 本番用依存のインストール
RUN npm install --production

# ソースコードのコピー
COPY . .

# 非rootユーザーで実行
USER node

# Fastifyポート公開
EXPOSE 3000

CMD ["npm", "start"]
