using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Site.Common
{
    public class ResponseContent
    {
        public static ContentResult ResponseJs(string content, string backUrl)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>alert('" + content + "');");
            if (backUrl != "")
            {
                sb.Append("window.location.href='" + backUrl + "'");
            }
            sb.Append("</script>");

            ContentResult result = new ContentResult()
             {
                 ContentType = "text/html",
                 Content = sb.ToString(),
             };
            return result;
        }

        public static ContentResult ResponseJs(string content)
        {
            return ResponseJs(content, "");
        }


        public static ContentResult ResponseCallFunction(string funcName, string paramsStr, string iframeName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>top." + funcName + "('" + paramsStr + "','" + iframeName + "');");
            sb.Append("</script>");

            ContentResult result = new ContentResult()
            {
                ContentType = "text/html",
                Content = sb.ToString(),
            };
            return result;
        }


    }
}
