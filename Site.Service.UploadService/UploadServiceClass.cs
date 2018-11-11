using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.Service.UploadService.UploadService;
using Site.Common;

namespace Site.Service.UploadService
{
    public class UploadServiceClass
    {
        #region 图片上传

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="imgDatas">二进制数据</param>
        /// <param name="configName">文件保存路径配置名称</param>
        /// <param name="sizeConfig">缩略尺寸设置：尺寸设置 200*120*1 缩略为200*120 使用1号水印图片</param>
        /// <param name="imgExt">扩展名</param>
        /// <param name="thumbModel">"s",整图缩放;"c",裁剪; 默认为裁剪</param>
        /// <returns>原图地址(0)和缩略图地址(1)</returns>
        public static List<string> UploadImg(byte[] imgDatas, string configName, List<string> sizeConfig, string imgExt, string thumbModel = "c", SiteEnum.SiteService uploadService= SiteEnum.SiteService.UploadService)
        {
            IUploadService channel = Entity.CreateChannel<IUploadService>(uploadService);
            var result = channel.UploadImg(imgDatas, configName, sizeConfig, imgExt, thumbModel);
            (channel as IDisposable).Dispose();
            return result;
        }

        #endregion

        #region 上传视频

        /// <summary>
        /// 上传视频
        /// </summary>
        /// <param name="videoDatas">二进制数据</param>
        /// <param name="configName">文件保存路径配置名称</param>
        /// <param name="sizeConfig">缩略尺寸设置：尺寸设置 200*120*1 缩略为200*120 使用1号水印图片</param>
        /// <param name="imgExt">扩展名</param>
        /// <param name="thumbModel">"s",整图缩放;"c",裁剪; 默认为裁剪</param>
        /// <param name="totalSecond">视频总长度，默认剪切2min</param>
        /// <returns>原图地址(0)和缩略图地址(1)</returns>
        public static List<string> UploadVideo(byte[] videoDatas, string configName, List<string> sizeConfig, string videoExt, int totalSecond, string thumbModel = "c", SiteEnum.SiteService uploadService = SiteEnum.SiteService.UploadService)
        {
            IUploadService channel = Entity.CreateChannel<IUploadService>(uploadService);
            var result = channel.UploadVideo(videoDatas, configName, sizeConfig, videoExt, thumbModel, totalSecond);
            (channel as IDisposable).Dispose();
            return result;
        }

        #endregion
    }
}
