# syntax=docker/dockerfile:1 

FROM buildpack-deps:noble-curl

WORKDIR /app

# VSCode CLIのインストール
RUN curl -Lk "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-$( [ "$(uname -m)" = "x86_64" ] && echo x64 || echo arm64 )" --output vscode_cli.tar.gz ; tar -xf vscode_cli.tar.gz ; mv code /usr/local/bin/code ; rm vscode_cli.tar.gz

# ウェブサーバーを起動
CMD [ "code", "serve-web", "--host", "0.0.0.0", "--without-connection-token", "--accept-server-license-terms" ]
