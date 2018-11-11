using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.VideoModel
{
    public class VideoInfo
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

        #region v_c_id
        private int _v_c_id;
        public int v_c_id
        {
            get
            {
                return this._v_c_id;
            }
            set
            {
                this._v_c_id = value;
            }
        }
        #endregion

        #region v_c_name
        private string _v_c_name;
        public string v_c_name
        {
            get
            {
                return this._v_c_name;
            }
            set
            {
                this._v_c_name = value;
            }
        }
        #endregion

        #region v_titile
        private string _v_titile;
        public string v_titile
        {
            get
            {
                return this._v_titile;
            }
            set
            {
                this._v_titile = value;
            }
        }
        #endregion

        #region v_intro
        private string _v_intro;
        public string v_intro
        {
            get
            {
                return this._v_intro;
            }
            set
            {
                this._v_intro = value;
            }
        }
        #endregion

        #region v_coverImgSrc
        private string _v_coverImgSrc;
        public string v_coverImgSrc
        {
            get
            {
                return this._v_coverImgSrc;
            }
            set
            {
                this._v_coverImgSrc = value;
            }
        }
        #endregion

        #region v_playSrc
        private string _v_playSrc;
        public string v_playSrc
        {
            get
            {
                return this._v_playSrc;
            }
            set
            {
                this._v_playSrc = value;
            }
        }
        #endregion

        #region v_min_playSrc
        private string _v_min_playSrc;
        public string v_min_playSrc
        {
            get
            {
                return this._v_min_playSrc;
            }
            set
            {
                this._v_min_playSrc = value;
            }
        }
        #endregion

        #region v_timeLength
        private string _v_timeLength;
        public string v_timeLength
        {
            get
            {
                return this._v_timeLength;
            }
            set
            {
                this._v_timeLength = value;
            }
        }
        #endregion

        #region v_createTime
        private DateTime _v_createTime;
        public DateTime v_createTime
        {
            get
            {
                return this._v_createTime;
            }
            set
            {
                this._v_createTime = value;
            }
        }
        #endregion

        #region v_status
        private int _v_status;
        public int v_status
        {
            get
            {
                return this._v_status;
            }
            set
            {
                this._v_status = value;
            }
        }
        #endregion

        #region v_totalSecond
        private int _v_totalSecond;
        public int v_totalSecond
        {
            get
            {
                return this._v_totalSecond;
            }
            set
            {
                this._v_totalSecond = value;
            }
        }
        #endregion
    }


}
