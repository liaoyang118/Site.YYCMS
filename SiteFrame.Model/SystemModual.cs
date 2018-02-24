using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiteFrame.Model
{
    public class SystemModual
    {

        #region m_id
        private int _m_id;
        public int m_id
        {
            get
            {
                return this._m_id;
            }
            set
            {
                this._m_id = value;
            }
        }
        #endregion

        #region m_gid
        private string _m_gid;
        public string m_gid
        {
            get
            {
                return this._m_gid;
            }
            set
            {
                this._m_gid = value;
            }
        }
        #endregion

        #region m_g_gid
        private string _m_g_gid;
        public string m_g_gid
        {
            get
            {
                return this._m_g_gid;
            }
            set
            {
                this._m_g_gid = value;
            }
        }
        #endregion

        #region m_name
        private string _m_name;
        public string m_name
        {
            get
            {
                return this._m_name;
            }
            set
            {
                this._m_name = value;
            }
        }
        #endregion

        #region m_path
        private string _m_path;
        public string m_path
        {
            get
            {
                return this._m_path;
            }
            set
            {
                this._m_path = value;
            }
        }
        #endregion

        #region m_parent
        private int _m_parent;
        public int m_parent
        {
            get
            {
                return this._m_parent;
            }
            set
            {
                this._m_parent = value;
            }
        }
        #endregion

        #region m_parent_gid
        private string _m_parent_gid;
        public string m_parent_gid
        {
            get
            {
                return this._m_parent_gid;
            }
            set
            {
                this._m_parent_gid = value;
            }
        }
        #endregion

        #region m_Controller
        private string _m_Controller;
        public string m_Controller
        {
            get
            {
                return this._m_Controller;
            }
            set
            {
                this._m_Controller = value;
            }
        }
        #endregion

        #region m_Action
        private string _m_Action;
        public string m_Action
        {
            get
            {
                return this._m_Action;
            }
            set
            {
                this._m_Action = value;
            }
        }
        #endregion

        #region m_createTime
        private DateTime _m_createTime;
        public DateTime m_createTime
        {
            get
            {
                return this._m_createTime;
            }
            set
            {
                this._m_createTime = value;
            }
        }
        #endregion

        #region m_createUser
        private string _m_createUser;
        public string m_createUser
        {
            get
            {
                return this._m_createUser;
            }
            set
            {
                this._m_createUser = value;
            }
        }
        #endregion
    }

}
