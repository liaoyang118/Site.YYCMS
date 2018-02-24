using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Service.SiteService.SiteServices;
using Site.Service.SiteService;

namespace Site.Main.Controllers
{
    public class ListController : Controller
    {
        //cateId_pagesize
        public ActionResult Index(string pageParam)
        {
            int pageSize = 20;
            int pageIndex = 1;
            int cateId = 0;
            int rowCount = 0;

            string[] arr = pageParam.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries);
            if (arr.Length == 2)
            {
                cateId = int.Parse(arr[0]);
                pageIndex = int.Parse(arr[1]);
            }
            else if (arr.Length == 1)
            {
                cateId = int.Parse(arr[0]);
            }

            //查询该分类下所有的文章
            List<Site_Content> list = SiteServiceClass.Site_Content_SelectPageByc_id(cateId, pageIndex, pageSize, out rowCount);
            
            Site_Cates c_info = SiteServiceClass.Site_Cates_SelectByc_id(cateId);


            ViewBag.pageSize = pageSize;
            ViewBag.pageIndex = pageIndex;
            ViewBag.rowCount = rowCount;

            ViewBag.cateId = cateId;
            ViewBag.list = list;
            ViewBag.c_info = c_info;
            return View();
        }
    }
}