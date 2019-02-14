﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using Leaf.xNet;
using NLua;
using Leaf.xNet.Services.Cloudflare;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using Newtonsoft.Json.Linq;

//GenMods Parser+
//TODO: Link Generation to Query

namespace PathOfSearching
{
    public partial class PathOfSearching : Form
    {
        public static List<Results> CollectList;
        public static string findModsGlobal;

        public PathOfSearching()
        {
            InitializeComponent();
        }

        static PathOfSearching()
        {
            CollectList = new List<Results>();
        }

        // make item data to Item Mods
        private void button1_Click(object sender, EventArgs e)
        {
            findmods.Text = "";
            findModsGlobal = "empty";

            for (var i = 0; i < 50; i++)
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
                findModsGlobal = string.Join(",", findmods.Lines.Distinct());
                /** Link Gen For Search on Trade Api POE **/
                //https://www.pathofexile.com/api/trade/search/Delve?redirect&source=[JSON]
            }
        }

        private void clearmods_Click(object sender, EventArgs e)
        {
            findmods.Clear();
        }

        public class Results
        {
            public string Id { get; set; }
            public string Text { get; set; }
        }

        private void updateDataStats_Click(object sender, EventArgs e)
        {
            var httpRequest = new HttpRequest();
            var clearResp = httpRequest.GetThroughCloudflare("https://www.pathofexile.com/api/trade/data/stats");
            dynamic x = JsonConvert.DeserializeObject(clearResp.ToString());
            var result = x.result;
            CollectList.Clear();
            collectedCount.Text = "0";

            foreach (var labels in result)
            {
                var labelName = labels.label;

                if (labelName == "Explicit" || labelName == "Implicit") //|| labelName == "Crafted"
                {
                    foreach (var xEntry in labels.entries)
                    {
                        string replacement = Regex.Replace(xEntry.text.ToString(), @"\t|\n|\r", " ");
                        var lower = replacement.ToLower();
                        CollectList.Add(new Results {Id = xEntry.id, Text = lower});
                    }
                }

                collectedCount.Text = CollectList.Count.ToString();
            }
        }

        private void convertToLuaRules_Click(object sender, EventArgs e)
        {
            /* Example
               ["life"] = "Life",
               ["maximum life"] = "Life",
               ["mana"] = "Mana",
             */
            string line = "";
            foreach (var convResult in CollectList)
            {
                line = "[\"" + convResult.Text + "\"] = \"" + convResult.Id + "\",";
                string writePath = @"temp_modparser.txt";
                try
                {
                    using (StreamWriter sw = new StreamWriter(writePath, true, System.Text.Encoding.Default))
                    {
                        sw.WriteLine(line.ToLower());
                    }
                }
                catch (Exception _exception)
                {
                    Console.WriteLine(_exception.Message);
                }

                //ModParserRichTextBox.Text += line;
            }

            MessageBox.Show("Done!");
        }

        public static string[] RemoveDuplicates(string[] s)
        {
            var set = new HashSet<string>(s);
            var result = new string[set.Count];
            set.CopyTo(result);
            return result;
        }

        private void searchMods_Click(object sender, EventArgs e)
        {
            richTextBox4.Clear();

            var result = findModsGlobal.Split(',').ToList();
            result = result.Where(s => !string.IsNullOrEmpty(s)).Distinct().ToList();

            var modsList = CollectList.Select(x => x.Text).ToList();

            var findModsOnMap = new List<string>();
            foreach (var sStr in result)
            {
                var str = sStr;
                findModsOnMap.AddRange(new[] {modsList.Find(y => y.ToLower().Contains(str.ToLower()))});
            }

            richTextBox4.Lines = RemoveDuplicates(findModsOnMap.ToArray());
        }
    }
}