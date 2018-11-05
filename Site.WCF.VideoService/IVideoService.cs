using Site.VideoModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Site.WCF.VideoService
{
    [ServiceContract(Name = "IVideosService", Namespace = "http://service.jsonyang.com")]
    public interface IVideosService
    {
        #region 视频

        [OperationContract]
        int VideoInfo_Insert(VideoInfo obj);

        [OperationContract]
        int VideoInfo_DeleteById(int Id);

        [OperationContract]
        int VideoInfo_UpdateById(VideoInfo obj);

        [OperationContract]
        List<VideoInfo> VideoInfo_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);

        [OperationContract]
        VideoInfo VideoInfo_SelectById(int Id);

        #endregion

        #region 视频分类

        [OperationContract]
        int VideoCate_Insert(VideoCate obj);

        [OperationContract]
        int VideoCate_DeleteByc_id(int Id);

        [OperationContract]
        int VideoCate_UpdateByc_id(VideoCate obj);

        [OperationContract]
        List<VideoCate> VideoCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount);

        [OperationContract]
        VideoCate VideoCate_SelectByc_id(int Id);

        #endregion
    }


}
