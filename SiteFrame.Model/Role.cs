using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class Role
    {

        #region r_id
        private int _r_id;
        public int r_id
        {
            get
            {
                return this._r_id;
            }
            set
            {
                this._r_id = value;
            }
        }
        #endregion

        #region r_gid
        private string _r_gid;
        public string r_gid
        {
            get
            {
                return this._r_gid;
            }
            set
            {
                this._r_gid = value;
            }
        }
        #endregion

        #region r_name
        private string _r_name;
        public string r_name
        {
            get
            {
                return this._r_name;
            }
            set
            {
                this._r_name = value;
            }
        }
        #endregion

        #region r_createTime
        private DateTime _r_createTime;
        public DateTime r_createTime
        {
            get
            {
                return this._r_createTime;
            }
            set
            {
                this._r_createTime = value;
            }
        }
        #endregion

        #region r_createUser
        private string _r_createUser;
        public string r_createUser
        {
            get
            {
                return this._r_createUser;
            }
            set
            {
                this._r_createUser = value;
            }
        }
        #endregion
    }

}
