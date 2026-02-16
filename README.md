# play_web_csharp

以 ASP.NET Core MVC 建立的 C# Web 範例專案，主要包含基本頁面、控制器路由與 Razor View。

## 專案概述

- Solution：`play_web_csharp.sln`
- Web 專案：`MvcMovie`
- 目標框架：`.NET 10`（`net10.0`）
- 架構：ASP.NET Core MVC（Controllers + Views）

## 目前功能

- `HomeController`
- `/` 或 `/Home/Index`：首頁
- `/Home/Privacy`：隱私權頁面
- `HelloWorldController`
- `/HelloWorld/Index`：HelloWorld Razor View 頁面
- `/HelloWorld/Welcome?name=YourName&ID=1`：回傳文字訊息

## 執行環境需求

- .NET SDK 10（需支援 `net10.0`）

## 快速開始

在專案根目錄執行：

```powershell
dotnet restore
dotnet run --project .\MvcMovie\MvcMovie.csproj
```

預設開發 URL（依 `launchSettings.json`）：

- `http://localhost:5286`
- `https://localhost:7141`

## 專案結構

```text
play_web_csharp/
├─ play_web_csharp.sln
├─ README.md
└─ MvcMovie/
   ├─ Controllers/
   │  ├─ HomeController.cs
   │  └─ HelloWorldController.cs
   ├─ Models/
   │  └─ ErrorViewModel.cs
   ├─ Views/
   │  ├─ Home/
   │  ├─ HelloWorld/
   │  └─ Shared/
   ├─ wwwroot/
   ├─ Program.cs
   ├─ appsettings.json
   └─ MvcMovie.csproj
```

## 設定說明

- `appsettings.json`：記錄日誌等級與 `AllowedHosts`
- `Program.cs`：註冊 MVC、設定中介軟體與預設路由

## 備註

目前為教學/練習性質的基礎範例，尚未包含資料庫、身分驗證與自動化測試。
