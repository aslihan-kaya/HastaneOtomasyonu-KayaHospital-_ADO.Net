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
    public partial class PolikliniklerPaneli : Form
    {
        public PolikliniklerPaneli()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=MSI;Database=Hastane;Integrated Security=true");

        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
       

        private void PoliklinikPaneli_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

           

        }

       

       

        private void polikliniklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PolikliniklerPaneli go = new PolikliniklerPaneli();
            go.Show();
            this.Hide();
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            Goster();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PEkle";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();//var olanı çektik
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PGuncelle";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();//var olanı çektik
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir =
               dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["PoliklinikNo"].Value.ToString();
            textBox2.Text = satir.Cells["PoliklinikAdi"].Value.ToString();
            textBox3.Text = satir.Cells["PoliklinikUzmanSayisi"].Value.ToString();
            textBox4.Text = satir.Cells["PoliklinikBaskani"].Value.ToString(); ;
            textBox5.Text = satir.Cells["PoliklinikBasHemsire"].Value.ToString();
            textBox6.Text = satir.Cells["YatakSayisi"].Value.ToString();
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

        private void PolikliniklerPaneli_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            AnaSayfa go = new AnaSayfa();
            go.Show();
            this.Hide();
        }
    }
}
