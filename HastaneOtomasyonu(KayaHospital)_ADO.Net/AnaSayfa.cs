using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneOtomasyonu_KayaHospital__ADO.Net
{
    public partial class AnaSayfa : Form
    {
        public AnaSayfa()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=MSI;Database=Hastane;Integrated Security=true");

        private void AnaSayfa_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }
            private void groupBox1_Enter(object sender, EventArgs e)
            {

            }

           

           

            

        private void button1_Click_1(object sender, EventArgs e)
        {
            PolikliniklerPaneli go = new PolikliniklerPaneli();
            go.Show();
            this.Hide();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KEkle";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox3.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox4.Text);
            cmd.Parameters.AddWithValue("Email", textBox5.Text);
            cmd.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);

            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
        }
    }
    }
