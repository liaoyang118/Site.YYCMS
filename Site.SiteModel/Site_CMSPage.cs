using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.SiteModel
{
    public class Site_CMSPage
    {

        #region p_id
        private int _p_id;
        public int p_id
        {
            get
            {
                return this._p_id;
            }
            set
            {
                this._p_id = value;
            }
        }
        #endregion

        #region p_gid
        private string _p_gid;
        public string p_gid
        {
            get
            {
                return this._p_gid;
            }
            set
            {
                this._p_gid = value;
            }
        }
        #endregion

        #region p_name
        private string _p_name;
        public string p_name
        {
            get
            {
                return this._p_name;
            }
            set
            {
                this._p_name = value;
            }
        }
        #endregion

        #region p_path
        private string _p_path;
        public string p_path
        {
            get
            {
                return this._p_path;
            }
            set
            {
                this._p_path = value;
            }
        }
        #endregion

        #region p_tempPath
        private string _p_tempPath;
        public string p_tempPath
        {
            get
            {
                return this._p_tempPath;
            }
            set
            {
                this._p_tempPath = value;
            }
        }
        #endregion

        #region p_filePath
        private string _p_filePath;
        public string p_filePath
        {
            get
            {
                return this._p_filePath;
            }
            set
            {
                this._p_filePath = value;
            }
        }
        #endregion

        #region p_createTime
        private DateTime _p_createTime;
        public DateTime p_createTime
        {
            get
            {
                return this._p_createTime;
            }
            set
            {
                this._p_createTime = value;
            }
        }
        #endregion

        #region p_createUser
        private string _p_createUser;
        public string p_createUser
        {
            get
            {
                return this._p_createUser;
            }
            set
            {
                this._p_createUser = value;
            }
        }
        #endregion

        #region p_pageDuty
        private string _p_pageDuty;
        public string p_pageDuty
        {
            get
            {
                return this._p_pageDuty;
            }
            set
            {
                this._p_pageDuty = value;
            }
        }
        #endregion

        #region p_siteName
        private int _p_siteName;
        public int p_siteName
        {
            get
            {
                return this._p_siteName;
            }
            set
            {
                this._p_siteName = value;
            }
        }
        #endregion

    }


}
