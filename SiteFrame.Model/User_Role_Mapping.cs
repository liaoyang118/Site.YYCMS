using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class User_Role_Mapping
    {

        #region u_r_id
        private int _u_r_id;
        public int u_r_id
        {
            get
            {
                return this._u_r_id;
            }
            set
            {
                this._u_r_id = value;
            }
        }
        #endregion

        #region u_r_gid
        private string _u_r_gid;
        public string u_r_gid
        {
            get
            {
                return this._u_r_gid;
            }
            set
            {
                this._u_r_gid = value;
            }
        }
        #endregion

        #region u_gid
        private string _u_gid;
        public string u_gid
        {
            get
            {
                return this._u_gid;
            }
            set
            {
                this._u_gid = value;
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

        #region u_r_CreateTime
        private DateTime _u_r_CreateTime;
        public DateTime u_r_CreateTime
        {
            get
            {
                return this._u_r_CreateTime;
            }
            set
            {
                this._u_r_CreateTime = value;
            }
        }
        #endregion

        #region u_r_CreateUser
        private string _u_r_CreateUser;
        public string u_r_CreateUser
        {
            get
            {
                return this._u_r_CreateUser;
            }
            set
            {
                this._u_r_CreateUser = value;
            }
        }
        #endregion
    }

}
