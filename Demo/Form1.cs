using System;
using System.Collections.Generic;
using System.Linq;
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
        // make item data to Item Mods
        private void button1_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < 20; i++)
            {
                var state = new Lua();
                try
                {
                    state.DoFile(@"C:\Users\WORK\Desktop\POE_Tools\MakeGearGreat\Demo\Demo\ModParser.lua");
                }
                catch (NLua.Exceptions.LuaScriptException ex)
                {
                    Console.WriteLine(e.ToString());
                }

                var scriptFunc = state["parseMod"] as LuaFunction;
                var res = scriptFunc.Call(richTextBox3.Text);
                var findmodsText = "";

                foreach (KeyValuePair<object, object> variable in (LuaTable) res[0])
                {
                    findmodsText += variable.Value + "\r\n";
                }

                label5.Text = findmodsText;
                findmods.Text += findmodsText;
                // remove duplicates
                findmods.Text = string.Join("\r\n", findmods.Lines.Distinct());
            }
        }
    }
}