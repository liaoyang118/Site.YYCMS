using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class VideoSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "v_createTime desc";

        /// <summary>
        /// 分类ID
        /// </summary>
        public string v_c_id { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public string v_titile { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(v_c_id))
            {
                where.Add(string.Format(" v_c_id = '{0}'", v_c_id));
            }

            if (!string.IsNullOrEmpty(v_titile))
            {
                where.Add(string.Format(" v_titile = '{0}'", v_titile));
            }


            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
