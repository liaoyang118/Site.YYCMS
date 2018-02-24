using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Site.YuYangModel;
using Site.YuYangAccess;

namespace Site.WCF.YuYangService
{
    [ServiceBehavior(Name = "YuYangService", Namespace = "http://service.jsonyang.com")]
    public class YuYangService : IYuYangService
    {
        #region 小说分类

        public int ContentCate_DeleteById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ContentCate_DeleteById(Id);
            }
        }

        public int ContentCate_Insert(ContentCate obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ContentCate_Insert(obj);
            }
        }

        public ContentCate ContentCate_SelectById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ContentCate_SelectById(Id);
            }
        }

        public List<ContentCate> ContentCate_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ContentCate_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public int ContentCate_UpdateById(ContentCate obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ContentCate_UpdateById(obj);
            }
        }
        #endregion

        #region 小说

        public int Fiction_DeleteById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.Fiction_DeleteById(Id);
            }
        }

        public int Fiction_Insert(Fiction obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.Fiction_Insert(obj);
            }
        }

        public Fiction Fiction_SelectById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.Fiction_SelectById(Id);
            }
        }

        public List<Fiction> Fiction_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.Fiction_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public int Fiction_UpdateById(Fiction obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.Fiction_UpdateById(obj);
            }
        }

        #endregion

        #region 小说访问日志

        public int ChapterVisits_DeleteById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ChapterVisits_DeleteById(Id);
            }
        }

        public int ChapterVisits_Insert(ChapterVisits obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ChapterVisits_Insert(obj);
            }
        }

        public ChapterVisits ChapterVisits_SelectById(int Id)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ChapterVisits_SelectById(Id);
            }
        }

        public List<ChapterVisits> ChapterVisits_SelectPage(string cloumns, int pageIndex, int pageSize, string orderBy, string where, out int rowCount)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ChapterVisits_SelectPage(cloumns, pageIndex, pageSize, orderBy, where, out rowCount);
            }
        }

        public int ChapterVisits_UpdateById(ChapterVisits obj)
        {
            using (SiteFictionAccess access = new SiteFictionAccess())
            {
                return access.ChapterVisits_UpdateById(obj);
            }
        }


        #endregion
    }
}
