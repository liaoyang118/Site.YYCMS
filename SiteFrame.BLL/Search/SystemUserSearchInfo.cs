using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.BLL.Search
{
    public class SystemUserSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "u_createTime desc";
        public string u_username { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(u_username))
            {
                where.Add(string.Format(" u_username like '%{0}%'", u_username));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
