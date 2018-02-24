using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;
using SiteFrame.Model;

namespace SiteFrame.DAL
{
    public class SystemDAL : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);


        #region IDisposable 实现
        public SystemDAL(string configName)
        {

            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public SystemDAL()
        {
            //db = DatabaseFactory.CreateDatabase("MySite"); 5.0 创建方式
            db = factory.Create("MySite");
        }

        //虚拟Idisposable 实现,手动调用的
        public void Dispose()
        {
            //调用方法，释放资源
            Dispose(true);
            //通知GC，已经手动调用，不用调用析构函数了
            System.GC.SuppressFinalize(this);
        }

        //重载方法，满足不同的调用，清理干净资源，提升性能
        /// <summary>
        /// true --手动调用，清理托管资源
        /// false--GC 调用，把非托管资源一起清理掉
        /// </summary>
        /// <param name="isDispose"></param>
        protected virtual void Dispose(bool isDispose)
        {
            if (isDispose)
            {

            }
            //清理非托管资源，此处没有，所以直接ruturn
            return;
        }

        //析构函数，供GC 调用
        ~SystemDAL()
        {
            Dispose(false);
        }
        #endregion

        #region 系统角色

        #region Proc_Role_Insert
        public int Role_Insert(Role obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_Insert");
            db.AddOutParameter(dbCmd, "@r_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@r_name", DbType.String, obj.r_name);
            db.AddInParameter(dbCmd, "@r_createUser", DbType.String, obj.r_createUser);
            db.AddInParameter(dbCmd, "@r_createTime", DbType.String, obj.r_createTime);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int r_id = (int)dbCmd.Parameters["@r_id"].Value;
                return r_id;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_DeleteByr_gid
        public int Role_DeleteByr_gid(string r_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_DeleteByr_gid");
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, r_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_UpdateByr_gid
        public int Role_UpdateByr_gid(Role obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_UpdateByr_gid");
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@r_name", DbType.String, obj.r_name);
            db.AddInParameter(dbCmd, "@r_createTime", DbType.String, obj.r_createTime);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_SelectByr_gid
        public Role Role_SelectByr_gid(string r_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_SelectByr_gid");
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, r_gid);
            Role obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<Role>(reader);
                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_SelectPage
        public List<Role> Role_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Role> list = new List<Role>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Role obj = Obj2Model<Role>(reader);

                        list.Add(obj);
                    }
                    reader.NextResult();
                }
                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #endregion

        #region 系统模块

        #region Proc_SystemModual_SelectPage
        public List<SystemModual> SystemModual_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<SystemModual> list = new List<SystemModual>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        SystemModual obj = Obj2Model<SystemModual>(reader);
                        list.Add(obj);
                    }
                    reader.NextResult();
                }
                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemModual_SelectByu_gid
        /// <summary>
        /// 查询 用户对应 模块组下的模块信息
        /// </summary>
        /// <param name="u_gid"></param>
        /// <param name="m_g_gid"></param>
        /// <returns></returns>
        public List<SystemModual> SystemModual_SelectByu_gid(string u_gid, string m_g_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_SelectByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            db.AddInParameter(dbCmd, "@m_g_gid", DbType.String, m_g_gid);
            List<SystemModual> list = new List<SystemModual>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        SystemModual obj = Obj2Model<SystemModual>(reader);
                        list.Add(obj);
                    }
                }
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemModual_SelectBym_gid
        public SystemModual SystemModual_SelectBym_gid(string m_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_SelectBym_gid");
            db.AddInParameter(dbCmd, "@m_gid", DbType.String, m_gid);
            SystemModual obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<SystemModual>(reader);
                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemModual_UpdateBym_gid
        public int SystemModual_UpdateBym_gid(SystemModual obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_UpdateBym_gid");
            db.AddInParameter(dbCmd, "@m_gid", DbType.String, obj.m_gid);
            db.AddInParameter(dbCmd, "@m_name", DbType.String, obj.m_name);
            db.AddInParameter(dbCmd, "@m_path", DbType.String, obj.m_path);
            db.AddInParameter(dbCmd, "@m_parent_gid", DbType.String, obj.m_parent_gid);
            db.AddInParameter(dbCmd, "@m_parent", DbType.Int32, obj.m_parent);
            db.AddInParameter(dbCmd, "@m_Controller", DbType.String, obj.m_Controller);
            db.AddInParameter(dbCmd, "@m_Action", DbType.String, obj.m_Action);
            db.AddInParameter(dbCmd, "@m_createTime", DbType.String, obj.m_createTime);
            db.AddInParameter(dbCmd, "@m_createUser", DbType.String, obj.m_createUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemModual_Insert
        public int SystemModual_Insert(SystemModual obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_Insert");
            db.AddOutParameter(dbCmd, "@m_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@m_gid", DbType.String, obj.m_gid);
            db.AddInParameter(dbCmd, "@m_g_gid", DbType.String, obj.m_g_gid);
            db.AddInParameter(dbCmd, "@m_name", DbType.String, obj.m_name);
            db.AddInParameter(dbCmd, "@m_path", DbType.String, obj.m_path);
            db.AddInParameter(dbCmd, "@m_parent", DbType.Int32, obj.m_parent);
            db.AddInParameter(dbCmd, "@m_parent_gid", DbType.String, obj.m_parent_gid);
            db.AddInParameter(dbCmd, "@m_Controller", DbType.String, obj.m_Controller);
            db.AddInParameter(dbCmd, "@m_Action", DbType.String, obj.m_Action);
            db.AddInParameter(dbCmd, "@m_createTime", DbType.String, obj.m_createTime);
            db.AddInParameter(dbCmd, "@m_createUser", DbType.String, obj.m_createUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int m_id = (int)dbCmd.Parameters["@m_id"].Value;
                return m_id;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemModual_DeleteBym_gid
        public int SystemModual_DeleteBym_gid(string m_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemModual_DeleteBym_gid");
            db.AddInParameter(dbCmd, "@m_gid", DbType.String, m_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Pro_SelectSystemModualByu_gid
        public List<SystemModual> SelectSystemModualByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Pro_SelectSystemModualByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            List<SystemModual> list = new List<SystemModual>();
            try
            {
                IDataReader reader = db.ExecuteReader(dbCmd);
                while (reader.Read())
                {
                    //属性赋值
                    SystemModual obj = Obj2Model<SystemModual>(reader);

                    list.Add(obj);
                }
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #endregion

        #region 系统模块组

        #region Proc_SystemGroup_SelectByu_gid
        public List<SystemGroup> SystemGroup_SelectByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_SelectByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            List<SystemGroup> list = new List<SystemGroup>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        SystemGroup obj = Obj2Model<SystemGroup>(reader);

                        list.Add(obj);
                    }
                }
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemGroup_SelectPage
        public List<SystemGroup> SystemGroup_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<SystemGroup> list = new List<SystemGroup>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        SystemGroup obj = Obj2Model<SystemGroup>(reader);
                        list.Add(obj);
                    }
                    reader.NextResult();
                }

                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemGroup_Insert
        public int SystemGroup_Insert(SystemGroup obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_Insert");
            db.AddOutParameter(dbCmd, "@g_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@g_gid", DbType.String, obj.g_gid);
            db.AddInParameter(dbCmd, "@g_name", DbType.String, obj.g_name);
            db.AddInParameter(dbCmd, "@g_picCover", DbType.String, obj.g_picCover);
            db.AddInParameter(dbCmd, "@g_createTime", DbType.DateTime, obj.g_createTime);
            db.AddInParameter(dbCmd, "@g_createUser", DbType.String, obj.g_createUser);
            db.AddInParameter(dbCmd, "@g_sort", DbType.Int32, obj.g_sort);

            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int g_id = (int)dbCmd.Parameters["@g_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemGroup_DeleteByg_gid
        public int SystemGroup_DeleteByg_gid(string g_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_DeleteByg_gid");
            db.AddInParameter(dbCmd, "@g_gid", DbType.String, g_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemGroup_UpdateByg_gid
        public int SystemGroup_UpdateByg_gid(SystemGroup obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_UpdateByg_gid");
            db.AddInParameter(dbCmd, "@g_id", DbType.Int32, obj.g_id);
            db.AddInParameter(dbCmd, "@g_gid", DbType.String, obj.g_gid);
            db.AddInParameter(dbCmd, "@g_name", DbType.String, obj.g_name);
            db.AddInParameter(dbCmd, "@g_picCover", DbType.String, obj.g_picCover);
            db.AddInParameter(dbCmd, "@g_createTime", DbType.DateTime, obj.g_createTime);
            db.AddInParameter(dbCmd, "@g_createUser", DbType.String, obj.g_createUser);
            db.AddInParameter(dbCmd, "@g_sort", DbType.Int32, obj.g_sort);

            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_SystemGroup_SelectByg_gid
        public SystemGroup SystemGroup_SelectByg_gid(string g_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SystemGroup_SelectByg_gid");
            db.AddInParameter(dbCmd, "@g_gid", DbType.String, g_gid);
            SystemGroup obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<SystemGroup>(reader);
                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #endregion

        #region 系统权限

        #region Proc_ModulePermission_SelectUserPerByu_gid
        public List<ModulePermission> ModulePermission_SelectUserPerByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_SelectUserPerByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            List<ModulePermission> list = new List<ModulePermission>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        ModulePermission obj = Obj2Model<ModulePermission>(reader);
                        list.Add(obj);
                    }
                }

                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_Insert
        public int ModulePermission_Insert(ModulePermission obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_Insert");
            db.AddOutParameter(dbCmd, "@p_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@p_m_gid", DbType.String, obj.p_m_gid);
            db.AddInParameter(dbCmd, "@p_name", DbType.String, obj.p_name);
            db.AddInParameter(dbCmd, "@p_path", DbType.String, obj.p_path);
            db.AddInParameter(dbCmd, "@p_createTime", DbType.String, obj.p_createTime);
            db.AddInParameter(dbCmd, "@p_createUser", DbType.String, obj.p_createUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int p_id = (int)dbCmd.Parameters["@p_id"].Value;
                return p_id;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_DeleteByp_gid
        public int ModulePermission_DeleteByp_gid(string p_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_DeleteByp_gid");
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, p_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_UpdateByp_gid
        public int ModulePermission_UpdateByp_gid(ModulePermission obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_UpdateByp_gid");
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@p_m_gid", DbType.String, obj.p_m_gid);
            db.AddInParameter(dbCmd, "@p_name", DbType.String, obj.p_name);
            db.AddInParameter(dbCmd, "@p_path", DbType.String, obj.p_path);
            db.AddInParameter(dbCmd, "@p_createTime", DbType.String, obj.p_createTime);
            db.AddInParameter(dbCmd, "@p_createUser", DbType.String, obj.p_createUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_SelectByp_gid
        public ModulePermission ModulePermission_SelectByp_gid(string p_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_SelectByp_gid");
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, p_gid);
            ModulePermission obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<ModulePermission>(reader);
                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_SelectPage
        public List<ModulePermission> ModulePermission_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<ModulePermission> list = new List<ModulePermission>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        ModulePermission obj = Obj2Model<ModulePermission>(reader);

                        list.Add(obj);
                    }
                    reader.NextResult();
                }

                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_ModulePermission_SelectModulePerByRoleGid
        public List<ModulePermission> ModulePermission_SelectModulePerByRoleGid(string rgid, string mgid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ModulePermission_SelectModulePerByRoleGid");
            db.AddInParameter(dbCmd, "@rgid", DbType.String, rgid);
            db.AddInParameter(dbCmd, "@mgid", DbType.String, mgid);
            List<ModulePermission> list = new List<ModulePermission>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        ModulePermission obj = this.Obj2Model<ModulePermission>(reader);
                        list.Add(obj);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return list;
        }
        #endregion

        #region 角色权限

        #region Proc_Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid
        public int Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid(string r_gid, string p_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid");
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, r_gid);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, p_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_ModualPermission_Mapping_DeleteByr_p_id
        public int Role_ModualPermission_Mapping_DeleteByr_p_id(int r_p_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_DeleteByr_p_id");
            db.AddInParameter(dbCmd, "@r_p_id", DbType.Int32, r_p_id);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_ModualPermission_Mapping_Insert
        public int Role_ModualPermission_Mapping_Insert(Role_ModualPermission_Mapping obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_Insert");
            db.AddOutParameter(dbCmd, "@r_p_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@r_p_gid", DbType.String, obj.r_p_gid);
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@r_p_CreateTime", DbType.String, obj.r_p_CreateTime);
            db.AddInParameter(dbCmd, "@r_p_CreateUser", DbType.String, obj.r_p_CreateUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int r_p_id = (int)dbCmd.Parameters["@r_p_id"].Value;
                return r_p_id;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_ModualPermission_Mapping_SelectByr_p_id
        public Role_ModualPermission_Mapping Role_ModualPermission_Mapping_SelectByr_p_id(int r_p_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_SelectByr_p_id");
            db.AddInParameter(dbCmd, "@r_p_id", DbType.Int32, r_p_id);
            Role_ModualPermission_Mapping obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = this.Obj2Model<Role_ModualPermission_Mapping>(reader);
                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_ModualPermission_Mapping_SelectPage
        public List<Role_ModualPermission_Mapping> Role_ModualPermission_Mapping_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Role_ModualPermission_Mapping> list = new List<Role_ModualPermission_Mapping>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Role_ModualPermission_Mapping obj = this.Obj2Model<Role_ModualPermission_Mapping>(reader);
                        list.Add(obj);
                    }
                    reader.NextResult();
                }
                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Role_ModualPermission_Mapping_UpdateByr_p_id
        public int Role_ModualPermission_Mapping_UpdateByr_p_id(Role_ModualPermission_Mapping obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Role_ModualPermission_Mapping_UpdateByr_p_id");
            db.AddInParameter(dbCmd, "@r_p_id", DbType.Int32, obj.r_p_id);
            db.AddInParameter(dbCmd, "@r_p_gid", DbType.String, obj.r_p_gid);
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@r_p_CreateTime", DbType.String, obj.r_p_CreateTime);
            db.AddInParameter(dbCmd, "@r_p_CreateUser", DbType.String, obj.r_p_CreateUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion



        #endregion


        #endregion

        #region 系统用户

        #region Proc_User_Insert
        public int User_Insert(User obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Insert");
            db.AddOutParameter(dbCmd, "@u_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, obj.u_gid);
            db.AddInParameter(dbCmd, "@u_username", DbType.String, obj.u_username);
            db.AddInParameter(dbCmd, "@u_password", DbType.String, obj.u_password);
            db.AddInParameter(dbCmd, "@u_createTime", DbType.String, obj.u_createTime);
            db.AddInParameter(dbCmd, "@u_createUser", DbType.String, obj.u_createUser);
            db.AddInParameter(dbCmd, "@u_status", DbType.Int32, obj.u_status);
            db.AddInParameter(dbCmd, "@u_nickName", DbType.String, obj.u_nickName);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int u_id = (int)dbCmd.Parameters["@u_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_SelectByu_gid
        public User User_SelectByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_SelectByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            User obj = null;
            try
            {
                IDataReader reader = db.ExecuteReader(dbCmd);
                while (reader.Read())
                {
                    obj = Obj2Model<User>(reader);

                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_UpdateByu_gid
        public int User_UpdateByu_gid(User obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_UpdateByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, obj.u_gid);
            db.AddInParameter(dbCmd, "@u_password", DbType.String, obj.u_password);
            db.AddInParameter(dbCmd, "@u_status", DbType.Int32, obj.u_status);
            db.AddInParameter(dbCmd, "@u_username", DbType.String, obj.u_username);
            db.AddInParameter(dbCmd, "@u_nickName", DbType.String, obj.u_nickName);

            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_DeleteByu_gid
        public int User_DeleteByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_DeleteByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_SelectByu_name
        public User User_SelectByu_name(string u_username)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_SelectByu_name");
            db.AddInParameter(dbCmd, "@u_username", DbType.String, u_username);
            User obj = null;
            try
            {
                IDataReader reader = db.ExecuteReader(dbCmd);
                while (reader.Read())
                {
                    obj = Obj2Model<User>(reader);
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_SelectPage
        public List<User> User_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<User> list = new List<User>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        User obj = Obj2Model<User>(reader);
                        //属性赋值

                        list.Add(obj);
                    }
                    reader.NextResult();
                }
                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #endregion

        #region 用户角色

        #region Proc_User_Role_Mapping_Insert
        public int User_Role_Mapping_Insert(User_Role_Mapping obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_Insert");
            db.AddOutParameter(dbCmd, "@u_r_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@u_r_gid", DbType.String, obj.u_r_gid);
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, obj.u_gid);
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@u_r_CreateTime", DbType.String, obj.u_r_CreateTime);
            db.AddInParameter(dbCmd, "@u_r_CreateUser", DbType.String, obj.u_r_CreateUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int u_r_id = (int)dbCmd.Parameters["@u_r_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_Role_Mapping_DeleteByu_r_id
        public int User_Role_Mapping_DeleteByu_r_id(int u_r_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_DeleteByu_r_id");
            db.AddInParameter(dbCmd, "@u_r_id", DbType.Int32, u_r_id);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_Role_Mapping_UpdateByu_r_id
        public int User_Role_Mapping_UpdateByu_r_id(User_Role_Mapping obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_UpdateByu_r_id");
            db.AddInParameter(dbCmd, "@u_r_id", DbType.Int32, obj.u_r_id);
            db.AddInParameter(dbCmd, "@u_r_gid", DbType.String, obj.u_r_gid);
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, obj.u_gid);
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, obj.r_gid);
            db.AddInParameter(dbCmd, "@u_r_CreateTime", DbType.String, obj.u_r_CreateTime);
            db.AddInParameter(dbCmd, "@u_r_CreateUser", DbType.String, obj.u_r_CreateUser);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_Role_Mapping_SelectByu_r_id
        public User_Role_Mapping User_Role_Mapping_SelectByu_r_id(int u_r_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_SelectByu_r_id");
            db.AddInParameter(dbCmd, "@u_r_id", DbType.Int32, u_r_id);
            User_Role_Mapping obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<User_Role_Mapping>(reader);

                    }
                }
                return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_User_Role_Mapping_SelectByu_gid
        public List<User_Role_Mapping> User_Role_Mapping_SelectByu_gid(string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_SelectByu_gid");
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            List<User_Role_Mapping> list = new List<User_Role_Mapping>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        User_Role_Mapping obj = Obj2Model<User_Role_Mapping>(reader);
                        list.Add(obj);
                    }
                }
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        #region Proc_User_Role_Mapping_DeleteByr_gidAndu_gid
        public int User_Role_Mapping_DeleteByr_gidAndu_gid(string r_gid, string u_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_DeleteByr_gidAndu_gid");
            db.AddInParameter(dbCmd, "@r_gid", DbType.String, r_gid);
            db.AddInParameter(dbCmd, "@u_gid", DbType.String, u_gid);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #endregion




        #region Proc_User_Role_Mapping_SelectPage
        public List<User_Role_Mapping> User_Role_Mapping_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_User_Role_Mapping_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<User_Role_Mapping> list = new List<User_Role_Mapping>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        User_Role_Mapping obj = Obj2Model<User_Role_Mapping>(reader);
                        //属性赋值

                        list.Add(obj);
                    }
                    reader.NextResult();
                }
                rowCount = (int)dbCmd.Parameters["@rowCount"].Value;
                return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #endregion

        #region 泛型方法（获取实体信息） + Obj2Model<T>(IDataReader reader)
        /// <summary>
        /// 泛型方法
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="reader"></param>
        /// <returns></returns>
        private T Obj2Model<T>(IDataReader reader) where T : class
        {
            //得到泛型类的 类 类型
            Type t = typeof(T);
            //创建T 对象
            T obj = Activator.CreateInstance(t) as T;
            PropertyInfo[] pros = t.GetProperties();
            foreach (PropertyInfo p in pros)
            {
                t.GetProperty(p.Name).SetValue(obj, reader[p.Name]);
            }
            return obj;
        }
        #endregion

    }
}
