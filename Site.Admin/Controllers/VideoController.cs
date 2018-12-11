using Site.Admin.Filter;
using Site.Service.VideosService;
using Site.Service.VideosService.VideosService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Common;
using Site.Service.SiteService.Search;
using Site.Service.SiteService;
using Site.Service.SiteService.SiteServices;
using Site.Admin.Common;
using Site.Service.UploadService;

namespace Site.Admin.Controllers
{
    [Authorizase]
    public class VideoController : Controller
    {
        #region 01 内容管理
        /// <summary>
        /// 视频
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
            VideoCateSearchInfo search = new VideoCateSearchInfo();
            List<VideoCate> list = VideoServiceClass.VideoCate_SelectPage(search, page, pageSize, out rowCount);
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
            VideoSearchInfo search = new VideoSearchInfo();
            search.v_c_id = cateId;
            search.v_titile = f_title;

            List<VideoInfo> list = VideoServiceClass.VideoInfo_SelectPage(search, page, pageSize, out rowCount);
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

            VideoInfo info = null;
            if (string.IsNullOrEmpty(fid))
            {
                info = new VideoInfo();
            }
            else
            {
                info = VideoServiceClass.VideoInfo_SelectById(fid.ToInt32(0));
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

            VideoInfo info = null;
            if (string.IsNullOrEmpty(fid))
            {
                info = new VideoInfo();
                info.v_coverImgSrc = string.Empty;
                info.v_playSrc = string.Empty;
            }
            else
            {
                info = VideoServiceClass.VideoInfo_SelectById(fid.ToInt32());
            }

            info.v_titile = c_title;
            info.v_c_id = c_id.ToInt32();
            info.v_c_name = string.Empty;
            info.v_intro = c_intro;
            info.v_timeLength = string.Empty;

            //TODO:新增时
            if (string.IsNullOrEmpty(fid))
            {
                int result = VideoServiceClass.VideoInfo_Insert(info);
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
                int result = VideoServiceClass.VideoInfo_UpdateById(info);
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
            VideoInfo info = null;
            string[] c_idArr = c_id.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_idArr.Length; i++)
            {
                info = VideoServiceClass.VideoInfo_SelectById(c_idArr[i].ToInt32());
                info.v_status = status;
                result = VideoServiceClass.VideoInfo_UpdateById(info);
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

            int result = VideoServiceClass.VideoInfo_DeleteById(c_id.ToInt32());
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
            search.p_siteName = 3;//查询视频站点页面

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

            VideoInfo fInfo = null;
            Site_CMSItem item = null;
            int existCount = 0;
            int successCount = 0;
            int failCount = 0;
            int result = 0;

            Site_CMSBlock b_info = SiteServiceClass.Site_CMSBlock_SelectByb_gid(b_gid);
            string[] c_idArr = c_id.Split(new string[] { ",", "，" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < c_idArr.Length; i++)
            {
                fInfo = VideoServiceClass.VideoInfo_SelectById(c_idArr[i].ToInt32());
                item = SiteServiceClass.Site_CMSItem_SelectByc_gidAndb_gid(c_idArr[i], b_gid);
                if (item != null)
                {
                    existCount++;
                    continue;
                }

                item = new Site_CMSItem();
                item.i_b_gid = b_gid;
                item.i_intro = fInfo.v_intro;//
                item.i_createTime = DateTime.Now;
                item.i_createUser = SiteHelp.CurrentUserName;
                item.i_c_gid = fInfo.Id.ToString();//唯一Id
                item.i_c_type = fInfo.v_c_id.ToString();//分类ID
                item.i_gid = Guid.NewGuid().ToString().Substring(0, 8);
                item.i_p_gid = p_gid;
                item.i_status = (int)SiteEnum.SiteItemStatus.待审核;
                item.i_subTitle = fInfo.v_timeLength;//时长
                item.i_title = fInfo.v_titile;
                item.i_c_img_src = string.Empty;

                //图片需要根据该区块设置的图片尺寸，缩放该图片,使用原图来进行缩放
                if (!string.IsNullOrEmpty(b_info.b_img_size.Trim()))
                {
                    if (!string.IsNullOrEmpty(fInfo.v_coverImgSrc))
                    {
                        string sourceSrc = fInfo.v_coverImgSrc;

                        string error;
                        byte[] imgData = SiteUntility.GetRemoteImage(sourceSrc, out error);
                        if (imgData != null)
                        {
                            List<string> srcResult = UploadServiceClass.UploadImg(
                                  imgData,
                                  SiteEnum.SiteUploadConfigName.baseUpload.ToString(),
                                  new List<string>() { b_info.b_img_size },
                                  ".jpg", "s", SiteEnum.SiteService.VideoUploadService
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
        #endregion

        #region 02 邮件日志

        [ValidatePermission]
        public ActionResult SendMailLog()
        {
            return View();
        }

        public ActionResult SendMailLogListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            string email = Request["Email"] ?? string.Empty;
            string title = Request["title"] ?? string.Empty;

            int rowCount;
            SendMailLogSearchInfo search = new SendMailLogSearchInfo();
            search.Email = email;

            List<SendMailLog> list = VideoServiceClass.SendMailLog_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult SendMailLogDelete(int id)
        {
            int result = VideoServiceClass.SendMailLog_DeleteById(id);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        public ActionResult ReSendMail(int id)
        {
            SendMailLog sInfo = VideoServiceClass.SendMailLog_SelectById(id);

            SentMail.SentMail sm = new SentMail.SentMail();
            sm.Init("591community@gmail.com", "账号激活", sInfo.Email, sInfo.SendContent, true);
            string error;
            sm.SentNetMail(out error);

            sInfo.Remark = error;
            sInfo.SendTime = DateTime.Now;

            int result = VideoServiceClass.SendMailLog_UpdateById(sInfo);

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

        #region 03 套餐管理

        [ValidatePermission]
        public ActionResult ComboInfoList()
        {
            return View();
        }

        public ActionResult ComboInfoListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string title = Request["title"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            ComboInfoSearchInfo search = new ComboInfoSearchInfo()
            {
                Title = title
            };
            List<ComboInfo> list = VideoServiceClass.ComboInfo_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult ComboInfoEditView()
        {
            string c_id = Request["c_id"] ?? string.Empty;
            string window = Request["window"] ?? string.Empty;

            ComboInfo info = null;
            if (string.IsNullOrEmpty(c_id))
            {
                info = new ComboInfo();
            }
            else
            {
                info = VideoServiceClass.ComboInfo_SelectByc_id(c_id);
            }

            ViewData["window"] = window;
            ViewData["info"] = info;
            return View();
        }

        public ActionResult ComboInfoEdit()
        {
            string c_id = Request["c_id"] ?? string.Empty;
            string c_title = Request["c_title"] ?? string.Empty;
            string c_intro = Request["c_intro"] ?? string.Empty;
            int c_num = Request["c_num"].ToInt32(0);
            int c_days = Request["c_days"].ToInt32(0);
            int c_status = Request["c_status"].ToInt32(0);

            ComboInfo info = null;
            if (string.IsNullOrEmpty(c_id))
            {
                info = new ComboInfo();
                //新增
                string guid = Guid.NewGuid().ToString().Replace("-", "");
                info.c_id = guid;
            }
            else
            {
                info = VideoServiceClass.ComboInfo_SelectByc_id(c_id);
            }

            info.c_title = c_title;
            info.c_intro = c_intro;
            info.c_num = c_num;
            info.c_days = c_days;
            info.c_status = (int)SiteEnum.BasicStatus.有效;


            if (string.IsNullOrEmpty(c_id))
            {
                int result = VideoServiceClass.ComboInfo_Insert(info);
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
                int result = VideoServiceClass.ComboInfo_UpdateById(info);
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

        public ActionResult ComboInfoDelete()
        {
            int id = Request["Id"].ToInt32(0);
            int result = VideoServiceClass.ComboInfo_DeleteById(id);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = true, errors = new { text = "删除失败" } });
            }
        }

        #endregion

        #region 04 访问日志

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
            UserVisitsInfoSearchInfo search = new UserVisitsInfoSearchInfo();
            search.v_ip = ip;

            List<UserVisitsInfo> list = VideoServiceClass.UserVisitsInfo_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }


        public ActionResult VisitsLogDelete(int id)
        {
            int result = VideoServiceClass.UserVisitsInfo_DeleteById(id);
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

    }
}