using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.BLL.Search
{
    public class SystemPermissionSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "p_createTime desc";
        public string p_m_gid { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(p_m_gid))
            {
                where.Add(string.Format(" p_m_gid = '{0}'", p_m_gid));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
