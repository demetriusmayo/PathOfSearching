using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NLua;

namespace Demo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public static string[] RemoveDuplicates(string[] s)
        {
            HashSet<string> set = new HashSet<string>(s);
            string[] result = new string[set.Count];
            set.CopyTo(result);
            return result;
        }

        // Кнопка для обработки события нажатия
        private void button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < 50; i++)
            {
                Lua state = new Lua();
                var success = true;
                try
                {
                    state.DoFile(@"C:\Users\WORK\Desktop\POE_Tools\MakeGearGreat\Demo\Demo\ModParser.lua");
                }
                catch (NLua.Exceptions.LuaScriptException ex)
                {
                    success = false;
                    Console.WriteLine(e.ToString());
                }

                var scriptFunc = state["parseMod"] as LuaFunction;
                var res = scriptFunc.Call(richTextBox3.Text);
                var _s = "";
//            var toCycle = new []{ s };

                foreach (KeyValuePair<object, object> variable in (LuaTable) res[0])
                {
                    //Array.Resize(ref toCycle, toCycle.Length + 1);
                    //toCycle[toCycle.Length - 1] = variable.Value.ToString();
                    _s += variable.Value + "\r\n";
                }

                label5.Text = _s;
                findmods.Text += _s;
                findmods.Text = string.Join("\r\n", findmods.Lines.Distinct());
            }
        }
    }
}