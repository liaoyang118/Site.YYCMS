using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.YuYangService.Search
{
    public class FictionSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "LastUpdateTime desc";
        public string Title { get; set; }
        public string C_C_ID { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(Title))
            {
                where.Add(string.Format(" Title like '%{0}%'", Title));
            }

            if (!string.IsNullOrEmpty(C_C_ID))
            {
                where.Add(string.Format(" C_C_ID = {0}", C_C_ID));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
