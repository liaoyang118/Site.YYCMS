using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using Site.SiteModel;
using System.Reflection;

namespace Site.SiteAccess
{
    public class SiteContentAccesss : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);

        #region IDisposable 实现
        public SiteContentAccesss(string configName)
        {
            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public SiteContentAccesss()
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
        ~SiteContentAccesss()
        {
            Dispose(false);
        }

        #endregion

        #region Proc_Site_Content_Insert
        public int Site_Content_Insert(Site_Content obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_Insert");
            db.AddOutParameter(dbCmd, "@c_id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, obj.c_gid);
            db.AddInParameter(dbCmd, "@c_c_gid", DbType.String, obj.c_c_gid);
            db.AddInParameter(dbCmd, "@c_title", DbType.String, obj.c_title);
            db.AddInParameter(dbCmd, "@c_keywords", DbType.String, obj.c_keywords);
            db.AddInParameter(dbCmd, "@c_sub_title", DbType.String, obj.c_sub_title);
            db.AddInParameter(dbCmd, "@c_intro", DbType.String, obj.c_intro);
            db.AddInParameter(dbCmd, "@c_content", DbType.String, obj.c_content);
            db.AddInParameter(dbCmd, "@c_img_src", DbType.String, obj.c_img_src);
            db.AddInParameter(dbCmd, "@c_createUserId", DbType.String, obj.c_createUserId);
            db.AddInParameter(dbCmd, "@c_createUserName", DbType.String, obj.c_createUserName);
            db.AddInParameter(dbCmd, "@c_createUserNickName", DbType.String, obj.c_createUserNickName);
            db.AddInParameter(dbCmd, "@c_createTime", DbType.DateTime, obj.c_createTime);
            db.AddInParameter(dbCmd, "@c_status", DbType.Int32, obj.c_status);
            db.AddInParameter(dbCmd, "@c_state", DbType.Boolean, obj.c_state);
            db.AddInParameter(dbCmd, "@c_updateTime", DbType.DateTime, obj.c_updateTime);

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

        #region Proc_Site_Content_DeleteByc_id
        public int Site_Content_DeleteByc_id(string c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_DeleteByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, c_id);
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

        #region Proc_Site_Content_UpdateByc_id
        public int Site_Content_UpdateByc_id(Site_Content obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_UpdateByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, obj.c_id);
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, obj.c_gid);
            db.AddInParameter(dbCmd, "@c_c_gid", DbType.String, obj.c_c_gid);
            db.AddInParameter(dbCmd, "@c_title", DbType.String, obj.c_title);
            db.AddInParameter(dbCmd, "@c_keywords", DbType.String, obj.c_keywords);
            db.AddInParameter(dbCmd, "@c_sub_title", DbType.String, obj.c_sub_title);
            db.AddInParameter(dbCmd, "@c_intro", DbType.String, obj.c_intro);
            db.AddInParameter(dbCmd, "@c_content", DbType.String, obj.c_content);
            db.AddInParameter(dbCmd, "@c_img_src", DbType.String, obj.c_img_src);
            db.AddInParameter(dbCmd, "@c_createUserId", DbType.String, obj.c_createUserId);
            db.AddInParameter(dbCmd, "@c_createUserName", DbType.String, obj.c_createUserName);
            db.AddInParameter(dbCmd, "@c_createUserNickName", DbType.String, obj.c_createUserNickName);
            db.AddInParameter(dbCmd, "@c_status", DbType.Int32, obj.c_status);
            db.AddInParameter(dbCmd, "@c_state", DbType.String, obj.c_state);
            db.AddInParameter(dbCmd, "@c_updateTime", DbType.DateTime, obj.c_updateTime);

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

        #region Proc_Site_Content_SelectByc_id
        public Site_Content Site_Content_SelectByc_id(string c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_SelectByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, c_id);
            Site_Content obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = this.Obj2Model<Site_Content>(reader);
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

        #region Proc_Site_Content_SelectByc_gid
        public Site_Content Site_Content_SelectByc_gid(string c_gid)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_SelectByc_gid");
            db.AddInParameter(dbCmd, "@c_gid", DbType.String, c_gid);
            Site_Content obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = this.Obj2Model<Site_Content>(reader);
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

        #region Proc_Site_Content_SelectPageByc_id
        public List<Site_Content> Site_Content_SelectPageByc_id(int cateId, int pageIndex, int pageSize, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_SelectPageByc_id");
            db.AddInParameter(dbCmd, "@cateId", DbType.Int32, cateId);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);

            List<Site_Content> list = new List<Site_Content>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        Site_Content obj = this.Obj2Model<Site_Content>(reader);

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


        #region Proc_Site_Content_SelectPage
        public List<Site_Content> Site_Content_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Site_Content_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Site_Content> list = new List<Site_Content>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        Site_Content obj = this.Obj2Model<Site_Content>(reader);
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
