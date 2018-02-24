using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.SiteService.Search
{
    public class Site_CMSBlocksSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "b_path";
        public string b_name { get; set; }
        public string b_p_gid { get; set; }

        /// <summary>
        /// 责任人
        /// </summary>
        public string p_pageDuty { get; set; }


        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(b_name))
            {
                where.Add(string.Format(" b_name like '%{0}%'", b_name));
            }
            if (!string.IsNullOrEmpty(b_p_gid))
            {
                where.Add(string.Format(" b_p_gid = '{0}'", b_p_gid));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
