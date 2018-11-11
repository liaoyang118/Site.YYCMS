using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.VideoModel
{
    public class SendMailLog
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

        #region Email
        private string _Email;
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                this._Email = value;
            }
        }
        #endregion

        #region Title
        private string _Title;
        public string Title
        {
            get
            {
                return this._Title;
            }
            set
            {
                this._Title = value;
            }
        }
        #endregion

        #region SendTime
        private DateTime _SendTime;
        public DateTime SendTime
        {
            get
            {
                return this._SendTime;
            }
            set
            {
                this._SendTime = value;
            }
        }
        #endregion

        #region SendContent
        private string _SendContent;
        public string SendContent
        {
            get
            {
                return this._SendContent;
            }
            set
            {
                this._SendContent = value;
            }
        }
        #endregion

        #region IsSuccess
        private bool _IsSuccess;
        public bool IsSuccess
        {
            get
            {
                return this._IsSuccess;
            }
            set
            {
                this._IsSuccess = value;
            }
        }
        #endregion

        #region Remark
        private string _Remark;
        public string Remark
        {
            get
            {
                return this._Remark;
            }
            set
            {
                this._Remark = value;
            }
        }
        #endregion

        #region CreateTime
        private DateTime _CreateTime;
        public DateTime CreateTime
        {
            get
            {
                return this._CreateTime;
            }
            set
            {
                this._CreateTime = value;
            }
        }
        #endregion
    }

}
