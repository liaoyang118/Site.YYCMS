using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace UploadService
{
    // 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码和配置文件中的接口名“IService1”。
    [ServiceContract(Name = "IUploadService", Namespace = "http://service.jsonyang.com")]
    public interface IUploadService
    {

        [OperationContract]
        List<string> UploadImg(byte[] imgDatas, string configName, List<string> sizeConfig, string imgExt, string thumbModel);

        [OperationContract]
        List<string> UploadVideo(byte[] videoDatas, string configName, List<string> sizeConfig, string videoExt, string thumbModel);

    }

}
