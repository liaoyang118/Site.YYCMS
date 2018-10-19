using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace Site.Common
{
    public class CommonContext
    {
       
        public static HttpRequest Requset
        {
            get { return Context.Request; }
        }


        public static HttpResponse Response
        {
            get { return Context.Response; }
        }



        public static HttpContext Context
        {
            get { return HttpContext.Current; }
        }


        public static HttpSessionState  Session
        {
            get { return Context.Session; }
        }


    }
}
