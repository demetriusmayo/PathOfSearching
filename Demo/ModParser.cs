using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using NLua;

namespace Demo
{
    public class ModParser
    {
        // Реализация логики работы парсера модов вещей
        public static void _init()
        {
            Lua state = new Lua();
            var success = true;
            try
            {
                state.DoFile(@"C:\Users\WORK\Desktop\POE_Tools\MakeGearGreat\Demo\Demo\ModParser.lua");
            }
            catch (NLua.Exceptions.LuaScriptException e)
            {
                success = false;
                Console.WriteLine(e.ToString());
            }

            var scriptFunc = state["parseMod"] as LuaFunction;
            var res = scriptFunc.Call(Form1.richTextBox3.Text);
            var s = "";
            foreach (KeyValuePair<object, object> variable in (LuaTable)res[0])
            {
                // Use KeyValuePair to use foreach on Dictionary.
//                    Console.WriteLine("Pair here: {0}, {1}", variable.Key, variable.Value);
                    s += variable.Value + ",";
            }

            Form1.label5.Text = s;
        }
    }
}