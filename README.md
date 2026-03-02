# play_web_csharp

這個倉庫目前包含一個主要開發中的 ASP.NET Core 專案，以及數個保留中的舊版練習專案。

- `MvcMovie/`：目前主要使用的 ASP.NET Core MVC 練習網站
- `MvcMovie.Tests/`：`MvcMovie` 的 NUnit 測試專案
- `Legacy/PracticeWebForm1/`：ASP.NET Web Forms 練習 solution
- `Legacy/PracticeMVC/`：ASP.NET MVC 5 練習 solution

## 專案結構

- 根目錄 Solution：`play_web_csharp.sln`
- 主網站專案：`MvcMovie/MvcMovie.csproj`
- 測試專案：`MvcMovie.Tests/MvcMovie.Tests.csproj`
- Legacy Web Forms Solution：`Legacy/PracticeWebForm1/PracticeForm.sln`
- Legacy MVC Solution：`Legacy/PracticeMVC/Contoso.sln`

## 主要專案：MvcMovie

`MvcMovie` 是目前根目錄 solution 中的主網站專案。

### 技術棧

- ASP.NET Core MVC
- Entity Framework Core 10
- SQLite
- .NET 10

### 目前功能

- `Home` 首頁、隱私頁與錯誤頁
- `HelloWorld` 路由與 View 範例
- `Movies` 完整 CRUD
- `Movies` 依片名搜尋
- `Movies` 依類型篩選

### 資料庫行為

- 連線字串定義於 `MvcMovie/appsettings.json`
- 目前實際使用的資料庫 provider 是 SQLite
- SQLite 資料庫檔案位置為 `MvcMovie/obj/MovieContext-2026a.db`
- 應用程式啟動時會執行 `SeedData.Initialize(...)`
- 如果資料表為空，會自動加入 4 筆範例電影資料

### 開發需求

- `.NET 10 SDK`

### 常用指令

```powershell
dotnet restore
dotnet build .\play_web_csharp.sln
dotnet test .\play_web_csharp.sln
dotnet run --project .\MvcMovie\MvcMovie.csproj
```

### 本機啟動網址

依 `MvcMovie/Properties/launchSettings.json`：

- `http://localhost:5286`
- `https://localhost:7141`

### 補充說明

- `MvcMovie.csproj` 已加入 `MySql.EntityFrameworkCore`
- `Program.cs` 目前仍以 SQLite 作為實際啟用的資料庫 provider
- MySQL 設定目前保留為註解範例，尚未啟用

## 測試專案：MvcMovie.Tests

`MvcMovie.Tests` 目前使用 NUnit，現有測試涵蓋：

- `HomeController` 的基本 action 行為
- `HelloWorldController` 的 View 與 `ViewData` 行為
- `Movie` 模型上的資料註釋屬性

## Legacy 專案

`Legacy` 目錄中的內容目前以保留與回顧練習為主，未納入根目錄 `play_web_csharp.sln`。

### Legacy/PracticeWebForm1

這個 ASP.NET Web Forms solution 目前包含 4 個專案：

- `P1-FormBasics`：`.NET Framework 4.5.2`
- `P2-WebControls`：`.NET Framework 4.5`
- `P3-DbADO_mysql`：`.NET Framework 4.6.1`
- `P4-EF_mysql`：`.NET Framework 4.6.1`

內容主題包含：

- 基本表單與 postback 練習
- Web Controls 練習
- ADO.NET 搭配 MySQL
- Entity Framework 6 搭配 MySQL

建置指令：

```powershell
nuget restore .\Legacy\PracticeWebForm1\PracticeForm.sln
msbuild .\Legacy\PracticeWebForm1\PracticeForm.sln /p:Configuration=Debug
```

### Legacy/PracticeMVC

`Contoso` 是 ASP.NET MVC 5 練習專案，使用：

- ASP.NET MVC 5
- Entity Framework 6
- .NET Framework 4.6.1
- MySQL 相關套件

建置指令：

```powershell
nuget restore .\Legacy\PracticeMVC\Contoso.sln
msbuild .\Legacy\PracticeMVC\Contoso.sln /p:Configuration=Debug
```

### Legacy 使用前提

- 需要使用支援 ASP.NET Web Application 的 Visual Studio 或 MSBuild 環境
- 建置前需要先還原 `packages.config` 型別的 NuGet 套件
- `dotnet build` 不會建置這些舊版 .NET Framework Web 專案

## 其他說明

- `play_web_csharp.sln` 目前只包含 `MvcMovie` 與 `MvcMovie.Tests`
- `Legacy` 內容彼此獨立，不影響主專案的 `dotnet build`、`dotnet test` 與 `dotnet run`
