using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Web;
using CustomException;
using Lucene.Net.Store;
using Lucene.Net.Index;
using System.IO;
using Lucene.Net.Analysis.PanGu;

namespace LuceneCreate
{
    public class LuceneCreateHelp
    {

        IBaseLucene _baseLucene;
        List<int> _add;
        List<int> _update;
        List<int> _delete;


        public LuceneCreateHelp(IBaseLucene luceneClass, List<int> add, List<int> update, List<int> delete)
        {
            _baseLucene = luceneClass;
            List<int> _add = add;
            List<int> _update = update;
            List<int> _delete = delete;
        }

        public void CreateIndex(string pathConfigName, out List<string> adds, out List<string> updates, out List<string> error)
        {
            string indexPath = GetLucenePath(pathConfigName);
            if (string.IsNullOrEmpty(indexPath))
            {
                throw new LuceneException("Lucenes索引路径为空");
            }

            if (!System.IO.Directory.Exists(indexPath))
            {
                System.IO.Directory.CreateDirectory(indexPath);
            }
            ExcuteCreate(indexPath, out adds, out updates, out error);
        }

        //获取配置文件的路径
        private string GetLucenePath(string pathName)
        {
            XmlDocument xd = new XmlDocument();
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.IgnoreComments = true;//忽略文档里面的注释
            string path = AppDomain.CurrentDomain.BaseDirectory + "\\CreateConfig\\LuceneCreate.config";
            XmlReader reader = XmlReader.Create(path, settings);
            xd.Load(reader);
            reader.Close();

            XmlNodeList nodeList = xd.DocumentElement.ChildNodes;
            string indexPath = string.Empty;
            foreach (XmlNode items in nodeList)
            {
                if (items.Attributes["name"] != null && items.Attributes["name"].Value == pathName)
                {
                    indexPath = items.InnerText;
                    break;
                }

            }
            return indexPath;
        }


        //执行创建索引文件
        private void ExcuteCreate(string indexPath, out List<string> adds, out List<string> updates, out List<string> error)
        {

            //FSDirectory是用于对文件系统目录的操作的类
            FSDirectory directory = FSDirectory.Open(new DirectoryInfo(indexPath), new NativeFSLockFactory());
            //检查目录是否存在
            bool isUpdate = IndexReader.IndexExists(directory);

            if (isUpdate)
            {
                //目录存在则判断目录是否被锁定，被锁定就解锁
                if (IndexWriter.IsLocked(directory))
                {
                    IndexWriter.Unlock(directory);
                }
            }
            //IndexWriter主要用于写索引
            //方法签名：public IndexWriter(Directory d,Analyzer a,boolean create,IndexWriter.MaxFieldLength mfl)
            //第一个参数是 (Directory d)：索引的目录(前面的FSDirectory类的对象)
            //第二个参数是 (Analyzer a)：分析器(这里我们用盘古分词的分析器)
            //第三个参数是 (boolean create)：是否创建目录
            //第四个参数是 (IndexWriter.MaxFieldLength):最大长度
            IndexWriter writer = new IndexWriter(directory, new PanGuAnalyzer(), !isUpdate, IndexWriter.MaxFieldLength.UNLIMITED);


            //执行lucene方法
            _baseLucene.ExecuteLuceneMethod(this._add, this._update, this._update, out adds, out updates, out error);




            //要记得关闭
            writer.Close();
            directory.Close();

        }

    }
}
