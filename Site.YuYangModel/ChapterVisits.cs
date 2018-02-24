using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.YuYangModel
{
    public class ChapterVisits
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

        #region IP
        private string _IP;
        public string IP
        {
            get
            {
                return this._IP;
            }
            set
            {
                this._IP = value;
            }
        }
        #endregion

        #region OS
        private string _OS;
        public string OS
        {
            get
            {
                return this._OS;
            }
            set
            {
                this._OS = value;
            }
        }
        #endregion

        #region Browser
        private string _Browser;
        public string Browser
        {
            get
            {
                return this._Browser;
            }
            set
            {
                this._Browser = value;
            }
        }
        #endregion

        #region Url
        private string _Url;
        public string Url
        {
            get
            {
                return this._Url;
            }
            set
            {
                this._Url = value;
            }
        }
        #endregion

        #region Time
        private DateTime _Time;
        public DateTime Time
        {
            get
            {
                return this._Time;
            }
            set
            {
                this._Time = value;
            }
        }
        #endregion
    }

}
