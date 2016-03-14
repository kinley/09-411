using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Xml;

namespace HospitalSystem
{
    public partial class Form1 : Form
    {
        public class Hospital
        {
            private string _id;
            private string _name;
            private string _address;
            private string _phone;
            private string _head;

            public Hospital(string id, string name, string address, string phone, string head)
            {
                _id = id;
                _name = name;
                _address = address;
                _phone = phone;
                _head = head;
            }

            public string HOSPITAL_ID
            {
                get
                {
                    return _id;
                }
            }

            public string NAME
            {
                get
                {
                    return _name;
                }
            }

            public string ADDRESS
            {
                get
                {
                    return _address;
                }
            }

            public string PHONE
            {
                get
                {
                    return _phone;
                }
            }

            public string HEAD
            {
                get
                {
                    return _head;
                }
            }
        }

        public class Department
        {
            private string _id;
            private string _idhosp;
            private string _name;
            private string _manager;

            public Department(string id, string idhosp, string name, string manager)
            {
                _id = id;
                _idhosp = idhosp;
                _name = name;
                _manager = manager;
            }

            public string HOSPITAL_ID
            {
                get
                {
                    return _idhosp;
                }
            }

            public string DEPARTMENT_ID
            {
                get
                {
                    return _id;
                }
            }


            public string NAME
            {
                get
                {
                    return _name;
                }
            }

            public string MANAGER
            {
                get
                {
                    return _manager;
                }
            }
        }

        public class Doctor
        {
            private string _id;
            private string _dochospid;
            private string _depid;
            private string _name;
            private string _cabinet;
            private string _email;
            private string _speciality;

            public Doctor(string id, string dochospid, string depid, string name, string cabinet, string email, string speciality)
            {
                _id = id;
                _dochospid = dochospid;
                _depid = depid;
                _name = name;
                _cabinet = cabinet;
                _email = email;
                _speciality = speciality;
            }

            public string HOSPITAL_ID
            {
                get
                {
                    return _dochospid;
                }
            }

            public string DEPARTMENT_ID
            {
                get
                {
                    return _depid;
                }
            }

            public string DOCTOR_ID
            {
                get
                {
                    return _id;
                }
            }


            public string NAME
            {
                get
                {
                    return _name;
                }
            }

            public string CABINET
            {
                get
                {
                    return _cabinet;
                }
            }

            public string EMAIL
            {
                get
                {
                    return _email;
                }
            }

            public string SPECIALITY
            {
                get
                {
                    return _speciality;
                }
            }

        }


        private string pathToFile;

        public Form1()
        {
            InitializeComponent();
        }

