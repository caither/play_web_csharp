using Contoso.Logging;
using System;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Infrastructure.Interception;
using System.Data.Entity.SqlServer;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection;

namespace Contoso.DataAccess
{
    //
    // Summary:
    // 這是一個 Entity Framework 的攔截器類別，用於模擬暫時性錯誤。在 ReaderExecuting 方法中，它檢查 SQL 命令的參數，如果第一個參數的值為 "%Throw%"，則它會模擬一個暫時性錯誤，並在前四次嘗試時返回該錯誤。這個攔截器可以用於測試應用程式對暫時性錯誤的處理能力。
    public class SchoolInterceptorTransientErrors : DbCommandInterceptor
    {
        private int _counter = 0;
        private ILogger _logger = new Logger();

        // 檢查 SQL 命令的參數，如果第一個參數的值為 "Throw"，則它會模擬一個暫時性錯誤，並在前四次嘗試時返回該錯誤。這裡使用了一個計數器來跟踪已經模擬了多少次錯誤，以確保只在前四次嘗試時返回錯誤。
        public override void ReaderExecuting(DbCommand command, DbCommandInterceptionContext<DbDataReader> interceptionContext)
        {
            bool throwTransientErrors = false;
            if (command.Parameters.Count > 0 && command.Parameters[0].Value.ToString() == "%Throw%")
            {
                throwTransientErrors = true;
                command.Parameters[0].Value = "%an%";
                command.Parameters[1].Value = "%an%";
            }

            if (throwTransientErrors && _counter < 4)
            {
                _logger.Information("Returning transient error for command: {0}", command.CommandText);
                _counter++;
                interceptionContext.Exception = CreateDummySqlException();
            }
        }

        // 創建一個模擬的 SqlException，該異常具有特定的錯誤號碼，以便在測試中識別為暫時性錯誤。這裡使用反射來創建 SqlError 和 SqlErrorCollection 的實例，並將其組合成一個 SqlException。
        private SqlException CreateDummySqlException()
        {
            // The instance of SQL Server you attempted to connect to does not support encryption
            var sqlErrorNumber = 20;

            var sqlErrorCtor = typeof(SqlError).GetConstructors(BindingFlags.Instance | BindingFlags.NonPublic).Where(c => c.GetParameters().Count() == 7).Single();
            var sqlError = sqlErrorCtor.Invoke(new object[] { sqlErrorNumber, (byte)0, (byte)0, "", "", "", 1 });

            var errorCollection = Activator.CreateInstance(typeof(SqlErrorCollection), true);
            var addMethod = typeof(SqlErrorCollection).GetMethod("Add", BindingFlags.Instance | BindingFlags.NonPublic);
            addMethod.Invoke(errorCollection, new[] { sqlError });

            var sqlExceptionCtor = typeof(SqlException).GetConstructors(BindingFlags.Instance | BindingFlags.NonPublic).Where(c => c.GetParameters().Count() == 4).Single();
            var sqlException = (SqlException)sqlExceptionCtor.Invoke(new object[] { "Dummy", errorCollection, null, Guid.NewGuid() });

            return sqlException;
        }
    }
}