﻿using System;
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
        public string CatchImg(string sourcePath, string sourceExt, string sizeConfig, int totalSecond, string configPath = "")
        {
            string targetImagePath = string.Empty;
            string ffmpeg = string.Empty;

            if (!string.IsNullOrEmpty(configPath))
            {
                ffmpeg = configPath;
            }
            else
            {
                ffmpeg = System.Web.HttpContext.Current.Server.MapPath("~\\ffmpeg\\ffmpeg.exe");
            }

            //剪切视频
            bool isSuccess = ShearVideo(ref sourcePath, sourceExt, totalSecond, configPath);
            if (isSuccess)
            {
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
                    throw new Exception("截图错误:" + e.Message);
                }
                targetImagePath = sourcePath;
            }
            else
            {
                throw new Exception("剪切错误:" + sourcePath);
            }



            return targetImagePath;
        }



        /// <summary>
        /// 视频剪辑，剪切开头多长
        /// </summary>
        /// <param name="sourcePath">视频源地址，需要绝对路径</param>
        /// <param name="sizeConfig">尺寸设置 200*120 缩略为200*120</param>
        /// <param name="sourceExt">视频源 后缀 如：.MP4</param>
        /// <param name="totalSecond">视频总长度 秒</param>
        /// <param name="configPath"></param>
        /// <returns></returns>
        public bool ShearVideo(ref string sourcePath, string sourceExt, int totalSecond, string configPath = "")
        {

            string ffmpeg = string.Empty;
            if (!string.IsNullOrEmpty(configPath))
            {
                ffmpeg = configPath;
            }
            else
            {
                ffmpeg = System.Web.HttpContext.Current.Server.MapPath("~\\ffmpeg\\ffmpeg.exe");
            }
            string newVideoPath = string.Empty;
            bool isSuccess = true;

            //初始化 ffmpeg
            System.Diagnostics.ProcessStartInfo ImgstartInfo = new System.Diagnostics.ProcessStartInfo(ffmpeg);
            ImgstartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;

            newVideoPath = sourcePath.Replace(".", string.Format("_{0}.", "new"));
            //ffmpeg  -ss 10 -t 15 -i test.mp4 -codec copy cut.mp4
            string arg = string.Format("-ss {0} -t {1} -i {2} -codec copy {3}", 120, totalSecond - 120, sourcePath, newVideoPath);
            ImgstartInfo.Arguments = arg;

            try
            {
                System.Diagnostics.Process.Start(ImgstartInfo);
            }
            catch (Exception e)
            {
                newVideoPath = "剪切错误" + e.Message;
                isSuccess = false;
            }

            sourcePath = newVideoPath;

            return isSuccess;
        }

    }
}
