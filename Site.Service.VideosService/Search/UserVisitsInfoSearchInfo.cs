using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class UserVisitsInfoSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "v_time desc";
        
        /// <summary>
        /// 名称
        /// </summary>
        public string v_ip { get; set; }
        public string v_os { get; set; }

        public string ToWhereString()
        {
            if (!string.IsNullOrEmpty(v_ip))
            {
                where.Add(string.Format(" v_ip like '%{0}%'", v_ip));
            }

            if (!string.IsNullOrEmpty(v_os))
            {
                where.Add(string.Format(" v_os like '%{0}%'", v_os));
            }


            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
