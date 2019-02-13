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
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.label3 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            Form1.label5 = new System.Windows.Forms.Label();
            Form1.richTextBox3 = new System.Windows.Forms.RichTextBox();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
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
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(695, 494);
            this.tabControl1.TabIndex = 3;
            //
            // tabPage1
            //
            this.tabPage1.Controls.Add(Form1.richTextBox3);
            this.tabPage1.Controls.Add(Form1.label5);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(687, 468);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "One item search";
            this.tabPage1.UseVisualStyleBackColor = true;
            //
            // label3
            //
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 289);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(45, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "bestVal:";
            //
            // tabPage2
            //
            this.tabPage2.Controls.Add(this.label2);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(687, 468);
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
            // label5
            //
            Form1.label5.AutoSize = true;
            Form1.label5.Location = new System.Drawing.Point(61, 288);
            Form1.label5.Name = "label5";
            Form1.label5.Size = new System.Drawing.Size(35, 13);
            Form1.label5.TabIndex = 4;
            Form1.label5.Text = "(.?)";
            //
            // richTextBox3
            //
            Form1.richTextBox3.Location = new System.Drawing.Point(9, 20);
            Form1.richTextBox3.Name = "richTextBox3";
            Form1.richTextBox3.Size = new System.Drawing.Size(392, 233);
            Form1.richTextBox3.TabIndex = 5;
            Form1.richTextBox3.Text = @"Rarity: Unique
Queen of the Forest
Destiny Leather
--------
Evasion Rating: 2037 (augmented)
--------
Requirements:
Level: 59
Dex: 160
--------
Sockets: G G 
--------
Item Level: 76
--------
5% increased maximum Energy Shield
--------
239% increased Evasion Rating
+60 to maximum Life
+10% to Fire Resistance
+31% to Cold Resistance
+15% to Lightning Resistance
25% reduced Movement Speed
1% increased Movement Speed per 600 Evasion Rating, up to 75%
-50 Physical Damage taken when Hit by Animals
--------
Shedding away her regal past, 
she forged a new destiny. 
Sacrificing the ephemeral joys of man, 
she embraced the eternal grasp of nature. 
Seizing her one true wish, 
she found peace at last.
--------
Corrupted
--------
Note: ~price 10 chaos
";
            //
            // Form1
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(711, 511);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "Import item data ALIVE";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);

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
        public static System.Windows.Forms.Label label5;
        public static System.Windows.Forms.RichTextBox richTextBox3;
    }
}

