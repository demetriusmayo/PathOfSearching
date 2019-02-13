using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using Leaf.xNet;
using NLua;
using Leaf.xNet.Services.Cloudflare;
using Newtonsoft.Json;


//GenMods Parser+
//TODO: Link Generation to Query

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
            }
        }

        private void clearmods_Click(object sender, EventArgs e)
        {
            findmods.Clear();
        }

        class Results
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
            var collectList = new List<Results>();
            collectList.Clear();
            collectedCount.Text = "0";

            foreach (var labels in result)
            {
                var labelName = labels.label;


                if (labelName == "Explicit" || labelName == "Implicit" || labelName == "Crafted")
                {
                    foreach (var xEntry in labels.entries)
                    {
                        collectList.Add(new Results {Id = xEntry.id, Text = xEntry.text});
                    }
                }

                collectedCount.Text = collectList.Count.ToString();
            }
        }
    }
}