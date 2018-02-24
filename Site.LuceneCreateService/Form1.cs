using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using CustomException;
using System.Web;
using System.Reflection;
using LuceneCreateService.LuceneClass;
using LuceneCreate;
using System.Threading;
using System.Diagnostics;

namespace LuceneCreateService
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            //窗体初始化
            InitConfig();
            Control.CheckForIllegalCrossThreadCalls = false;

        }



        Stopwatch _wc;
        //初始化配置
        private void InitConfig()
        {
            GetLucenePath();
            _wc = new Stopwatch();

        }

        private void GetLucenePath()
        {
            XmlDocument xd = new XmlDocument();
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.IgnoreComments = true;//忽略文档里面的注释
            string path = AppDomain.CurrentDomain.BaseDirectory + "\\LuceneConfig\\LuceneService.config";
            XmlReader reader = XmlReader.Create(path, settings);
            xd.Load(reader);
            reader.Close();

            XmlNodeList nodeList = xd.DocumentElement.ChildNodes;
            string _id = string.Empty;
            string _name = string.Empty;
            string _path = string.Empty;
            string _autostart = string.Empty;
            string _class = string.Empty;
            string _isStarted = string.Empty;

            try
            {
                foreach (XmlNode items in nodeList)
                {
                    _id = items.Attributes["id"].Value.ToString();
                    _name = items.Attributes["name"].Value.ToString();
                    _path = items.Attributes["path"].Value.ToString();
                    _autostart = items.Attributes["autostart"].Value.ToString();
                    _class = items.Attributes["class"].Value.ToString();
                    _isStarted = items.Attributes["isStarted"].Value.ToString();

                    this.dataGridView1.Rows.Add(_id, _name, _path, _autostart, _class, _isStarted);

                }
            }
            catch
            {
                throw new LuceneException("新建lucene任务的配置信息有误，可能是属性缺失");
            }
        }

        //启动
        private void btnLucene_Click(object sender, EventArgs e)
        {
            if (this.dataGridView1.SelectedRows.Count <= 0)
            {
                MessageBox.Show("请先选择要建立的lucene");
                return;
            }
            string _name = this.dataGridView1.SelectedRows[0].Cells["NAME"].Value.ToString();
            string _path = this.dataGridView1.SelectedRows[0].Cells["Path"].Value.ToString();
            string _autoStart = this.dataGridView1.SelectedRows[0].Cells["AutoStart"].Value.ToString();
            string _class = this.dataGridView1.SelectedRows[0].Cells["Class"].Value.ToString();
            string _isStarted = this.dataGridView1.SelectedRows[0].Cells["IsStarted"].Value.ToString();

            if (_isStarted == "1")
            {
                MessageBox.Show("该lucene任务已启动，请勿重复启动", "提示", MessageBoxButtons.OK);
                return;
            }
            else
            {
                this.dataGridView1.SelectedRows[0].Cells["IsStarted"].Value = 1;
            }

            Type t = Type.GetType("LuceneCreateService.LuceneClass." + _class);
            IBaseLucene bl = null;
            bl = (IBaseLucene)Activator.CreateInstance(t, true);

            //多线程，循环执行创建
            LuceneIntervalExcute(_name, bl);
        }

        /// <summary>
        /// 间隔执行
        /// </summary>
        private void LuceneIntervalExcute(string luceneName, IBaseLucene BL)
        {
            //使用匿名方法创建无参数，无返回值的 委托
            Thread t = new Thread(delegate()
            {
                ExcuteMethod(BL);
            });
            t.IsBackground = true;
            t.Name = luceneName;
            t.Start();
        }

        //线程方法
        private void ExcuteMethod(IBaseLucene BL)
        {
            List<string> adds;
            List<string> updates;
            List<string> error;

            while (Thread.CurrentThread.IsAlive)
            {
                _wc.Start();//计时
                BL.Execute(Thread.CurrentThread.Name, out adds, out updates, out error);
                _wc.Stop();

                TextLog.AppendText(this.textBox1, string.Format("{3}: 新增成功{0}，更行{1}，删除{2} 耗时:{4}ms \r\n", adds.Count, updates.Count, error.Count, Thread.CurrentThread.Name,_wc.ElapsedMilliseconds));

                _wc.Reset();
                Thread.Sleep(1000 * 5);
            }
        }
    }
}
