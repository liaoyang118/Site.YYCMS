using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Site.Admin.Filter;
using Site.Admin.Common;
using SiteFrame.BLL;
using SiteFrame.Model;
using SiteFrame.BLL.Search;
using Site.Common;


namespace Site.Admin.Controllers
{
    [Authorizase, Exception]
    public class SystemController : Controller
    {

        #region 模块管理
        public ActionResult ModuleList()
        {
            SystemGroupSearchInfo groupSearch = new SystemGroupSearchInfo();
            int rowcount;
            //查询所有模块组下的，所有的模块信息
            List<SystemGroup> groupList = SystemSeviceClass.SystemGroup_SelectPage(groupSearch, 1, 100, out rowcount);

            //查询所有模块信息
            SystemModuleSearchInfo search = new SystemModuleSearchInfo();
            List<SystemModual> moduleList = SystemSeviceClass.SystemModual_SelectPage(search, 1, 1000, out rowcount);

            ViewData["groupList"] = groupList;
            ViewData["moduleList"] = moduleList;

            return View();
        }

        public ActionResult ModuleListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            int? m_parent = Request["m_parent"].ToInt32(0) == 0 ? (int?)null : Request["m_parent"].ToInt32();
            string m_g_gid = Request["m_g_gid"] ?? string.Empty;
            string m_name = Request["m_name"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            SystemModuleSearchInfo search = new SystemModuleSearchInfo()
            {
                m_g_gid = m_g_gid,
                m_parent = m_parent,
                m_name = m_name
            };
            List<SystemModual> list = SystemSeviceClass.SystemModual_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;


            return PartialView();
        }

        #region 获取模块组下的用户模块 + MenuList()
        /// <summary>
        /// 获取模块组下的用户模块
        /// </summary>
        /// <returns></returns>
        public ActionResult MenuList()
        {
            //模块组gid
            string g_gid = Request["g_gid"] ?? string.Empty;
            //用户gid
            string u_gid = (CommonContext.Session[Entity.UserSessionKey] as User).u_gid;

            List<SystemModual> list = SystemSeviceClass.SystemModual_SelectByu_gid(u_gid, g_gid);
            ViewData["list"] = list;

            return PartialView();
        }
        #endregion

        public ActionResult ModuleEditView()
        {
            string m_gid = Request["m_gid"] ?? string.Empty;
            string window = Request["window"] ?? string.Empty;
            SystemModual info = null;
            if (string.IsNullOrEmpty(m_gid))
            {
                info = new SystemModual();
            }
            else
            {
                info = SystemSeviceClass.SystemModual_SelectBym_gid(m_gid);
            }
            SystemGroupSearchInfo groupSearch = new SystemGroupSearchInfo();
            int rowCount;
            List<SystemGroup> gList = SystemSeviceClass.SystemGroup_SelectPage(groupSearch, 1, 100, out rowCount);

            ViewData["window"] = window;
            ViewData["gList"] = gList;
            ViewData["info"] = info;
            return View();
        }

