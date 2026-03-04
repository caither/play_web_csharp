using System;

namespace Contoso.Logging
{
    //
    //
    // 這是一個可供應用程式使用的簡單日誌介面。它定義了幾種不同的日誌方法，允許記錄資訊、警告和錯誤，以及追蹤 API 呼叫的性能。實際的日誌實現可以根據需要進行擴展或替換。
    public interface ILogger
    {
        void Information(string message);
        void Information(string fmt, params object[] vars);
        void Information(Exception exception, string fmt, params object[] vars);

        void Warning(string message);
        void Warning(string fmt, params object[] vars);
        void Warning(Exception exception, string fmt, params object[] vars);

        void Error(string message);
        void Error(string fmt, params object[] vars);
        void Error(Exception exception, string fmt, params object[] vars);

        void TraceApi(string componentName, string method, TimeSpan timespan);
        void TraceApi(string componentName, string method, TimeSpan timespan, string properties);
        void TraceApi(string componentName, string method, TimeSpan timespan, string fmt, params object[] vars);
    }
}