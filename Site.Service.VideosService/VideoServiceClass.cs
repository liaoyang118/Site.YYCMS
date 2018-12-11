using Site.Common;
using Site.Service.VideosService.VideosService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class VideoServiceClass
    {
        #region 视频

        public static int VideoInfo_DeleteById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoInfo_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int VideoInfo_Insert(VideoInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoInfo_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static VideoInfo VideoInfo_SelectById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoInfo_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static List<VideoInfo> VideoInfo_SelectPage(VideoSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            VideoInfo_SelectPageRequest request = new VideoInfo_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.VideoInfo_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.VideoInfo_SelectPageResult;
        }

        public static int VideoInfo_UpdateById(VideoInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoInfo_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }


        #endregion

        #region 视频分类


        public static int VideoCate_Insert(VideoCate obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoCate_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int VideoCate_DeleteByc_id(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoCate_DeleteByc_id(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static int VideoCate_UpdateByc_id(VideoCate obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoCate_UpdateByc_id(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static VideoCate VideoCate_SelectByc_id(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.VideoCate_SelectByc_id(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<VideoCate> VideoCate_SelectPage(VideoCateSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            VideoCate_SelectPageRequest request = new VideoCate_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.VideoCate_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.VideoCate_SelectPageResult;
        }



        #endregion

        #region 邮件日志

        public static int SendMailLog_Insert(SendMailLog obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.SendMailLog_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int SendMailLog_DeleteById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.SendMailLog_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static int SendMailLog_UpdateById(SendMailLog obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.SendMailLog_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static SendMailLog SendMailLog_SelectById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.SendMailLog_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<SendMailLog> SendMailLog_SelectPage(SendMailLogSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            SendMailLog_SelectPageRequest request = new SendMailLog_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.SendMailLog_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.SendMailLog_SelectPageResult;
        }


        #endregion

        #region 套餐

        public static int ComboInfo_Insert(ComboInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.ComboInfo_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ComboInfo_DeleteById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.ComboInfo_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ComboInfo_UpdateById(ComboInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.ComboInfo_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static ComboInfo ComboInfo_SelectById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.ComboInfo_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static ComboInfo ComboInfo_SelectByc_id(string c_id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.ComboInfo_SelectByc_id(c_id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<ComboInfo> ComboInfo_SelectPage(ComboInfoSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            ComboInfo_SelectPageRequest request = new ComboInfo_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.ComboInfo_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.ComboInfo_SelectPageResult;
        }


        #endregion

        #region 访问日志

        public static int UserVisitsInfo_Insert(UserVisitsInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.UserVisitsInfo_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int UserVisitsInfo_DeleteById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.UserVisitsInfo_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int UserVisitsInfo_UpdateById(UserVisitsInfo obj)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.UserVisitsInfo_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static UserVisitsInfo UserVisitsInfo_SelectById(int Id)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            var result = channel.UserVisitsInfo_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static List<UserVisitsInfo> UserVisitsInfo_SelectPage(UserVisitsInfoSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IVideosService channel = Entity.CreateChannel<IVideosService>(SiteEnum.SiteService.VideoService);
            UserVisitsInfo_SelectPageRequest request = new UserVisitsInfo_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.UserVisitsInfo_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.UserVisitsInfo_SelectPageResult;
        }



        #endregion
    }
}
