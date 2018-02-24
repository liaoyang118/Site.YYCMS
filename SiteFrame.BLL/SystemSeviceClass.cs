using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.SessionState;
using SiteFrame.BLL.Search;
using SiteFrame.Model;
using SiteFrame.DAL;

namespace SiteFrame.BLL
{
    public class SystemSeviceClass
    {

        const string SESSION_MODUALKEY = "userModual";

        #region 用户管理

        #region 查询单个用户 + User User_SelectByu_name(string u_username)
        /// <summary>
        /// 查询单个用户
        /// </summary>
        /// <param name="u_username"></param>
        /// <returns></returns>
        public static User User_SelectByu_name(string u_username)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_SelectByu_name(u_username);
            }
        }
        #endregion

        #region 插入用户
        /// <summary>
        /// 插入用户
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int User_Insert(User obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Insert(obj);
            }
        }
        #endregion

        #region 查询单个用户
        /// <summary>
        /// 查询单个用户
        /// </summary>
        /// <param name="u_gid"></param>
        /// <returns></returns>
        public static User User_SelectByu_gid(string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_SelectByu_gid(u_gid);
            }
        }
        #endregion

        #region 用户更新
        public static int User_UpdateByu_gid(User obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_UpdateByu_gid(obj);
            }
        }
        #endregion

        #region 删除用户
        public static int User_DeleteByu_gid(string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_DeleteByu_gid(u_gid);
            }
        }
        #endregion

        #region 分页查询系统用户
        public static List<User> User_SelectPage(SystemUserSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out  rowCount);
            }
        }
        #endregion


        #endregion

        #region 模块管理

        #region 分页查询系统所有权限模块信息
        /// <summary>
        /// 分页查询系统所有权限模块信息
        /// </summary>
        /// <param name="cloumns"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<SystemModual> SystemModual_SelectPage(SystemModuleSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out  rowCount);
            }
        }
        #endregion

        #region 查询单条信息 + SystemModual SystemModual_SelectBym_gid(string m_gid)
        /// <summary>
        /// 查询单条信息
        /// </summary>
        /// <param name="m_gid"></param>
        /// <returns></returns>
        public static SystemModual SystemModual_SelectBym_gid(string m_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_SelectBym_gid(m_gid);
            }
        }
        #endregion

        #region 更新系统模块 + int SystemModual_UpdateBym_gid(SystemModual obj)
        /// <summary>
        /// 更新系统模块
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int SystemModual_UpdateBym_gid(SystemModual obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_UpdateBym_gid(obj);
            }
        }
        #endregion

        #region 插入模块  +int SystemModual_Insert(SystemModual obj)
        /// <summary>
        /// 插入模块
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int SystemModual_Insert(SystemModual obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_Insert(obj);
            }
        }
        #endregion

        #region 删除模块 + int SystemModual_DeleteBym_gid(string m_gid)
        /// <summary>
        /// 删除模块
        /// </summary>
        /// <param name="m_gid"></param>
        /// <returns></returns>
        public static int SystemModual_DeleteBym_gid(string m_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_DeleteBym_gid(m_gid);
            }
        }
        #endregion

        #region 查询 用户对应 模块组下的模块信息
        /// <summary>
        /// 查询 用户对应 模块组下的模块信息
        /// </summary>
        /// <param name="u_gid"></param>
        /// <param name="m_g_gid"></param>
        /// <returns></returns>
        public static List<SystemModual> SystemModual_SelectByu_gid(string u_gid, string m_g_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemModual_SelectByu_gid(u_gid, m_g_gid);
            }
        }
        #endregion

        #endregion

        #region 模块组管理

        #region 获取用户对应的模块组
        /// <summary>
        /// 获取用户对应的模块组
        /// </summary>
        /// <param name="u_gid"></param>
        /// <returns></returns>
        public static List<SystemGroup> SystemGroup_SelectByu_gid(string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemGroup_SelectByu_gid(u_gid);
            }
        }
        #endregion

        #region 分页查询模块组信息
        /// <summary>
        /// 分页查询模块组信息
        /// </summary>
        /// <param name="cloumns"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<SystemGroup> SystemGroup_SelectPage(SystemGroupSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (var access = new SystemDAL())
            {
                return access.SystemGroup_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out  rowCount);
            }
        }
        #endregion

        public static int SystemGroup_Insert(SystemGroup obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemGroup_Insert(obj);
            }
        }

        public static int SystemGroup_DeleteByg_gid(string g_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemGroup_DeleteByg_gid(g_gid);
            }
        }

        public static int SystemGroup_UpdateByg_gid(SystemGroup obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemGroup_UpdateByg_gid(obj);
            }
        }

        public static SystemGroup SystemGroup_SelectByg_gid(string g_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.SystemGroup_SelectByg_gid(g_gid);
            }
        }

        #endregion

        #region 权限管理

        #region 查询用户的所有 模块权限 + List<ModulePermission> ModulePermission_SelectUserPerByu_gid(string u_gid)
        /// <summary>
        /// 查询用户的所有 模块权限
        /// </summary>
        /// <param name="u_gid"></param>
        /// <returns></returns>
        public static List<ModulePermission> ModulePermission_SelectUserPerByu_gid(string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_SelectUserPerByu_gid(u_gid);
            }
        }
        #endregion

        public static int ModulePermission_Insert(ModulePermission obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_Insert(obj);
            }
        }

        public static int ModulePermission_DeleteByp_gid(string p_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_DeleteByp_gid(p_gid);
            }
        }

        public static int ModulePermission_UpdateByp_gid(ModulePermission obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_UpdateByp_gid(obj);
            }
        }

        public static ModulePermission ModulePermission_SelectByp_gid(string p_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_SelectByp_gid(p_gid);
            }
        }

        public static List<ModulePermission> ModulePermission_SelectPage(SystemPermissionSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out  rowCount);
            }
        }

        #region 查询角色对应的 某个模块下拥有的权限 + List<ModulePermission> ModulePermission_SelectModulePerByRoleGid(string rgid, string mgid)
        /// <summary>
        /// 查询角色对应的 某个模块下拥有的权限
        /// </summary>
        /// <param name="rgid">角色gid</param>
        /// <param name="mgid">模块gid</param>
        /// <returns></returns>
        public static List<ModulePermission> ModulePermission_SelectModulePerByRoleGid(string rgid, string mgid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.ModulePermission_SelectModulePerByRoleGid(rgid, mgid);
            }
        }
        #endregion


        #region 角色权限

        /// <summary>
        /// 删除角色权限
        /// </summary>
        /// <param name="r_gid">角色gid</param>
        /// <param name="p_gid">权限gid</param>
        /// <returns></returns>
        public static int Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid(string r_gid, string p_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid(r_gid, p_gid);
            }
        }

        /// <summary>
        /// 删除角色权限
        /// </summary>
        /// <param name="r_p_id">id主键</param>
        /// <returns></returns>
        public static int Role_ModualPermission_Mapping_DeleteByr_p_id(int r_p_id)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_DeleteByr_p_id(r_p_id);
            }
        }

        /// <summary>
        /// 插入角色权限
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int Role_ModualPermission_Mapping_Insert(Role_ModualPermission_Mapping obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_Insert(obj);
            }
        }

        /// <summary>
        /// 查询单条角色权限
        /// </summary>
        /// <param name="r_p_id">id主键</param>
        /// <returns></returns>
        public static Role_ModualPermission_Mapping Role_ModualPermission_Mapping_SelectByr_p_id(int r_p_id)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_SelectByr_p_id(r_p_id);
            }
        }

        /// <summary>
        /// 分页查询角色权限 所有的
        /// </summary>
        /// <param name="cloumns"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Role_ModualPermission_Mapping> Role_ModualPermission_Mapping_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out  rowCount);
            }
        }

        /// <summary>
        /// 更新角色权限
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int Role_ModualPermission_Mapping_UpdateByr_p_id(Role_ModualPermission_Mapping obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_ModualPermission_Mapping_UpdateByr_p_id(obj);
            }
        }
        #endregion


        #endregion

        #region 角色管理

        public static int Role_Insert(Role obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_Insert(obj);
            }
        }
        public static int Role_DeleteByr_gid(string obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_DeleteByr_gid(obj);
            }
        }
        public static int Role_UpdateByr_gid(Role obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_UpdateByr_gid(obj);
            }
        }
        public static Role Role_SelectByr_gid(string r_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_SelectByr_gid(r_gid);
            }
        }
        public static List<Role> Role_SelectPage(SystemRoleSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.Role_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out  rowCount);
            }
        }

        #endregion

        #region 用户角色管理

        public static int User_Role_Mapping_Insert(User_Role_Mapping obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_Insert(obj);
            }
        }

        public static int User_Role_Mapping_DeleteByu_r_id(int u_r_id)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_DeleteByu_r_id(u_r_id);
            }
        }

        public static int User_Role_Mapping_UpdateByu_r_id(User_Role_Mapping obj)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_UpdateByu_r_id(obj);
            }
        }

        public static User_Role_Mapping User_Role_Mapping_SelectByu_r_id(int u_r_id)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_SelectByu_r_id(u_r_id);
            }
        }

        public static List<User_Role_Mapping> User_Role_Mapping_SelectPage(SystemUserRoleSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_SelectPage("*", pageIndex, pageSize, search.DefaultOrder, search.ToWhereString(), out rowCount);
            }
        }


        public static List<User_Role_Mapping> User_Role_Mapping_SelectByu_gid(string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_SelectByu_gid(u_gid);
            }
        }

        public static int User_Role_Mapping_DeleteByr_gidAndu_gid(string r_gid, string u_gid)
        {
            using (SystemDAL access = new SystemDAL())
            {
                return access.User_Role_Mapping_DeleteByr_gidAndu_gid(r_gid, u_gid);
            }
        }


        #endregion

    }
}
