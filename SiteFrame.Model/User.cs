using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class User
    {

        #region u_id
        private int _u_id;
        public int u_id
        {
            get
            {
                return this._u_id;
            }
            set
            {
                this._u_id = value;
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

        #region u_username
        private string _u_username;
        public string u_username
        {
            get
            {
                return this._u_username;
            }
            set
            {
                this._u_username = value;
            }
        }
        #endregion

        #region u_password
        private string _u_password;
        public string u_password
        {
            get
            {
                return this._u_password;
            }
            set
            {
                this._u_password = value;
            }
        }
        #endregion

        #region u_createTime
        private DateTime _u_createTime;
        public DateTime u_createTime
        {
            get
            {
                return this._u_createTime;
            }
            set
            {
                this._u_createTime = value;
            }
        }
        #endregion

        #region u_createUser
        private string _u_createUser;
        public string u_createUser
        {
            get
            {
                return this._u_createUser;
            }
            set
            {
                this._u_createUser = value;
            }
        }
        #endregion

        #region u_status
        private int _u_status;
        public int u_status
        {
            get
            {
                return this._u_status;
            }
            set
            {
                this._u_status = value;
            }
        }
        #endregion


        #region u_nickName
        private string _u_nickName;
        public string u_nickName
        {
            get
            {
                return this._u_nickName;
            }
            set
            {
                this._u_nickName = value;
            }
        }
        #endregion

    }

}
