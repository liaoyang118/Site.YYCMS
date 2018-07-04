using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Site.Common;
using System.Configuration;
using System.Net;
using System.IO;

namespace Site.Common
{
    /// <summary>
    /// CMS后台工具类
    /// </summary>
    public class SiteUntility
    {
        #region 新闻站点

        #region  URL生成

        public static string GetRelationCateUrl(string cateId)
        {
            if (string.IsNullOrEmpty(cateId.Trim(' ')))
            {
                return "/";
            }
            return string.Format("/list/{0}.html", cateId);
        }

        private static string GetRelationCatePageUrl(string cateId, int pageIndex)
        {
            if (string.IsNullOrEmpty(cateId.Trim(' ')))
            {
                return "/";
            }
            return string.Format("/list/{0}_{1}.html", cateId, pageIndex);
        }

        public static string GetDomainCateUrl(string cateId)
        {
            if (string.IsNullOrEmpty(cateId))
            {
                return "/";
            }
            return string.Format("http://{0}/list/{1}.html", ConfigurationManager.AppSettings["SiteDomain"], cateId);
        }

        private static string GetDomainCatePageUrl(string cateId, int pageIndex)
        {
            if (string.IsNullOrEmpty(cateId))
            {
                return "/";
            }
            return string.Format("http://{0}/list/{1}_{2}.html", ConfigurationManager.AppSettings["SiteDomain"], cateId, pageIndex);
        }

        public static string GetRelationDetailUrl(string c_gid)
        {
            return string.Format("/detail/{0}.html", c_gid);
        }

        public static string GetDomainDetailUrl(string cateId, string c_gid)
        {
            return string.Format("http://{0}/detail/{1}.html", ConfigurationManager.AppSettings["SiteDomain"], c_gid);
        }
        #endregion

        #region 分页条生成
        /// <summary>
        /// 生成分类列表分页Dome
        /// </summary>
        /// <returns></returns>
        public static string CreateListPage(string cateId, int pageSize, int pageIndex, int rowCount)
        {
            /*
             *
             自定义分页格式
             <div class="content_page">
                <a href="#">首页</a>
                <a href="#">上一页</a>
                <a href="#">1</a>
                <a href="#" class="cur">2</a>
                <a href="#">3</a>
                <a href="#">下一页</a>
                <a href="#">尾页</a>
            </div>


            模板分页格式
            <ul class="pagination box-hover clearfix">
                <li><a href="#" class="previous-page paging">首页</a></li>
                <li><a href="#" class="previous-page paging">上一页</a></li>
                <li><a href="#" class="paging">1</a></li>
                <li><a href="#" class="paging">2</a></li>
                <li class="current"><a href="#" class="paging">3</a></li>
                <li><a href="#" class="paging">4</a></li>
                <li><a href="#" class="next-page paging">下一页</a></li>
                <li><a href="#" class="next-page paging">尾页</a></li>
            </ul>

            */
            string result = string.Empty;

            #region 自定义分页格式【无效】
            //string pageHtml = "<div class=\"content_page\">{0}</div>";
            //string a_url = string.Empty;
            //int totalPage = (int)Math.Ceiling(rowCount * 1.00 / pageSize * 1.00);
            //if (totalPage > 1)
            //{
            //    if (pageIndex != 1)
            //    {
            //        a_url += string.Format("<a href=\"{0}\">首页</a>\r\n", GetRelationCateUrl(cateId));
            //        a_url += string.Format("<a href=\"{0}\">上一页</a>\r\n", GetRelationCatePageUrl(cateId, pageIndex - 1));
            //    }

            //    for (int i = 1; i <= totalPage; i++)
            //    {
            //        a_url += string.Format("<a href=\"{0}\" class=\"{2}\" >{1}</a>\r\n", GetRelationCatePageUrl(cateId, i), i, i == pageIndex ? "cur" : "");
            //    }

            //    if (pageIndex != totalPage)
            //    {
            //        a_url += string.Format("<a href=\"{0}\">下一页</a>\r\n", GetRelationCatePageUrl(cateId, pageIndex + 1));
            //        a_url += string.Format("<a href=\"{0}\">尾页</a>\r\n", GetRelationCatePageUrl(cateId, totalPage));
            //    }

            //    result = string.Format(pageHtml, a_url);
            //} 
            #endregion

            #region 模板分页格式
            string pageHtml = "<ul class=\"pagination box-hover clearfix\">{0}</ul>";
            string a_url = string.Empty;
            int totalPage = (int)Math.Ceiling(rowCount * 1.00 / pageSize * 1.00);
            if (totalPage > 1)
            {
                if (pageIndex != 1)
                {
                    a_url += string.Format("<li><a href=\"{0}\" class=\"previous-page paging\">首页</a></li>\r\n", GetRelationCateUrl(cateId));
                    a_url += string.Format("<li><a href=\"{0}\" class=\"previous-page paging\">上一页</a></li>\r\n", GetRelationCatePageUrl(cateId, pageIndex - 1));
                }

                for (int i = 1; i <= totalPage; i++)
                {
                    a_url += string.Format("<li class=\"{2}\"><a href=\"{0}\" class=\"paging\">{1}</a></li>\r\n", GetRelationCatePageUrl(cateId, i), i, i == pageIndex ? "current" : "");
                }

                if (pageIndex != totalPage)
                {
                    a_url += string.Format("<li><a href=\"{0}\" class=\"next-page paging\">下一页</a></li>\r\n", GetRelationCatePageUrl(cateId, pageIndex + 1));
                    a_url += string.Format("<li><a href=\"{0}\" class=\"next-page paging\">尾页</a></li>\r\n", GetRelationCatePageUrl(cateId, totalPage));
                }

                result = string.Format(pageHtml, a_url);
            }
            #endregion

            return result;
        }
        #endregion

