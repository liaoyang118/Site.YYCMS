using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SiteFrame.Model;
using Site.Common;

namespace Site.Admin.Common
{
    /// <summary>
    /// 获取一些公用信息
    /// </summary>
    public static class SiteHelp
    {
        #region 登录用户名

        /// <summary>
        /// 当前登录用户名
        /// </summary>
        public static string CurrentUserName
        {
            get { return GetLoginUserName(); }
        }

        public static string CurrentUserNickName
        {
            get
            {
                if (UserInfo != null)
                {
                    return UserInfo.u_nickName;
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        private static User UserInfo
        {
            get { return GetCurrentUser(); }
        }


        private static User GetCurrentUser()
        {
            if (CommonContext.Session[Entity.UserSessionKey] == null)
            {
                return null;
            }
            else
            {
                return CommonContext.Session[Entity.UserSessionKey] as User;
            }
        }


        private static string GetLoginUserName()
        {

            if (CommonContext.Session[Entity.UserSessionKey] == null)
            {
                string name = string.Empty;
                if (System.Web.HttpContext.Current.Request.Cookies["name"] != null)
                {
                    name = System.Web.HttpContext.Current.Request.Cookies["name"].Value;
                }
                return name;
            }
            else
            {
                return (CommonContext.Session[Entity.UserSessionKey] as User).u_username;
            }
        }

        #endregion

        #region 获取枚举值 - Dictionary<int, string> GetNamesValues<T>()
        /// <summary>
        /// 返回枚举的 name - key 和 val - value
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public static Dictionary<int, string> GetNamesValues<T>() where T : SiteEnum
        {
            Dictionary<int, string> dic = new Dictionary<int, string>();
            Array arr = Enum.GetValues(typeof(T));
            foreach (int item in arr)
            {
                dic[item] = Enum.GetName(typeof(T), item);
            }
            return dic;
        }
        #endregion
    }
}