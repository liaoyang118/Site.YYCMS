using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Site.Common;
using Site.Admin.Filter;
using System.Web.Script.Serialization;
using SiteFrame.BLL;
using SiteFrame.Model;
using SystemLog;
using Site.Admin.Common;

namespace Site.Admin.Controllers
{
    public class HomeController : Controller
    {
        #region 登录视图 +Login()
        [HttpGet]
        public ActionResult Login()
        {
            LogHelper.WriteVisitsLog("进入登陆页面");
            return View();
        }
        #endregion

        #region 登录 + Login(User obj)
        [HttpPost]
        public ActionResult Login(User obj)
        {
            string remenber = Request["remenber"] ?? string.Empty;
            User info = SystemSeviceClass.User_SelectByu_name(obj.u_username);

            if (info != null)
            {
                string md5Pwd = Entity.Str2Md5(obj.u_password);
                if (md5Pwd == info.u_password)
                {
                    if (remenber == "1")
                    {
                        HttpCookie cookies = new HttpCookie("name", info.u_username);
                        cookies.Expires = DateTime.Now.AddMinutes(60);
                        Response.Cookies.Add(cookies);
                    }
                    CommonContext.Session[Entity.UserSessionKey] = info;
                    //登陆成功之后，将权限放到session中
                    CommonContext.Session[Entity.PERMISSIONKEY] = SystemSeviceClass.ModulePermission_SelectUserPerByu_gid(info.u_gid);

                    LogHelper.WriteLoginLog(string.Format("用户:{0},登录成功", info.u_username));
                    return Json(new { success = true, errors = new { text = "登陆成功" } });
                }
                LogHelper.WriteLoginLog(string.Format("用户:{0},密码错误", info.u_username));
                return Json(new { success = false, errors = new { text = "密码错误" } });
            }
            LogHelper.WriteLoginLog(string.Format("用户:{0},用户名不存在", obj.u_username));
            return Json(new { success = false, errors = new { text = "用户名不存在" } });
        }
        #endregion

        #region 登出 + LoginOut()
        public ActionResult LoginOut()
        {
            LogHelper.WriteLoginLog(string.Format("用户:{0},登出成功", SiteHelp.CurrentUserName));
            CommonContext.Session.Abandon();
            return Json(new { success = true, errors = new { text = "登出成功" } });
        }
        #endregion

        #region 主页 +Index()

        public ActionResult Index()
        {
            if (CommonContext.Session[Entity.UserSessionKey] != null)
            {
                string u_gid = (CommonContext.Session[Entity.UserSessionKey] as User).u_gid ?? string.Empty;
                List<SystemGroup> list = SystemSeviceClass.SystemGroup_SelectByu_gid(u_gid);

                ViewData["name"] = (CommonContext.Session[Entity.UserSessionKey] as User).u_username;
                ViewData["list"] = list;
            }
            return View();
        }
        #endregion

        #region 登录分布视图 + LoginPartFrame()
        //登录分布视图
        public ActionResult LoginPartFrame()
        {
            string type = Request["type"] ?? string.Empty;
            string iframeName = Request["iframeName"] ?? string.Empty;

            ViewData["type"] = type;
            ViewData["iframeName"] = iframeName;

            return PartialView();
        }
        #endregion


        public ActionResult Test()
        {
            return View();
        }
    }
}
