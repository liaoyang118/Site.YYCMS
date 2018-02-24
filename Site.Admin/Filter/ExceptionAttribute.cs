using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SystemLog;

namespace Site.Admin.Filter
{
    /// <summary>
    /// 异常特性
    /// </summary>
    public class ExceptionAttribute : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext filterContext)
        {
            LogHelper.WriteErrorLog(filterContext.Exception);
        }
    }
}