using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class Role_ModualPermission_Mapping
    {

        #region r_p_id
        private int _r_p_id;
        public int r_p_id
        {
            get
            {
                return this._r_p_id;
            }
            set
            {
                this._r_p_id = value;
            }
        }
        #endregion

        #region r_p_gid
        private string _r_p_gid;
        public string r_p_gid
        {
            get
            {
                return this._r_p_gid;
            }
            set
            {
                this._r_p_gid = value;
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

        #region r_p_CreateTime
        private DateTime _r_p_CreateTime;
        public DateTime r_p_CreateTime
        {
            get
            {
                return this._r_p_CreateTime;
            }
            set
            {
                this._r_p_CreateTime = value;
            }
        }
        #endregion

        #region r_p_CreateUser
        private string _r_p_CreateUser;
        public string r_p_CreateUser
        {
            get
            {
                return this._r_p_CreateUser;
            }
            set
            {
                this._r_p_CreateUser = value;
            }
        }
        #endregion
    }

}
