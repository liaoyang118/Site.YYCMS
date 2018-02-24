using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.IO;

namespace Site.WCF.PublishPageService
{
    // 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码、svc 和配置文件中的类名“Service1”。
    // 注意: 为了启动 WCF 测试客户端以测试此服务，请在解决方案资源管理器中选择 Service1.svc 或 Service1.svc.cs，然后开始调试。
    [ServiceBehavior(Name = "PublishPageService", Namespace = "http://service.jsonyang.com")]
    public class PublishPageService : IPublishPageService
    {
        public string PublishPage(string relationPath, string html)
        {
            string result = string.Empty;
            try
            {
                string pageBasePath = System.Configuration.ConfigurationManager.AppSettings["PageBasePath"].ToString();
                string path = string.Format("{0}\\{1}", pageBasePath, relationPath);
                if (!Directory.Exists(pageBasePath))
                {
                    result = "不存在配置的站点文件目录";
                }

                //判断是否存在最后一级视图文件夹目录，没有则创建
                int _index = path.LastIndexOf(@"\");
                string directoryPath = path.Substring(0, _index);
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }


                using (StreamWriter sw = new StreamWriter(path, false, Encoding.UTF8))
                {
                    sw.Write(html);
                }
            }
            catch (Exception e)
            {
                result = string.Format("服务器名称:{0},发布页面错误：{1}", Dns.GetHostName(), e.Message);
            }

            return result;

        }
    }
}
