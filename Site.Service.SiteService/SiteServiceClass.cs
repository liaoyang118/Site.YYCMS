using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.Service.SiteService.SiteServices;
using Site.Common;
using Site.Service.SiteService.Search;

namespace Site.Service.SiteService
{
    public class SiteServiceClass
    {
        #region 站点分类
        public static int Site_Cates_Insert(Site_Cates obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_Cates_DeleteByc_gid(string c_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_DeleteByc_gid(c_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_Cates_UpdateByc_gid(Site_Cates obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_UpdateByc_gid(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_Cates Site_Cates_SelectByc_gid(string c_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_SelectByc_gid(c_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_Cates Site_Cates_SelectBaseCateByc_gid(string c_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_SelectBaseCateByc_gid(c_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_Cates Site_Cates_SelectByc_id(int c_id)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Cates_SelectByc_id(c_id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static List<Site_Cates> Site_Cates_SelectPage(Site_CatesSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_Cates_SelectPageRequest request = new Site_Cates_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Site_Cates_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_Cates_SelectPageResult;
        }
        #endregion

        #region 站点页面

        public static int Site_CMSPage_Insert(Site_CMSPage obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSPage_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_CMSPage_DeleteByp_gid(string p_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSPage_DeleteByp_gid(p_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_CMSPage_UpdateByp_gid(Site_CMSPage obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSPage_UpdateByp_gid(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_CMSPage Site_CMSPage_SelectByp_gid(string p_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSPage_SelectByp_gid(p_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static List<Site_CMSPage> Site_CMSPage_SelectPage(Site_CMSPagesSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_CMSPage_SelectPageRequest request = new Site_CMSPage_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Site_CMSPage_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_CMSPage_SelectPageResult;
        }
        #endregion

        #region 页面区块

        public static int Site_CMSBlock_Insert(Site_CMSBlock obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSBlock_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_CMSBlock_DeleteByb_gid(string b_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSBlock_DeleteByb_gid(b_gid);
            (channel as IDisposable).Dispose();
            return result;
        }
        public static int Site_CMSBlock_UpdateByb_gid(Site_CMSBlock obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSBlock_UpdateByb_gid(obj);
            (channel as IDisposable).Dispose();
            return result;
        }
        public static Site_CMSBlock Site_CMSBlock_SelectByb_gid(string b_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSBlock_SelectByb_gid(b_gid);
            (channel as IDisposable).Dispose();
            return result;
        }
        public static List<Site_CMSBlock> Site_CMSBlock_SelectPage(Site_CMSBlocksSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_CMSBlock_SelectPageRequest request = new Site_CMSBlock_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Site_CMSBlock_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_CMSBlock_SelectPageResult;
        }

        #endregion

        #region 信息项

        public static int Site_CMSItem_Insert(Site_CMSItem obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSItem_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_CMSItem_DeleteByi_gid(string i_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSItem_DeleteByi_gid(i_gid);
            (channel as IDisposable).Dispose();
            return result;
        }
        public static int Site_CMSItem_UpdateByi_gid(Site_CMSItem obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSItem_UpdateByi_gid(obj);
            (channel as IDisposable).Dispose();
            return result;
        }
        public static Site_CMSItem Site_CMSItem_SelectByi_gid(string i_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSItem_SelectByi_gid(i_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_CMSItem Site_CMSItem_SelectByc_gidAndb_gid(string c_gid, string b_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_CMSItem_SelectByc_gidAndb_gid(c_gid, b_gid);
            (channel as IDisposable).Dispose();
            return result;
        }


        public static List<Site_CMSItem> Site_CMSItem_SelectPage(Site_CMSItemSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_CMSItem_SelectPageRequest request = new Site_CMSItem_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Site_CMSItem_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_CMSItem_SelectPageResult;
        }

        #endregion

        #region 站点内容

        public static int Site_Content_Insert(Site_Content obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Content_Insert(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_Content_DeleteByc_id(string c_id)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Content_DeleteByc_id(c_id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static int Site_Content_UpdateByc_id(Site_Content obj)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Content_UpdateByc_id(obj);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_Content Site_Content_SelectByc_id(string c_id)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Content_SelectByc_id(c_id);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static Site_Content Site_Content_SelectByc_gid(string c_gid)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            var result = channel.Site_Content_SelectByc_gid(c_gid);
            (channel as IDisposable).Dispose();
            return result;
        }

        public static List<Site_Content> Site_Content_SelectPage(Site_ContentSearchInfo search, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_Content_SelectPageRequest request = new Site_Content_SelectPageRequest()
            {
                cloumns = "*",
                orderBy = search.DefaultOrder,
                pageIndex = pageIndex,
                pageSize = pageSize,
                where = search.ToWhereString()
            };

            var result = channel.Site_Content_SelectPage(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_Content_SelectPageResult;
        }


        public static List<Site_Content> Site_Content_SelectPageByc_id(int cateId, int pageIndex, int pageSize, out int rowCount)
        {
            ISiteService channel = Entity.CreateChannel<ISiteService>(SiteEnum.SiteService.SiteService);
            Site_Content_SelectPageByc_idRequest request = new Site_Content_SelectPageByc_idRequest()
            {
                cateId = cateId,
                pageIndex = pageIndex,
                pageSize = pageSize
            };
            var result = channel.Site_Content_SelectPageByc_id(request);
            (channel as IDisposable).Dispose();

            rowCount = result.rowCount;
            return result.Site_Content_SelectPageByc_idResult;
        }

        #endregion
    }
}
