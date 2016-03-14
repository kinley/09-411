namespace HospitalSystem
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.clearDepartmentsGrid = new System.Windows.Forms.Button();
            this.load_dep = new System.Windows.Forms.Button();
            this.cancel_dep = new System.Windows.Forms.Button();
            this.del_dep = new System.Windows.Forms.Button();
            this.save_dep = new System.Windows.Forms.Button();
            this.add_dep = new System.Windows.Forms.Button();
            this.Departments = new System.Windows.Forms.DataGridView();
            this.d_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.idhosp = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.d_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manager = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.clearDoctorsGrid = new System.Windows.Forms.Button();
            this.load_doc = new System.Windows.Forms.Button();
            this.cancel_doc = new System.Windows.Forms.Button();
            this.del_doc = new System.Windows.Forms.Button();
            this.save_doc = new System.Windows.Forms.Button();
            this.add_doc = new System.Windows.Forms.Button();
            this.Doctors = new System.Windows.Forms.DataGridView();
            this.d_ic = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dochospid = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iddep = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cabinet = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.email = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.speciality = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.clearHospitalsGrid = new System.Windows.Forms.Button();
            this.load_hosp = new System.Windows.Forms.Button();
            this.cancel_hosp = new System.Windows.Forms.Button();
            this.del_hosp = new System.Windows.Forms.Button();
            this.save_hosp = new System.Windows.Forms.Button();
            this.add_hosp = new System.Windows.Forms.Button();
            this.Hospitals = new System.Windows.Forms.DataGridView();
            this.h_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.h_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.head = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.propertyGrid3 = new System.Windows.Forms.PropertyGrid();
            this.listBox3 = new System.Windows.Forms.ListBox();
            this.propertyGrid2 = new System.Windows.Forms.PropertyGrid();
            this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
            this.listBox2 = new System.Windows.Forms.ListBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.загрузитьИнформациюОБольницахToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.оБольницахToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.обОтделенияхToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.оВрачахToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.вывестиВсюИнформациюToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.очиститьПоляToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.справкаToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.tabPage2.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Departments)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Doctors)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Hospitals)).BeginInit();
            this.tabPage1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.groupBox2);
            this.tabPage2.Controls.Add(this.groupBox3);
            this.tabPage2.Controls.Add(this.groupBox1);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(977, 706);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Создание/Редактирование";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.clearDepartmentsGrid);
            this.groupBox2.Controls.Add(this.load_dep);
            this.groupBox2.Controls.Add(this.cancel_dep);
            this.groupBox2.Controls.Add(this.del_dep);
            this.groupBox2.Controls.Add(this.save_dep);
            this.groupBox2.Controls.Add(this.add_dep);
            this.groupBox2.Controls.Add(this.Departments);
            this.groupBox2.Location = new System.Drawing.Point(6, 235);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(771, 219);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Отделения";
            // 
            // clearDepartmentsGrid
            // 
            this.clearDepartmentsGrid.Enabled = false;
            this.clearDepartmentsGrid.Location = new System.Drawing.Point(602, 184);
            this.clearDepartmentsGrid.Name = "clearDepartmentsGrid";
            this.clearDepartmentsGrid.Size = new System.Drawing.Size(122, 27);
            this.clearDepartmentsGrid.TabIndex = 10;
            this.clearDepartmentsGrid.Text = "Очистить поля";
            this.clearDepartmentsGrid.UseVisualStyleBackColor = true;
            this.clearDepartmentsGrid.Click += new System.EventHandler(this.clearDepartmentsGrid_Click);
            // 
            // load_dep
            // 
            this.load_dep.Location = new System.Drawing.Point(602, 25);
            this.load_dep.Name = "load_dep";
            this.load_dep.Size = new System.Drawing.Size(122, 28);
            this.load_dep.TabIndex = 9;
            this.load_dep.Text = "Загрузить из файла";
            this.load_dep.UseVisualStyleBackColor = true;
            this.load_dep.Click += new System.EventHandler(this.load_dep_Click);
            // 
            // cancel_dep
            // 
            this.cancel_dep.Enabled = false;
            this.cancel_dep.Location = new System.Drawing.Point(602, 152);
            this.cancel_dep.Name = "cancel_dep";
            this.cancel_dep.Size = new System.Drawing.Size(122, 27);
            this.cancel_dep.TabIndex = 8;
            this.cancel_dep.Text = "Отмена";
            this.cancel_dep.UseVisualStyleBackColor = true;
            this.cancel_dep.Click += new System.EventHandler(this.cancel_dep_Click);
            // 
            // del_dep
            // 
            this.del_dep.Enabled = false;
            this.del_dep.Location = new System.Drawing.Point(602, 89);
            this.del_dep.Name = "del_dep";
            this.del_dep.Size = new System.Drawing.Size(122, 27);
            this.del_dep.TabIndex = 7;
            this.del_dep.Text = "Удалить";
            this.del_dep.UseVisualStyleBackColor = true;
            this.del_dep.Click += new System.EventHandler(this.del_dep_Click);
            // 
            // save_dep
            // 
            this.save_dep.Enabled = false;
            this.save_dep.Location = new System.Drawing.Point(602, 121);
            this.save_dep.Name = "save_dep";
            this.save_dep.Size = new System.Drawing.Size(122, 27);
            this.save_dep.TabIndex = 6;
            this.save_dep.Text = "Сохранить";
            this.save_dep.UseVisualStyleBackColor = true;
            this.save_dep.Click += new System.EventHandler(this.save_dep_Click);
            // 
            // add_dep
            // 
            this.add_dep.Location = new System.Drawing.Point(602, 57);
            this.add_dep.Name = "add_dep";
            this.add_dep.Size = new System.Drawing.Size(122, 27);
            this.add_dep.TabIndex = 5;
            this.add_dep.Text = "Добавить";
            this.add_dep.UseVisualStyleBackColor = true;
            this.add_dep.Click += new System.EventHandler(this.add_dep_Click);
            // 
            // Departments
            // 
            this.Departments.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Departments.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.d_id,
            this.idhosp,
            this.d_name,
            this.manager});
            this.Departments.Location = new System.Drawing.Point(25, 19);
            this.Departments.Name = "Departments";
            this.Departments.ReadOnly = true;
            this.Departments.Size = new System.Drawing.Size(445, 192);
            this.Departments.TabIndex = 1;
            // 
            // d_id
            // 
            this.d_id.HeaderText = "ID Отеделения";
            this.d_id.Name = "d_id";
            this.d_id.ReadOnly = true;
            // 
            // idhosp
            // 
            this.idhosp.HeaderText = "ID Больницы";
            this.idhosp.Name = "idhosp";
            this.idhosp.ReadOnly = true;
            // 
            // d_name
            // 
            this.d_name.HeaderText = "Название";
            this.d_name.Name = "d_name";
            this.d_name.ReadOnly = true;
            // 
            // manager
            // 
            this.manager.HeaderText = "Заведующий отделением";
            this.manager.Name = "manager";
            this.manager.ReadOnly = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.clearDoctorsGrid);
            this.groupBox3.Controls.Add(this.load_doc);
            this.groupBox3.Controls.Add(this.cancel_doc);
            this.groupBox3.Controls.Add(this.del_doc);
            this.groupBox3.Controls.Add(this.save_doc);
            this.groupBox3.Controls.Add(this.add_doc);
            this.groupBox3.Controls.Add(this.Doctors);
            this.groupBox3.Location = new System.Drawing.Point(6, 474);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(953, 226);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Врачи";
            // 
            // clearDoctorsGrid
            // 
            this.clearDoctorsGrid.Enabled = false;
            this.clearDoctorsGrid.Location = new System.Drawing.Point(811, 189);
            this.clearDoctorsGrid.Name = "clearDoctorsGrid";
            this.clearDoctorsGrid.Size = new System.Drawing.Size(122, 27);
            this.clearDoctorsGrid.TabIndex = 10;
            this.clearDoctorsGrid.Text = "Очистить поля";
            this.clearDoctorsGrid.UseVisualStyleBackColor = true;
            this.clearDoctorsGrid.Click += new System.EventHandler(this.clearDoctorsGrid_Click);
            // 
            // load_doc
            // 
            this.load_doc.Location = new System.Drawing.Point(811, 25);
            this.load_doc.Name = "load_doc";
            this.load_doc.Size = new System.Drawing.Size(122, 27);
            this.load_doc.TabIndex = 9;
            this.load_doc.Text = "Загрузить из файла";
            this.load_doc.UseVisualStyleBackColor = true;
            this.load_doc.Click += new System.EventHandler(this.load_doc_Click);
            // 
            // cancel_doc
            // 
            this.cancel_doc.Enabled = false;
            this.cancel_doc.Location = new System.Drawing.Point(811, 156);
            this.cancel_doc.Name = "cancel_doc";
            this.cancel_doc.Size = new System.Drawing.Size(122, 27);
            this.cancel_doc.TabIndex = 8;
            this.cancel_doc.Text = "Отмена";
            this.cancel_doc.UseVisualStyleBackColor = true;
            this.cancel_doc.Click += new System.EventHandler(this.cancel_doc_Click);
            // 
            // del_doc
            // 
            this.del_doc.Enabled = false;
            this.del_doc.Location = new System.Drawing.Point(811, 91);
            this.del_doc.Name = "del_doc";
            this.del_doc.Size = new System.Drawing.Size(122, 27);
            this.del_doc.TabIndex = 7;
            this.del_doc.Text = "Удалить";
            this.del_doc.UseVisualStyleBackColor = true;
            this.del_doc.Click += new System.EventHandler(this.del_doc_Click);
            // 
            // save_doc
            // 
            this.save_doc.Enabled = false;
            this.save_doc.Location = new System.Drawing.Point(811, 124);
            this.save_doc.Name = "save_doc";
            this.save_doc.Size = new System.Drawing.Size(122, 27);
            this.save_doc.TabIndex = 6;
            this.save_doc.Text = "Сохранить";
            this.save_doc.UseVisualStyleBackColor = true;
            this.save_doc.Click += new System.EventHandler(this.save_doc_Click);
            // 
            // add_doc
            // 
            this.add_doc.Location = new System.Drawing.Point(811, 58);
            this.add_doc.Name = "add_doc";
            this.add_doc.Size = new System.Drawing.Size(122, 27);
            this.add_doc.TabIndex = 5;
            this.add_doc.Text = "Добавить";
            this.add_doc.UseVisualStyleBackColor = true;
            this.add_doc.Click += new System.EventHandler(this.add_doc_Click);
            // 
            // Doctors
            // 
            this.Doctors.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Doctors.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.d_ic,
            this.dochospid,
            this.iddep,
            this.name,
            this.cabinet,
            this.email,
            this.speciality});
            this.Doctors.Location = new System.Drawing.Point(26, 25);
            this.Doctors.Name = "Doctors";
            this.Doctors.ReadOnly = true;
            this.Doctors.Size = new System.Drawing.Size(745, 191);
            this.Doctors.TabIndex = 1;
            this.Doctors.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Doctors_CellContentClick);
            // 
            // d_ic
            // 
            this.d_ic.HeaderText = "ID Врача";
            this.d_ic.Name = "d_ic";
            this.d_ic.ReadOnly = true;
            // 
            // dochospid
            // 
            this.dochospid.HeaderText = "ID Больницы";
            this.dochospid.Name = "dochospid";
            this.dochospid.ReadOnly = true;
            // 
            // iddep
            // 
            this.iddep.HeaderText = "ID Отделения";
            this.iddep.Name = "iddep";
            this.iddep.ReadOnly = true;
            // 
            // name
            // 
            this.name.HeaderText = "Имя";
            this.name.Name = "name";
            this.name.ReadOnly = true;
            // 
            // cabinet
            // 
            this.cabinet.HeaderText = "Кабинет";
            this.cabinet.Name = "cabinet";
            this.cabinet.ReadOnly = true;
            // 
            // email
            // 
            this.email.HeaderText = "Email";
            this.email.Name = "email";
            this.email.ReadOnly = true;
            // 
            // speciality
            // 
            this.speciality.HeaderText = "Специальность";
            this.speciality.Name = "speciality";
            this.speciality.ReadOnly = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.clearHospitalsGrid);
            this.groupBox1.Controls.Add(this.load_hosp);
            this.groupBox1.Controls.Add(this.cancel_hosp);
            this.groupBox1.Controls.Add(this.del_hosp);
            this.groupBox1.Controls.Add(this.save_hosp);
            this.groupBox1.Controls.Add(this.add_hosp);
            this.groupBox1.Controls.Add(this.Hospitals);
            this.groupBox1.Location = new System.Drawing.Point(6, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(771, 223);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Больницы";
            // 
            // clearHospitalsGrid
            // 
            this.clearHospitalsGrid.Enabled = false;
            this.clearHospitalsGrid.Location = new System.Drawing.Point(602, 183);
            this.clearHospitalsGrid.Name = "clearHospitalsGrid";
            this.clearHospitalsGrid.Size = new System.Drawing.Size(122, 27);
            this.clearHospitalsGrid.TabIndex = 2;
            this.clearHospitalsGrid.Text = "Очистить поля";
            this.clearHospitalsGrid.UseVisualStyleBackColor = true;
            this.clearHospitalsGrid.Click += new System.EventHandler(this.clearHospitalsGrid_Click);
            // 
            // load_hosp
            // 
            this.load_hosp.Location = new System.Drawing.Point(602, 19);
            this.load_hosp.Name = "load_hosp";
            this.load_hosp.Size = new System.Drawing.Size(122, 27);
            this.load_hosp.TabIndex = 5;
            this.load_hosp.Text = "Загрузить из файла";
            this.load_hosp.UseVisualStyleBackColor = true;
            this.load_hosp.Click += new System.EventHandler(this.load_hosp_Click);
            // 
            // cancel_hosp
            // 
            this.cancel_hosp.Enabled = false;
            this.cancel_hosp.Location = new System.Drawing.Point(602, 150);
            this.cancel_hosp.Name = "cancel_hosp";
            this.cancel_hosp.Size = new System.Drawing.Size(122, 27);
            this.cancel_hosp.TabIndex = 4;
            this.cancel_hosp.Text = "Отмена";
            this.cancel_hosp.UseVisualStyleBackColor = true;
            this.cancel_hosp.Click += new System.EventHandler(this.cancel_hosp_Click);
            // 
            // del_hosp
            // 
            this.del_hosp.Enabled = false;
            this.del_hosp.Location = new System.Drawing.Point(602, 84);
            this.del_hosp.Name = "del_hosp";
            this.del_hosp.Size = new System.Drawing.Size(122, 27);
            this.del_hosp.TabIndex = 3;
            this.del_hosp.Text = "Удалить";
            this.del_hosp.UseVisualStyleBackColor = true;
            this.del_hosp.Click += new System.EventHandler(this.del_hosp_Click);
            // 
            // save_hosp
            // 
            this.save_hosp.Enabled = false;
            this.save_hosp.Location = new System.Drawing.Point(602, 117);
            this.save_hosp.Name = "save_hosp";
            this.save_hosp.Size = new System.Drawing.Size(122, 27);
            this.save_hosp.TabIndex = 2;
            this.save_hosp.Text = "Сохранить";
            this.save_hosp.UseVisualStyleBackColor = true;
            this.save_hosp.Click += new System.EventHandler(this.save_hosp_Click);
            // 
            // add_hosp
            // 
            this.add_hosp.Location = new System.Drawing.Point(602, 51);
            this.add_hosp.Name = "add_hosp";
            this.add_hosp.Size = new System.Drawing.Size(122, 27);
            this.add_hosp.TabIndex = 1;
            this.add_hosp.Text = "Добавить";
            this.add_hosp.UseVisualStyleBackColor = true;
            this.add_hosp.Click += new System.EventHandler(this.add_hosp_Click);
            // 
            // Hospitals
            // 
            this.Hospitals.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Hospitals.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.h_id,
            this.h_name,
            this.address,
            this.phone,
            this.head});
            this.Hospitals.Location = new System.Drawing.Point(25, 19);
            this.Hospitals.Name = "Hospitals";
            this.Hospitals.ReadOnly = true;
            this.Hospitals.Size = new System.Drawing.Size(546, 191);
            this.Hospitals.TabIndex = 0;
            // 
            // h_id
            // 
            this.h_id.HeaderText = "ID Больницы";
            this.h_id.Name = "h_id";
            this.h_id.ReadOnly = true;
            // 
            // h_name
            // 
            this.h_name.HeaderText = "Название";
            this.h_name.Name = "h_name";
            this.h_name.ReadOnly = true;
            // 
            // address
            // 
            this.address.HeaderText = "Адрес";
            this.address.Name = "address";
            this.address.ReadOnly = true;
            // 
            // phone
            // 
            this.phone.HeaderText = "Телефон";
            this.phone.Name = "phone";
            this.phone.ReadOnly = true;
            // 
            // head
            // 
            this.head.HeaderText = "Главный врач";
            this.head.Name = "head";
            this.head.ReadOnly = true;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.propertyGrid3);
            this.tabPage1.Controls.Add(this.listBox3);
            this.tabPage1.Controls.Add(this.propertyGrid2);
            this.tabPage1.Controls.Add(this.propertyGrid1);
            this.tabPage1.Controls.Add(this.listBox2);
            this.tabPage1.Controls.Add(this.listBox1);
            this.tabPage1.Controls.Add(this.menuStrip1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(977, 706);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Просмотр";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // propertyGrid3
            // 
            this.propertyGrid3.HelpVisible = false;
            this.propertyGrid3.Location = new System.Drawing.Point(500, 441);
            this.propertyGrid3.Name = "propertyGrid3";
            this.propertyGrid3.PropertySort = System.Windows.Forms.PropertySort.NoSort;
            this.propertyGrid3.Size = new System.Drawing.Size(409, 159);
            this.propertyGrid3.TabIndex = 8;
            this.propertyGrid3.ToolbarVisible = false;
            // 
            // listBox3
            // 
            this.listBox3.FormattingEnabled = true;
            this.listBox3.Location = new System.Drawing.Point(76, 440);
            this.listBox3.Name = "listBox3";
            this.listBox3.Size = new System.Drawing.Size(409, 160);
            this.listBox3.TabIndex = 7;
            this.listBox3.SelectedIndexChanged += new System.EventHandler(this.listBox3_SelectedIndexChanged_1);
            // 
            // propertyGrid2
            // 
            this.propertyGrid2.HelpVisible = false;
            this.propertyGrid2.Location = new System.Drawing.Point(500, 273);
            this.propertyGrid2.Name = "propertyGrid2";
            this.propertyGrid2.PropertySort = System.Windows.Forms.PropertySort.NoSort;
            this.propertyGrid2.Size = new System.Drawing.Size(409, 159);
            this.propertyGrid2.TabIndex = 4;
            this.propertyGrid2.ToolbarVisible = false;
            // 
            // propertyGrid1
            // 
            this.propertyGrid1.HelpVisible = false;
            this.propertyGrid1.Location = new System.Drawing.Point(500, 108);
            this.propertyGrid1.Name = "propertyGrid1";
            this.propertyGrid1.PropertySort = System.Windows.Forms.PropertySort.NoSort;
            this.propertyGrid1.Size = new System.Drawing.Size(409, 159);
            this.propertyGrid1.TabIndex = 3;
            this.propertyGrid1.ToolbarVisible = false;
            // 
            // listBox2
            // 
            this.listBox2.FormattingEnabled = true;
            this.listBox2.Location = new System.Drawing.Point(76, 274);
            this.listBox2.Name = "listBox2";
            this.listBox2.Size = new System.Drawing.Size(409, 160);
            this.listBox2.TabIndex = 1;
            this.listBox2.SelectedIndexChanged += new System.EventHandler(this.listBox2_SelectedIndexChanged);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(76, 108);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(409, 160);
            this.listBox1.TabIndex = 0;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.загрузитьИнформациюОБольницахToolStripMenuItem,
            this.очиститьПоляToolStripMenuItem,
            this.справкаToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(3, 3);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(971, 24);
            this.menuStrip1.TabIndex = 6;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // загрузитьИнформациюОБольницахToolStripMenuItem
            // 
            this.загрузитьИнформациюОБольницахToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.оБольницахToolStripMenuItem,
            this.обОтделенияхToolStripMenuItem,
            this.оВрачахToolStripMenuItem,
            this.вывестиВсюИнформациюToolStripMenuItem});
            this.загрузитьИнформациюОБольницахToolStripMenuItem.Name = "загрузитьИнформациюОБольницахToolStripMenuItem";
            this.загрузитьИнформациюОБольницахToolStripMenuItem.Size = new System.Drawing.Size(152, 20);
            this.загрузитьИнформациюОБольницахToolStripMenuItem.Text = "Загрузить информацию";
            this.загрузитьИнформациюОБольницахToolStripMenuItem.Click += new System.EventHandler(this.загрузитьИнформациюОБольницахToolStripMenuItem_Click);
            // 
            // оБольницахToolStripMenuItem
            // 
            this.оБольницахToolStripMenuItem.Name = "оБольницахToolStripMenuItem";
            this.оБольницахToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.оБольницахToolStripMenuItem.Text = "О больницах";
            this.оБольницахToolStripMenuItem.Click += new System.EventHandler(this.оБольницахToolStripMenuItem_Click);
            // 
            // обОтделенияхToolStripMenuItem
            // 
            this.обОтделенияхToolStripMenuItem.Name = "обОтделенияхToolStripMenuItem";
            this.обОтделенияхToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.обОтделенияхToolStripMenuItem.Text = "Об отделениях";
            this.обОтделенияхToolStripMenuItem.Click += new System.EventHandler(this.обОтделенияхToolStripMenuItem_Click);
            // 
            // оВрачахToolStripMenuItem
            // 
            this.оВрачахToolStripMenuItem.Name = "оВрачахToolStripMenuItem";
            this.оВрачахToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.оВрачахToolStripMenuItem.Text = "О врачах";
            this.оВрачахToolStripMenuItem.Click += new System.EventHandler(this.оВрачахToolStripMenuItem_Click);
            // 
            // вывестиВсюИнформациюToolStripMenuItem
            // 
            this.вывестиВсюИнформациюToolStripMenuItem.Name = "вывестиВсюИнформациюToolStripMenuItem";
            this.вывестиВсюИнформациюToolStripMenuItem.Size = new System.Drawing.Size(224, 22);
            this.вывестиВсюИнформациюToolStripMenuItem.Text = "Вывести всю информацию";
            this.вывестиВсюИнформациюToolStripMenuItem.Click += new System.EventHandler(this.вывестиВсюИнформациюToolStripMenuItem_Click);
            // 
            // очиститьПоляToolStripMenuItem
            // 
            this.очиститьПоляToolStripMenuItem.Name = "очиститьПоляToolStripMenuItem";
            this.очиститьПоляToolStripMenuItem.Size = new System.Drawing.Size(101, 20);
            this.очиститьПоляToolStripMenuItem.Text = "Очистить поля";
            this.очиститьПоляToolStripMenuItem.Click += new System.EventHandler(this.очиститьПоляToolStripMenuItem_Click_1);
            // 
            // справкаToolStripMenuItem
            // 
            this.справкаToolStripMenuItem.Name = "справкаToolStripMenuItem";
            this.справкаToolStripMenuItem.Size = new System.Drawing.Size(65, 20);
            this.справкаToolStripMenuItem.Text = "Справка";
            this.справкаToolStripMenuItem.Click += new System.EventHandler(this.справкаToolStripMenuItem_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(985, 732);
            this.tabControl1.TabIndex = 0;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1008, 748);
            this.Controls.Add(this.tabControl1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Hospital DataStorageSystem";
            this.tabPage2.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Departments)).EndInit();
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Doctors)).EndInit();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Hospitals)).EndInit();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button load_dep;
        private System.Windows.Forms.Button cancel_dep;
        private System.Windows.Forms.Button del_dep;
        private System.Windows.Forms.Button save_dep;
        private System.Windows.Forms.Button add_dep;
        private System.Windows.Forms.DataGridView Departments;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button load_doc;
        private System.Windows.Forms.Button cancel_doc;
        private System.Windows.Forms.Button del_doc;
        private System.Windows.Forms.Button save_doc;
        private System.Windows.Forms.Button add_doc;
        private System.Windows.Forms.DataGridView Doctors;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button load_hosp;
        private System.Windows.Forms.Button cancel_hosp;
        private System.Windows.Forms.Button del_hosp;
        private System.Windows.Forms.Button save_hosp;
        private System.Windows.Forms.Button add_hosp;
        private System.Windows.Forms.DataGridView Hospitals;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.PropertyGrid propertyGrid2;
        private System.Windows.Forms.PropertyGrid propertyGrid1;
        private System.Windows.Forms.ListBox listBox2;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem загрузитьИнформациюОБольницахToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem справкаToolStripMenuItem;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dochospid;
        private System.Windows.Forms.DataGridViewTextBoxColumn speciality;
        private System.Windows.Forms.DataGridViewTextBoxColumn email;
        private System.Windows.Forms.DataGridViewTextBoxColumn cabinet;
        private System.Windows.Forms.DataGridViewTextBoxColumn name;
        private System.Windows.Forms.DataGridViewTextBoxColumn iddep;
        private System.Windows.Forms.DataGridViewTextBoxColumn d_ic;
        private System.Windows.Forms.ListBox listBox3;
        private System.Windows.Forms.PropertyGrid propertyGrid3;
        private System.Windows.Forms.DataGridViewTextBoxColumn head;
        private System.Windows.Forms.DataGridViewTextBoxColumn phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn address;
        private System.Windows.Forms.DataGridViewTextBoxColumn h_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn h_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn manager;
        private System.Windows.Forms.DataGridViewTextBoxColumn d_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn d_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn idhosp;
        private System.Windows.Forms.ToolStripMenuItem очиститьПоляToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem оБольницахToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem обОтделенияхToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem оВрачахToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem вывестиВсюИнформациюToolStripMenuItem;
        private System.Windows.Forms.Button clearHospitalsGrid;
        private System.Windows.Forms.Button clearDepartmentsGrid;
        private System.Windows.Forms.Button clearDoctorsGrid;
    }
}

