using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Site.SiteModel;
using Site.SiteAccess;

namespace Site.WCF.SiteService
{
    [ServiceBehavior(Name = "SiteService", Namespace = "http://service.jsonyang.com")]
    public class SiteService : ISiteService
    {
        #region 站点分类
        public int Site_Cates_Insert(Site_Cates obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_Insert(obj);
            }
        }

        public int Site_Cates_DeleteByc_gid(string c_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_DeleteByc_gid(c_gid);
            }
        }

        public int Site_Cates_UpdateByc_gid(Site_Cates obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_UpdateByc_gid(obj);
            }
        }

        public Site_Cates Site_Cates_SelectByc_gid(string c_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_SelectByc_gid(c_gid);
            }
        }

        public Site_Cates Site_Cates_SelectBaseCateByc_gid(string c_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_SelectBaseCateByc_gid(c_gid);
            }
        }

        public Site_Cates Site_Cates_SelectByc_id(int c_id)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_SelectByc_id(c_id);
            }

        }

        public List<Site_Cates> Site_Cates_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_Cates_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }
        #endregion

        #region 站点页面
        public int Site_CMSPage_Insert(Site_CMSPage obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSPage_Insert(obj);
            }
        }

        public int Site_CMSPage_DeleteByp_gid(string p_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSPage_DeleteByp_gid(p_gid);
            }
        }

        public int Site_CMSPage_UpdateByp_gid(Site_CMSPage obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSPage_UpdateByp_gid(obj);
            }
        }

        public Site_CMSPage Site_CMSPage_SelectByp_gid(string p_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSPage_SelectByp_gid(p_gid);
            }
        }

        public List<Site_CMSPage> Site_CMSPage_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSPage_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }


        #endregion

        #region 页面区块
        public int Site_CMSBlock_Insert(Site_CMSBlock obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSBlock_Insert(obj);
            }
        }

        public int Site_CMSBlock_DeleteByb_gid(string b_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSBlock_DeleteByb_gid(b_gid);
            }
        }

        public int Site_CMSBlock_UpdateByb_gid(Site_CMSBlock obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSBlock_UpdateByb_gid(obj);
            }
        }

        public Site_CMSBlock Site_CMSBlock_SelectByb_gid(string b_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSBlock_SelectByb_gid(b_gid);
            }
        }

        public List<Site_CMSBlock> Site_CMSBlock_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSBlock_SelectPage(cloumns, orderBy, where, pageIndex, pageSize, out rowCount);
            }
        }
        #endregion

        #region 信息项


        public int Site_CMSItem_Insert(Site_CMSItem obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_Insert(obj);
            }
        }

        public int Site_CMSItem_DeleteByi_gid(string i_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_DeleteByi_gid(i_gid);
            }
        }

        public int Site_CMSItem_UpdateByi_gid(Site_CMSItem obj)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_UpdateByi_gid(obj);
            }
        }

        public Site_CMSItem Site_CMSItem_SelectByi_gid(string i_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_SelectByi_gid(i_gid);
            }
        }

        public Site_CMSItem Site_CMSItem_SelectByc_gidAndb_gid(string c_gid, string b_gid)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_SelectByc_gidAndb_gid(c_gid, b_gid);
            }
        }

        public List<Site_CMSItem> Site_CMSItem_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount)
        {
            using (SiteCatesAccess access = new SiteCatesAccess())
            {
                return access.Site_CMSItem_SelectPage(cloumns, orderBy, where, pageIndex, pageSize, out rowCount);
            }
        }

        #endregion

        #region 站点内容
        public int Site_Content_Insert(Site_Content obj)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_Insert(obj);
            }
        }

        public int Site_Content_DeleteByc_id(string c_id)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_DeleteByc_id(c_id);
            }
        }

        public int Site_Content_UpdateByc_id(Site_Content obj)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_UpdateByc_id(obj);
            }
        }

        public Site_Content Site_Content_SelectByc_id(string c_id)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_SelectByc_id(c_id);
            }
        }

        public Site_Content Site_Content_SelectByc_gid(string c_gid)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_SelectByc_gid(c_gid);
            }
        }

        public List<Site_Content> Site_Content_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public List<Site_Content> Site_Content_SelectPageByc_id(int cateId, int pageIndex, int pageSize, out int rowCount)
        {
            using (SiteContentAccesss access = new SiteContentAccesss())
            {
                return access.Site_Content_SelectPageByc_id(cateId, pageIndex, pageSize, out rowCount);
            }
        }


        #endregion
    }
}
