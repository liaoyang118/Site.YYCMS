using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.Service.VideosService
{
    public class ComboInfoSearchInfo
    {
        private List<string> where = new List<string>();

        public string DefaultOrder = "c_days asc";
        
        public string Title { get; set; }

        public string ToWhereString()
        {
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
