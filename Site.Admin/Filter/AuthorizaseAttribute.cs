using SiteFrame.BLL;
using SiteFrame.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Common;

namespace Site.Admin.Filter
{
    /// <summary>
    /// 登录验证特性
    /// </summary>
    public class AuthorizaseAttribute : AuthorizeAttribute
    {

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //判断是否登录
            if (!IsLogin())
            {
                //弹出登录窗
                string iframeName = filterContext.RequestContext.HttpContext.Request["name"] ?? string.Empty;
                filterContext.Result = ResponseContent.ResponseCallFunction("showLoginDialog", "ajax", iframeName);

            }
            else
            {
                //判断是否需要判断 权限
                if (IsDefindAttr<ValidatePermissionAttribute>(filterContext))
                {
                    //判断是否有权限
                    if (CommonContext.Session[Entity.PERMISSIONKEY] == null)
                    {
                        string u_gid = (CommonContext.Session[Entity.UserSessionKey] as User).u_gid;
                        CommonContext.Session[Entity.PERMISSIONKEY] = SystemSeviceClass.ModulePermission_SelectUserPerByu_gid(u_gid);
                    }
                    List<ModulePermission> listPer = CommonContext.Session[Entity.PERMISSIONKEY] as List<ModulePermission>;
                    if (!IsHasPermission(listPer, filterContext.ActionDescriptor))
                    {
                        JsonResult json = new JsonResult();
                        json.ContentType = "text/html";
                        json.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
                        json.Data = new { success = false, errors = new { text = "没有访问权限" } };
                        filterContext.Result = json;
                    }
                }
            }
        }

        //判断登录
        private bool IsLogin()
        {
            if (System.Web.HttpContext.Current.Session[Entity.UserSessionKey] == null)
            {
                if (System.Web.HttpContext.Current.Request.Cookies["name"] != null)
                {
                    string name = System.Web.HttpContext.Current.Request.Cookies["name"].Value;
                    User info = SystemSeviceClass.User_SelectByu_name(name);
                    System.Web.HttpContext.Current.Session[Entity.UserSessionKey] = info;
                    return true;
                }
                return false;
            }
            return true;
        }

        //判断是否有 T 特性
        private bool IsDefindAttr<T>(AuthorizationContext filterContext) where T : Attribute
        {
            if (filterContext.ActionDescriptor.IsDefined(typeof(T), false) || filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(T), false))
            {
                return true;
            }
            return false;
        }

        //判断是否有权限
        private bool IsHasPermission(List<ModulePermission> listPer, ActionDescriptor descript)
        {
            string controllerName = descript.ControllerDescriptor.ControllerName;
            string ActionName = descript.ActionName;
            string[] arr = null;
            foreach (ModulePermission item in listPer)
            {
                arr = item.p_path.Split(new[] { ".", "." }, StringSplitOptions.RemoveEmptyEntries);
                if (arr.Length == 2)
                {
                    if (arr[0].ToLower() == controllerName.ToLower() && arr[1].ToLower() == ActionName.ToLower())
                    {
                        return true;
                    }
                }
            }
            return false;
        }


    }
}