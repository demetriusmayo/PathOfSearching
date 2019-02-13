namespace Demo
{
    partial class Form1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.richTextBox3 = new System.Windows.Forms.RichTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.findmods = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.clearmods = new System.Windows.Forms.Button();
            this.updateDataStats = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.collectedCount = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
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
            this.button1.Location = new System.Drawing.Point(9, 259);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Convert";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(562, 743);
            this.tabControl1.TabIndex = 3;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.richTextBox3);
            this.tabPage1.Controls.Add(this.label5);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(554, 717);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "One item search";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // richTextBox3
            // 
            this.richTextBox3.Location = new System.Drawing.Point(9, 20);
            this.richTextBox3.Name = "richTextBox3";
            this.richTextBox3.Size = new System.Drawing.Size(672, 233);
            this.richTextBox3.TabIndex = 5;
            this.richTextBox3.Text = resources.GetString("richTextBox3.Text");
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(61, 288);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(22, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "(.?)";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 289);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "mods";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.label2);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(554, 717);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "About tool";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(286, 211);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(120, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Ukrainian Boys (c) 2019";
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.collectedCount);
            this.tabPage3.Controls.Add(this.label8);
            this.tabPage3.Controls.Add(this.label7);
            this.tabPage3.Controls.Add(this.updateDataStats);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(554, 717);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Api Trade";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // findmods
            // 
            this.findmods.Location = new System.Drawing.Point(576, 32);
            this.findmods.MaxLength = 100000;
            this.findmods.Multiline = true;
            this.findmods.Name = "findmods";
            this.findmods.Size = new System.Drawing.Size(253, 723);
            this.findmods.TabIndex = 7;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(665, 758);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(56, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Find Mods";
            // 
            // clearmods
            // 
            this.clearmods.Location = new System.Drawing.Point(668, 3);
            this.clearmods.Name = "clearmods";
            this.clearmods.Size = new System.Drawing.Size(75, 23);
            this.clearmods.TabIndex = 8;
            this.clearmods.Text = "clear";
            this.clearmods.UseVisualStyleBackColor = true;
            this.clearmods.Click += new System.EventHandler(this.clearmods_Click);
            // 
            // updateDataStats
            // 
            this.updateDataStats.Location = new System.Drawing.Point(7, 10);
            this.updateDataStats.Name = "updateDataStats";
            this.updateDataStats.Size = new System.Drawing.Size(75, 23);
            this.updateDataStats.TabIndex = 0;
            this.updateDataStats.Text = "Update Data Stats";
            this.updateDataStats.UseVisualStyleBackColor = true;
            this.updateDataStats.Click += new System.EventHandler(this.updateDataStats_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(88, 15);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(367, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Updata data stats from <https://www.pathofexile.com/api/trade/data/stats>";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(7, 40);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(110, 13);
            this.label8.TabIndex = 2;
            this.label8.Text = "Collected id-text pairs:";
            // 
            // collectedCount
            // 
            this.collectedCount.AutoSize = true;
            this.collectedCount.Location = new System.Drawing.Point(124, 40);
            this.collectedCount.Name = "collectedCount";
            this.collectedCount.Size = new System.Drawing.Size(13, 13);
            this.collectedCount.TabIndex = 3;
            this.collectedCount.Text = "0";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(925, 780);
            this.Controls.Add(this.clearmods);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.findmods);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "Import item data ALIVE";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
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
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label label2;
        public static System.Windows.Forms.Label bestVal;
        private System.Windows.Forms.Label label3;
        public static System.Windows.Forms.RichTextBox richTextBox2;
        public static System.Windows.Forms.Label label4;
        public System.Windows.Forms.Label label5;
        public System.Windows.Forms.RichTextBox richTextBox3;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox findmods;
        private System.Windows.Forms.Button clearmods;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button updateDataStats;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label collectedCount;
    }
}

