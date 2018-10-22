using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.FFmpeg
{
    public class FFmpegTool
    {
        /// <summary>
        /// 截取图片 统一为jpg
        /// </summary>
        /// <param name="sourcePath">视频源地址，需要绝对路径</param>
        /// <param name="sizeConfig">尺寸设置 200*120 缩略为200*120</param>
        /// <param name="sourceExt">视频源 后缀 如：.MP4</param>
        /// <returns>缩略图地址 绝对路径</returns>
        public string CatchImg(string sourcePath, string sourceExt, string sizeConfig)
        {


            string ffmpeg = System.Web.HttpContext.Current.Server.MapPath("~\\ffmpeg\\ffmpeg.exe");
            string targetImagePath = string.Empty;

            //初始化 ffmpeg
            System.Diagnostics.ProcessStartInfo ImgstartInfo = new System.Diagnostics.ProcessStartInfo(ffmpeg);
            ImgstartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;

            sizeConfig = sizeConfig.Replace("*", "x");
            targetImagePath = sourcePath.Replace(sourceExt, string.Format("_{0}.jpg", sizeConfig));
            ImgstartInfo.Arguments = "   -i   " + sourcePath + "  -y  -f  image2 -t 0.001 -s   " + sizeConfig + " " + targetImagePath;

            try
            {
                System.Diagnostics.Process.Start(ImgstartInfo);
            }
            catch (Exception e)
            {
                targetImagePath = "截图错误" + e.Message;
            }


            return targetImagePath;
        }
    }
}
