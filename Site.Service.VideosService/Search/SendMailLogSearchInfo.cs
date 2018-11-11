using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class SendMailLogSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "SendTime desc";
        
        /// <summary>
        /// 名称
        /// </summary>
        public string Email { get; set; }
        public string Title { get; set; }

        public string ToWhereString()
        {
            if (!string.IsNullOrEmpty(Email))
            {
                where.Add(string.Format(" Email like '%{0}%'", Email));
            }

            if (!string.IsNullOrEmpty(Title))
            {
                where.Add(string.Format(" Title like '%{0}%'", Title));
            }


            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
