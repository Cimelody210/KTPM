namespace yami_ai
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
            this.userbox = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.buttonfind = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.CContext = new System.Windows.Forms.CheckBox();
            this.chatrichTextBox = new System.Windows.Forms.RichTextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // userbox
            // 
            this.userbox.BackColor = System.Drawing.SystemColors.ControlLight;
            this.userbox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.userbox.Location = new System.Drawing.Point(21, 11);
            this.userbox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.userbox.Multiline = true;
            this.userbox.Name = "userbox";
            this.userbox.Size = new System.Drawing.Size(924, 82);
            this.userbox.TabIndex = 0;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.groupBox1.Controls.Add(this.buttonfind);
            this.groupBox1.Controls.Add(this.userbox);
            this.groupBox1.ForeColor = System.Drawing.SystemColors.ControlLight;
            this.groupBox1.Location = new System.Drawing.Point(8, 14);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox1.Size = new System.Drawing.Size(1016, 101);
            this.groupBox1.TabIndex = 5;
            this.groupBox1.TabStop = false;
            // 
            // buttonfind
            // 
            this.buttonfind.BackColor = System.Drawing.SystemColors.ControlLight;
            this.buttonfind.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("buttonfind.BackgroundImage")));
            this.buttonfind.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.buttonfind.FlatAppearance.BorderSize = 0;
            this.buttonfind.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonfind.Location = new System.Drawing.Point(947, 23);
            this.buttonfind.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonfind.Name = "buttonfind";
            this.buttonfind.Size = new System.Drawing.Size(64, 46);
            this.buttonfind.TabIndex = 1;
            this.buttonfind.UseVisualStyleBackColor = false;
            this.buttonfind.Click += new System.EventHandler(this.buttonfind_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Controls.Add(this.CContext);
            this.groupBox2.Controls.Add(this.chatrichTextBox);
            this.groupBox2.Location = new System.Drawing.Point(11, 130);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox2.Size = new System.Drawing.Size(1032, 409);
            this.groupBox2.TabIndex = 6;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "chat:";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(976, 358);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(43, 43);
            this.button1.TabIndex = 2;
            this.button1.Text = "↺";
            this.button1.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // CContext
            // 
            this.CContext.AutoSize = true;
            this.CContext.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.CContext.Location = new System.Drawing.Point(879, 380);
            this.CContext.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.CContext.Name = "CContext";
            this.CContext.Size = new System.Drawing.Size(73, 20);
            this.CContext.TabIndex = 1;
            this.CContext.Text = "Context";
            this.CContext.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.CContext.UseVisualStyleBackColor = true;
            // 
            // chatrichTextBox
            // 
            this.chatrichTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.chatrichTextBox.Location = new System.Drawing.Point(11, 23);
            this.chatrichTextBox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.chatrichTextBox.Name = "chatrichTextBox";
            this.chatrichTextBox.ReadOnly = true;
            this.chatrichTextBox.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.chatrichTextBox.ShowSelectionMargin = true;
            this.chatrichTextBox.Size = new System.Drawing.Size(1013, 378);
            this.chatrichTextBox.TabIndex = 0;
            this.chatrichTextBox.Text = "";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.groupBox1);
            this.groupBox3.Location = new System.Drawing.Point(11, 1);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox3.Size = new System.Drawing.Size(1032, 122);
            this.groupBox3.TabIndex = 7;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "user:";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Form1";
            this.Text = "Chat-yami chan";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox userbox;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.RichTextBox chatrichTextBox;
        private System.Windows.Forms.Button buttonfind;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.CheckBox CContext;
        private System.Windows.Forms.GroupBox groupBox3;
    }
}

