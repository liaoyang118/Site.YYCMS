using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.SiteService.Search
{
    public class Site_CMSPagesSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "p_path";
        public string p_name { get; set; }
        public int? p_siteName { get; set; }

        public int? p_path_length { get; set; }
        public string p_path { get; set; }

        /// <summary>
        /// 责任人
        /// </summary>
        public string p_pageDuty { get; set; }


        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(p_name))
            {
                where.Add(string.Format(" p_name like '%{0}%'", p_name));
            }
            if (!string.IsNullOrEmpty(p_pageDuty))
            {
                where.Add(string.Format(" p_pageDuty like '%{0}%'", p_pageDuty));
            }

            if (!string.IsNullOrEmpty(p_path))
            {
                where.Add(string.Format(" p_path like '{0}%'", p_path));
            }

            if (p_siteName != null)
            {
                where.Add(string.Format(" p_siteName = {0}", p_siteName));
            }

            if (p_path_length != null)
            {
                where.Add(string.Format(" LEN(p_path) = {0}", p_path_length));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
