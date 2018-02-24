using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SystemLog
{
    public class LogHelper
    {
        #region 字段
        private static log4net.ILog VisitLog
        {
            get { return log4net.LogManager.GetLogger("visits"); }
        }

        private static log4net.ILog ErrorLog
        {
            get { return log4net.LogManager.GetLogger("error"); }
        }

        private static log4net.ILog LoginLog
        {
            get { return log4net.LogManager.GetLogger("login"); }
        } 
        #endregion



        public static void WriteVisitsLog(string message)
        {
            VisitLog.Info(message);
        }

        public static void WriteErrorLog(Exception ex)
        {
            ErrorLog.Error("Error:", ex);
        }

        public static void WriteErrorLog(string error)
        {
            ErrorLog.Error(error);
        }

        public static void WriteLoginLog(string msg)
        {
            LoginLog.Info(msg);
        }
    }
}
