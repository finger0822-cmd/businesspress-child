# FTP経由でデプロイするPowerShellスクリプト

$FtpServer = "www1080.conoha.ne.jp"
$FtpUsername = "takeru7736@suzukireinetsu.com"
$FtpPassword = "h3QRh72h@@8yTR5"

# リモートディレクトリのパス（複数のパターンを試す）
$RemotePaths = @(
    "/wp-content/themes/businesspress-child/",
    "/public_html/wp-content/themes/businesspress-child/",
    "/home/takeru7736/www/wp-content/themes/businesspress-child/",
    "/var/www/html/wp-content/themes/businesspress-child/"
)

# アップロードするファイル
$FilesToUpload = @(
    "functions.php",
    "page-ouchi-support.php",
    "screenshot.png",
    "style.css"
)

Write-Host "FTPデプロイを開始します..." -ForegroundColor Green
Write-Host "サーバー: $FtpServer" -ForegroundColor Cyan

# FTP URIを作成
$FtpUri = "ftp://$FtpServer"

# 注意: このスクリプトは手動でリモートパスを指定する必要があります
Write-Host "`n注意: リモートディレクトリのパスを確認する必要があります。" -ForegroundColor Yellow
Write-Host "よくあるパスパターン:" -ForegroundColor Yellow
foreach ($path in $RemotePaths) {
    Write-Host "  - $path" -ForegroundColor Gray
}

Write-Host "`n実際のリモートディレクトリのパスが分かっている場合は、" -ForegroundColor Yellow
Write-Host "GitHub Secretsに設定するか、このスクリプトを編集してください。" -ForegroundColor Yellow


