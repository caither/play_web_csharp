using Contoso.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Contoso
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // 在應用程式啟動時設定 Entity Framework 的資料庫初始化器。
            Database.SetInitializer(new SchoolInitializer());

            // 在應用程式啟動時註冊 SchoolInterceptorTransientErrors 攔截器，以便在整個應用程式中模擬暫時性錯誤。
            DbInterception.Add(new SchoolInterceptorTransientErrors());
            // 註冊 SchoolInterceptorLogging 攔截器，以便在整個應用程式中捕獲和記錄 SQL 命令的執行資訊。
            DbInterception.Add(new SchoolInterceptorLogging());
        }
    }
}
