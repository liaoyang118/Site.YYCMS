using Site.Common;
using Site.Service.VideosService.VideosService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class VideoService
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
    }
}
