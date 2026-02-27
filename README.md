# play_web_csharp

這個倉庫目前包含兩部分：

- `MvcMovie/`: ASP.NET Core MVC 練習專案
- `Legacy/PracticeWebForm1/`: 保留的 ASP.NET Web Forms 歷史練習

## 目前結構

- 根目錄 Solution: `play_web_csharp.sln`
- 主網站專案: `MvcMovie/`
- 測試專案: `MvcMovie.Tests/`
- Legacy 練習: `Legacy/PracticeWebForm1/PracticeForm.sln`

## MvcMovie

`MvcMovie` 是目前主專案，使用 ASP.NET Core MVC、Entity Framework Core 與 SQLite。

### 主要功能

- `Movies` CRUD
- `Movies` 依片名搜尋
- `Movies` 依類型篩選
- `HelloWorld` 基本路由與 View 範例
- `Home` 基本頁面

### 開發需求

- `.NET SDK 10`

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

## Legacy Web Forms

`Legacy/PracticeWebForm1` 是過去的 Web Forms 練習，保留用途以歷史參考為主，並未加入根目錄的 `play_web_csharp.sln`。

### Legacy 專案特性

- 技術：ASP.NET Web Forms
- Framework：`.NET Framework 4.5.2`
- 獨立 Solution：`Legacy/PracticeWebForm1/PracticeForm.sln`
- 專案檔：`Legacy/PracticeWebForm1/WebFormBasics/P1-FormBasics.csproj`
- 套件管理：`packages.config`

### Legacy 建置方式

這個專案已移除對 `.nuget/NuGet.targets` 的硬依賴，但仍需要先還原 NuGet 套件再建置。

```powershell
nuget restore .\Legacy\PracticeWebForm1\PracticeForm.sln

msbuild .\Legacy\PracticeWebForm1\PracticeForm.sln /p:Configuration=Debug
```

### Legacy 保存原則

- 以保存練習內容為主，不主動升級成新框架
- 不將 `packages/`、`bin/`、`obj/`、`App_Data/`、`.nuget/` 納入版控
- 如需開啟 Legacy 專案，請使用支援 .NET Framework Web Application 的 Visual Studio 環境

## Git Ignore 現況

目前已忽略下列 Legacy 產物路徑：

- `Legacy/**/packages/`
- `Legacy/**/bin/`
- `Legacy/**/obj/`
- `Legacy/**/App_Data/`
- `.nuget/`

## 備註

- 根目錄 `play_web_csharp.sln` 目前只管理 `MvcMovie` 與 `MvcMovie.Tests`
- `Legacy/PracticeWebForm1` 為獨立保存，不影響主專案的 `dotnet build` 與 `dotnet test`
