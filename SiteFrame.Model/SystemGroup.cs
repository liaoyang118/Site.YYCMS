using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class SystemGroup
    {

        #region g_id
        private int _g_id;
        public int g_id
        {
            get
            {
                return this._g_id;
            }
            set
            {
                this._g_id = value;
            }
        }
        #endregion

        #region g_gid
        private string _g_gid;
        public string g_gid
        {
            get
            {
                return this._g_gid;
            }
            set
            {
                this._g_gid = value;
            }
        }
        #endregion

        #region g_name
        private string _g_name;
        public string g_name
        {
            get
            {
                return this._g_name;
            }
            set
            {
                this._g_name = value;
            }
        }
        #endregion

        #region g_picCover
        private string _g_picCover;
        public string g_picCover
        {
            get
            {
                return this._g_picCover;
            }
            set
            {
                this._g_picCover = value;
            }
        }
        #endregion

        #region g_createTime
        private DateTime _g_createTime;
        public DateTime g_createTime
        {
            get
            {
                return this._g_createTime;
            }
            set
            {
                this._g_createTime = value;
            }
        }
        #endregion

        #region g_createUser
        private string _g_createUser;
        public string g_createUser
        {
            get
            {
                return this._g_createUser;
            }
            set
            {
                this._g_createUser = value;
            }
        }
        #endregion

        #region g_sort
        private int _g_sort;
        public int g_sort
        {
            get
            {
                return this._g_sort;
            }
            set
            {
                this._g_sort = value;
            }
        }
        #endregion

    }

}
