using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.SiteService.Search
{
    public class Site_CMSItemSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "i_sort asc";
        public string i_createUser { get; set; }
        public int? i_status { get; set; }
        public string i_b_gid { get; set; }
        public string i_p_gid { get; set; }


        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(i_createUser))
            {
                where.Add(string.Format(" i_createUser like '%{0}%'", i_createUser));
            }
            if (!string.IsNullOrEmpty(i_b_gid))
            {
                where.Add(string.Format(" i_b_gid = '{0}'", i_b_gid));
            }
            if (!string.IsNullOrEmpty(i_p_gid))
            {
                where.Add(string.Format(" i_p_gid = '{0}'", i_p_gid));
            }
            if (i_status!=null)
            {
                where.Add(string.Format(" i_status = '{0}'", i_status));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
