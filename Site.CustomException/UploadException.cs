using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomException
{
    public class UploadException : Exception
    {
        private string _message { get; set; }
        public UploadException(string message)
        {
            _message = message;
        }
        public override string Message
        {
            get
            {
                return _message;
            }
        }
    }
}