        [ValidatePermission]
        public ActionResult ModuleEdit()
        {
            string m_gid = Request["m_gid"] ?? string.Empty;
            string m_name = Request["m_name"] ?? string.Empty;
            string g_gid = Request["moduleGroup"] ?? string.Empty;
            string moduleGrade = Request["moduleGrade"] ?? string.Empty;
            string m_controller = Request["m_controller"] ?? string.Empty;
            string m_action = Request["m_action"] ?? string.Empty;
            string modulePart = Request["modulePart"] ?? string.Empty;
            string m_path = Request["m_path"] ?? string.Empty;


            SystemModual info = null;
            if (string.IsNullOrEmpty(m_gid))
            {
                info = new SystemModual();
                //新增
                string guid = Guid.NewGuid().ToString().Substring(0, 8);
                info.m_gid = guid;
                info.m_g_gid = g_gid;
                info.m_createTime = DateTime.Now;
                info.m_createUser = SiteHelp.CurrentUserName;
            }
            else
            {
                info = SystemSeviceClass.SystemModual_SelectBym_gid(m_gid);
            }

            if (moduleGrade == "0")//一级元素
            {
                info.m_parent = 0;
                info.m_parent_gid = string.Empty;
            }
            else if (moduleGrade == "1" && !string.IsNullOrEmpty(modulePart))//二级元素
            {
                info.m_parent = modulePart.Split(new[] { "-" }, StringSplitOptions.RemoveEmptyEntries)[0].ToInt32();
                info.m_parent_gid = modulePart.Split(new[] { "-" }, StringSplitOptions.RemoveEmptyEntries)[1];
            }
            info.m_path = m_path;
            info.m_name = m_name;
            info.m_Controller = m_controller;
            info.m_Action = m_action;

            if (string.IsNullOrEmpty(m_gid))
            {
                int result = SystemSeviceClass.SystemModual_Insert(info);
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
                int result = SystemSeviceClass.SystemModual_UpdateBym_gid(info);
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

        //查询对应模块组下的一级元素
        public ActionResult ModuleSearch()
        {
            string g_gid = Request["g_gid"] ?? string.Empty;
            int? m_parent = (Request["m_parent"] ?? string.Empty) == string.Empty ? (int?)null : Request["m_parent"].ToInt32();

            SystemModuleSearchInfo search = new SystemModuleSearchInfo()
            {
                m_g_gid = g_gid,
                m_parent = m_parent
            };
            int rowCount;
            List<SystemModual> list = SystemSeviceClass.SystemModual_SelectPage(search, 1, 100, out rowCount);

            return Json(list, "text/html", JsonRequestBehavior.AllowGet);
        }

        public ActionResult ModuleDelete()
        {
            string m_gid = Request["m_gid"] ?? string.Empty;
            int result = SystemSeviceClass.SystemModual_DeleteBym_gid(m_gid);
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

        #region 模块组管理

        public ActionResult GroupList()
        {
            return View();
        }

        public ActionResult GoupListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string g_name = Request["g_name"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            SystemGroupSearchInfo search = new SystemGroupSearchInfo()
            {
                g_name = g_name
            };
            List<SystemGroup> list = SystemSeviceClass.SystemGroup_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult SystemGroupDelete()
        {
            string g_gid = Request["g_gid"] ?? string.Empty;
            int result = SystemSeviceClass.SystemGroup_DeleteByg_gid(g_gid);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        public ActionResult GroupEditView()
        {
            string g_gid = Request["g_gid"] ?? string.Empty;
            SystemGroup info = null;
            if (string.IsNullOrEmpty(g_gid))
            {
                info = new SystemGroup();
            }
            else
            {
                info = SystemSeviceClass.SystemGroup_SelectByg_gid(g_gid);
            }

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["info"] = info;
            return View();
        }

        public ActionResult SystemGroupEdit()
        {
            string g_gid = Request["g_gid"] ?? string.Empty;
            string g_name = Request["g_name"] ?? string.Empty;
            string g_picCover = Request["g_picCover"] ?? string.Empty;
            int m_sort = Request["g_sort"].ToInt32(0);

            HttpPostedFileBase fb = Request.Files["coverFile"];

            SystemGroup info = null;
            if (string.IsNullOrEmpty(g_gid))
            {
                info = new SystemGroup();
                //新增
                info.g_gid = Entity.GenerateGUID();
                info.g_createTime = DateTime.Now;
                info.g_createUser = SiteHelp.CurrentUserName;
            }
            else
            {
                info = SystemSeviceClass.SystemGroup_SelectByg_gid(g_gid);
            }
            info.g_name = g_name;
            info.g_sort = m_sort;

            if (fb != null && fb.ContentLength > 0)
            {
                string fileName = "/ImageIcon/" + fb.FileName;
                fb.SaveAs(Server.MapPath("~" + fileName));
                info.g_picCover = fileName;
            }
            else
            {
                info.g_picCover = g_picCover;
            }

            if (string.IsNullOrEmpty(g_gid))
            {
                int result = SystemSeviceClass.SystemGroup_Insert(info);
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
                int result = SystemSeviceClass.SystemGroup_UpdateByg_gid(info);
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


        #endregion

        #region 用户管理

        public ActionResult UserList()
        {
            return View();
        }
        public ActionResult UserListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string u_name = Request["u_name"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            SystemUserSearchInfo search = new SystemUserSearchInfo()
            {
                u_username = u_name
            };
            List<User> list = SystemSeviceClass.User_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;


            return PartialView();
        }

        public ActionResult UserEditView()
        {
            string gid = Request["gid"] ?? string.Empty;
            string window = Request["window"] ?? string.Empty;

            SiteFrame.Model.User info = null;
            if (!string.IsNullOrEmpty(gid))
            {
                info = SystemSeviceClass.User_SelectByu_gid(gid);
            }
            else
            {
                info = new User();
            }
            ViewBag.uInfo = info;
            ViewData["window"] = window;

            return View();
        }

        public ActionResult UserEdit()
        {
            string u_gid = Request["u_gid"] ?? string.Empty;
            string u_username = Request["u_username"] ?? string.Empty;
            string u_nickName = Request["u_nickName"] ?? string.Empty;
            string u_password = Request["u_password"] ?? string.Empty;
            int u_status = Request["u_status"].ToInt32(0);

            SiteFrame.Model.User info = null;
            if (string.IsNullOrEmpty(u_gid))
            {
                info = SystemSeviceClass.User_SelectByu_name(u_username);
                if (info != null)
                {
                    return Json(new { success = false, errors = new { text = "已经存在相同用户名" } });
                }

                info = new SiteFrame.Model.User();
                info.u_gid = Guid.NewGuid().ToString().Substring(0, 8);
                info.u_createUser = SiteHelp.CurrentUserName;
                info.u_password = Entity.Str2Md5(u_password);
                info.u_status = u_status;
                info.u_username = u_username;
                info.u_nickName = u_nickName;
                info.u_createTime = DateTime.Now;

                int result = SystemSeviceClass.User_Insert(info);
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
                info = SystemSeviceClass.User_SelectByu_gid(u_gid);
                info.u_status = u_status;
                info.u_username = u_username;
                info.u_nickName = u_nickName;

                int result = SystemSeviceClass.User_UpdateByu_gid(info);
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

        public ActionResult UserDelete(string u_gid)
        {
            int result = SystemSeviceClass.User_DeleteByu_gid(u_gid);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "删除成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "删除失败" } });
            }
        }

        public ActionResult UserRoleList(string u_gid)
        {
            int rowCount;
            //查询所有的角色
            SystemRoleSearchInfo search = new SystemRoleSearchInfo();
            List<Role> roleList = SystemSeviceClass.Role_SelectPage(search, 1, 100, out rowCount);
            ViewData["roleList"] = roleList;

            //查询用户拥有的所有角色
            List<User_Role_Mapping> urList = SystemSeviceClass.User_Role_Mapping_SelectByu_gid(u_gid);
            Dictionary<Role, bool> rbDic = new Dictionary<Role, bool>();
            foreach (Role item in roleList)
            {
                if (urList.Where(ur => ur.r_gid == item.r_gid).Count() > 0)
                {
                    rbDic.Add(item, true);
                }
                else
                {
                    rbDic.Add(item, false);
                }
            }
            ViewBag.rbDic = rbDic;
            ViewBag.u_gid = u_gid;

            return View();
        }

        //用户角色设置
        public ActionResult UserRoleOperation()
        {
            string ugid = Request["ugid"] ?? string.Empty;
            string rgid = Request["rgid"] ?? string.Empty;
            int oType = Request["oType"].ToInt32(-1); //1：新增;0：删除

            int result = 0;
            if (oType == 1)
            {
                User_Role_Mapping obj = new User_Role_Mapping();
                obj.u_gid = ugid;
                obj.r_gid = rgid;
                obj.u_r_CreateTime = DateTime.Now;
                obj.u_r_CreateUser = SiteHelp.CurrentUserName;
                obj.u_r_gid = Entity.GenerateGUID();

                result = SystemSeviceClass.User_Role_Mapping_Insert(obj);
            }
            else if (oType == 0)
            {
                result = SystemSeviceClass.User_Role_Mapping_DeleteByr_gidAndu_gid(rgid, ugid);
            }

            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "操作成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "操作失败" } });
            }
        }

        public ActionResult UserEditPwdView(string u_gid)
        {
            ViewBag.u_gid = u_gid;

            ViewData["window"] = Request["window"] ?? string.Empty;
            return View();
        }

        //重置密码
        public ActionResult UserEditPwd(string u_gid, string u_password)
        {
            SiteFrame.Model.User info = SystemSeviceClass.User_SelectByu_gid(u_gid);
            info.u_password = Entity.Str2Md5(u_password);

            int result = SystemSeviceClass.User_UpdateByu_gid(info);
            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "重置密码成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "重置密码失败" } });
            }
        }

        #endregion

        #region 权限管理

        public ActionResult PermissionListView()
        {
            string m_gid = Request["m_gid"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            SystemPermissionSearchInfo search = new SystemPermissionSearchInfo()
            {
                p_m_gid = m_gid
            };
            List<ModulePermission> list = SystemSeviceClass.ModulePermission_SelectPage(search, 1, 100, out rowCount);

            ViewData["window"] = Request["window"] ?? string.Empty;
            ViewData["list"] = list;
            ViewData["m_gid"] = m_gid;

            return View();
        }

        public ActionResult PermissionEdit()
        {
            string p_name = Request["p_name"] ?? string.Empty;
            string p_path = Request["p_path"] ?? string.Empty;
            string m_gid = Request["m_gid"] ?? string.Empty;
            string p_gid = Request["p_gid"] ?? string.Empty;

            ModulePermission info = null;
            if (string.IsNullOrEmpty(p_gid))
            {
                info = new ModulePermission();
                //新增
                string guid = Guid.NewGuid().ToString().Substring(0, 8);
                info.p_gid = guid;
                info.p_createTime = DateTime.Now;
                info.p_createUser = SiteHelp.CurrentUserName;
            }
            else
            {
                info = SystemSeviceClass.ModulePermission_SelectByp_gid(p_gid);
            }
            info.p_name = p_name;
            info.p_path = p_path;
            info.p_m_gid = m_gid;



            if (string.IsNullOrEmpty(p_gid))
            {
                int result = SystemSeviceClass.ModulePermission_Insert(info);
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
                int result = SystemSeviceClass.ModulePermission_UpdateByp_gid(info);
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

        public ActionResult PermissionDelete()
        {
            string p_gid = Request["p_gid"] ?? string.Empty;
            int result = SystemSeviceClass.ModulePermission_DeleteByp_gid(p_gid);
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

        #region 权限分配

        public ActionResult PermissionAssignList()
        {
            return View();
        }

        public ActionResult PermissionAssignListView()
        {
            int rowCount;
            //查询所有的角色
            SystemRoleSearchInfo search = new SystemRoleSearchInfo();
            List<Role> roleList = SystemSeviceClass.Role_SelectPage(search, 1, 100, out rowCount);
            ViewData["roleList"] = roleList;

            return PartialView();
        }

        public ActionResult PerModuleListView()
        {
            int rowCount;
            //查询所有的模块
            string ruid = Request["ruid"] ?? string.Empty;
            SystemModuleSearchInfo search = new SystemModuleSearchInfo();
            List<SystemModual> moduleList = SystemSeviceClass.SystemModual_SelectPage(search, 1, 100, out rowCount);
            ViewData["moduleList"] = moduleList;

            ViewBag.ruid = ruid;
            return PartialView();
        }

        //查询角色 对应的 模块下的 所有权限
        public ActionResult PerListView()
        {
            //模块gid
            string m_gid = Request["m_gid"] ?? string.Empty;
            //角色gid
            string ruid = Request["ruid"] ?? string.Empty;

            //查询 角色 已有该模块下的 哪些权限
            List<ModulePermission> rpList = SystemSeviceClass.ModulePermission_SelectModulePerByRoleGid(ruid, m_gid);

            SystemPermissionSearchInfo search = new SystemPermissionSearchInfo()
            {
                p_m_gid = m_gid
            };
            int rowcount;
            //模块下的所有权限
            List<ModulePermission> pList = SystemSeviceClass.ModulePermission_SelectPage(search, 1, 100, out rowcount);

            //bool:角色是否有该权限
            Dictionary<ModulePermission, bool> mbDic = new Dictionary<ModulePermission, bool>();

            foreach (ModulePermission item in pList)
            {
                if (rpList.Where(u => u.p_gid == item.p_gid).Count() > 0)
                {
                    mbDic.Add(item, true);
                }
                else
                {
                    mbDic.Add(item, false);
                }
            }

            ViewBag.mbDic = mbDic;
            ViewBag.ruid = ruid;
            ViewBag.m_gid = m_gid;

            return PartialView();
        }

        //权限操作
        public ActionResult PerOperation()
        {
            string rgid = Request["rgid"] ?? string.Empty;
            string pgid = Request["pgid"] ?? string.Empty;
            int oType = Request["oType"].ToInt32(-1); //1：新增;0：删除

            int result = 0;
            if (oType == 1)
            {
                Role_ModualPermission_Mapping obj = new Role_ModualPermission_Mapping();
                obj.p_gid = pgid;
                obj.r_gid = rgid;
                obj.r_p_CreateTime = DateTime.Now;
                obj.r_p_CreateUser = SiteHelp.CurrentUserName;
                obj.r_p_gid = Entity.GenerateGUID();

                result = SystemSeviceClass.Role_ModualPermission_Mapping_Insert(obj);
            }
            else if (oType == 0)
            {
                result = SystemSeviceClass.Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid(rgid, pgid);
            }

            if (result > 0)
            {
                return Json(new { success = true, errors = new { text = "操作成功" } });
            }
            else
            {
                return Json(new { success = false, errors = new { text = "操作失败" } });
            }

        }

        #endregion

        #region 角色管理

        public ActionResult RoleList()
        {
            return View();
        }

        public ActionResult RoleListView()
        {
            int page = Request["page"].ToString().ToInt32(1);
            int pageSize = Request["pagesize"].ToString().ToInt32(15);
            //搜索关键字
            string r_name = Request["r_name"] ?? string.Empty;

            int rowCount;
            //查询所有的模块
            SystemRoleSearchInfo search = new SystemRoleSearchInfo()
            {
                r_name = r_name
            };
            List<Role> list = SystemSeviceClass.Role_SelectPage(search, page, pageSize, out rowCount);
            ViewData["list"] = list;

            ViewData["page"] = page;
            ViewData["pageSize"] = pageSize;
            ViewData["rowCount"] = rowCount;

            return PartialView();
        }

        public ActionResult RoleEditView()
        {
            string r_gid = Request["r_gid"] ?? string.Empty;
            string window = Request["window"] ?? string.Empty;

            Role info = null;
            if (string.IsNullOrEmpty(r_gid))
            {
                info = new Role();
            }
            else
            {
                info = SystemSeviceClass.Role_SelectByr_gid(r_gid);
            }

            ViewData["window"] = window;
            ViewData["info"] = info;
            return View();
        }

        public ActionResult RoleEdit()
        {
            string r_gid = Request["r_gid"] ?? string.Empty;
            string r_name = Request["r_name"] ?? string.Empty;

            Role info = null;
            if (string.IsNullOrEmpty(r_gid))
            {
                info = new Role();
                //新增
                string guid = Guid.NewGuid().ToString().Substring(0, 8);
                info.r_gid = guid;
                info.r_createTime = DateTime.Now;
                info.r_createUser = SiteHelp.CurrentUserName;
            }
            else
            {
                info = SystemSeviceClass.Role_SelectByr_gid(r_gid);
            }
            info.r_name = r_name;


            if (string.IsNullOrEmpty(r_gid))
            {
                int result = SystemSeviceClass.Role_Insert(info);
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
                int result = SystemSeviceClass.Role_UpdateByr_gid(info);
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

        public ActionResult RoleDelete()
        {
            string r_gid = Request["r_gid"] ?? string.Empty;
            int result = SystemSeviceClass.Role_DeleteByr_gid(r_gid);
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

    }
}
