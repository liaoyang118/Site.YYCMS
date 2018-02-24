using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.SiteService.Search
{
    public class Site_ContentSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "c_createTime desc";
        public string c_c_gid { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(c_c_gid))
            {
                where.Add(string.Format(" c_c_gid = '{0}'", c_c_gid));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
