# デプロイに必要な情報

自動デプロイを実行するには、以下のいずれかの情報が必要です。

## 方法1: FTP/SFTP経由

以下の情報をGitHub Secretsに設定してください：

- **FTP_SERVER**: FTPサーバーのアドレス
  - 例: `ftp.example.com` または `192.168.1.100`
- **FTP_USERNAME**: FTPユーザー名
  - 例: `wp_user`
- **FTP_PASSWORD**: FTPパスワード
- **FTP_REMOTE_DIR**: WordPressテーマディレクトリのパス
  - 例: `/wp-content/themes/businesspress-child/`
  - または: `/public_html/wp-content/themes/businesspress-child/`

## 方法2: SSH経由（サーバーでGit Pull）

- **SSH_HOST**: SSHサーバーのアドレス
- **SSH_USERNAME**: SSHユーザー名
- **SSH_PRIVATE_KEY**: SSH秘密鍵
- **サーバー側のパス**: WordPressテーマディレクトリのパス

## 現在のデプロイ設定

GitHub Actionsワークフロー（`.github/workflows/deploy.yml`）が設定済みです。
`main`ブランチにプッシュすると自動的にデプロイが実行されます。


