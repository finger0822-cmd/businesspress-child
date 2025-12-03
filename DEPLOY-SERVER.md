# サーバー側での自動反映設定

サーバーにSSHアクセスがある場合、サーバー側でGitリポジトリをクローンして自動更新する方法です。

## セットアップ手順

### 1. サーバーでリポジトリをクローン

```bash
cd /path/to/wordpress/wp-content/themes/
git clone https://github.com/finger0822-cmd/businesspress-child.git
cd businesspress-child
```

### 2. 自動更新の設定

#### 方法A: Cronジョブで自動Pull（5分ごと）

```bash
crontab -e
```

以下を追加：

```cron
*/5 * * * * cd /path/to/wordpress/wp-content/themes/businesspress-child && git pull origin main > /dev/null 2>&1
```

#### 方法B: GitHub Webhookを使用

1. **サーバー側でWebhookエンドポイントを作成**

`/path/to/webhook/deploy.php` を作成：

```php
<?php
$secret = 'your-secret-key';
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';

$payload = file_get_contents('php://input');
$expected = 'sha256=' . hash_hmac('sha256', $payload, $secret);

if (hash_equals($expected, $signature)) {
    $path = '/path/to/wordpress/wp-content/themes/businesspress-child';
    chdir($path);
    shell_exec('git pull origin main');
    echo "Deployed successfully";
} else {
    http_response_code(403);
    echo "Forbidden";
}
```

2. **GitHubでWebhookを設定**
   - リポジトリの「Settings」→「Webhooks」→「Add webhook」
   - Payload URL: `https://your-domain.com/path/to/webhook/deploy.php`
   - Content type: `application/json`
   - Secret: 上記の`your-secret-key`と同じ値を設定
   - Events: 「Just the push event」を選択

#### 方法C: シェルスクリプト + 手動実行

`deploy.sh` を作成：

```bash
#!/bin/bash
cd /path/to/wordpress/wp-content/themes/businesspress-child
git pull origin main
echo "Deployment completed at $(date)"
```

実行権限を付与：

```bash
chmod +x deploy.sh
```

## 注意事項

- サーバーでGitがインストールされている必要があります
- リポジトリがパブリックの場合、認証は不要です
- プライベートリポジトリの場合は、SSH鍵またはPersonal Access Tokenを設定してください

