# GitHub Secrets 設定ガイド

## エラー: "Input required and not supplied: server"

このエラーは、GitHub Secretsが設定されていないか、空の値が設定されていることを意味します。

## 解決方法

### ステップ1: GitHub Secretsを設定

以下のURLにアクセスして、4つのSecretを追加してください：

**🔗 https://github.com/finger0822-cmd/businesspress-child/settings/secrets/actions**

### ステップ2: 以下の4つのSecretを追加

「New repository secret」をクリックして、それぞれ追加してください：

#### 1. FTP_SERVER
- **Name**: `FTP_SERVER`
- **Secret**: `www1080.conoha.ne.jp`

#### 2. FTP_USERNAME
- **Name**: `FTP_USERNAME`
- **Secret**: `takeru7736@suzukireinetsu.com`

#### 3. FTP_PASSWORD
- **Name**: `FTP_PASSWORD`
- **Secret**: `h3QRh72h@@8yTR5`

#### 4. FTP_REMOTE_DIR
- **Name**: `FTP_REMOTE_DIR`
- **Secret**: `/public_html/suzukireinetsu.com/wp-content/themes/lightning-child/`

### ステップ3: Secrets設定の確認

1. リポジトリの「Settings」→「Secrets and variables」→「Actions」に移動
2. 以下の4つのSecretが表示されているか確認：
   - ✅ FTP_SERVER
   - ✅ FTP_USERNAME
   - ✅ FTP_PASSWORD
   - ✅ FTP_REMOTE_DIR

### ステップ4: デプロイの再実行

Secretsを設定した後：

1. GitHubの「Actions」タブを開く
2. 失敗しているワークフローを選択
3. 「Re-run jobs」ボタンをクリック

または、新しいコミットをプッシュすると自動的にデプロイが再実行されます。

## 注意事項

- Secret名は正確に入力してください（大文字小文字を区別します）
- Secretの値に余分なスペースが入っていないか確認してください
- Secretsを設定した後、必ず保存ボタンをクリックしてください

## トラブルシューティング

### Secretsを設定してもエラーが出る場合

1. Secret名が正確か確認（例: `FTP_SERVER` が `FTP-SERVER` になっていないか）
2. Secretの値に誤字がないか確認
3. ブラウザを更新してから再度実行
4. ワークフローのキャッシュをクリア（失敗したワークフローを削除して再実行）

