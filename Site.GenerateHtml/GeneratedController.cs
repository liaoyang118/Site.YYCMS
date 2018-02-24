using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web;
using Site.Service.SiteService.SiteServices;
using Site.Service.SiteService;
using System.Configuration;
using Site.Service.SiteService.Search;
using Site.Common;
using Site.Service.SiteService.PublishPageService;

namespace GenerateHtml
{
    /// <summary>
    /// 获取视图引擎渲染后的内容，生成静态化页面
    /// </summary>
    public class GeneratedController : Controller
    {

        //测试action
        public ActionResult PublishPage()
        {
            string p_gid = Request["p_gid"] ?? string.Empty;
            string p_path = Request["p_path"] ?? string.Empty;//模板绝对路径 基地址 名称
            Site_CMSPage info = SiteServiceClass.Site_CMSPage_SelectByp_gid(p_gid);
            string tempFilePath = info.p_tempPath;
            string generatePath = info.p_filePath;

            //获取页面发布服务配置名称
            string siteName = Request["siteName"] ?? string.Empty;//模板绝对路径 基地址 名称
            SiteEnum.SiteService serviceName = SiteEnum.SiteService.PublishPageService;
            SiteEnum.SiteName serviceEnum = (SiteEnum.SiteName)Enum.Parse(typeof(SiteEnum.SiteName), siteName);

            switch (serviceEnum)
            {
                case SiteEnum.SiteName.MainSite:
                    serviceName = SiteEnum.SiteService.PublishPageService;
                    break;
                case SiteEnum.SiteName.XiaoShuoSite:
                    serviceName = SiteEnum.SiteService.PublishXiaoShuoPageService;
                    break;
                default:
                    serviceName = SiteEnum.SiteService.PublishPageService;
                    break;
            }

            tempFilePath = tempFilePath.Replace("/", "\\");
            generatePath = generatePath.Replace("~", "").Replace("/", "\\");
            //查询页面下的区块数据 <路径，数据项>
            Dictionary<string, List<Site_CMSItem>> dic = new Dictionary<string, List<Site_CMSItem>>();

            Site_CMSBlocksSearchInfo search = new Site_CMSBlocksSearchInfo()
            {
                b_p_gid = p_gid
            };
            int rowCount;
            List<Site_CMSBlock> list = SiteServiceClass.Site_CMSBlock_SelectPage(search, 1, 100, out rowCount);
            List<Site_CMSItem> itemList = new List<Site_CMSItem>();

            Site_CMSItemSearchInfo itemSearch = null;
            foreach (Site_CMSBlock item in list)
            {
                itemSearch = new Site_CMSItemSearchInfo()
                {
                    i_status = (int)SiteEnum.SiteItemStatus.正常,
                    i_b_gid = item.b_gid
                };

                itemList = SiteServiceClass.Site_CMSItem_SelectPage(itemSearch, 1, 100, out rowCount);
                dic.Add(item.b_path, itemList);
            }

            //获取数据，传递到页面
            ViewBag.dataList = dic;

            return this.GeneratePage(tempFilePath, generatePath, serviceName, this.ViewData, this.TempData, this.ControllerContext);
        }

        #region 1.1 生成静态页面 - GeneratePage
        /// <summary>
        /// 生成静态页面
        /// </summary>
        /// <param name="tempFilePath">模板文件全路径</param>
        /// <param name="generatePath">生成文件相对路径</param>
        /// <param name="dic">ViewData</param>
        /// <param name="tempDic">TempData</param>
        /// <param name="context">控制器上下文</param>
        /// <returns></returns>
        private ActionResult GeneratePage(string tempFilePath, string generatePath, SiteEnum.SiteService serviceName, ViewDataDictionary dic, TempDataDictionary tempDic, ControllerContext context)
        {
            string fullPath = Server.MapPath(tempFilePath);
            if (!System.IO.File.Exists(fullPath))
            {
                return Json(new { success = false, errors = new { text = "不存在该模板文件" } }, "text/html", JsonRequestBehavior.AllowGet);
            }
            string html = GenerateHtml(tempFilePath, dic, tempDic, context);

            string error;
            bool isSuccess = CreatePage(generatePath, html, serviceName, out error);
            return Json(new { success = isSuccess, errors = new { text = error } }, "text/html", JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region 1.2 获取通过视图引擎渲染后的页面HTML文本 - GenerateHtml
        /// <summary>
        /// 获取通过视图引擎渲染后的页面HTML文本
        /// </summary>
        /// <param name="tempFilePath"></param>
        /// <param name="dic"></param>
        /// <param name="tempDic"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        private string GenerateHtml(string tempFilePath, ViewDataDictionary dic, TempDataDictionary tempDic, ControllerContext context)
        {
            string html = string.Empty;
            IView view = ViewEngines.Engines.FindPartialView(context, tempFilePath).View;

            if (view == null)
            {
                throw new Exception("没有找到分布视图");
            }
            using (System.IO.StringWriter sw = new System.IO.StringWriter())
            {
                ViewContext vc = new ViewContext(context, view, dic, tempDic, sw);
                vc.View.Render(vc, sw);
                html = sw.ToString();
            }
            return html;
        }
        #endregion

        #region 1.3 生成页面文件 - CreatePage
        /// <summary>
        /// 生成页面文件
        /// </summary>
        /// <param name="generatePath">生成文件的相对路径</param>
        /// <param name="content">生成的页面内容</param>
        /// <param name="error"></param>
        /// <returns></returns>
        private bool CreatePage(string generatePath, string content, SiteEnum.SiteService serviceName, out string error)
        {
            error = "发布完成";
            try
            {
                //string fullPath = generatePath;
                //int _index = fullPath.LastIndexOf(@"\");
                //string directoryPath = fullPath.Substring(0, _index);
                //if (!System.IO.Directory.Exists(directoryPath))
                //{
                //    System.IO.Directory.CreateDirectory(directoryPath);
                //}

                #region 无效，读取文件的时候会乱码
                //byte[] bytes = System.Text.Encoding.UTF8.GetBytes(content);
                //using (System.IO.FileStream fs = new System.IO.FileStream(fullPath, System.IO.FileMode.Create))
                //{
                //    fs.Write(bytes, 0, bytes.Length);
                //} 
                #endregion

                #region 无效，本地路径发布，不能实现远程发布
                //using (System.IO.StreamWriter sw = new System.IO.StreamWriter(fullPath, false, Encoding.UTF8))
                //{
                //    sw.Write(content);
                //} 
                #endregion


                List<IPublishPageService> channelList = Entity.CreateChannelList<IPublishPageService>(serviceName);
                if (channelList != null && channelList.Count > 0)
                {
                    foreach (IPublishPageService channel in channelList)
                    {
                        error += string.Format("{0} ", channel.PublishPage(generatePath, content));
                        (channel as IDisposable).Dispose();
                    }

                    return true;
                }
                else
                {
                    error = "WCF通道创建失败，可能是没有该名称对应的服务配置项";
                    return false;
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }

        }
        #endregion
    }
}
