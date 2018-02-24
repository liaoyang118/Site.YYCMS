using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Web;
using System.Reflection;
using Memcached.ClientLibrary;

namespace Memcached
{
    public class MemcacheHelp
    {
        #region 1.0 初始化配置

        /// <summary>
        /// 缓存权重和缓存服务器地址
        /// </summary>
        static List<int> w = null;
        static List<string> s = null;

        //缓存客户端
        static MemcachedClient mc = null;

        static MemcacheHelp()
        {
            GetMemcachedServersConfig();
            if (w.Count > 0 && s.Count > 0)
            {
                InitMemcached();
                mc = new MemcachedClient();
                mc.EnableCompression = true;// 设置压缩模式
                mc.CompressionThreshold = 1024 * 1024;//如果超过1MB 压缩数据
            }
        }

        /// <summary>
        /// 读取配置文件获取缓存服务器和缓存权重
        /// </summary>
        /// <returns></returns>
        private static void GetMemcachedServersConfig()
        {
            w = new List<int>();
            s = new List<string>();

            XmlDocument xd = new XmlDocument();
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.IgnoreComments = true;//忽略文档里面的注释
            string path = System.Web.HttpContext.Current.Server.MapPath(@"~\\bin\\Memcache.config");
            XmlReader reader = XmlReader.Create(path, settings);
            xd.Load(reader);
            reader.Close();

            XmlNodeList nodeList = xd.DocumentElement.ChildNodes;
            foreach (XmlNode items in nodeList)
            {

                s.Add(items.SelectNodes("serverIp").Item(0).InnerText);
                w.Add(Convert.ToInt32(items.SelectNodes("weight").Item(0).InnerText));
            }
        }


        /// <summary>
        /// 初始化Memcached
        /// </summary>
        private static void InitMemcached()
        {
            // 初始化连接池
            try
            {
                // 从连接池获取一个连接实例
                SockIOPool pool = SockIOPool.GetInstance();
                //设置服务器列表
                pool.SetServers(s.ToArray());

                //设置服务器负载量
                pool.SetWeights(w.ToArray());

                //初始连接数
                pool.InitConnections = 3;
                //最小连接数 3
                pool.MinConnections = 3;
                //最大连接数 50
                pool.MaxConnections = 50;
                // 连接超时 时间
                pool.SocketConnectTimeout = 1000;
                //设置 读取 超时3秒钟
                pool.SocketTimeout = 3000;
                // 设置主线程睡眠时间，每隔30秒醒来
                pool.MaintenanceSleep = 30;
                //服务器失效转移
                pool.Failover = true;

                // 关闭nagle算法
                pool.Nagle = false;
                pool.Initialize();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        #endregion

        #region 1.1 缓存操作
        /// <summary>
        /// 缓存
        /// </summary>
        /// <param name="key">key</param>
        /// <param name="value">value</param>
        /// <param name="expiryMin">过期时间：单位分钟</param>
        /// <returns></returns>
        public static bool Set(string key, object value, int expiryMin)
        {
            DateTime expiry = DateTime.Now.AddMinutes(expiryMin);
            return mc.Set(key, value, expiry);
        }

        /// <summary>
        /// 取值泛型
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public static T Get<T>(string key)
        {
            if (mc.KeyExists(key))
            {
                return (T)mc.Get(key);
            }
            else
            {
                return default(T);
            }
        }

        /// <summary>
        /// 取值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static object Get(string key)
        {
            return mc.Get(key);
        }

        public static bool Clear(string key)
        {
            if (mc.KeyExists(key))
            {
                return mc.Delete(key);
            }
            return false;
        }

        #endregion

    }

}
