# play_web_csharp

這是一個練習用的 ASP.NET Core MVC 專案（`MvcMovie`），示範 Razor View、Controller 路由，以及使用 Entity Framework Core 對 `Movie` 資料表進行 CRUD。

## 專案組成

- Solution：`play_web_csharp.sln`
- Web 專案：`MvcMovie/`
- 目標框架：`.NET 10`（`net10.0`）
- 架構：ASP.NET Core MVC（Controllers + Views）+ EF Core（DbContext + Migrations）

## 主要功能

- Movies（CRUD）
  - `GET /Movies`：列表
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
dotnet run --project .\MvcMovie\MvcMovie.csproj
```

本機預設網址請參考 `MvcMovie/Properties/launchSettings.json`：

- `http://localhost:5286`
- `https://localhost:7141`

## 資料庫與種子資料（Seed）

- 預設使用 **SQLite**：
  - 連線字串在 `MvcMovie/appsettings.json` 的 `ConnectionStrings:MvcMovieContext`
  - 目前設定為：`Data Source=obj/MovieContext-2026a.db`
- 啟動時會執行種子資料初始化：
  - `MvcMovie/Program.cs` 會呼叫 `SeedData.Initialize(...)`
  - `MvcMovie/Models/MovieSeedData.cs` 會在資料表已存在資料時跳過（`context.Movie.Any()`）

## 注意事項 / 常見問題

- DB 檔案目前放在 `obj/` 下：清理/重建（例如 `dotnet clean`）可能導致資料庫檔案被移除；若要長期保存，建議改到固定位置（例如專案根目錄下的 `App_Data/`）。
- 專案內同時存在 SQLite 與 MySQL 的套件與 Migration 痕跡：若要切換到 MySQL，請確保
  - `MvcMovie/Program.cs` 的 `UseSqlite(...)` / `UseMySQL(...)` 與
  - `MvcMovie/Migrations/`、`ModelSnapshot`
  三者保持一致，避免 `dotnet ef database update` 或執行期行為出錯。

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
