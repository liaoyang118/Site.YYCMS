using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.VideoModel
{
    public class UserVisitsInfo
    {

        #region Id
        private int _Id;
        public int Id
        {
            get
            {
                return this._Id;
            }
            set
            {
                this._Id = value;
            }
        }
        #endregion

        #region u_id
        private string _u_id;
        public string u_id
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

        #region v_id
        private string _v_id;
        public string v_id
        {
            get
            {
                return this._v_id;
            }
            set
            {
                this._v_id = value;
            }
        }
        #endregion

        #region v_ip
        private string _v_ip;
        public string v_ip
        {
            get
            {
                return this._v_ip;
            }
            set
            {
                this._v_ip = value;
            }
        }
        #endregion

        #region platform
        private string _platform;
        public string platform
        {
            get
            {
                return this._platform;
            }
            set
            {
                this._platform = value;
            }
        }
        #endregion

        #region v_url
        private string _v_url;
        public string v_url
        {
            get
            {
                return this._v_url;
            }
            set
            {
                this._v_url = value;
            }
        }
        #endregion

        #region v_time
        private DateTime _v_time;
        public DateTime v_time
        {
            get
            {
                return this._v_time;
            }
            set
            {
                this._v_time = value;
            }
        }
        #endregion

        #region v_browser
        private string _v_browser;
        public string v_browser
        {
            get
            {
                return this._v_browser;
            }
            set
            {
                this._v_browser = value;
            }
        }
        #endregion

        #region v_os
        private string _v_os;
        public string v_os
        {
            get
            {
                return this._v_os;
            }
            set
            {
                this._v_os = value;
            }
        }
        #endregion
    }

}
