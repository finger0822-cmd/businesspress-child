# WordPress自動デプロイ設定ガイド

このリポジトリは、GitHub Actionsを使ってWordPressサーバーに自動デプロイできるように設定されています。

## セットアップ手順

### 方法1: FTP/SFTP経由での自動デプロイ（推奨）

1. **GitHubリポジトリのSecrets設定**
   - GitHubリポジトリの「Settings」→「Secrets and variables」→「Actions」に移動
   - 以下のSecretsを追加：
     - `FTP_SERVER`: FTPサーバーのアドレス（例: `ftp.example.com` または IPアドレス）
     - `FTP_USERNAME`: FTPユーザー名
     - `FTP_PASSWORD`: FTPパスワード
     - `FTP_REMOTE_DIR`: WordPressのテーマディレクトリ（例: `/wp-content/themes/businesspress-child/`）

2. **自動デプロイの動作**
   - `main`ブランチにプッシュすると自動的にデプロイされます
   - 手動で実行する場合：GitHubの「Actions」タブから「Deploy to WordPress Server」を選択して「Run workflow」をクリック

### 方法2: SSH経由でのGit Pull（サーバーでGitが使える場合）

サーバー側でGitリポジトリをクローンしている場合、以下のワークフローファイルを使用：

```yaml
# .github/workflows/deploy-ssh.yml として作成
name: Deploy via SSH

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Deploy via SSH
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.SSH_HOST }}
        username: ${{ secrets.SSH_USERNAME }}
        key: ${{ secrets.SSH_PRIVATE_KEY }}
        script: |
          cd /path/to/wordpress/wp-content/themes/businesspress-child
          git pull origin main
```

必要なSecrets：
- `SSH_HOST`: SSHサーバーのアドレス
- `SSH_USERNAME`: SSHユーザー名
- `SSH_PRIVATE_KEY`: SSH秘密鍵

### 方法3: サーバー側でWebhookを使用

サーバー側でWebhookエンドポイントを設定し、GitHubのWebhookから呼び出す方法もあります。

## 注意事項

- FTPパスワードなどの機密情報は必ずGitHub Secretsに保存してください
- 初回デプロイ時は、WordPress管理画面でテーマを有効化してください
- 固定ページテンプレート「おうち安心サポート」を使用する場合は、WordPress管理画面で固定ページを作成してください

## トラブルシューティング

- デプロイが失敗する場合、GitHub Actionsのログを確認してください
- FTPサーバーのパスが正しいか確認してください
- ファイルのパーミッションを確認してください（通常755または644）


