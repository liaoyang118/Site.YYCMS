﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Common
{
    public class SiteEnum
    {
        /// <summary>
        /// 站点WCF服务名称
        /// </summary>
        public enum SiteService
        {
            /// <summary>
            /// 后台系统服务
            /// </summary>
            SystemService = 1,

            /// <summary>
            /// 前台站点服务
            /// </summary>
            SiteService = 2,

            /// <summary>
            /// 上传服务
            /// </summary>
            UploadService = 3,

            /// <summary>
            /// 发布页面服务（默认主站点）
            /// </summary>
            PublishPageService = 4,

            /// <summary>
            /// 小说站点服务
            /// </summary>
            YuYangService = 5,

            /// <summary>
            /// 发布页面服务（小说站点）
            /// </summary>
            PublishXiaoShuoPageService = 6,



            /// <summary>
            /// 视频站点服务
            /// </summary>
            VideoService = 7,

            /// <summary>
            /// 发布页面服务（视频站点）
            /// </summary>
            PublishVideoPageService = 8,

            /// <summary>
            /// 视频站点上传服务
            /// </summary>
            VideoUploadService = 9
        }

        /// <summary>
        /// 系统账号 状态
        /// </summary>
        public enum SiteUserStatus
        {
            正常 = 1,
            无效 = 2
        }

        /// <summary>
        /// 新闻内容 分类类型
        /// </summary>
        public enum SiteCatesType
        {
            news = 1,
            image = 2
        }

        /// <summary>
        /// 站点名称，用来筛选对应站点的 站点页面,以及 获取站点发布页面的 基路径
        /// </summary>
        public enum SiteName
        {
            MainSite = 1,//主站点
            XiaoShuoSite = 2, //小说站
            VideoSite = 3, //591站点
        }

        /// <summary>
        /// 信息项的 状态
        /// </summary>
        public enum SiteItemStatus
        {
            [Description("red")]
            待审核 = 1,
            [Description("green")]
            正常 = 2,
            [Description("gray")]
            关闭 = 3,
            [Description("blue")]
            已发布 = 4
        }

        /// <summary>
        /// 基本状态 0 成功，1失败
        /// </summary>
        public enum BasicSuccessStatus
        {
            [Description("red")]
            失败 = 0,
            [Description("green")]
            成功 = 1
        }

        /// <summary>
        /// 基本状态 0无效 1有效
        /// </summary>
        public enum BasicStatus
        {
            [Description("red")]
            无效 = 0,
            [Description("green")]
            有效 = 1
        }

        /// <summary>
        /// WCF上传服务，文件保存路径的配置名称
        /// </summary>
        public enum SiteUploadConfigName
        {
            baseUpload,
            TestUpload
        }
    }
}