        private void del_hosp_Click(object sender, EventArgs e)
        {
            try
            {
                Hospitals.Rows.RemoveAt(Hospitals.CurrentRow.Index);
            }
            catch (InvalidOperationException)
            {
                MessageBox.Show("Удаление выполнено", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void загрузитьИнформациюОБольницахToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void listBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                       pathToFile = pathToFile.Split('.')[0];

            XmlDocument doc = new XmlDocument();
            doc.Load(pathToFile + ".xml");
            //listBox3.Items.Clear();
            //pathToFile = pathToFile.Split('.')[0];

            //XmlDocument doc = new XmlDocument();
            //doc.Load(pathToFile + ".xml");

            //foreach (XmlNode node in doc.DocumentElement)
            //{
            //    //string name = node.Attributes[0].Value.ToString();
            //    //string id = node["id"].InnerText;
            //    //string dochospid = node["dochospid"].InnerText;
            //    //string depid = node["depid"].InnerText;
            //    //string cabinet = node["cabinet"].InnerText;
            //    //string email = node["email"].InnerText;
            //    //string speciality = node["speciality"].InnerText;
            //    //listBox1.DisplayMember = "name";
            //    //listBox1.ValueMember = "id";
            //    ////listBox1.Items.Add(new Doctor(name, surname, birthday, email, phone));
            //    //listBox1.Items.Add(new Doctor(id, dochospid, depid, name, cabinet, email, speciality));
            //}


            if (listBox3.SelectedIndex != -1)
            {
                propertyGrid3.SelectedObject = listBox3.SelectedItem;
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pathToFile = pathToFile.Split('.')[0];

            XmlDocument doc = new XmlDocument();
            doc.Load(pathToFile + ".xml");

            //foreach (XmlNode node in doc.DocumentElement)
            //{
            //    //string id = node.Attributes[0].Value.ToString();
            //    //string name = node["name"].InnerText;
            //    //string address = node["address"].InnerText;
            //    //string phone = node["phone"].InnerText;
            //    //string head = node["head"].InnerText;
            //    //listBox2.DisplayMember = "name";
            //    //listBox2.ValueMember = "id";
            //    //public Hospital(string id, string name, string address, string phone, string head)
            //    //listBox2.Items.Add(new Hospital(id, name, address, phone, head));
            //    string id = node.Attributes[0].Value.ToString();
            //    string idhosp = node["idhosp"].InnerText;
            //    string name = node["name"].InnerText;
            //    string manager = node["manager"].InnerText;
            //    listBox3.DisplayMember = "name";
            //    listBox3.ValueMember = "id";
            //    listBox2.Items.Add(new Department(id, idhosp, name, manager));
            //}

            if (listBox1.SelectedIndex != -1)
            {
                propertyGrid1.SelectedObject = listBox1.SelectedItem;
            }
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            pathToFile = pathToFile.Split('.')[0];

            XmlDocument doc = new XmlDocument();
            doc.Load(pathToFile + ".xml");

            //foreach (XmlNode node in doc.DocumentElement)
            //{
            //    //string id = node.Attributes[0].Value.ToString();
            //    //string idhosp = node["idhosp"].InnerText;
            //    //string name = node["name"].InnerText;
            //    //string manager = node["manager"].InnerText;
            //    //listBox3.DisplayMember = "name";
            //    //listBox3.ValueMember = "id";
            //    //listBox3.Items.Add(new Department(id, idhosp, name, manager));
            //    string name = node.Attributes[0].Value.ToString();
            //    string id = node["id"].InnerText;
            //    string dochospid = node["dochospid"].InnerText;
            //    string depid = node["depid"].InnerText;
            //    string cabinet = node["cabinet"].InnerText;
            //    string email = node["email"].InnerText;
            //    string speciality = node["speciality"].InnerText;
            //    listBox1.DisplayMember = "name";
            //    listBox1.ValueMember = "id";
            //    //listBox1.Items.Add(new Doctor(name, surname, birthday, email, phone));
            //    listBox1.Items.Add(new Doctor(id, dochospid, depid, name, cabinet, email, speciality));

            //}

            if (listBox1.SelectedIndex != -1)
            {
                propertyGrid2.SelectedObject = listBox2.SelectedItem;
            }
        }


        private void save_doc_Click(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            XmlDeclaration xmlDecl = xmlDoc.CreateXmlDeclaration("1.0", "utf-8", null);
            xmlDoc.AppendChild(xmlDecl); 

            XmlElement doctorsElement = xmlDoc.CreateElement("Doctors");
            int count = Doctors.Rows.Count;
            for (int i = 0; i < count - 1; i++)
            {
                XmlElement doctorElement = xmlDoc.CreateElement("Doctor");
                doctorElement.SetAttribute("id", Doctors.Rows[i].Cells[0].Value.ToString());

                //listBox1.Items.Add(new Doctor(id, dochospid, depid, name, cabinet, email, speciality));

                XmlElement dochospidElement = xmlDoc.CreateElement("dochospid");
                dochospidElement.InnerText = Doctors.Rows[i].Cells[1].Value.ToString();
                doctorElement.AppendChild(dochospidElement);

                XmlElement depidElement = xmlDoc.CreateElement("depid");
                depidElement.InnerText = Doctors.Rows[i].Cells[2].Value.ToString();
                doctorElement.AppendChild(depidElement);

                XmlElement nameElement = xmlDoc.CreateElement("name");
                nameElement.InnerText = Doctors.Rows[i].Cells[3].Value.ToString();
                doctorElement.AppendChild(nameElement);

                XmlElement cabinetElement = xmlDoc.CreateElement("cabinet");
                cabinetElement.InnerText = Doctors.Rows[i].Cells[4].Value.ToString();
                doctorElement.AppendChild(cabinetElement);

                XmlElement emailElement = xmlDoc.CreateElement("email");
                emailElement.InnerText = Doctors.Rows[i].Cells[5].Value.ToString();
                doctorElement.AppendChild(emailElement);

                XmlElement specialityElement = xmlDoc.CreateElement("speciality");
                specialityElement.InnerText = Doctors.Rows[i].Cells[6].Value.ToString();
                doctorElement.AppendChild(specialityElement);


                doctorsElement.AppendChild(doctorElement);
            }

            xmlDoc.AppendChild(doctorsElement); 
            xmlDoc.Save("Doctors.xml");
            MessageBox.Show("Файл сохранен в папке Debug (Doctors.xml)", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void Doctors_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void save_dep_Click(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            XmlDeclaration xmlDecl = xmlDoc.CreateXmlDeclaration("1.0", "utf-8", null);
            xmlDoc.AppendChild(xmlDecl); 

            XmlElement departmentsElement = xmlDoc.CreateElement("Department");
            int count = Departments.Rows.Count;
            for (int i = 0; i < count - 1; i++)
            {
                XmlElement departmentElement = xmlDoc.CreateElement("Department");
                departmentElement.SetAttribute("id", Departments.Rows[i].Cells[0].Value.ToString());

                //listBox1.Items.Add(new Department(id, idhosp, name, manager));

                XmlElement idhospElement = xmlDoc.CreateElement("idhosp");
                idhospElement.InnerText = Departments.Rows[i].Cells[1].Value.ToString();
                departmentElement.AppendChild(idhospElement);

                XmlElement nameElement = xmlDoc.CreateElement("name");
                nameElement.InnerText = Departments.Rows[i].Cells[2].Value.ToString();
                departmentElement.AppendChild(nameElement);

                XmlElement managerElement = xmlDoc.CreateElement("manager");
                managerElement.InnerText = Departments.Rows[i].Cells[3].Value.ToString();
                departmentElement.AppendChild(managerElement);

                departmentsElement.AppendChild(departmentElement);
            }

            xmlDoc.AppendChild(departmentsElement); 
            xmlDoc.Save("Departments.xml");
            MessageBox.Show("Файл сохранен в папке Debug (Departments.xml)", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void save_hosp_Click(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            XmlDeclaration xmlDecl = xmlDoc.CreateXmlDeclaration("1.0", "utf-8", null);
            xmlDoc.AppendChild(xmlDecl); 

            XmlElement hospitalsElement = xmlDoc.CreateElement("Hospitals");
            int count = Hospitals.Rows.Count;
            for (int i = 0; i < count - 1; i++)
            {
                XmlElement hospitalElement = xmlDoc.CreateElement("Hospital");
                hospitalElement.SetAttribute("id", Hospitals.Rows[i].Cells[0].Value.ToString());

                //public Hospital(string id, string name, string address, string phone, string head)

                XmlElement nameElement = xmlDoc.CreateElement("name");
                nameElement.InnerText = Hospitals.Rows[i].Cells[1].Value.ToString();
                hospitalElement.AppendChild(nameElement);

                XmlElement addressElement = xmlDoc.CreateElement("address");
                addressElement.InnerText = Hospitals.Rows[i].Cells[2].Value.ToString();
                hospitalElement.AppendChild(addressElement);

                XmlElement phoneElement = xmlDoc.CreateElement("phone");
                phoneElement.InnerText = Hospitals.Rows[i].Cells[3].Value.ToString();
                hospitalElement.AppendChild(phoneElement);

                XmlElement headElement = xmlDoc.CreateElement("head");
                headElement.InnerText = Hospitals.Rows[i].Cells[4].Value.ToString();
                hospitalElement.AppendChild(headElement);

                hospitalsElement.AppendChild(hospitalElement);
            }

            xmlDoc.AppendChild(hospitalsElement); 
            xmlDoc.Save("Hospitals.xml");
            MessageBox.Show("Файл сохранен в папке Debug (Hospitals.xml)", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void load_dep_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = openFileDialog1.FileName;

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                pathToFile = pathToFile.Split('.')[0];

                doc = new XmlDocument();
                doc.Load(pathToFile + ".xml");

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value.ToString();
                    string idhosp = node["idhosp"].InnerText;
                    string name = node["name"].InnerText;
                    string manager = node["manager"].InnerText;
                    Departments.Rows.Add(id, idhosp, name, manager);
                }
            }
            del_dep.Enabled = true;
            save_dep.Enabled = true;
            cancel_dep.Enabled = true;
            clearDepartmentsGrid.Enabled = true;
        }

        private void load_doc_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = openFileDialog1.FileName;

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                pathToFile = pathToFile.Split('.')[0];

                doc = new XmlDocument();
                doc.Load(pathToFile + ".xml");

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value.ToString();
                    string dochospid = node["dochospid"].InnerText;
                    string depid = node["depid"].InnerText;
                    string name = node["name"].InnerText;
                    string cabinet = node["cabinet"].InnerText;
                    string email = node["email"].InnerText;
                    string speciality = node["speciality"].InnerText;
                    Doctors.Rows.Add(id, dochospid, depid, name, cabinet, email, speciality);
                }
            }

            del_doc.Enabled = true;
            save_doc.Enabled = true;
            cancel_doc.Enabled = true;
            clearDoctorsGrid.Enabled = true;

        }

        private void load_hosp_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = openFileDialog1.FileName;

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                pathToFile = pathToFile.Split('.')[0];

                doc = new XmlDocument();
                doc.Load(pathToFile + ".xml");

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value.ToString();
                    string name = node["name"].InnerText;
                    string address = node["address"].InnerText;
                    string phone = node["phone"].InnerText;
                    string head = node["head"].InnerText;
                    Hospitals.Rows.Add(id, name, address, phone, head);
                }
                del_hosp.Enabled = true;
                save_hosp.Enabled = true;
                cancel_hosp.Enabled = true;
                clearHospitalsGrid.Enabled = true;
            }
        }

