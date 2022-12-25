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
    public partial class DoktorlarPaneli : Form
    {
        public DoktorlarPaneli()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=MSI;Database=Hastane;Integrated Security=true");

        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void polikliniklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PolikliniklerPaneli go = new PolikliniklerPaneli();
            go.Show();
            this.Hide();
        }

        private void doktorlarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DoktorlarPaneli go = new DoktorlarPaneli();
            go.Show();
            this.Hide();
        }

        private void hastalarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            HastalarPaneli go = new HastalarPaneli();
            go.Show();
            this.Hide();
        }

        private void DoktorlarPaneli_Load(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DEkle";

            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTCNO", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlıkAlani", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvani", textBox4.Text);
            cmd.Parameters.AddWithValue("TelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();//var olanı çektik
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DGuncelle";
            cmd.Parameters.AddWithValue("DoktorNo", textBox5.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTCNO", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlıkAlani", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvani", textBox4.Text);
            cmd.Parameters.AddWithValue("TelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();//var olanı çektik
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir =
               dataGridView1.CurrentRow;
            textBox5.Text = satir.Cells["DoktorNo"].Value.ToString();
            textBox1.Text = satir.Cells["DoktorAdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["DoktorTCNO"].Value.ToString();
            textBox3.Text = satir.Cells["UzmanlıkAlani"].Value.ToString(); ;
            textBox4.Text = satir.Cells["Unvani"].Value.ToString();
            maskedTextBox1.Text = satir.Cells["TelefonNumarasi"].Value.ToString();
            textBox6.Text = satir.Cells["Adres"].Value.ToString();
            dateTimePicker1.Text = satir.Cells["DogumTarihi"].Value.ToString();
            comboBox1.Text = satir.Cells["PoliklinikNo"].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Goster();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            AnaSayfa go = new AnaSayfa();
            go.Show();
            this.Hide();
        }
    }
}
