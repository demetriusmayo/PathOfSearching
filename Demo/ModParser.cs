using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NLua;

namespace Demo
{
    public class ModParser
    {
        // Реализация логики работы парсера модов вещей
        public static void _init()
        {
            Lua state = new Lua();
            bool success = true;
            try
            {
	            state.DoFile(@"C:\Users\WORK\Desktop\POE_Tools\MakeGearGreat\Demo\Demo\ModParser.lua");
            }
            catch (NLua.Exceptions.LuaScriptException e)
            {
	            success = false;
	            Console.WriteLine(e.ToString());
            }
            var scriptFunc = state ["parseMod"] as LuaFunction;
            var res = scriptFunc.Call (Form1.richTextBox2.Text);
            Form1.label4.Text = res.ToString();
        }
    }
}