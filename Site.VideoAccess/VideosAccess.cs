using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.VideoModel;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Reflection;

namespace Site.VideoAccess
{
    public class VideosAccess : IDisposable
    {
        Database db;

        DatabaseProviderFactory factory = new DatabaseProviderFactory();//6.0 创建方式
        //6.0 版本需要设置数据提供工厂
        //DatabaseFactory.SetDatabaseProviderFactory(factory, false);

        #region IDisposable 实现
        public VideosAccess(string configName)
        {
            //db = DatabaseFactory.CreateDatabase(configName); 5.0 创建方式
            db = factory.Create(configName);
        }

        public VideosAccess()
        {
            //db = DatabaseFactory.CreateDatabase("Video"); 5.0 创建方式
            db = factory.Create("Video");
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
        ~VideosAccess()
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
            db.AddInParameter(dbCmd, "@v_min_playSrc", DbType.String, obj.v_min_playSrc);
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
            db.AddInParameter(dbCmd, "@v_min_playSrc", DbType.String, obj.v_min_playSrc);
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

        #region 分类

        #region Proc_VideoCate_Insert
        public int VideoCate_Insert(VideoCate obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoCate_Insert");
            db.AddInParameter(dbCmd, "@c_name", DbType.String, obj.c_name);
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

        #region Proc_VideoCate_DeleteByc_id
        public int VideoCate_DeleteByc_id(int c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoCate_DeleteByc_id");
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


        #region Proc_VideoCate_UpdateByc_id
        public int VideoCate_UpdateByc_id(VideoCate obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoCate_UpdateByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, obj.c_id);
            db.AddInParameter(dbCmd, "@c_name", DbType.String, obj.c_name);
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

        #region Proc_VideoCate_SelectPage
        public List<VideoCate> VideoCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoCate_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<VideoCate> list = new List<VideoCate>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        VideoCate obj = Obj2Model<VideoCate>(reader);

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

        #region Proc_VideoCate_SelectByc_id
        public VideoCate VideoCate_SelectByc_id(int c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_VideoCate_SelectByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.Int32, c_id);
            VideoCate obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<VideoCate>(reader);
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

        #region 邮件日志

        #region Proc_SendMailLog_Insert
        public int SendMailLog_Insert(SendMailLog obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SendMailLog_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@Email", DbType.String, obj.Email);
            db.AddInParameter(dbCmd, "@Title", DbType.String, obj.Title);
            db.AddInParameter(dbCmd, "@SendTime", DbType.String, obj.SendTime);
            db.AddInParameter(dbCmd, "@SendContent", DbType.String, obj.SendContent);
            db.AddInParameter(dbCmd, "@IsSuccess", DbType.Boolean, obj.IsSuccess);
            db.AddInParameter(dbCmd, "@Remark", DbType.String, obj.Remark);
            db.AddInParameter(dbCmd, "@CreateTime", DbType.String, obj.CreateTime);
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

        #region Proc_SendMailLog_DeleteById
        public int SendMailLog_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SendMailLog_DeleteById");
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

        #region Proc_SendMailLog_UpdateById
        public int SendMailLog_UpdateById(SendMailLog obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SendMailLog_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@Email", DbType.String, obj.Email);
            db.AddInParameter(dbCmd, "@Title", DbType.String, obj.Title);
            db.AddInParameter(dbCmd, "@SendTime", DbType.String, obj.SendTime);
            db.AddInParameter(dbCmd, "@SendContent", DbType.String, obj.SendContent);
            db.AddInParameter(dbCmd, "@IsSuccess", DbType.Boolean, obj.IsSuccess);
            db.AddInParameter(dbCmd, "@Remark", DbType.String, obj.Remark);
            db.AddInParameter(dbCmd, "@CreateTime", DbType.String, obj.CreateTime);
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

        #region Proc_SendMailLog_SelectById
        public SendMailLog SendMailLog_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SendMailLog_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            SendMailLog obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<SendMailLog>(reader);
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

        #region Proc_SendMailLog_SelectPage
        public List<SendMailLog> SendMailLog_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_SendMailLog_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<SendMailLog> list = new List<SendMailLog>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        SendMailLog obj = Obj2Model<SendMailLog>(reader);

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

        #region 套餐设置

        #region Proc_ComboInfo_Insert
        public int ComboInfo_Insert(ComboInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@c_id", DbType.String, obj.c_id);
            db.AddInParameter(dbCmd, "@c_title", DbType.String, obj.c_title);
            db.AddInParameter(dbCmd, "@c_intro", DbType.String, obj.c_intro);
            db.AddInParameter(dbCmd, "@c_num", DbType.Int32, obj.c_num);
            db.AddInParameter(dbCmd, "@c_days", DbType.Int32, obj.c_days);
            db.AddInParameter(dbCmd, "@c_status", DbType.Int32, obj.c_status);
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


        #region Proc_ComboInfo_DeleteById
        public int ComboInfo_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_DeleteById");
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

        #region Proc_ComboInfo_UpdateById
        public int ComboInfo_UpdateById(ComboInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@c_id", DbType.String, obj.c_id);
            db.AddInParameter(dbCmd, "@c_title", DbType.String, obj.c_title);
            db.AddInParameter(dbCmd, "@c_intro", DbType.String, obj.c_intro);
            db.AddInParameter(dbCmd, "@c_num", DbType.Int32, obj.c_num);
            db.AddInParameter(dbCmd, "@c_days", DbType.Int32, obj.c_days);
            db.AddInParameter(dbCmd, "@c_status", DbType.Int32, obj.c_status);
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

        #region Proc_ComboInfo_SelectById
        public ComboInfo ComboInfo_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            ComboInfo obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<ComboInfo>(reader);
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

        #region Proc_ComboInfo_SelectPage
        public List<ComboInfo> ComboInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<ComboInfo> list = new List<ComboInfo>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        ComboInfo obj = Obj2Model<ComboInfo>(reader);

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

        #region Proc_ComboInfo_SelectByc_id
        public ComboInfo ComboInfo_SelectByc_id(string c_id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_ComboInfo_SelectByc_id");
            db.AddInParameter(dbCmd, "@c_id", DbType.String, c_id);
            ComboInfo obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        obj = Obj2Model<ComboInfo>(reader);
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

        #region 访问日志

        #region Proc_UserVisitsInfo_Insert
        public int UserVisitsInfo_Insert(UserVisitsInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_UserVisitsInfo_Insert");
            db.AddOutParameter(dbCmd, "@Id", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@u_id", DbType.String, obj.u_id);
            db.AddInParameter(dbCmd, "@v_id", DbType.String, obj.v_id);
            db.AddInParameter(dbCmd, "@v_ip", DbType.String, obj.v_ip);
            db.AddInParameter(dbCmd, "@platform", DbType.String, obj.platform);
            db.AddInParameter(dbCmd, "@v_url", DbType.String, obj.v_url);
            db.AddInParameter(dbCmd, "@v_time", DbType.String, obj.v_time);
            db.AddInParameter(dbCmd, "@v_browser", DbType.String, obj.v_browser);
            db.AddInParameter(dbCmd, "@v_os", DbType.String, obj.v_os);
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


        #region Proc_UserVisitsInfo_DeleteById
        public int UserVisitsInfo_DeleteById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_UserVisitsInfo_DeleteById");
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

        #region Proc_UserVisitsInfo_UpdateById
        public int UserVisitsInfo_UpdateById(UserVisitsInfo obj)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_UserVisitsInfo_UpdateById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, obj.Id);
            db.AddInParameter(dbCmd, "@u_id", DbType.String, obj.u_id);
            db.AddInParameter(dbCmd, "@v_id", DbType.String, obj.v_id);
            db.AddInParameter(dbCmd, "@v_ip", DbType.String, obj.v_ip);
            db.AddInParameter(dbCmd, "@platform", DbType.String, obj.platform);
            db.AddInParameter(dbCmd, "@v_url", DbType.String, obj.v_url);
            db.AddInParameter(dbCmd, "@v_time", DbType.String, obj.v_time);
            db.AddInParameter(dbCmd, "@v_browser", DbType.String, obj.v_browser);
            db.AddInParameter(dbCmd, "@v_os", DbType.String, obj.v_os);
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

        #region Proc_UserVisitsInfo_SelectById
        public UserVisitsInfo UserVisitsInfo_SelectById(int Id)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_UserVisitsInfo_SelectById");
            db.AddInParameter(dbCmd, "@Id", DbType.Int32, Id);
            UserVisitsInfo obj = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        obj = Obj2Model<UserVisitsInfo>(reader);
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

        #region Proc_UserVisitsInfo_SelectPage
        public List<UserVisitsInfo> UserVisitsInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            DbCommand dbCmd = db.GetStoredProcCommand("Proc_UserVisitsInfo_SelectPage");
            db.AddOutParameter(dbCmd, "@rowCount", DbType.Int32, 4);
            db.AddInParameter(dbCmd, "@cloumns", DbType.String, cloumns);
            db.AddInParameter(dbCmd, "@pageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(dbCmd, "@pageSize", DbType.Int32, pageSize);
            db.AddInParameter(dbCmd, "@orderBy", DbType.String, orderBy);
            db.AddInParameter(dbCmd, "@where", DbType.String, where);
            List<UserVisitsInfo> list = new List<UserVisitsInfo>();
            try
            {
                using (IDataReader reader = db.ExecuteReader(dbCmd))
                {
                    while (reader.Read())
                    {
                        //属性赋值
                        UserVisitsInfo obj = Obj2Model<UserVisitsInfo>(reader);

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
