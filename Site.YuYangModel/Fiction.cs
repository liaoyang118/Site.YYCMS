using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.YuYangModel
{
    /// <summary>
    /// 小说类
    /// </summary>
    public class Fiction
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

        #region Author
        private string _Author;
        public string Author
        {
            get
            {
                return this._Author;
            }
            set
            {
                this._Author = value;
            }
        }
        #endregion

        #region Intro
        private string _Intro;
        public string Intro
        {
            get
            {
                return this._Intro;
            }
            set
            {
                this._Intro = value;
            }
        }
        #endregion

        #region CoverImage
        private string _CoverImage;
        public string CoverImage
        {
            get
            {
                return this._CoverImage;
            }
            set
            {
                this._CoverImage = value;
            }
        }
        #endregion

        #region C_C_ID
        private int _C_C_ID;
        public int C_C_ID
        {
            get
            {
                return this._C_C_ID;
            }
            set
            {
                this._C_C_ID = value;
            }
        }
        #endregion

        #region LastUpdateChapter
        private string _LastUpdateChapter;
        public string LastUpdateChapter
        {
            get
            {
                return this._LastUpdateChapter;
            }
            set
            {
                this._LastUpdateChapter = value;
            }
        }
        #endregion

        #region LastUpdateTime
        private DateTime _LastUpdateTime;
        public DateTime LastUpdateTime
        {
            get
            {
                return this._LastUpdateTime;
            }
            set
            {
                this._LastUpdateTime = value;
            }
        }
        #endregion

        #region CompleteState
        private int _CompleteState;
        public int CompleteState
        {
            get
            {
                return this._CompleteState;
            }
            set
            {
                this._CompleteState = value;
            }
        }
        #endregion

        #region LastChapterId
        private int _LastChapterId;
        public int LastChapterId
        {
            get
            {
                return this._LastChapterId;
            }
            set
            {
                this._LastChapterId = value;
            }
        }
        #endregion

    }

}
