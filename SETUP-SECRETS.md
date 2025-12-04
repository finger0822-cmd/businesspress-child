# GitHub Secrets設定手順

以下の情報をGitHubリポジトリのSecretsに設定してください。

## 設定方法

1. GitHubリポジトリにアクセス：
   https://github.com/finger0822-cmd/businesspress-child

2. 「Settings」タブをクリック

3. 左メニューから「Secrets and variables」→「Actions」を選択

4. 「New repository secret」をクリック

5. 以下の4つのSecretを追加：

### Secret 1: FTP_SERVER
- Name: `FTP_SERVER`
- Secret: `www1080.conoha.ne.jp`

### Secret 2: FTP_USERNAME
- Name: `FTP_USERNAME`
- Secret: `takeru7736@suzukireinetsu.com`

### Secret 3: FTP_PASSWORD
- Name: `FTP_PASSWORD`
- Secret: `h3QRh72h@@8yTR5`

### Secret 4: FTP_REMOTE_DIR
- Name: `FTP_REMOTE_DIR`
- Secret: `/public_html/suzukireinetsu.com/wp-content/themes/lightning-child/`

**確認済みのリモートディレクトリパス**: 
`/public_html/suzukireinetsu.com/wp-content/themes/lightning-child/`

## 設定後の確認

Secretsを設定したら：
1. GitHubの「Actions」タブを開く
2. 失敗しているワークフローがあれば「Re-run jobs」をクリック
3. または、新しい変更をプッシュすると自動的にデプロイが開始されます

