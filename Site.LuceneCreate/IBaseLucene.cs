using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LuceneCreate
{
    public interface IBaseLucene
    {

        /// <summary>
        /// 执行体，主要用来获取lucene 日志，来执行
        /// </summary>
        /// <param name="pathConfigName"></param>
        /// <param name="adds"></param>
        /// <param name="updates"></param>
        /// <param name="error"></param>
        void Execute(string pathConfigName, out List<string> adds, out List<string> updates, out List<string> error);


        /// <summary>
        /// 
        /// </summary>
        /// <param name="add">需要新增的</param>
        /// <param name="update">需啊哟更新的</param>
        /// <param name="delete">需要删除的</param>
        /// <param name="adds">已经新增的</param>
        /// <param name="updates">已经更新的</param>
        /// <param name="error">已经错误的</param>
        void ExecuteLuceneMethod(List<int> add, List<int> update, List<int> delete, out List<string> adds, out List<string> updates, out List<string> error);


        

    }
}
