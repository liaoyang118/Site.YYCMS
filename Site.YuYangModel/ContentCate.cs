using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.YuYangModel
{
    public class ContentCate
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

        #region CateName
        private string _CateName;
        public string CateName
        {
            get
            {
                return this._CateName;
            }
            set
            {
                this._CateName = value;
            }
        }
        #endregion
    }

}
