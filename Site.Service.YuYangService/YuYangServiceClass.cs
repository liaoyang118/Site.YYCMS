using System;
using System.Collections.Generic;
using Site.Common;
using Site.Service.YuYangService.Search;
using Site.Service.YuYangService.YuYangServices;

namespace Site.Service.YuYangService
{
    public class YuYangServiceClass
    {
        #region 小说
        public static int Fiction_Insert(Fiction obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.Fiction_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Fiction_DeleteById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.Fiction_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Fiction_UpdateById(Fiction obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.Fiction_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Fiction Fiction_SelectById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.Fiction_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<Fiction> Fiction_SelectPage(FictionSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            Fiction_SelectPageRequest request = new Fiction_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Fiction_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Fiction_SelectPageResult;
        }
        #endregion

        #region 小说分类

        public static int ContentCate_Insert(ContentCate obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ContentCate_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ContentCate_DeleteById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ContentCate_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ContentCate_UpdateById(ContentCate obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ContentCate_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static ContentCate ContentCate_SelectById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ContentCate_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<ContentCate> ContentCate_SelectPage(ContentCateSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            ContentCate_SelectPageRequest request = new ContentCate_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.ContentCate_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.ContentCate_SelectPageResult;
        }

        #endregion

        #region 小说日志
        public static int ChapterVisits_Insert(ChapterVisits obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ChapterVisits_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ChapterVisits_DeleteById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ChapterVisits_DeleteById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int ChapterVisits_UpdateById(ChapterVisits obj)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ChapterVisits_UpdateById(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static ChapterVisits ChapterVisits_SelectById(int Id)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            var result = channel.ChapterVisits_SelectById(Id);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<ChapterVisits> ChapterVisits_SelectPage(ChapterVisitsSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            IYuYangService channel = Entity.CreateChannel<IYuYangService>(SiteEnum.SiteService.YuYangService);
            ChapterVisits_SelectPageRequest request = new ChapterVisits_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.ChapterVisits_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.ChapterVisits_SelectPageResult;
        }


        #endregion
    }
}
