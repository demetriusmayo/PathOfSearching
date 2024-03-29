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

//GenMods Parser+
//TODO: Link Generation to Query

namespace PathOfSearching
{
    public partial class PathOfSearching : Form
    {
        public static List<Results> CollectList;
        public static string findModsGlobal;
        public static string poeTradeLink;
        public static string poet;

        public PathOfSearching()
        {
            //TODO: make CollectList at start
            var lines = File.ReadAllLines(System.Environment.CurrentDirectory + "\\temp_modparser.txt");
            foreach (var line in lines)
            {
                string matched = null;
                string matched2 = null;
                Regex expression = new Regex(@"\[\""(.+?)\""\]");
                var results = expression.Matches(line);
                foreach (Match match in results)
                {
                    matched = match.Groups[1].Value;
                }

                Regex expression2 = new Regex(@"= ""(.+?)""");
                var results2 = expression2.Matches(line);
                foreach (Match match in results2)
                {
                    matched2 = match.Groups[1].Value;
                }


                CollectList.Add(new Results {Id = matched2, Text = matched});

                //["# to maximum Life"] = "explicit.stat_3299347043"
            }


            InitializeComponent();
            collectedCount.Text = CollectList.Count.ToString();
        }

        static PathOfSearching()
        {
            CollectList = new List<Results>();
        }

        private void findMod_Click(object sender, EventArgs e)
        {
            findmods.Text = "";
            findModsGlobal = "empty";
            List<string> findModsOnMap = new List<string>();
            var findmodsText = "";
            foreach (var testLine in richTextBox3.Lines)
            {
                var replace = testLine.Replace("+", "");
                var replace2 = replace.Replace("Level", "Bullshit");

                MatchCollection matches = Regex.Matches(replace2, @"[0-9]*\.?[0-9]+");
                var modsList = CollectList.Select(x => x.Text).ToList();

                for (var index = 0; index < matches.Count; index++)
                {
                    var mod = Regex.Replace(replace2, @"[0-9]*\.?[0-9]+", "#");
                    // search mod
                    findModsOnMap.AddRange(new[] {modsList.Find(y => y.ToLower().Contains(mod.ToLower()))});
                    findmodsText += findModsOnMap[findModsOnMap.Count - 1] + "\r\n";
                }
            }

            findmods.Text += findmodsText.Trim();
            findModsGlobal = string.Join(",", findmods.Lines.Distinct());
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
                    state.DoFile(
                        @"C:\Users\WORK\Desktop\POE_Tools\MakeGearGreat\PathOfSearching\PathOfSearching\ModParser.lua");
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

                findmods.Text += findmodsText;
                // remove duplicates
                findmods.Text = string.Join("\r\n", findmods.Lines.Distinct());
                findModsGlobal = string.Join(",", findmods.Lines.Distinct());
            }
        }

