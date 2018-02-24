using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.BLL.Search
{
    public class SystemGroupSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "g_sort";
        public string g_name { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(g_name))
            {
                where.Add(string.Format(" g_name like '%{0}%'", g_name));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
