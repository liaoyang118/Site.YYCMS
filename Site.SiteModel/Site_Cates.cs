using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.SiteModel
{
    public class Site_Cates
    {

        #region c_id
        private int _c_id;
        public int c_id
        {
            get
            {
                return this._c_id;
            }
            set
            {
                this._c_id = value;
            }
        }
        #endregion

        #region c_gid
        private string _c_gid;
        public string c_gid
        {
            get
            {
                return this._c_gid;
            }
            set
            {
                this._c_gid = value;
            }
        }
        #endregion

        #region c_path
        private string _c_path;
        public string c_path
        {
            get
            {
                return this._c_path;
            }
            set
            {
                this._c_path = value;
            }
        }
        #endregion

        #region c_isMainCate
        private bool _c_isMainCate;
        public bool c_isMainCate
        {
            get
            {
                return this._c_isMainCate;
            }
            set
            {
                this._c_isMainCate = value;
            }
        }
        #endregion

        #region c_tableId
        private int _c_tableId;
        public int c_tableId
        {
            get
            {
                return this._c_tableId;
            }
            set
            {
                this._c_tableId = value;
            }
        }
        #endregion

        #region c_name
        private string _c_name;
        public string c_name
        {
            get
            {
                return this._c_name;
            }
            set
            {
                this._c_name = value;
            }
        }
        #endregion

        #region c_type
        private string _c_type;
        public string c_type
        {
            get
            {
                return this._c_type;
            }
            set
            {
                this._c_type = value;
            }
        }
        #endregion

        #region c_createUser
        private string _c_createUser;
        public string c_createUser
        {
            get
            {
                return this._c_createUser;
            }
            set
            {
                this._c_createUser = value;
            }
        }
        #endregion

        #region c_createTime
        private DateTime _c_createTime;
        public DateTime c_createTime
        {
            get
            {
                return this._c_createTime;
            }
            set
            {
                this._c_createTime = value;
            }
        }
        #endregion
    }

}
