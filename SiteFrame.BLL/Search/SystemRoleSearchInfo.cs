using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.BLL.Search
{
    public class SystemRoleSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "r_createTime desc";
        public string r_name { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(r_name))
            {
                where.Add(string.Format(" r_name like '%{0}%'", r_name));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
