using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.BLL.Search
{
    public class SystemUserRoleSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "u_r_CreateTime desc";
        public string u_gid { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(u_gid))
            {
                where.Add(string.Format(" u_gid = '{0}'", u_gid));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