        private void add_hosp_Click(object sender, EventArgs e)
        {
            Hospitals.ReadOnly = false;
            del_hosp.Enabled = true;
            save_hosp.Enabled = true;
            cancel_hosp.Enabled = true;
            clearHospitalsGrid.Enabled = true;
            //Hospitals.Rows.Add();
        }

        private void del_dep_Click(object sender, EventArgs e)
        {
            try
            {
                Departments.Rows.RemoveAt(Departments.CurrentRow.Index);
            }
            catch (InvalidOperationException)
            {
                MessageBox.Show("Удаление выполнено", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void del_doc_Click(object sender, EventArgs e)
        {
            try
            {
                Doctors.Rows.RemoveAt(Doctors.CurrentRow.Index);
            }
            catch (InvalidOperationException)
            {
                MessageBox.Show("Удаление выполнено", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void add_dep_Click(object sender, EventArgs e)
        {
            Departments.ReadOnly = false;
            del_dep.Enabled = true;
            save_dep.Enabled = true;
            cancel_dep.Enabled = true;
            clearDepartmentsGrid.Enabled = true;
            Departments.Rows.Add();
        }

        private void add_doc_Click(object sender, EventArgs e)
        {
            Doctors.ReadOnly = false;
            del_doc.Enabled = true;
            save_doc.Enabled = true;
            cancel_doc.Enabled = true;
            Doctors.Rows.Add();
        }

        private void cancel_doc_Click(object sender, EventArgs e)
        {
            Doctors.ReadOnly = true;
            del_doc.Enabled = false;
            save_doc.Enabled = false;
            cancel_doc.Enabled = false;
            clearDoctorsGrid.Enabled = false;
        }

        private void cancel_dep_Click(object sender, EventArgs e)
        {
            Departments.ReadOnly = true;
            del_dep.Enabled = false;
            save_dep.Enabled = false;
            cancel_dep.Enabled = false;
            clearDepartmentsGrid.Enabled = false;
        }

        private void cancel_hosp_Click(object sender, EventArgs e)
        {
            Hospitals.ReadOnly = true;
            del_hosp.Enabled = false;
            save_hosp.Enabled = false;
            cancel_hosp.Enabled = false;
            clearHospitalsGrid.Enabled = false;
        }

        private void очиститьПоляToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            listBox2.Items.Clear();
            listBox3.Items.Clear();
            propertyGrid1.Refresh();
            propertyGrid2.Refresh();
            propertyGrid3.Refresh();
        }

        public void ShowHospitals()
        {
            listBox1.Items.Clear();
            //if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = @"Hospitals.xml";

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value;
                    string name = node["name"].InnerText;
                    string address = node["address"].InnerText;
                    string phone = node["phone"].InnerText;
                    string head = node["head"].InnerText;
                    listBox1.DisplayMember = "name";
                    listBox1.Items.Add(new Hospital(id, name, address, phone, head));
                }
            }
        }

        private void оБольницахToolStripMenuItem_Click(object sender, EventArgs e)
        {
           ShowHospitals();
        }

        private void listBox3_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if (listBox3.SelectedIndex != -1)
            {
                propertyGrid3.SelectedObject = listBox3.SelectedItem;
            }
        }

        public void ShowAllInfoAboutHospitalSystem()
        {
            ShowHospitals();
            ShowDepartments();
            ShowDoctors();
        }

        public void ShowDepartments()
        {
            listBox2.Items.Clear();
            //if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = @"Departments.xml";

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value.ToString();
                    string idhosp = node["idhosp"].InnerText;
                    string name = node["name"].InnerText;
                    string manager = node["manager"].InnerText;
                    listBox2.DisplayMember = "name";
                    listBox2.ValueMember = "id";
                    listBox2.Items.Add(new Department(id, idhosp, name, manager));
                }
            }
        }

