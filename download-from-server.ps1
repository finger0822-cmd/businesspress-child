# WordPressサーバーからファイルをダウンロードするPowerShellスクリプト

$FtpServer = "www1080.conoha.ne.jp"
$FtpUsername = "takeru7736@suzukireinetsu.com"
$FtpPassword = "h3QRh72h@@8yTR5"
$RemotePath = "/public_html/suzukireinetsu.com/wp-content/themes/lightning-child/"
$LocalPath = ".\downloaded-from-server\"

# ローカルディレクトリを作成
if (-not (Test-Path $LocalPath)) {
    New-Item -ItemType Directory -Path $LocalPath -Force | Out-Null
}

Write-Host "FTPサーバーからファイルをダウンロードします..." -ForegroundColor Green
Write-Host "サーバー: $FtpServer" -ForegroundColor Cyan
Write-Host "リモートパス: $RemotePath" -ForegroundColor Cyan
Write-Host "ローカルパス: $LocalPath" -ForegroundColor Cyan

# ダウンロードするファイルリスト
$FilesToDownload = @(
    "functions.php",
    "page-ouchi-support.php",
    "screenshot.png",
    "style.css"
)

# FTP接続のURIを作成
$FtpUri = "ftp://$FtpServer$RemotePath"

foreach ($File in $FilesToDownload) {
    try {
        $RemoteFile = "$FtpUri$File"
        $LocalFile = Join-Path $LocalPath $File
        
        Write-Host "`nダウンロード中: $File" -ForegroundColor Yellow
        
        # FTPリクエストを作成
        $FtpRequest = [System.Net.FtpWebRequest]::Create($RemoteFile)
        $FtpRequest.Credentials = New-Object System.Net.NetworkCredential($FtpUsername, $FtpPassword)
        $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::DownloadFile
        $FtpRequest.UseBinary = $true
        $FtpRequest.UsePassive = $true
        
        # ダウンロード実行
        $FtpResponse = $FtpRequest.GetResponse()
        $ResponseStream = $FtpResponse.GetResponseStream()
        $LocalFileStream = New-Object System.IO.FileStream($LocalFile, [System.IO.FileMode]::Create)
        
        [byte[]]$Buffer = New-Object byte[] 1024
        $ReadLength = $ResponseStream.Read($Buffer, 0, 1024)
        
        while ($ReadLength -gt 0) {
            $LocalFileStream.Write($Buffer, 0, $ReadLength)
            $ReadLength = $ResponseStream.Read($Buffer, 0, 1024)
        }
        
        $LocalFileStream.Close()
        $ResponseStream.Close()
        $FtpResponse.Close()
        
        Write-Host "✓ 完了: $File" -ForegroundColor Green
    } catch {
        Write-Host "✗ エラー: $File - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nダウンロード処理が完了しました！" -ForegroundColor Green
Write-Host "ダウンロード先: $LocalPath" -ForegroundColor Cyan
