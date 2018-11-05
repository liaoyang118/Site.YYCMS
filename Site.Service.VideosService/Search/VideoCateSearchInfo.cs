using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class VideoCateSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "c_name desc";

        /// <summary>
        /// 分类ID
        /// </summary>
        public int? c_id { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        public string c_name { get; set; }

        public string ToWhereString()
        {

            if (c_id != null)
            {
                where.Add(string.Format(" c_id = {0}", c_id));
            }

            if (!string.IsNullOrEmpty(c_name))
            {
                where.Add(string.Format(" c_name = '{0}'", c_name));
            }


            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
