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
using Site.VideoModel;

namespace Site.YuYangAccess
{
    public class VideoAccess : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);

        #region IDisposable 实现
        public VideoAccess(string configName)
        {
            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public VideoAccess()
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
        ~VideoAccess()
        {
            Dispose(false);
        }

        #endregion

        #region 视频

        #region Proc_VideoInfo_Insert
        public int VideoInfo_Insert(VideoInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoInfo_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@v_id", DbType.String, obj.v_id);
            db.AddInParameter(dbCmd, "@v_c_id", DbType.Int32, obj.v_c_id);
            db.AddInParameter(dbCmd, "@v_c_name", DbType.String, obj.v_c_name);
            db.AddInParameter(dbCmd, "@v_titile", DbType.String, obj.v_titile);
            db.AddInParameter(dbCmd, "@v_intro", DbType.String, obj.v_intro);
            db.AddInParameter(dbCmd, "@v_coverImgSrc", DbType.String, obj.v_coverImgSrc);
            db.AddInParameter(dbCmd, "@v_playSrc", DbType.String, obj.v_playSrc);
            db.AddInParameter(dbCmd, "@v_timeLength", DbType.String, obj.v_timeLength);
            db.AddInParameter(dbCmd, "@v_createTime", DbType.String, obj.v_createTime);
            db.AddInParameter(dbCmd, "@v_status", DbType.Int32, obj.v_status);
            db.AddInParameter(dbCmd, "@v_totalSecond", DbType.Int32, obj.v_totalSecond);
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

        #region Proc_VideoInfo_DeleteById
        public int VideoInfo_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoInfo_DeleteById");
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

        #region Proc_VideoInfo_UpdateById
        public int VideoInfo_UpdateById(VideoInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoInfo_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@v_id", DbType.String, obj.v_id);
            db.AddInParameter(dbCmd, "@v_c_id", DbType.Int32, obj.v_c_id);
            db.AddInParameter(dbCmd, "@v_c_name", DbType.String, obj.v_c_name);
            db.AddInParameter(dbCmd, "@v_titile", DbType.String, obj.v_titile);
            db.AddInParameter(dbCmd, "@v_intro", DbType.String, obj.v_intro);
            db.AddInParameter(dbCmd, "@v_coverImgSrc", DbType.String, obj.v_coverImgSrc);
            db.AddInParameter(dbCmd, "@v_playSrc", DbType.String, obj.v_playSrc);
            db.AddInParameter(dbCmd, "@v_timeLength", DbType.String, obj.v_timeLength);
            db.AddInParameter(dbCmd, "@v_createTime", DbType.String, obj.v_createTime);
            db.AddInParameter(dbCmd, "@v_status", DbType.Int32, obj.v_status);
            db.AddInParameter(dbCmd, "@v_totalSecond", DbType.Int32, obj.v_totalSecond);
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

        #region Proc_VideoInfo_SelectPage
        public List<VideoInfo> VideoInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoInfo_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<VideoInfo> list = new List<VideoInfo>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        VideoInfo obj = Obj2Model<VideoInfo>(reader);

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

        #region Proc_VideoInfo_SelectById
        public VideoInfo VideoInfo_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoInfo_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            VideoInfo obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<VideoInfo>(reader);

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
