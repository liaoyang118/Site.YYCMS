using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.YuYangService.Search
{
    public class ChapterVisitsSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "Time desc";
        public string IP { get; set; }

        public string ToWhereString()
        {

            if (!string.IsNullOrEmpty(IP))
            {
                where.Add(string.Format(" IP like '%{0}%'", IP));
            }

            if (where.Count > 0)
            {
                return string.Format(" where {0}", string.Join(" and ", where.ToArray()));
            }
            return string.Empty;
        }
    }
}
