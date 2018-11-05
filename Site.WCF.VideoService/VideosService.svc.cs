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
    }
}
