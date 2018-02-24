using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Admin.Common;
using Site.Admin.Filter;
using Site.Common;
using Site.Service.SiteService;
using Site.Service.SiteService.Search;
using Site.Service.SiteService.SiteServices;
using Site.Service.UploadService;
using Site.Service.YuYangService;
using Site.Service.YuYangService.Search;
using Site.Service.YuYangService.YuYangServices;

namespace Site.Admin.Controllers
{
    [Authorizase]
    public class FictionController : Controller
    {
        /// <summary>
        /// 小说
        /// </summary>
        /// <returns></returns>
        [ValidatePermission]
        public ActionResult SiteContentList()
        {
            return View();
        }

        public ActionResult ContentCatePartialListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);

            int rowCount;
            //查询所有的分类
            ContentCateSearchInfo search = new ContentCateSearchInfo();
            List<ContentCate> list = YuYangServiceClass.ContentCate_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            return PartialView();
        }

        public ActionResult SiteContentListView(string cateId)
        {
            int page = Request["page"].ToInt32(1);
            int pageSize = Request["pagesize"].ToInt32(15);
            string f_title = Request["f_title"] ?? string.Empty;

            int rowCount;
            //查询该分类下的小说内容
            FictionSearchInfo search = new FictionSearchInfo();
            search.C_C_ID = cateId;
            search.Title = f_title;

            List<Fiction> list = YuYangServiceClass.Fiction_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;
            return PartialView();
        }

        public ActionResult ContentEditView()
        {
            string c_id = Request["c_id"] ?? string.Empty;
            string fid = Request["fid"] ?? string.Empty;

            Fiction info = null;
            if (string.IsNullOrEmpty(fid))
            {
                info = new Fiction();
            }
            else
            {
                info = YuYangServiceClass.Fiction_SelectById(fid.ToInt32(0));
            }
            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            ViewBag.c_id = c_id;
            ViewBag.fid = fid;

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
            string fid = Request["fid"] ?? string.Empty;
            string c_id = Request["c_id"] ?? string.Empty;//分类Id

            Fiction info = null;
            if (string.IsNullOrEmpty(fid))
            {
                info = new Fiction();
                info.CoverImage = string.Empty;
            }
            else
            {
                info = YuYangServiceClass.Fiction_SelectById(fid.ToInt32());
            }

            //info.c_status = (int)SiteEnum.SiteItemStatus.待审核;
            info.LastUpdateTime = DateTime.Now;
            info.Title = c_title;
            info.C_C_ID = c_id.ToInt32();
            info.Author = c_subTitle;
            info.Intro = c_intro;
            info.LastUpdateChapter = string.Empty;

            //TODO:新增时 小说封面设置



            if (string.IsNullOrEmpty(fid))
            {
                int result = YuYangServiceClass.Fiction_Insert(info);
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
                int result = YuYangServiceClass.Fiction_UpdateById(info);
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
            string c_id = Request["c_id"] ?? string.Empty;
            int status = Request["status"].ToInt32(1);

            int successCount = 0;
            int failCount = 0;
            int result = 0;
            Fiction info = null;
            string[] c_idArr = c_id.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_idArr.Length; i++)
            {
                info = YuYangServiceClass.Fiction_SelectById(c_idArr[i].ToInt32());
                //info.c_status = status;
                result = YuYangServiceClass.Fiction_UpdateById(info);
                if (result > 0)
                {
                    successCount++;
                }
                else
                {
                    failCount++;
                }
            }
            if (c_idArr.Length == 1)
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

            int result = YuYangServiceClass.Fiction_DeleteById(c_id.ToInt32());
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
            string c_id = Request["c_id"] ?? string.Empty;

            int rowCount;
            Site_CMSPagesSearchInfo search = new Site_CMSPagesSearchInfo();
            //search.p_siteName = 2;//查询小说页面

            List<Site_CMSPage> list = SiteServiceClass.Site_CMSPage_SelectPage(search, 1, 1000, out rowCount);

            ViewBag.list = list;
            ViewBag.c_id = c_id;
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
            string c_id = Request["c_id"] ?? string.Empty;
            //推荐区块ID
            string b_gid = Request["b_gid"] ?? string.Empty;
            //区块页面ID
            string p_gid = Request["p_gid"] ?? string.Empty;

            Fiction fInfo = null;
            Site_CMSItem item = null;
            int existCount = 0;
            int successCount = 0;
            int failCount = 0;
            int result = 0;

            Site_CMSBlock b_info = SiteServiceClass.Site_CMSBlock_SelectByb_gid(b_gid);
            string[] c_idArr = c_id.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_idArr.Length; i++)
            {
                fInfo = YuYangServiceClass.Fiction_SelectById(c_idArr[i].ToInt32());
                item = SiteServiceClass.Site_CMSItem_SelectByc_gidAndb_gid(c_idArr[i], b_gid);
                if (item != null)
                {
                    existCount++;
                    continue;
                }

                item = new Site_CMSItem();
                item.i_b_gid = b_gid;
                item.i_intro = fInfo.Intro;//
                item.i_createTime = DateTime.Now;
                item.i_createUser = SiteHelp.CurrentUserName;
                item.i_c_gid = fInfo.Id.ToString();//此处存放小说的唯一Id
                item.i_c_type = string.Empty;
                item.i_gid = Guid.NewGuid().ToString().Substring(0, 8);
                item.i_p_gid = p_gid;
                item.i_status = (int)SiteEnum.SiteItemStatus.待审核;
                item.i_subTitle = fInfo.Author;//作者
                item.i_title = fInfo.Title;
                item.i_c_img_src = string.Empty;

                //图片需要根据该区块设置的图片尺寸，缩放该图片,使用原图来进行缩放
                if (!string.IsNullOrEmpty(b_info.b_img_size.Trim()))
                {
                    if (!string.IsNullOrEmpty(fInfo.CoverImage))
                    {
                        int index = fInfo.CoverImage.LastIndexOf('_');
                        string sourceSrc = fInfo.CoverImage.Substring(0, index) + ".jpg";

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

            if (c_idArr.Length == 1)
            {
                return Json(new { success = true, errors = new { text = "推荐成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = string.Format("推荐成功{0}条，失败{1}条，重复{2}条", successCount, failCount, existCount) } });

            }
        }

        [ValidatePermission]
        public ActionResult VisitsLog()
        {
            return View();
        }


        public ActionResult VisitsLogListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            string ip = Request["ip"] ?? string.Empty;

            int rowCount;
            ChapterVisitsSearchInfo search = new ChapterVisitsSearchInfo();
            search.IP = ip;

            List<ChapterVisits> list = YuYangServiceClass.ChapterVisits_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }


        public ActionResult VisitsLogDelete(int id)
        {
            int result = YuYangServiceClass.ChapterVisits_DeleteById(id);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }
    }
}