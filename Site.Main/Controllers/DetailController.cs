using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Service.SiteService.SiteServices;
using Site.Service.SiteService;
using Site.Common;

namespace Site.Main.Controllers
{
    public class DetailController : Controller
    {
        // GET: Detail
        public ActionResult Index(string gid)
        {
            Site_Content info = SiteServiceClass.Site_Content_SelectByc_gid(gid);
            
            if (info != null)
            {
                //查询出子分类
                Site_Cates c_info = SiteServiceClass.Site_Cates_SelectBaseCateByc_gid(info.c_c_gid);

                ViewBag.c_info = c_info;
                if (info.c_status == (int)SiteEnum.SiteItemStatus.待审核 || info.c_status == (int)SiteEnum.SiteItemStatus.关闭)
                {
                    return RedirectToAction("NotFound", "Error");
                }
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }

            ViewBag.info = info;
            return View();
        }
    }
}