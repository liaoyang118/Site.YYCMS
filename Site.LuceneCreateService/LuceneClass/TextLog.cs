using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LuceneCreateService.LuceneClass
{
    class TextLog
    {
        public static void AppendText(TextBox t, string message)
        {
            if (t.Lines.Length >= 2000)
            {
                t.Clear();
                t.AppendText("文本超过2000行，清空文本\r\n");
            }

            t.AppendText(message);
        }


    }
}
