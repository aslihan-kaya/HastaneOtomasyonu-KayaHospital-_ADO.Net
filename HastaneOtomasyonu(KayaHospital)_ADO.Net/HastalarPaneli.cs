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
    public partial class HastalarPaneli : Form
    {
        public HastalarPaneli()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=MSI;Database=Hastane;Integrated Security=true");

        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HListele";
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

        private void button6_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HEkle";

            //cmd.Parameters.AddWithValue("HastaNo", textBox1.Text);
            cmd.Parameters.AddWithValue("HastaAdiSoyadi", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTCNO", textBox7.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("Boy", textBox6.Text);
            cmd.Parameters.AddWithValue("Yas", textBox5.Text);
            cmd.Parameters.AddWithValue("Recete", textBox4.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox3.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Text);
            cmd.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HGuncelle";

            cmd.Parameters.AddWithValue("HastaNo", textBox1.Text);
            cmd.Parameters.AddWithValue("HastaAdiSoyadi", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTCNO", textBox7.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("Boy", textBox6.Text);
            cmd.Parameters.AddWithValue("Yas", textBox5.Text);
            cmd.Parameters.AddWithValue("Recete", textBox4.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox3.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Text);
            cmd.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            cmd.ExecuteNonQuery();//buradaki satır sayısı kadar işlemleri döndür demek.
            con.Close();
            Goster();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Goster();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir =
                 dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["HastaNo"].Value.ToString();
            textBox2.Text = satir.Cells["HastaAdiSoyadi"].Value.ToString();
            textBox7.Text = satir.Cells["HastaTCNO"].Value.ToString();
            dateTimePicker1.Text = satir.Cells["DogumTarihi"].Value.ToString(); ;
            textBox6.Text = satir.Cells["Boy"].Value.ToString();
            textBox5.Text = satir.Cells["Yas"].Value.ToString();
            textBox4.Text = satir.Cells["Recete"].Value.ToString();
            textBox3.Text = satir.Cells["RaporDurumu"].Value.ToString();
            dateTimePicker2.Text = satir.Cells["RandevuTarihi"].Value.ToString();
            comboBox1.Text = satir.Cells["DoktorNo"].Value.ToString();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            AnaSayfa go = new AnaSayfa();
            go.Show();
            this.Hide();
        }
    }
}
