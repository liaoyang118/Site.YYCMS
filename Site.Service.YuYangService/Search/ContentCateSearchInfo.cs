using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.YuYangService.Search
{
    public class ContentCateSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "Id";
        public string CateName { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(CateName))
            {
                where.Add(string.Format(" CateName like '%{0}%'", CateName));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