        #endregion

        #region 小说站点

        #region URL生成

        /// <summary>
        /// 生成小说介绍页URL
        /// </summary>
        /// <param name="cateId"></param>
        /// <param name="fId"></param>
        /// <returns></returns>
        public static string GenerateIntroUrl(int fId)
        {
            return string.Format("http://{0}/Introduce/{1}.html", ConfigurationManager.AppSettings["XSDomain"], fId);
        }

        /// <summary>
        /// 生成小说章节页URL
        /// </summary>
        /// <param name="fId"></param>
        /// <param name="chapterId"></param>
        /// <returns></returns>
        public static string GenerateDetailUrl(int fId, string chapterId)
        {
            return string.Format("http://{0}/Detail/{1}/{2}.html", ConfigurationManager.AppSettings["XSDomain"], fId, chapterId);
        }

        /// <summary>
        /// 生成小说列表页URL
        /// </summary>
        /// <param name="fId"></param>
        /// <param name="chapterId"></param>
        /// <returns></returns>
        public static string GenerateListUrl(int cateId)
        {
            return string.Format("http://{0}/List/{1}.html", ConfigurationManager.AppSettings["XSDomain"], cateId);
        }

        #endregion

        #endregion



        /// <summary>
        /// 远程抓取图片
        /// </summary>
        /// <param name="imageHttpUrl"></param>
        /// <returns></returns>
        public static byte[] GetRemoteImage(string imageHttpUrl, out string error)
        {
            byte[] imgData = null;
            error = "";
            var request = HttpWebRequest.Create(imageHttpUrl) as HttpWebRequest;
            using (var response = request.GetResponse() as HttpWebResponse)
            {
                if (response.StatusCode != HttpStatusCode.OK)
                {
                    error = "Url returns " + response.StatusCode + ", " + response.StatusDescription;
                }
                if (response.ContentType.IndexOf("image") == -1)
                {
                    error = "Url is not an image";
                }

                try
                {
                    var stream = response.GetResponseStream();
                    var reader = new BinaryReader(stream);
                    byte[] bytes;
                    using (var ms = new MemoryStream())
                    {
                        byte[] buffer = new byte[4096];
                        int count;
                        while ((count = reader.Read(buffer, 0, buffer.Length)) != 0)
                        {
                            ms.Write(buffer, 0, count);
                        }
                        bytes = ms.ToArray();
                    }
                    imgData = bytes;
                }
                catch (Exception e)
                {
                    error = "抓取错误：" + e.Message;
                }
            }
            return imgData;
        }
    }
}