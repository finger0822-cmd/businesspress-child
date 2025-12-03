# BusinessPress Child Theme - おうち安心サポート

WordPress子テーマ「businesspress-child」の「おうち安心サポート」専用ページ実装

## ファイル構成

- `functions.php` - 子テーマの関数ファイル
- `style.css` - 子テーマのスタイルシート（テーマヘッダー含む）
- `page-ouchi-support.php` - おうち安心サポート専用固定ページテンプレート
- `screenshot.png` - テーマのスクリーンショット

## 機能

「おうち安心サポート」固定ページテンプレートを含むWordPress子テーマです。

- 定額制おうち訪問サービスのLPページ
- モバイルファーストのレスポンシブデザイン
- 青系＋白ベースの安心感のあるデザイン

## インストール方法

### WordPress管理画面から

1. `businesspress-child.zip` をダウンロード
2. WordPress管理画面 → 外観 → テーマ → 新規追加
3. 「テーマをアップロード」をクリック
4. ZIPファイルを選択してアップロード
5. 「有効化」をクリック

### FTP/SFTPでアップロード

1. すべてのファイルを `/wp-content/themes/businesspress-child/` にアップロード
2. WordPress管理画面でテーマを有効化

## 使用方法

### 固定ページの作成

1. WordPress管理画面 → 固定ページ → 新規追加
2. ページタイトルを入力（例：「おうち安心サポート」）
3. 右側の「ページ属性」→「テンプレート」で「おうち安心サポート」を選択
4. 「公開」をクリック

## 自動デプロイ

自動デプロイの設定方法については、以下のファイルを参照してください：

- `DEPLOY.md` - GitHub Actionsを使った自動デプロイ設定
- `DEPLOY-SERVER.md` - サーバー側での自動反映設定

## ライセンス

親テーマ（BusinessPress）のライセンスに従います。

