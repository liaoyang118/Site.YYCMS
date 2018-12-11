using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Site.VideoAccess;
using Site.VideoModel;

namespace Site.WCF.VideoService
{
    public class VideosService : IVideosService
    {
        #region 视频

        public int VideoInfo_DeleteById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoInfo_DeleteById(Id);
            }
        }

        public int VideoInfo_Insert(VideoInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoInfo_Insert(obj);
            }
        }

        public VideoInfo VideoInfo_SelectById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoInfo_SelectById(Id);
            }
        }

        public List<VideoInfo> VideoInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoInfo_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public int VideoInfo_UpdateById(VideoInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoInfo_UpdateById(obj);
            }
        }
        #endregion

        #region 视频分类

        public int VideoCate_Insert(VideoCate obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoCate_Insert(obj);
            }
        }

        public int VideoCate_DeleteByc_id(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoCate_DeleteByc_id(Id);
            }
        }


        public int VideoCate_UpdateByc_id(VideoCate obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoCate_UpdateByc_id(obj);
            }
        }


        public VideoCate VideoCate_SelectByc_id(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoCate_SelectByc_id(Id);
            }
        }

        public List<VideoCate> VideoCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.VideoCate_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        #endregion

        #region 邮件日志

        public int SendMailLog_Insert(SendMailLog obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.SendMailLog_Insert(obj);
            }
        }

        public int SendMailLog_DeleteById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.SendMailLog_DeleteById(Id);
            }
        }


        public int SendMailLog_UpdateById(SendMailLog obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.SendMailLog_UpdateById(obj);
            }
        }


        public SendMailLog SendMailLog_SelectById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.SendMailLog_SelectById(Id);
            }
        }

        public List<SendMailLog> SendMailLog_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.SendMailLog_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        #endregion

        #region 套餐

        public int ComboInfo_Insert(ComboInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_Insert(obj);
            }
        }

        public int ComboInfo_DeleteById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_DeleteById(Id);
            }
        }

        public int ComboInfo_UpdateById(ComboInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_UpdateById(obj);
            }
        }

        public ComboInfo ComboInfo_SelectById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_SelectById(Id);
            }
        }

        public List<ComboInfo> ComboInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public ComboInfo ComboInfo_SelectByc_id(string c_id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.ComboInfo_SelectByc_id(c_id);
            }
        }


        #endregion

        #region 访问日志

        public int UserVisitsInfo_Insert(UserVisitsInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.UserVisitsInfo_Insert(obj);
            }
        }

        public int UserVisitsInfo_DeleteById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.UserVisitsInfo_DeleteById(Id);
            }
        }


        public int UserVisitsInfo_UpdateById(UserVisitsInfo obj)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.UserVisitsInfo_UpdateById(obj);
            }
        }


        public UserVisitsInfo UserVisitsInfo_SelectById(int Id)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.UserVisitsInfo_SelectById(Id);
            }
        }

        public List<UserVisitsInfo> UserVisitsInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (VideosAccess access = new VideosAccess())
            {
                return access.UserVisitsInfo_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }




        #endregion
    }
}
