using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.VideoModel
{
    public class ComboInfo
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

        #region c_id
        private string _c_id;
        public string c_id
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

        #region c_title
        private string _c_title;
        public string c_title
        {
            get
            {
                return this._c_title;
            }
            set
            {
                this._c_title = value;
            }
        }
        #endregion

        #region c_intro
        private string _c_intro;
        public string c_intro
        {
            get
            {
                return this._c_intro;
            }
            set
            {
                this._c_intro = value;
            }
        }
        #endregion

        #region c_num
        private int _c_num;
        public int c_num
        {
            get
            {
                return this._c_num;
            }
            set
            {
                this._c_num = value;
            }
        }
        #endregion

        #region c_days
        private int _c_days;
        public int c_days
        {
            get
            {
                return this._c_days;
            }
            set
            {
                this._c_days = value;
            }
        }
        #endregion

        #region c_status
        private int _c_status;
        public int c_status
        {
            get
            {
                return this._c_status;
            }
            set
            {
                this._c_status = value;
            }
        }
        #endregion
    }

}
