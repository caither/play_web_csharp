# PracticeMVC / Contoso

這是一個使用 `.NET Framework 4.6.1` 建立的 `ASP.NET MVC 5` 練習專案。
專案採用 `Entity Framework 6 Code First` 搭配 `MySQL`，並實作基本的 `Student` CRUD 功能。

## 技術堆疊

- ASP.NET MVC `5.2.4`
- .NET Framework `4.6.1`
- Entity Framework `6.4.4`
- MySql.Data / MySql.Data.EntityFramework `8.0.30`
- Bootstrap `3.3.7`
- jQuery `3.3.1`

## 專案結構

- `Contoso/`：主要 Web 應用程式
- `Contoso/Controllers/`：`HomeController`、`StudentController`
- `Contoso/Models/`：`Student`、`Course`、`Enrollment`
- `Contoso/DataAccess/`：`SchoolContext`、`SchoolInitializer`
- `Contoso/Views/Student/`：Student CRUD 頁面
- `Contoso.sln`：Visual Studio 方案檔
- `packages/`：使用 `packages.config` 管理與還原的 NuGet 套件

## 先決條件

- Visual Studio 2017 / 2019 / 2022，且已安裝 ASP.NET 與 Web 開發工作負載
- .NET Framework 4.6.1 Targeting Pack
- 本機可用的 MySQL Server

## 快速開始

1. 使用 Visual Studio 開啟 `Contoso.sln`
2. 如果套件尚未還原，先執行 NuGet 套件還原
3. 將 `Contoso` 設為啟動專案
4. 按下 `F5` 以 IIS Express 啟動網站

## 資料庫設定

連線字串定義於 `Contoso/Web.config`。

本機環境可參考以下 SQL 建立資料庫與帳號：

```sql
CREATE DATABASE Contoso CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'P@ssw0rd';
GRANT ALL PRIVILEGES ON Contoso.* TO 'appuser'@'localhost';
FLUSH PRIVILEGES;
```

## 資料庫初始化器

`Contoso/Global.asax.cs` 中設定了：

```csharp
Database.SetInitializer(new SchoolInitializer());
```

`SchoolInitializer` 使用 `DropCreateDatabaseIfModelChanges<SchoolContext>`。
當模型發生變更時，資料庫可能會被重建，並重新匯入範例資料。

## 已驗證的建置指令

以下指令可用來建置方案：

```powershell
& 'VS\2017\MSBuild\15.0\Bin\MSBuild.exe' .\Contoso.sln /t:Build /p:Configuration=Debug /p:Platform="Any CPU" /v:m
```

以下重建指令：

```powershell
& 'VS\2017\MSBuild\15.0\Bin\MSBuild.exe' .\Contoso.sln /t:Rebuild /p:Configuration=Debug /p:Platform="Any CPU" /v:n /clp:Summary
```

## 已驗證的本機啟動與測試指令

以下 PowerShell 指令可啟動 IIS Express，並驗證首頁與 `Student` 頁面是否能正常回應：

```powershell
$process = Start-Process 'C:\Program Files\IIS Express\iisexpress.exe' -ArgumentList '/path:.\PracticeMVC\Contoso','/port:65280' -PassThru
Start-Sleep -Seconds 4
try {
    $homeResponse = Invoke-WebRequest 'http://localhost:65280/' -UseBasicParsing
    $studentResponse = Invoke-WebRequest 'http://localhost:65280/Student' -UseBasicParsing
    'HOME_STATUS=' + [int]$homeResponse.StatusCode
    'STUDENT_STATUS=' + [int]$studentResponse.StatusCode
    'STUDENT_LENGTH=' + $studentResponse.Content.Length
}
finally {
    Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
}
```

以下指令可進一步確認 `/Student` 頁面是否真的顯示了種子資料：

```powershell
$process = Start-Process 'C:\Program Files\IIS Express\iisexpress.exe' -ArgumentList '/path:.\PracticeMVC\Contoso','/port:65280' -PassThru
Start-Sleep -Seconds 4
try {
    $studentResponse = Invoke-WebRequest 'http://localhost:65280/Student' -UseBasicParsing
    if ($studentResponse.Content -match 'Carson|Alexander|Meredith|Alonso') { 'SEED_DATA_PRESENT=1' } else { 'SEED_DATA_PRESENT=0' }
    'CONTENT_LENGTH=' + $studentResponse.Content.Length
}
finally {
    Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
}
```

## 路由

- 首頁：`/`
- Student 清單：`/Student`
