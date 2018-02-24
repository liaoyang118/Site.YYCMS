using Site.SiteModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Site.WCF.SiteService
{
    [ServiceContract(Name = "ISiteService", Namespace = "http://service.jsonyang.com")]
    public interface ISiteService
    {
        #region 站点分类

        [OperationContract]
        int Site_Cates_Insert(Site_Cates obj);
        [OperationContract]
        int Site_Cates_DeleteByc_gid(string c_gid);
        [OperationContract]
        int Site_Cates_UpdateByc_gid(Site_Cates obj);
        [OperationContract]
        Site_Cates Site_Cates_SelectByc_gid(string c_gid);

        [OperationContract]
        Site_Cates Site_Cates_SelectBaseCateByc_gid(string c_gid);

        [OperationContract]
        Site_Cates Site_Cates_SelectByc_id(int c_id);

        [OperationContract]
        List<Site_Cates> Site_Cates_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);

        #endregion

        #region 站点页面
        [OperationContract]
        int Site_CMSPage_Insert(Site_CMSPage obj);
        [OperationContract]
        int Site_CMSPage_DeleteByp_gid(string p_gid);
        [OperationContract]
        int Site_CMSPage_UpdateByp_gid(Site_CMSPage obj);
        [OperationContract]
        List<Site_CMSPage> Site_CMSPage_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);
        [OperationContract]
        Site_CMSPage Site_CMSPage_SelectByp_gid(string p_gid);

        #endregion

        #region 页面区块

        [OperationContract]
        int Site_CMSBlock_Insert(Site_CMSBlock obj);
        [OperationContract]
        int Site_CMSBlock_DeleteByb_gid(string b_gid);
        [OperationContract]
        int Site_CMSBlock_UpdateByb_gid(Site_CMSBlock obj);
        [OperationContract]
        Site_CMSBlock Site_CMSBlock_SelectByb_gid(string b_gid);
        [OperationContract]
        List<Site_CMSBlock> Site_CMSBlock_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount);

        #endregion

        #region 信息项

        [OperationContract]
        int Site_CMSItem_Insert(Site_CMSItem obj);

        [OperationContract]
        int Site_CMSItem_DeleteByi_gid(string i_gid);
        [OperationContract]
        int Site_CMSItem_UpdateByi_gid(Site_CMSItem obj);
        [OperationContract]
        Site_CMSItem Site_CMSItem_SelectByi_gid(string i_gid);

        [OperationContract]
        Site_CMSItem Site_CMSItem_SelectByc_gidAndb_gid(string c_gid, string b_gid);

        [OperationContract]
        List<Site_CMSItem> Site_CMSItem_SelectPage(string cloumns, string orderBy, string where, int pageIndex, int pageSize, out int rowCount);



        #endregion

        #region 站点内容

        [OperationContract]
        int Site_Content_Insert(Site_Content obj);

        [OperationContract]
        int Site_Content_DeleteByc_id(string c_id);

        [OperationContract]
        int Site_Content_UpdateByc_id(Site_Content obj);

        [OperationContract]
        Site_Content Site_Content_SelectByc_id(string c_id);

        [OperationContract]
        Site_Content Site_Content_SelectByc_gid(string c_gid);

        [OperationContract]
        List<Site_Content> Site_Content_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);

        [OperationContract]
        List<Site_Content> Site_Content_SelectPageByc_id(int cateId, int pageIndex, int pageSize, out int rowCount);

        #endregion

    }
}
