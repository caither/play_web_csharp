# play_web_csharp

這是一個練習用的 ASP.NET Core MVC 專案（`MvcMovie`），示範 Razor View、Controller 路由，以及使用 Entity Framework Core 對 `Movie` 資料表進行 CRUD、搜尋與類型篩選。

## 專案現況

- Solution：`play_web_csharp.sln`
- Web 專案：`MvcMovie/`
- 目標框架：`.NET 10`（`net10.0`）
- 技術組合：ASP.NET Core MVC + EF Core + SQLite（預設）
- 編譯狀態：`dotnet build --no-restore .\play_web_csharp.sln` 可成功建置（0 errors / 0 warnings）
- 測試狀態：已新增 `MvcMovie.Tests`（NUnit），目前有基本單元測試

## 主要功能

- Movies（CRUD + 搜尋）
  - `GET /Movies`：列表
  - `GET /Movies?searchString=xxx`：標題關鍵字搜尋
  - `GET /Movies?movieGenre=Comedy`：類型篩選
  - `GET /Movies/Details/{id}`：詳細
  - `GET/POST /Movies/Create`：新增
  - `GET/POST /Movies/Edit/{id}`：編輯
  - `GET/POST /Movies/Delete/{id}`：刪除
- HelloWorld（示範 ViewData）
  - `GET /HelloWorld`
  - `GET /HelloWorld/Welcome?name=YourName&numTimes=3`
- Home
  - `GET /Home/Index`
  - `GET /Home/Privacy`

## 執行方式

需要安裝 `.NET SDK 10`。

```powershell
dotnet restore
dotnet build .\play_web_csharp.sln
dotnet test .\play_web_csharp.sln
dotnet run --project .\MvcMovie\MvcMovie.csproj
```

本機預設網址請參考 `MvcMovie/Properties/launchSettings.json`：

- `http://localhost:5286`
- `https://localhost:7141`

## 資料庫與 Seed

- 預設資料庫為 SQLite。
  - 連線字串位於 `MvcMovie/appsettings.json` 的 `ConnectionStrings:MvcMovieContext`
  - 目前值為：`Data Source=obj/MovieContext-2026a.db`
- 啟動時會呼叫 `SeedData.Initialize(...)` 嘗試灌入初始資料。
- Migration 檔案位於 `MvcMovie/Migrations/`（目前包含 `InitialCreate`、`Rating`）。

## 已知風險與限制

- 連線字串指向 `obj/`：執行 `dotnet clean`、重建或切換環境後，資料庫檔可能被刪除。
- 啟動流程目前沒有自動 `Database.Migrate()`；在全新環境若尚未建表，可能在 Seed 階段失敗。
- `Movies/Index.cshtml` 透過 `Model.Movies![0]` 取欄位名稱，若清單為空有潛在例外風險。
- 專案同時保留 SQLite 與 MySQL 套件/設定註解，若切換資料庫需同步調整 `Program.cs`、Migration 與資料庫連線設定。

## 測試

- 測試專案：`MvcMovie.Tests/`（NUnit）
- 執行方式：

```powershell
dotnet test .\play_web_csharp.sln
```

- 目前涵蓋：
  - `HomeController`：`Index` / `Privacy` / `Error`
  - `HelloWorldController`：`Index` / `Welcome`
  - `Movie` 模型：`ReleaseDate` 與 `Price` 的資料註釋屬性

## 建議改善方向

- 將 SQLite DB 路徑改到固定資料夾（例如 `App_Data/`）。
- 在啟動流程加入自動 migration（`Database.Migrate()`）以降低新環境啟動失敗風險。
- 逐步補上資料存取層與整合測試（例如 `MoviesController` + DbContext）。
- 調整 `Movies/Index.cshtml` 的欄位顯示寫法，避免依賴 `Movies[0]`。

## 目錄結構

```text
play_web_csharp/
  play_web_csharp.sln
  README.md
  MvcMovie/
    Controllers/
    Data/
    Migrations/
    Models/
    Views/
    wwwroot/
    Program.cs
    appsettings.json
    MvcMovie.csproj
```