        private void clearmods_Click(object sender, EventArgs e)
        {
            findModsGlobal = "";
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
                        var lower = replacement; // toLower
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
                        sw.WriteLine(line);
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
            poeTradeLink = "";
            poet = "";
            var result = findModsGlobal.Split(',').ToList();
            result = result.Where(s => !string.IsNullOrEmpty(s)).Distinct().ToList();

            var modsList = CollectList.Select(x => x.Text).ToList();

            var findModsOnMap = new List<string>();
            string json = "";
            for (var index = 0; index < result.Count; index++)
            {
                var sStr = result[index];
                var str = sStr;
                findModsOnMap.AddRange(new[] {modsList.Find(y => y.ToLower().Contains(str.ToLower()))});
                var file = CollectList.Where(f => f.Text == findModsOnMap[index]).OrderByDescending(f => f.Id)
                    .FirstOrDefault();
                // Make query Json
                var obj = new Filters
                {
                    id = file.Id,
                    disabled = false,
//                    value = new FiltersValue
//                    {
//                        max = 95,
//                        min = 1
//                    }
                };

                poet += "&mod_name=" + System.Uri.EscapeDataString(findModsOnMap[index]) +
                        "&mod_min=&mod_max=&mod_weight=";
                json += "," + JsonConvert.SerializeObject(obj, Formatting.None);
                //////////////////////
            }


           var jsonReplace2 = Regex.Replace(json, "implicit", "explicit");

           Regex reg = new Regex("explicit");
           var jsonReplace = reg.Replace(jsonReplace2, "implicit", 1);
//           try
//           {
//               string text = jsonReplace;
//               string pattern = @"explicit";
//               Regex myRegex = new Regex(pattern, RegexOptions.IgnoreCase);
//
//               Match m = myRegex.Match(text);   // m is the first match
//               while (m.Success)
//               {
//                   // Do something with m
//                   m = m.NextMatch();              // more matches
//               }
//           }
//           catch (Exception exception)
//           {
//               Console.WriteLine(exception);
//               throw;
//           }
            poet += "&group_type=And&group_min=&group_max=&group_count=" + findModsOnMap.Count + "";
            var substring = jsonReplace.Substring(1);
            richTextBox4.Lines = RemoveDuplicates(findModsOnMap.ToArray());
            poeTradeLink = "https://www.pathofexile.com/api/trade/search/Betrayal?redirect&source={\"query\":{\"status\":{\"option\":\"online\"},\"stats\":[{\"type\":\"and\",\"filters\":[" +  substring + "],\"disabled\":false}]}}";
            /** Link Gen For Search on Trade Api POE **/
            //https://www.pathofexile.com/api/trade/search/Betrayal?redirect&source=[JSON]
            //{"query":{"status":{"option":"online"},"stats":[{"type":"and","filters":[],"disabled":false}]}}
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            linkLabel1.LinkVisited = true;

            System.Diagnostics.Process.Start("https://www.pathofexile.com/api/trade/data/stats");
        }

        private void tradeLink_Click(object sender, EventArgs e)
        {
//            var linkBefore = Regex.Replace(poeTradeLink, "implicit", "explicit");
            var link = Regex.Replace(poeTradeLink, "\"", "\"\"\"");
            System.Diagnostics.Process.Start(link);
        }

        private void poetradepost_Click(object sender, EventArgs e)
        {
            using (var request = new HttpRequest())
            {
                request.UserAgent =
                    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36";
                string data = string.Concat(new string[]
                {
                    string.Concat(new object[]
                    {
                        "league=Betrayal&type=&base=&name=&dmg_min=&dmg_max=&aps_min=&aps_max=&crit_min=&crit_max=&dps_min=&dps_max=&edps_min=&edps_max=&pdps_min=&pdps_max=&armour_min=&armour_max=&evasion_min=&evasion_max=&shield_min=&shield_max=&block_min=&block_max=&sockets_min=&sockets_max=&link_min=&link_max=&sockets_r=&sockets_g=&sockets_b=&sockets_w=&linked_r=&linked_g=&linked_b=&linked_w=&rlevel_min=&rlevel_max=&rstr_min=&rstr_max=&rdex_min=&rdex_max=&rint_min=&rint_max=" +
                        (poet) +
                        "&q_min=&q_max=&level_min=&level_max=&ilvl_min=&ilvl_max=&rarity=&progress_min=&progress_max=&sockets_a_min=&sockets_a_max=&map_series=&altart=&identified=&corrupted=&shaper=&elder=&crafted=&enchanted=&mirrored=&veiled=&seller=&thread=&online=x&capquality=x&buyout_min=&buyout_max=&buyout_currency=&has_buyout=&exact_currency="
                    })
                });
                request.AllowAutoRedirect = false;
//                var linkAfter = Regex.Replace(data, "%20", "+");

                var str2 = request.Post("http://poe.trade/search", data, "application/x-www-form-urlencoded")
                    .ToString();
                System.Diagnostics.Process.Start(request.Response.Location);
            }
        }
    }

    public class FiltersValue
    {
        public int min;
        public int max;
    }

    public class Filters
    {
//        public FiltersValue value;
        public string id { get; set; }
        public bool disabled { get; set; }
    }
}