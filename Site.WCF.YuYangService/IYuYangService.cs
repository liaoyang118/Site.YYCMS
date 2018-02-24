using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Site.YuYangModel;

namespace Site.WCF.YuYangService
{
    [ServiceContract(Name = "IYuYangService", Namespace = "http://service.jsonyang.com")]
    public interface IYuYangService
    {
        #region 小说

        [OperationContract]
        int Fiction_Insert(Fiction obj);
        [OperationContract]
        int Fiction_DeleteById(int Id);
        [OperationContract]
        int Fiction_UpdateById(Fiction obj);
        [OperationContract]
        Fiction Fiction_SelectById(int Id);
        [OperationContract]
        List<Fiction> Fiction_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);
        #endregion


        #region 小说分类

        [OperationContract]
        int ContentCate_Insert(ContentCate obj);
        [OperationContract]
        int ContentCate_DeleteById(int Id);
        [OperationContract]
        int ContentCate_UpdateById(ContentCate obj);
        [OperationContract]
        ContentCate ContentCate_SelectById(int Id);
        [OperationContract]
        List<ContentCate> ContentCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);


        #endregion


        #region 小说日志


        [OperationContract]
        int ChapterVisits_Insert(ChapterVisits obj);
        [OperationContract]
        int ChapterVisits_DeleteById(int Id);
        [OperationContract]
        int ChapterVisits_UpdateById(ChapterVisits obj);
        [OperationContract]
        ChapterVisits ChapterVisits_SelectById(int Id);
        [OperationContract]
        List<ChapterVisits> ChapterVisits_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);

        #endregion
    }

}