        private void обОтделенияхToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowDepartments();
        }

        public void ShowDoctors()
        {

            listBox3.Items.Clear();
            //if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pathToFile = @"Doctors.xml";

                XmlDocument doc = new XmlDocument();
                doc.Load(pathToFile);

                foreach (XmlNode node in doc.DocumentElement)
                {
                    string id = node.Attributes[0].Value.ToString();
                    string name = node["name"].InnerText;
                    string dochospid = node["dochospid"].InnerText;
                    string depid = node["depid"].InnerText;
                    string cabinet = node["cabinet"].InnerText;
                    string email = node["email"].InnerText;
                    string speciality = node["speciality"].InnerText;
                    listBox3.DisplayMember = "name";
                    listBox3.ValueMember = "id";
                    //listBox1.Items.Add(new Doctor(name, surname, birthday, email, phone));
                    //public Doctor(string id, string dochospid, string depid, string name, string cabinet, string email, string speciality)
                    listBox3.Items.Add(new Doctor(id, dochospid, depid, name, cabinet, email, speciality));
                }
            }
        }

        private void оВрачахToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowDoctors();
        }

        private void вывестиВсюИнформациюToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowAllInfoAboutHospitalSystem();
        }

        private void справкаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Текст справки ___________________", "Справка", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void clearHospitalsGrid_Click(object sender, EventArgs e)
        {
            Hospitals.Rows.Clear();
        }

        private void clearDepartmentsGrid_Click(object sender, EventArgs e)
        {
            Departments.Rows.Clear();
        }

        private void clearDoctorsGrid_Click(object sender, EventArgs e)
        {
            Doctors.Rows.Clear();
        }
    }
}
