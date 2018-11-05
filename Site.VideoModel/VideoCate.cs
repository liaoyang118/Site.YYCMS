using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Site.VideoModel
{
    public class VideoCate
    {

        #region c_id
        private int _c_id;
        public int c_id
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

        #region c_name
        private string _c_name;
        public string c_name
        {
            get
            {
                return this._c_name;
            }
            set
            {
                this._c_name = value;
            }
        }
        #endregion
    }

}
