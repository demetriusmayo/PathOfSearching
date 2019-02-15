namespace PathOfSearching
{
    partial class PathOfSearching
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PathOfSearching));
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.findMod = new System.Windows.Forms.Button();
            this.richTextBox3 = new System.Windows.Forms.RichTextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.label2 = new System.Windows.Forms.Label();
            this.convertToLuaRules = new System.Windows.Forms.Button();
            this.collectedCount = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.updateDataStats = new System.Windows.Forms.Button();
            this.poetradepost = new System.Windows.Forms.Button();
            this.tradeLink = new System.Windows.Forms.Button();
            this.searchMods = new System.Windows.Forms.Button();
            this.richTextBox4 = new System.Windows.Forms.RichTextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.findmods = new System.Windows.Forms.TextBox();
            this.clearmods = new System.Windows.Forms.Button();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Paste Copy ItemInfo";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.WindowText;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button1.Location = new System.Drawing.Point(178, 649);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(131, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Find mods (lua)";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(558, 539);
            this.tabControl1.TabIndex = 3;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.poetradepost);
            this.tabPage1.Controls.Add(this.findMod);
            this.tabPage1.Controls.Add(this.richTextBox3);
            this.tabPage1.Controls.Add(this.tradeLink);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.richTextBox4);
            this.tabPage1.Controls.Add(this.searchMods);
            this.tabPage1.Controls.Add(this.label9);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(550, 513);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "One item search";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // findMod
            // 
            this.findMod.BackColor = System.Drawing.Color.Salmon;
            this.findMod.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.findMod.Location = new System.Drawing.Point(9, 259);
            this.findMod.Name = "findMod";
            this.findMod.Size = new System.Drawing.Size(75, 23);
            this.findMod.TabIndex = 6;
            this.findMod.Text = "Find mods";
            this.findMod.UseVisualStyleBackColor = false;
            this.findMod.Click += new System.EventHandler(this.findMod_Click);
            // 
            // richTextBox3
            // 
            this.richTextBox3.Location = new System.Drawing.Point(9, 20);
            this.richTextBox3.Name = "richTextBox3";
            this.richTextBox3.Size = new System.Drawing.Size(539, 233);
            this.richTextBox3.TabIndex = 5;
            this.richTextBox3.Text = resources.GetString("richTextBox3.Text");
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.linkLabel1);
            this.tabPage3.Controls.Add(this.label2);
            this.tabPage3.Controls.Add(this.convertToLuaRules);
            this.tabPage3.Controls.Add(this.button1);
            this.tabPage3.Controls.Add(this.collectedCount);
            this.tabPage3.Controls.Add(this.label8);
            this.tabPage3.Controls.Add(this.label7);
            this.tabPage3.Controls.Add(this.updateDataStats);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(554, 717);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Map of modifier names";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(126, 29);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(245, 13);
            this.linkLabel1.TabIndex = 6;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "https://www.pathofexile.com/api/trade/data/stats";
            this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Maroon;
            this.label2.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.label2.Location = new System.Drawing.Point(355, 672);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(74, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "for developers";
            // 
            // convertToLuaRules
            // 
            this.convertToLuaRules.BackColor = System.Drawing.Color.YellowGreen;
            this.convertToLuaRules.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.convertToLuaRules.ForeColor = System.Drawing.SystemColors.ControlText;
            this.convertToLuaRules.Location = new System.Drawing.Point(178, 688);
            this.convertToLuaRules.Name = "convertToLuaRules";
            this.convertToLuaRules.Size = new System.Drawing.Size(171, 23);
            this.convertToLuaRules.TabIndex = 4;
            this.convertToLuaRules.Text = "Convert to ModParser rules.";
            this.convertToLuaRules.UseVisualStyleBackColor = false;
            this.convertToLuaRules.Click += new System.EventHandler(this.convertToLuaRules_Click);
            // 
            // collectedCount
            // 
            this.collectedCount.AutoSize = true;
            this.collectedCount.Location = new System.Drawing.Point(301, 11);
            this.collectedCount.Name = "collectedCount";
            this.collectedCount.Size = new System.Drawing.Size(13, 13);
            this.collectedCount.TabIndex = 3;
            this.collectedCount.Text = "0";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(185, 11);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(110, 13);
            this.label8.TabIndex = 2;
            this.label8.Text = "Collected id-text pairs:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 29);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(114, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Update data stats from";
            // 
            // updateDataStats
            // 
            this.updateDataStats.BackColor = System.Drawing.Color.Black;
            this.updateDataStats.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.updateDataStats.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.updateDataStats.Location = new System.Drawing.Point(6, 3);
            this.updateDataStats.Name = "updateDataStats";
            this.updateDataStats.Size = new System.Drawing.Size(174, 23);
            this.updateDataStats.TabIndex = 0;
            this.updateDataStats.Text = "Update all mods";
            this.updateDataStats.UseVisualStyleBackColor = false;
            this.updateDataStats.Click += new System.EventHandler(this.updateDataStats_Click);
            // 
            // poetradepost
            // 
            this.poetradepost.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.poetradepost.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.poetradepost.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.poetradepost.Location = new System.Drawing.Point(473, 483);
            this.poetradepost.Name = "poetradepost";
            this.poetradepost.Size = new System.Drawing.Size(75, 23);
            this.poetradepost.TabIndex = 4;
            this.poetradepost.Text = "poe.trade";
            this.poetradepost.UseVisualStyleBackColor = false;
            this.poetradepost.Click += new System.EventHandler(this.poetradepost_Click);
            // 
            // tradeLink
            // 
            this.tradeLink.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.tradeLink.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.tradeLink.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.tradeLink.Location = new System.Drawing.Point(368, 483);
            this.tradeLink.Name = "tradeLink";
            this.tradeLink.Size = new System.Drawing.Size(99, 23);
            this.tradeLink.TabIndex = 3;
            this.tradeLink.Text = "Off. Trade";
            this.tradeLink.UseVisualStyleBackColor = false;
            this.tradeLink.Click += new System.EventHandler(this.tradeLink_Click);
            // 
            // searchMods
            // 
            this.searchMods.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.searchMods.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.searchMods.Location = new System.Drawing.Point(9, 483);
            this.searchMods.Name = "searchMods";
            this.searchMods.Size = new System.Drawing.Size(152, 23);
            this.searchMods.TabIndex = 2;
            this.searchMods.Text = "search mods on map";
            this.searchMods.UseVisualStyleBackColor = false;
            this.searchMods.Click += new System.EventHandler(this.searchMods_Click);
            // 
            // richTextBox4
            // 
            this.richTextBox4.Location = new System.Drawing.Point(9, 324);
            this.richTextBox4.Name = "richTextBox4";
            this.richTextBox4.Size = new System.Drawing.Size(539, 153);
            this.richTextBox4.TabIndex = 1;
            this.richTextBox4.Text = "";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(6, 306);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(69, 13);
            this.label9.TabIndex = 0;
            this.label9.Text = "Search mods";
            // 
            // findmods
            // 
            this.findmods.Location = new System.Drawing.Point(576, 32);
            this.findmods.MaxLength = 100000;
            this.findmods.Multiline = true;
            this.findmods.Name = "findmods";
            this.findmods.Size = new System.Drawing.Size(253, 255);
            this.findmods.TabIndex = 7;
            // 
            // clearmods
            // 
            this.clearmods.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.clearmods.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.clearmods.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.clearmods.Location = new System.Drawing.Point(576, 293);
            this.clearmods.Name = "clearmods";
            this.clearmods.Size = new System.Drawing.Size(253, 23);
            this.clearmods.TabIndex = 8;
            this.clearmods.Text = "clear";
            this.clearmods.UseVisualStyleBackColor = false;
            this.clearmods.Click += new System.EventHandler(this.clearmods_Click);
            // 
            // PathOfSearching
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(837, 555);
            this.Controls.Add(this.clearmods);
            this.Controls.Add(this.findmods);
            this.Controls.Add(this.tabControl1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "PathOfSearching";
            this.Text = "Path of Searching";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public static System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        public static System.Windows.Forms.Label bestVal;
        public static System.Windows.Forms.RichTextBox richTextBox2;
        public static System.Windows.Forms.Label label4;
        public System.Windows.Forms.RichTextBox richTextBox3;
        private System.Windows.Forms.TextBox findmods;
        private System.Windows.Forms.Button clearmods;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button updateDataStats;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label collectedCount;
        private System.Windows.Forms.Button convertToLuaRules;
        private System.Windows.Forms.Button searchMods;
        private System.Windows.Forms.RichTextBox richTextBox4;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button tradeLink;
        private System.Windows.Forms.Button poetradepost;
        private System.Windows.Forms.Button findMod;
    }
}

