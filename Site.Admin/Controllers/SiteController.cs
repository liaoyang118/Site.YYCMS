using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Common;
using Site.Service.SiteService;
using Site.Admin.Common;
using Site.Service.SiteService.SiteServices;
using Site.Service.SiteService.Search;
using Site.Admin.Filter;
using System.Text.RegularExpressions;
using Site.Service.UploadService;

namespace Site.Admin.Controllers
{
    [Authorizase]
    public class SiteController : Controller
    {
        #region 站点分类

        [ValidatePermission]
        public ActionResult SiteCateList()
        {
            return View();
        }

        public ActionResult SiteCateListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string c_name = Request["c_name"] ?? string.Empty;

            int rowCount;
            //查询所有的分类
            Site_CatesSearchInfo search = new Site_CatesSearchInfo()
            {
                c_name = c_name
            };
            List<Site_Cates> list = SiteServiceClass.Site_Cates_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult CatesEditView()
        {
            string c_gid = Request["c_gid"] ?? string.Empty;
            string tableId = Request["tableId"] ?? string.Empty;

            Site_Cates info = null;
            if (string.IsNullOrEmpty(c_gid))
            {
                info = new Site_Cates();
            }
            else
            {
                info = SiteServiceClass.Site_Cates_SelectByc_gid(c_gid);
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewData["tableId"] = tableId;
            return View();
        }

        [ValidatePermission]
        public ActionResult CatesEdit()
        {
            string c_name = Request["c_name"] ?? string.Empty;
            string catesType = Request["catesType"] ?? string.Empty;
            string c_gid = Request["c_gid"] ?? string.Empty;
            string c_path = Request["c_path"] ?? string.Empty;

            string tableId = Request["tableId"] ?? string.Empty;

            Site_Cates info = null;
            if (string.IsNullOrEmpty(c_gid))
            {
                info = new Site_Cates();
                //新增
                string guid = Guid.NewGuid().ToString().Substring(0, 8);
                info.c_gid = guid;
                info.c_isMainCate = c_path.Length == 2 ? true : false;
                info.c_createTime = DateTime.Now;
                info.c_createUser = SiteHelp.CurrentUserName;
                if (!string.IsNullOrEmpty(tableId))
                {
                    info.c_tableId = tableId.ToInt32();
                }
            }
            else
            {
                info = SiteServiceClass.Site_Cates_SelectByc_gid(c_gid);
            }

            info.c_name = c_name;
            info.c_path = c_path;
            info.c_type = catesType;

            if (string.IsNullOrEmpty(c_gid))
            {
                int result = SiteServiceClass.Site_Cates_Insert(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "新增成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "新增失败" } });
                }
            }
            else
            {
                int result = SiteServiceClass.Site_Cates_UpdateByc_gid(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "修改成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "修改失败" } });
                }
            }
        }

        [ValidatePermission]
        public ActionResult CatesDelete()
        {
            string c_gid = Request["c_gid"] ?? string.Empty;

            int result = SiteServiceClass.Site_Cates_DeleteByc_gid(c_gid);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        #endregion

        #region 站点页面

        [ValidatePermission]
        public ActionResult SiteCMSPageList()
        {
            int siteName = Request["siteName"].ToInt32(0);

            ViewBag.siteName = siteName;
            //站点基路径
            ViewBag.sitePath = Enum.GetName(typeof(Site.Common.SiteEnum.SiteName), siteName);

            return View();
        }

        public ActionResult SiteCMSPageListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string p_name = Request["p_name"] ?? string.Empty;
            string p_pageDuty = Request["p_pageDuty"] ?? string.Empty;
            int? siteName = Request["siteName"].ToInt32(0) == 0 ? (int?)null : Request["siteName"].ToInt32();

            int rowCount;
            //查询
            Site_CMSPagesSearchInfo search = new Site_CMSPagesSearchInfo()
            {
                p_name = p_name,
                p_pageDuty = p_pageDuty,
                p_siteName = siteName
            };
            List<Site_CMSPage> list = SiteServiceClass.Site_CMSPage_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;
            ViewData["siteName"] = siteName;

            return PartialView();
        }

        public ActionResult SiteCMSPageEditView()
        {
            string p_gid = Request["p_gid"] ?? string.Empty;
            int siteName = Request["siteName"].ToInt32(0);

            Site_CMSPage info = null;
            if (string.IsNullOrEmpty(p_gid))
            {
                info = new Site_CMSPage();
            }
            else
            {
                info = SiteServiceClass.Site_CMSPage_SelectByp_gid(p_gid);
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewBag.siteName = siteName;

            return View();
        }

        [ValidatePermission]
        public ActionResult SiteCMSPageEdit()
        {
            string p_name = Request["p_name"] ?? string.Empty;
            string p_path = Request["p_path"] ?? string.Empty;
            string p_tempPath = Request["p_tempPath"] ?? string.Empty;
            string p_filePath = Request["p_filePath"] ?? string.Empty;
            string p_pageDuty = Request["p_pageDuty"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;
            int siteName = Request["siteName"].ToInt32(0);

            Site_CMSPage info = null;
            if (string.IsNullOrEmpty(p_gid))
            {
                info = new Site_CMSPage();
                //新增
                info.p_gid = Entity.GenerateGUID();
                info.p_createTime = DateTime.Now;
                info.p_createUser = SiteHelp.CurrentUserName;
                info.p_siteName = siteName;
            }
            else
            {
                info = SiteServiceClass.Site_CMSPage_SelectByp_gid(p_gid);
            }

            info.p_filePath = p_filePath;
            info.p_name = p_name;
            info.p_pageDuty = p_pageDuty;
            info.p_path = p_path;
            info.p_tempPath = p_tempPath;


            if (string.IsNullOrEmpty(p_gid))
            {
                int result = SiteServiceClass.Site_CMSPage_Insert(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "新增成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "新增失败" } });
                }
            }
            else
            {
                int result = SiteServiceClass.Site_CMSPage_UpdateByp_gid(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "修改成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "修改失败" } });
                }
            }
        }

        [ValidatePermission]
        public ActionResult SiteCMSPageDelete()
        {
            string p_gid = Request["g_gid"] ?? string.Empty;

            int result = SiteServiceClass.Site_CMSPage_DeleteByp_gid(p_gid);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        public ActionResult SiteCMSPageTempView()
        {
            string p_tempPath = Request["p_tempPath"] ?? string.Empty;

            string content = string.Empty;
            if (!string.IsNullOrEmpty(p_tempPath))
            {
                string path = Server.MapPath(p_tempPath);
                using (System.IO.StreamReader sr = new System.IO.StreamReader(path, System.Text.Encoding.Default))
                {
                    content = sr.ReadToEnd();
                }
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewBag.content = content;
            ViewBag.p_tempPath = p_tempPath;
            return View();
        }

        [ValidateInput(false), ValidatePermission]
        public ActionResult SiteCMSPageTempEdit()
        {
            string p_tempPath = Request["p_tempPath"] ?? string.Empty;
            string content = Request["content"] ?? string.Empty;
            try
            {
                string path = Server.MapPath(p_tempPath);
                using (System.IO.StreamWriter sr = new System.IO.StreamWriter(path, false, System.Text.Encoding.Default))
                {
                    sr.Write(content);
                }
                return Json(new { success = true, errors = new { text = "保存成功" } });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, errors = new { text = "保存失败" } });
            }

        }



        #endregion

        #region 页面区块

        public ActionResult SiteCMSBlockList()
        {
            string p_gid = Request["p_gid"] ?? string.Empty;
            int siteName = Request["siteName"].ToInt32(0);

            ViewBag.p_gid = p_gid;
            ViewBag.siteName = siteName;
            ViewBag.sitePath = Enum.GetName(typeof(Site.Common.SiteEnum.SiteName), siteName);

            return View();
        }

        public ActionResult SiteCMSBlockListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);

            int siteName = Request["siteName"].ToInt32(0);
            string p_gid = Request["p_gid"] ?? string.Empty;
            string b_name = Request["b_name"] ?? string.Empty;

            int rowCount;
            Site_CMSBlocksSearchInfo search = new Site_CMSBlocksSearchInfo()
            {
                b_p_gid = p_gid,
                b_name = b_name
            };
            List<Site_CMSBlock> list = SiteServiceClass.Site_CMSBlock_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;
            ViewBag.siteName = siteName;
            ViewBag.p_gid = p_gid;


            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult SiteCMSBlockEditView()
        {
            string p_gid = Request["p_gid"] ?? string.Empty;
            string b_gid = Request["b_gid"] ?? string.Empty;
            int siteName = Request["siteName"].ToInt32(0);

            Site_CMSBlock info = null;
            if (string.IsNullOrEmpty(b_gid))
            {
                info = new Site_CMSBlock();
            }
            else
            {
                info = SiteServiceClass.Site_CMSBlock_SelectByb_gid(b_gid);
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewBag.siteName = siteName;
            ViewBag.p_gid = p_gid;

            return View();
        }

        [ValidatePermission]
        public ActionResult SiteCMSBlockEdit()
        {
            string b_name = Request["b_name"] ?? string.Empty;
            string b_path = Request["b_path"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;
            string b_gid = Request["b_gid"] ?? string.Empty;
            string b_img_size = Request["b_img_size"] ?? string.Empty;
            int siteName = Request["siteName"].ToInt32(0);

            Site_CMSBlock info = null;
            if (string.IsNullOrEmpty(b_gid))
            {
                info = new Site_CMSBlock();
                //新增
                info.b_gid = Entity.GenerateGUID();
                info.b_createTime = DateTime.Now;
                info.b_createUser = SiteHelp.CurrentUserName;
                info.b_p_gid = p_gid;
            }
            else
            {
                info = SiteServiceClass.Site_CMSBlock_SelectByb_gid(b_gid);
            }

            info.b_name = b_name;
            info.b_path = b_path;
            info.b_img_size = b_img_size;


            if (string.IsNullOrEmpty(b_gid))
            {
                int result = SiteServiceClass.Site_CMSBlock_Insert(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "新增成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "新增失败" } });
                }
            }
            else
            {
                int result = SiteServiceClass.Site_CMSBlock_UpdateByb_gid(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "修改成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "修改失败" } });
                }
            }
        }

        [ValidatePermission]
        public ActionResult SiteCMSBlockDelete()
        {
            string b_gid = Request["b_gid"] ?? string.Empty;

            int result = SiteServiceClass.Site_CMSBlock_DeleteByb_gid(b_gid);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        #endregion

        #region 信息项

        public ActionResult SiteCMSItemListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);

            string b_gid = Request["b_gid"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;

            int rowCount;
            Site_CMSItemSearchInfo search = new Site_CMSItemSearchInfo()
            {
                i_b_gid = b_gid,
                i_p_gid = p_gid
            };
            List<Site_CMSItem> list = SiteServiceClass.Site_CMSItem_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;
            ViewBag.b_gid = b_gid;
            ViewBag.p_gid = p_gid;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult SiteCMSItemEditView()
        {
            string i_gid = Request["i_gid"] ?? string.Empty;
            string b_gid = Request["b_gid"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;

            Site_CMSItem info = null;
            if (string.IsNullOrEmpty(i_gid))
            {
                info = new Site_CMSItem();
            }
            else
            {
                info = SiteServiceClass.Site_CMSItem_SelectByi_gid(i_gid);
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewBag.b_gid = b_gid;
            ViewBag.p_gid = p_gid;

            return View();
        }

        [ValidatePermission]
        public ActionResult SiteCMSItemEdit()
        {
            string i_title = Request["i_title"] ?? string.Empty;
            string i_subTitle = Request["i_subTitle"] ?? string.Empty;
            string i_content = Request["i_content"] ?? string.Empty;
            string i_sort = Request["i_sort"] ?? string.Empty;
            string i_gid = Request["i_gid"] ?? string.Empty;
            string b_gid = Request["b_gid"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;



            Site_CMSItem info = null;
            if (string.IsNullOrEmpty(i_gid))
            {
                info = new Site_CMSItem();
                //新增
                info.i_gid = Entity.GenerateGUID();
                info.i_createTime = DateTime.Now;
                info.i_createUser = SiteHelp.CurrentUserName;
                info.i_b_gid = b_gid;
                info.i_p_gid = p_gid;
                info.i_c_gid = string.Empty;
                info.i_c_type = string.Empty;
                info.i_status = (int)SiteEnum.SiteItemStatus.待审核;
                info.i_c_img_src = string.Empty;
            }
            else
            {
                info = SiteServiceClass.Site_CMSItem_SelectByi_gid(i_gid);
            }

            info.i_title = i_title;
            info.i_subTitle = i_subTitle;
            info.i_intro = i_content;

            int sort = 0;
            int.TryParse(i_sort, out sort);
            info.i_sort = sort;

            if (string.IsNullOrEmpty(i_gid))
            {
                int result = SiteServiceClass.Site_CMSItem_Insert(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "新增成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "新增失败" } });
                }
            }
            else
            {
                int result = SiteServiceClass.Site_CMSItem_UpdateByi_gid(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "修改成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "修改失败" } });
                }
            }
        }

        [ValidatePermission]
        public ActionResult SiteCMSItemDelete()
        {
            string i_gid = Request["i_gid"] ?? string.Empty;

            int successCount = 0;
            int failCount = 0;
            int result = 0;
            string[] i_gidArr = i_gid.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < i_gidArr.Length; i++)
            {
                result = SiteServiceClass.Site_CMSItem_DeleteByi_gid(i_gidArr[i]);
                if (result > 0)
                {
                    successCount++;
                }
                else
                {
                    failCount++;
                }
            }

            if (i_gidArr.Length == 1)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = string.Format("删除成功{0}条，失败{1}条", successCount, failCount) } });

            }

        }

        [ValidatePermission]
        public ActionResult SiteCMSItemCheck()
        {
            string i_gid = Request["i_gid"] ?? string.Empty;
            int status = Request["status"].ToInt32(1);

            int successCount = 0;
            int failCount = 0;
            int result = 0;
            Site_CMSItem info = null;
            string[] i_gidArr = i_gid.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < i_gidArr.Length; i++)
            {
                info = SiteServiceClass.Site_CMSItem_SelectByi_gid(i_gidArr[i]);
                info.i_status = status;
                result = SiteServiceClass.Site_CMSItem_UpdateByi_gid(info);
                if (result > 0)
                {
                    successCount++;
                }
                else
                {
                    failCount++;
                }
            }

            if (i_gidArr.Length == 1)
            {
                return Json(new { success = true, errors = new { text = "审核成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = string.Format("审核成功{0}条，失败{1}条", successCount, failCount) } });

            }

        }


        #endregion

        #region 站点内容
        [ValidatePermission]
        public ActionResult SiteContentList()
        {
            return View();
        }

        public ActionResult SiteCatePartialListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);

            int isSub = Request["isSub"].ToString().ToInt32(0);
            string c_path = Request["c_path"] ?? string.Empty;

            int rowCount;
            //查询所有的分类
            Site_CatesSearchInfo search = new Site_CatesSearchInfo();
            List<Site_Cates> list = SiteServiceClass.Site_Cates_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["isSub"] = isSub;
            ViewData["c_path"] = c_path;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;



            return PartialView();
        }


        public ActionResult SiteContentListView(string cateId)
        {
            int page = Request["page"].ToInt32(1);
            int pageSize = Request["pagesize"].ToInt32(15);

            int rowCount;
            //查询该分类下的新闻内容
            Site_ContentSearchInfo search = new Site_ContentSearchInfo();
            search.c_c_gid = cateId;

            List<Site_Content> list = SiteServiceClass.Site_Content_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;
            return PartialView();
        }
        
        public ActionResult ContentEditView()
        {
            string cate_gid = Request["cate_gid"] ?? string.Empty;
            string c_gid = Request["c_gid"] ?? string.Empty;

            Site_Content info = null;
            if (string.IsNullOrEmpty(c_gid))
            {
                info = new Site_Content();
            }
            else
            {
                info = SiteServiceClass.Site_Content_SelectByc_gid(c_gid);
            }
            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewBag.c_gid = c_gid;
            ViewBag.cate_gid = cate_gid;

            return View();
        }


        [ValidateInput(false), ValidatePermission]
        public ActionResult SiteContentEdit()
        {
            string c_title = Request["c_title"] ?? string.Empty;
            string c_keywords = Request["c_keywords"] ?? string.Empty;
            string c_subTitle = Request["c_subTitle"] ?? string.Empty;
            string c_content = Request["c_content"] ?? string.Empty;
            string c_intro = Request["c_intro"] ?? string.Empty;
            string c_gid = Request["c_gid"] ?? string.Empty;
            string c_c_gid = Request["cate_gid"] ?? string.Empty;

            Site_Content info = null;
            if (string.IsNullOrEmpty(c_gid))
            {
                info = new Site_Content();
                //新增
                info.c_gid = Entity.GenerateGUID();
                info.c_createUserName = SiteHelp.CurrentUserName;
                info.c_createUserNickName = SiteHelp.CurrentUserNickName;
                info.c_createUserId = string.Empty;
                info.c_createTime = DateTime.Now;
            }
            else
            {
                info = SiteServiceClass.Site_Content_SelectByc_gid(c_gid);
            }

            info.c_status = (int)SiteEnum.SiteItemStatus.待审核;
            info.c_updateTime = DateTime.Now;
            info.c_sub_title = c_subTitle;
            info.c_title = c_title;
            info.c_keywords = c_keywords;
            info.c_c_gid = c_c_gid;
            info.c_content = c_content;
            info.c_intro = c_intro;
            info.c_img_src = string.Empty;

            //默认第一张图片为封面
            MatchCollection list = Regex.Matches(c_content, @"<img src=""(?<img>[\S]*)""[^/]*/>");
            if (list.Count > 0)
            {
                string img_src = list[0].Groups["img"].Value;
                info.c_img_src = img_src;
            }

            if (string.IsNullOrEmpty(c_gid))
            {
                int result = SiteServiceClass.Site_Content_Insert(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "新增成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "新增失败" } });
                }
            }
            else
            {
                int result = SiteServiceClass.Site_Content_UpdateByc_id(info);
                if (result > 0)
                {
                    return Json(new { success = true, errors = new { text = "修改成功" } });
                }
                else
                {
                    return Json(new { success = false, errors = new { text = "修改失败" } });
                }
            }
        }

        [ValidatePermission]
        public ActionResult SiteContentCheck()
        {
            string c_gid = Request["c_gid"] ?? string.Empty;
            int status = Request["status"].ToInt32(1);

            int successCount = 0;
            int failCount = 0;
            int result = 0;
            Site_Content info = null;
            string[] c_gidArr = c_gid.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_gidArr.Length; i++)
            {
                info = SiteServiceClass.Site_Content_SelectByc_gid(c_gidArr[i]);
                info.c_status = status;
                result = SiteServiceClass.Site_Content_UpdateByc_id(info);
                if (result > 0)
                {
                    successCount++;
                }
                else
                {
                    failCount++;
                }
            }
            if (c_gidArr.Length == 1)
            {
                return Json(new { success = true, errors = new { text = "审核成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = string.Format("审核成功{0}条，失败{1}条", successCount, failCount) } });

            }
        }

        [ValidatePermission]
        public ActionResult SiteContentDelete()
        {
            string c_id = Request["c_id"] ?? string.Empty;

            int result = SiteServiceClass.Site_Content_DeleteByc_id(c_id);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }


        public ActionResult SiteContentRecommendList()
        {
            string c_gid = Request["c_gid"] ?? string.Empty;

            int rowCount;
            Site_CMSPagesSearchInfo search = new Site_CMSPagesSearchInfo();
            List<Site_CMSPage> list = SiteServiceClass.Site_CMSPage_SelectPage(search, 1, 1000, out rowCount);

            ViewBag.list = list;
            ViewBag.c_gid = c_gid;
            return View();
        }

        public ActionResult SiteContentRecommendListView()
        {
            int page = Request["page"].ToInt32(1);
            int pageSize = Request["pagesize"].ToInt32(15);
            string p_gid = Request["p_gid"] ?? string.Empty;

            int rowCount;

            Site_CMSBlocksSearchInfo search = new Site_CMSBlocksSearchInfo();
            search.DefaultOrder = "b_path";
            search.b_p_gid = p_gid;


            List<Site_CMSBlock> list = SiteServiceClass.Site_CMSBlock_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            ViewBag.p_gid = p_gid;
            return PartialView();
        }

        [ValidatePermission]
        public ActionResult SiteContentRecommendEdit()
        {
            //内容ID
            string c_gid = Request["c_gid"] ?? string.Empty;
            //推荐区块ID
            string b_gid = Request["b_gid"] ?? string.Empty;
            //区块页面ID
            string p_gid = Request["p_gid"] ?? string.Empty;

            Site_Content content = null;
            Site_CMSItem item = null;
            int existCount = 0;
            int successCount = 0;
            int failCount = 0;
            int result = 0;

            Site_CMSBlock b_info = SiteServiceClass.Site_CMSBlock_SelectByb_gid(b_gid);
            string[] c_gidArr = c_gid.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_gidArr.Length; i++)
            {
                content = SiteServiceClass.Site_Content_SelectByc_gid(c_gidArr[i]);
                item = SiteServiceClass.Site_CMSItem_SelectByc_gidAndb_gid(c_gidArr[i], b_gid);
                if (item != null)
                {
                    existCount++;
                    continue;
                }

                item = new Site_CMSItem();
                item.i_b_gid = b_gid;
                item.i_intro = content.c_intro;
                item.i_createTime = DateTime.Now;
                item.i_createUser = SiteHelp.CurrentUserName;
                item.i_c_gid = content.c_gid;
                item.i_c_type = string.Empty;
                item.i_gid = Guid.NewGuid().ToString().Substring(0, 8);
                item.i_p_gid = p_gid;
                item.i_status = (int)SiteEnum.SiteItemStatus.待审核;
                item.i_subTitle = content.c_sub_title;
                item.i_title = content.c_sub_title;
                item.i_c_img_src = string.Empty;

                //图片需要根据该区块设置的图片尺寸，缩放该图片,使用原图来进行缩放
                if (!string.IsNullOrEmpty(b_info.b_img_size.Trim()))
                {
                    if (!string.IsNullOrEmpty(content.c_img_src))
                    {
                        int index = content.c_img_src.LastIndexOf('_');
                        string sourceSrc = content.c_img_src.Substring(0, index) + ".jpg";

                        string error;
                        byte[] imgData = SiteUntility.GetRemoteImage(sourceSrc, out error);
                        if (imgData != null)
                        {
                            List<string> srcResult = UploadServiceClass.UploadImg(
                                  imgData,
                                  SiteEnum.SiteUploadConfigName.baseUpload.ToString(),
                                  new List<string>() { b_info.b_img_size },
                                  ".jpg", "s"
                                  );
                            item.i_c_img_src = srcResult[1];
                        }
                    }
                }

                result = SiteServiceClass.Site_CMSItem_Insert(item);
                if (result > 0)
                {
                    successCount++;
                }
                else
                {
                    failCount++;
                }

            }

            if (c_gidArr.Length == 1)
            {
                return Json(new { success = true, errors = new { text = "推荐成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = string.Format("推荐成功{0}条，失败{1}条，重复{2}条", successCount, failCount, existCount) } });

            }
        }


        #endregion

    }
}
