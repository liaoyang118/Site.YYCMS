using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.SiteModel;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Reflection;

namespace Site.SiteAccess
{
    public class SiteCatesAccess : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);

        #region IDisposable 实现
        public SiteCatesAccess(string configName)
        {
            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public SiteCatesAccess()
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
        ~SiteCatesAccess()
        {
            Dispose(false);
        }

        #endregion

        #region 站点分类

        #region Proc_Site_Cates_Insert
        public int Site_Cates_Insert(Site_Cates obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_Insert");
            db.AddOutParameter(dbCmd, "@c_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, obj.c_gid);
            db.AddInParameter(dbCmd, "@c_path", DbType.String, obj.c_path);
            db.AddInParameter(dbCmd, "@c_isMainCate", DbType.Boolean, obj.c_isMainCate);
            db.AddInParameter(dbCmd, "@c_tableId", DbType.Int32, obj.c_tableId);
            db.AddInParameter(dbCmd, "@c_name", DbType.String, obj.c_name);
            db.AddInParameter(dbCmd, "@c_type", DbType.String, obj.c_type);
            db.AddInParameter(dbCmd, "@c_createUser", DbType.String, obj.c_createUser);
            db.AddInParameter(dbCmd, "@c_createTime", DbType.String, obj.c_createTime);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int c_id = (int)dbCmd.Parameters["@c_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Site_Cates_DeleteByc_gid
        public int Site_Cates_DeleteByc_gid(string c_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_DeleteByc_gid");
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, c_gid);
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

        #region Proc_Site_Cates_UpdateByc_gid
        public int Site_Cates_UpdateByc_gid(Site_Cates obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_UpdateByc_gid");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, obj.c_id);
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, obj.c_gid);
            db.AddInParameter(dbCmd, "@c_path", DbType.String, obj.c_path);
            db.AddInParameter(dbCmd, "@c_isMainCate", DbType.Boolean, obj.c_isMainCate);
            db.AddInParameter(dbCmd, "@c_tableId", DbType.Int32, obj.c_tableId);
            db.AddInParameter(dbCmd, "@c_name", DbType.String, obj.c_name);
            db.AddInParameter(dbCmd, "@c_type", DbType.String, obj.c_type);
            db.AddInParameter(dbCmd, "@c_createUser", DbType.String, obj.c_createUser);
            db.AddInParameter(dbCmd, "@c_createTime", DbType.String, obj.c_createTime);
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

        #region Proc_Site_Cates_SelectByc_gid
        public Site_Cates Site_Cates_SelectByc_gid(string c_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_SelectByc_gid");
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, c_gid);
            Site_Cates obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<Site_Cates>(reader);
                        //属性赋值

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

        #region Proc_Site_Cates_SelectBaseCateByc_gid
        public Site_Cates Site_Cates_SelectBaseCateByc_gid(string c_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_SelectBaseCateByc_gid");
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, c_gid);
            Site_Cates obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<Site_Cates>(reader);
                        //属性赋值

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





        #region Proc_Site_Cates_SelectByc_id
        public Site_Cates Site_Cates_SelectByc_id(int c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_SelectByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, c_id);
            Site_Cates obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<Site_Cates>(reader);
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


        #region Proc_Site_Cates_SelectPage
        public List<Site_Cates> Site_Cates_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Cates_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Site_Cates> list = new List<Site_Cates>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Site_Cates obj = Obj2Model<Site_Cates>(reader);
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

        #region 站点页面

        #region Proc_Site_CMSPage_Insert
        public int Site_CMSPage_Insert(Site_CMSPage obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSPage_Insert");
            db.AddOutParameter(dbCmd, "@p_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@p_name", DbType.String, obj.p_name);
            db.AddInParameter(dbCmd, "@p_path", DbType.String, obj.p_path);
            db.AddInParameter(dbCmd, "@p_tempPath", DbType.String, obj.p_tempPath);
            db.AddInParameter(dbCmd, "@p_filePath", DbType.String, obj.p_filePath);
            db.AddInParameter(dbCmd, "@p_createTime", DbType.String, obj.p_createTime);
            db.AddInParameter(dbCmd, "@p_createUser", DbType.String, obj.p_createUser);
            db.AddInParameter(dbCmd, "@p_pageDuty", DbType.String, obj.p_pageDuty);
            db.AddInParameter(dbCmd, "@p_siteName", DbType.Int32, obj.p_siteName);

            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int p_id = (int)dbCmd.Parameters["@p_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Site_CMSPage_DeleteByp_gid
        public int Site_CMSPage_DeleteByp_gid(string p_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSPage_DeleteByp_gid");
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

        #region Proc_Site_CMSPage_UpdateByp_gid
        public int Site_CMSPage_UpdateByp_gid(Site_CMSPage obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSPage_UpdateByp_gid");
            db.AddInParameter(dbCmd, "@p_id", DbType.Int32, obj.p_id);
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, obj.p_gid);
            db.AddInParameter(dbCmd, "@p_name", DbType.String, obj.p_name);
            db.AddInParameter(dbCmd, "@p_path", DbType.String, obj.p_path);
            db.AddInParameter(dbCmd, "@p_tempPath", DbType.String, obj.p_tempPath);
            db.AddInParameter(dbCmd, "@p_filePath", DbType.String, obj.p_filePath);
            db.AddInParameter(dbCmd, "@p_createTime", DbType.String, obj.p_createTime);
            db.AddInParameter(dbCmd, "@p_createUser", DbType.String, obj.p_createUser);
            db.AddInParameter(dbCmd, "@p_pageDuty", DbType.String, obj.p_pageDuty);
            db.AddInParameter(dbCmd, "@p_siteName", DbType.Int32, obj.p_siteName);

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

        #region Proc_Site_CMSPage_SelectByp_gid
        public Site_CMSPage Site_CMSPage_SelectByp_gid(string p_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSPage_SelectByp_gid");
            db.AddInParameter(dbCmd, "@p_gid", DbType.String, p_gid);
            Site_CMSPage obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<Site_CMSPage>(reader);
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

        #region Proc_Site_CMSPage_SelectPage
        public List<Site_CMSPage> Site_CMSPage_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSPage_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Site_CMSPage> list = new List<Site_CMSPage>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Site_CMSPage obj = Obj2Model<Site_CMSPage>(reader);
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

        #region 页面区块

        #region Proc_Site_CMSBlock_Insert
        public int Site_CMSBlock_Insert(Site_CMSBlock obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSBlock_Insert");
            db.AddOutParameter(dbCmd, "@b_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@b_gid", DbType.String, obj.b_gid);
            db.AddInParameter(dbCmd, "@b_p_gid", DbType.String, obj.b_p_gid);
            db.AddInParameter(dbCmd, "@b_path", DbType.String, obj.b_path);
            db.AddInParameter(dbCmd, "@b_name", DbType.String, obj.b_name);
            db.AddInParameter(dbCmd, "@b_img_size", DbType.String, obj.b_img_size);
            db.AddInParameter(dbCmd, "@b_createUser", DbType.String, obj.b_createUser);
            db.AddInParameter(dbCmd, "@b_createTime", DbType.String, obj.b_createTime);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int b_id = (int)dbCmd.Parameters["@b_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Site_CMSBlock_DeleteByb_gid
        public int Site_CMSBlock_DeleteByb_gid(string b_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSBlock_DeleteByb_gid");
            db.AddInParameter(dbCmd, "@b_gid", DbType.String, b_gid);
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

        #region Proc_Site_CMSBlock_UpdateByb_gid
        public int Site_CMSBlock_UpdateByb_gid(Site_CMSBlock obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSBlock_UpdateByb_gid");
            db.AddInParameter(dbCmd, "@b_id", DbType.Int32, obj.b_id);
            db.AddInParameter(dbCmd, "@b_gid", DbType.String, obj.b_gid);
            db.AddInParameter(dbCmd, "@b_p_gid", DbType.String, obj.b_p_gid);
            db.AddInParameter(dbCmd, "@b_path", DbType.String, obj.b_path);
            db.AddInParameter(dbCmd, "@b_name", DbType.String, obj.b_name);
            db.AddInParameter(dbCmd, "@b_img_size", DbType.String, obj.b_img_size);
            db.AddInParameter(dbCmd, "@b_createUser", DbType.String, obj.b_createUser);
            db.AddInParameter(dbCmd, "@b_createTime", DbType.String, obj.b_createTime);
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

        #region Proc_Site_CMSBlock_SelectByb_gid
        public Site_CMSBlock Site_CMSBlock_SelectByb_gid(string b_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSBlock_SelectByb_gid");
            db.AddInParameter(dbCmd, "@b_gid", DbType.String, b_gid);
            Site_CMSBlock obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<Site_CMSBlock>(reader);
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

        #region Proc_Site_CMSBlock_SelectPage
        public List<Site_CMSBlock> Site_CMSBlock_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSBlock_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Site_CMSBlock> list = new List<Site_CMSBlock>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Site_CMSBlock obj = Obj2Model<Site_CMSBlock>(reader);
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

        #region 信息项

        #region Proc_Site_CMSItem_Insert
        public int Site_CMSItem_Insert(Site_CMSItem obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_Insert");
            db.AddOutParameter(dbCmd, "@i_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@i_gid", DbType.String, obj.i_gid);
            db.AddInParameter(dbCmd, "@i_p_gid", DbType.String, obj.i_p_gid);
            db.AddInParameter(dbCmd, "@i_b_gid", DbType.String, obj.i_b_gid);
            db.AddInParameter(dbCmd, "@i_title", DbType.String, obj.i_title);
            db.AddInParameter(dbCmd, "@i_c_gid", DbType.String, obj.i_c_gid);
            db.AddInParameter(dbCmd, "@i_c_type", DbType.String, obj.i_c_type);
            db.AddInParameter(dbCmd, "@i_subTitle", DbType.String, obj.i_subTitle);
            db.AddInParameter(dbCmd, "@i_intro", DbType.String, obj.i_intro); 
            db.AddInParameter(dbCmd, "@i_c_img_src", DbType.String, obj.i_c_img_src); 
            db.AddInParameter(dbCmd, "@i_status", DbType.Int32, obj.i_status);
            db.AddInParameter(dbCmd, "@i_createUser", DbType.String, obj.i_createUser);
            db.AddInParameter(dbCmd, "@i_createTime", DbType.String, obj.i_createTime);
            db.AddInParameter(dbCmd, "@i_sort", DbType.Int32, obj.i_sort);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int i_id = (int)dbCmd.Parameters["@i_id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Site_CMSItem_DeleteByi_gid
        public int Site_CMSItem_DeleteByi_gid(string i_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_DeleteByi_gid");
            db.AddInParameter(dbCmd, "@i_gid", DbType.String, i_gid);
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

        #region Proc_Site_CMSItem_UpdateByi_gid
        public int Site_CMSItem_UpdateByi_gid(Site_CMSItem obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_UpdateByi_gid");
            db.AddInParameter(dbCmd, "@i_id", DbType.Int32, obj.i_id);
            db.AddInParameter(dbCmd, "@i_gid", DbType.String, obj.i_gid);
            db.AddInParameter(dbCmd, "@i_p_gid", DbType.String, obj.i_p_gid);
            db.AddInParameter(dbCmd, "@i_b_gid", DbType.String, obj.i_b_gid);
            db.AddInParameter(dbCmd, "@i_title", DbType.String, obj.i_title);
            db.AddInParameter(dbCmd, "@i_c_gid", DbType.String, obj.i_c_gid);
            db.AddInParameter(dbCmd, "@i_c_type", DbType.String, obj.i_c_type);
            db.AddInParameter(dbCmd, "@i_subTitle", DbType.String, obj.i_subTitle);
            db.AddInParameter(dbCmd, "@i_intro", DbType.String, obj.i_intro);
            db.AddInParameter(dbCmd, "@i_c_img_src", DbType.String, obj.i_c_img_src);
            db.AddInParameter(dbCmd, "@i_status", DbType.Int32, obj.i_status);
            db.AddInParameter(dbCmd, "@i_createUser", DbType.String, obj.i_createUser);
            db.AddInParameter(dbCmd, "@i_createTime", DbType.String, obj.i_createTime);
            db.AddInParameter(dbCmd, "@i_sort", DbType.Int32, obj.i_sort);


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

        #region Proc_Site_CMSItem_SelectByi_gid
        public Site_CMSItem Site_CMSItem_SelectByi_gid(string i_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_SelectByi_gid");
            db.AddInParameter(dbCmd, "@i_gid", DbType.String, i_gid);
            Site_CMSItem obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = this.Obj2Model<Site_CMSItem>(reader);
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

        #region Proc_Site_CMSItem_SelectByc_gidAndb_gid
        public Site_CMSItem Site_CMSItem_SelectByc_gidAndb_gid(string c_gid,string b_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_SelectByc_gidAndb_gid");
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, c_gid);
            db.AddInParameter(dbCmd, "@b_gid", DbType.String, b_gid);
            Site_CMSItem obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = this.Obj2Model<Site_CMSItem>(reader);
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



        #region Proc_Site_CMSItem_SelectPage
        public List<Site_CMSItem> Site_CMSItem_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_CMSItem_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Site_CMSItem> list = new List<Site_CMSItem>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Site_CMSItem obj = this.Obj2Model<Site_CMSItem>(reader);
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
