using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.SiteService.Search
{
    public class Site_CatesSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "c_path";
        public string c_name { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(c_name))
            {
                where.Add(string.Format(" c_name like '%{0}%'", c_name));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
