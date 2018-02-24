using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.SiteModel
{
    public class Site_CMSBlock
    {
        #region b_id
        private int _b_id;
        public int b_id
        {
            get
            {
                return this._b_id;
            }
            set
            {
                this._b_id = value;
            }
        }
        #endregion

        #region b_gid
        private string _b_gid;
        public string b_gid
        {
            get
            {
                return this._b_gid;
            }
            set
            {
                this._b_gid = value;
            }
        }
        #endregion

        #region b_p_gid
        private string _b_p_gid;
        public string b_p_gid
        {
            get
            {
                return this._b_p_gid;
            }
            set
            {
                this._b_p_gid = value;
            }
        }
        #endregion

        #region b_path
        private string _b_path;
        public string b_path
        {
            get
            {
                return this._b_path;
            }
            set
            {
                this._b_path = value;
            }
        }
        #endregion

        #region b_name
        private string _b_name;
        public string b_name
        {
            get
            {
                return this._b_name;
            }
            set
            {
                this._b_name = value;
            }
        }
        #endregion

        #region b_img_size
        private string _b_img_size;
        public string b_img_size
        {
            get
            {
                return this._b_img_size;
            }
            set
            {
                this._b_img_size = value;
            }
        }
        #endregion

        #region b_createUser
        private string _b_createUser;
        public string b_createUser
        {
            get
            {
                return this._b_createUser;
            }
            set
            {
                this._b_createUser = value;
            }
        }
        #endregion

        #region b_createTime
        private DateTime _b_createTime;
        public DateTime b_createTime
        {
            get
            {
                return this._b_createTime;
            }
            set
            {
                this._b_createTime = value;
            }
        }
        #endregion
    }

}
