using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LuceneCreate;

namespace LuceneCreateService.LuceneClass
{
    public class TestLucene : IBaseLucene
    {
        public void Execute(string pathConfigName, out List<string> adds, out List<string> updates, out List<string> error)
        {
            //获取数据，执行创建
            List<int> add = new List<int>() { 1, 2, 3, 4, 5 };
            List<int> update = new List<int>() { 1, 2, 3, 4, 5 };
            List<int> delete = new List<int>() { 1, 2, 3, 4, 5 };


            LuceneCreateHelp lch = new LuceneCreateHelp(this, add, update, delete);
            lch.CreateIndex(pathConfigName, out adds, out updates, out error);
        }


        /// <summary>
        /// 执行 lucene 文档的创建，document
        /// </summary>
        /// <param name="add"></param>
        /// <param name="update"></param>
        /// <param name="delete"></param>
        /// <param name="adds"></param>
        /// <param name="updates"></param>
        /// <param name="error"></param>
        public void ExecuteLuceneMethod(List<int> add, List<int> update, List<int> delete, out List<string> adds, out List<string> updates, out List<string> error)
        {
            adds = new List<string>() { "1" };
            updates = new List<string>() { "1" };
            error = new List<string>() { "1" };

        }

    }
}
