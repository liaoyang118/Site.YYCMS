using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.YuYangModel;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Reflection;

namespace Site.YuYangAccess
{
    public class SiteFictionAccess : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);

        #region IDisposable 实现
        public SiteFictionAccess(string configName)
        {
            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public SiteFictionAccess()
        {
            //db = DatabaseFactory.CreateDatabase("XiaoShuo"); 5.0 创建方式
            db = factory.Create("XiaoShuo");
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
        ~SiteFictionAccess()
        {
            Dispose(false);
        }

        #endregion

        #region 小说

        #region Proc_Fiction_Insert
        public int Fiction_Insert(Fiction obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Fiction_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@Title", DbType.String, obj.Title);
            db.AddInParameter(dbCmd, "@Author", DbType.String, obj.Author);
            db.AddInParameter(dbCmd, "@Intro", DbType.String, obj.Intro);
            db.AddInParameter(dbCmd, "@CoverImage", DbType.String, obj.CoverImage);
            db.AddInParameter(dbCmd, "@C_C_ID", DbType.Int32, obj.C_C_ID);
            db.AddInParameter(dbCmd, "@LastUpdateChapter", DbType.String, obj.LastUpdateChapter);
            db.AddInParameter(dbCmd, "@LastUpdateTime", DbType.String, obj.LastUpdateTime);
            db.AddInParameter(dbCmd, "@CompleteState", DbType.Int32, obj.CompleteState);
            db.AddInParameter(dbCmd, "@LastChapterId", DbType.String, obj.LastChapterId);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int Id = (int)dbCmd.Parameters["@Id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion

        #region Proc_Fiction_DeleteById
        public int Fiction_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Fiction_DeleteById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
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

        #region Proc_Fiction_UpdateById
        public int Fiction_UpdateById(Fiction obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Fiction_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@Title", DbType.String, obj.Title);
            db.AddInParameter(dbCmd, "@Author", DbType.String, obj.Author);
            db.AddInParameter(dbCmd, "@Intro", DbType.String, obj.Intro);
            db.AddInParameter(dbCmd, "@CoverImage", DbType.String, obj.CoverImage);
            db.AddInParameter(dbCmd, "@C_C_ID", DbType.Int32, obj.C_C_ID);
            db.AddInParameter(dbCmd, "@LastUpdateChapter", DbType.String, obj.LastUpdateChapter);
            db.AddInParameter(dbCmd, "@LastUpdateTime", DbType.String, obj.LastUpdateTime);
            db.AddInParameter(dbCmd, "@CompleteState", DbType.Int32, obj.CompleteState);
            db.AddInParameter(dbCmd, "@LastChapterId", DbType.String, obj.LastChapterId);
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

        #region Proc_Fiction_SelectById
        public Fiction Fiction_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Fiction_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            Fiction obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = this.Obj2Model<Fiction>(reader);
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

        #region Proc_Fiction_SelectPage
        public List<Fiction> Fiction_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_Fiction_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<Fiction> list = new List<Fiction>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        Fiction obj = this.Obj2Model<Fiction>(reader);

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

        #region 小说分类

        #region Proc_ContentCate_Insert
        public int ContentCate_Insert(ContentCate obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ContentCate_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@CateName", DbType.String, obj.CateName);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int Id = (int)dbCmd.Parameters["@Id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #region Proc_ContentCate_DeleteById
        public int ContentCate_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ContentCate_DeleteById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
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

        #region Proc_ContentCate_UpdateById
        public int ContentCate_UpdateById(ContentCate obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ContentCate_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@CateName", DbType.String, obj.CateName);
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

        #region Proc_ContentCate_SelectById
        public ContentCate ContentCate_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ContentCate_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            ContentCate obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = this.Obj2Model<ContentCate>(reader);
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

        #region Proc_ContentCate_SelectPage
        public List<ContentCate> ContentCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ContentCate_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<ContentCate> list = new List<ContentCate>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        ContentCate obj = this.Obj2Model<ContentCate>(reader);

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

        #region 小说浏览日志

        #region Proc_ChapterVisits_Insert
        public int ChapterVisits_Insert(ChapterVisits obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ChapterVisits_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@IP", DbType.String, obj.IP);
            db.AddInParameter(dbCmd, "@OS", DbType.String, obj.OS);
            db.AddInParameter(dbCmd, "@Browser", DbType.String, obj.Browser);
            db.AddInParameter(dbCmd, "@Url", DbType.String, obj.Url);
            db.AddInParameter(dbCmd, "@Time", DbType.String, obj.Time);
            try
            {
                int returnValue = db.ExecuteNonQuery(dbCmd);
                int Id = (int)dbCmd.Parameters["@Id"].Value;
                return returnValue;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        #endregion


        #region Proc_ChapterVisits_DeleteById
        public int ChapterVisits_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ChapterVisits_DeleteById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
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

        #region Proc_ChapterVisits_UpdateById
        public int ChapterVisits_UpdateById(ChapterVisits obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ChapterVisits_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@IP", DbType.String, obj.IP);
            db.AddInParameter(dbCmd, "@OS", DbType.String, obj.OS);
            db.AddInParameter(dbCmd, "@Browser", DbType.String, obj.Browser);
            db.AddInParameter(dbCmd, "@Url", DbType.String, obj.Url);
            db.AddInParameter(dbCmd, "@Time", DbType.String, obj.Time);
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

        #region Proc_ChapterVisits_SelectById
        public ChapterVisits ChapterVisits_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ChapterVisits_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            ChapterVisits obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = this.Obj2Model<ChapterVisits>(reader);
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

        #region Proc_ChapterVisits_SelectPage
        public List<ChapterVisits> ChapterVisits_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ChapterVisits_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<ChapterVisits> list = new List<ChapterVisits>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        ChapterVisits obj = this.Obj2Model<ChapterVisits>(reader);

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
