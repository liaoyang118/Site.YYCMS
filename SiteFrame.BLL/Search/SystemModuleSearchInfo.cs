using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Site.Common;

namespace SiteFrame.BLL.Search
{
    public class SystemModuleSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "m_path";
        public string m_g_gid { get; set; }
        public int? m_parent { get; set; }
        public string m_name { get; set; }

        public string ToWhereString()
        {
            if (!string.IsNullOrEmpty(m_g_gid))
            {
                where.Add(string.Format(" m_g_gid='{0}'", m_g_gid.ToSafeString()));
            }

            if (m_parent != null)
            {
                where.Add(string.Format(" m_parent={0}", m_parent));
            }
            if (!string.IsNullOrEmpty(m_name))
            {
                where.Add(string.Format(" m_name like '%{0}%'", m_name));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
