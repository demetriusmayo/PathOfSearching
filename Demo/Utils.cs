using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NLua;

namespace Demo
{
    class Utils
    {
        internal static void OneItem()
        {
            var state = new Lua ();
            state.DoString("y = 10 + x*(5 + 2)");
            var y = state["y"];
            return;
        }

    }
}
