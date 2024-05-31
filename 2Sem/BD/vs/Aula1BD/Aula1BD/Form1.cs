using Microsoft.Data.SqlClient;
using System.Data;

namespace Aula1BD
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            TestDBConnection(TextBox1, textBox3, textBox3, textBox2);
        }
        private void TestDBConnection(string textBox1, string dbName, string textBox3, string textBox2)
        {
            SqlConnection CN = new SqlConnection("Data Source = " + textBox1 + ";"
           + "Initial Catalog = " + dbName + "; uid = " + textBox3 + ";" + "password = " + textBox2 + "; TrustServerCertificate=True");

            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    MessageBox.Show("Successful connection to database " + CN.Database + " on the "
                   + CN.DataSource + " server", "Connection Test", MessageBoxButtons.OK);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to open connection to database due to the error \r\n" +
               ex.Message, "Connection Test", MessageBoxButtons.OK);
            }
            if (CN.State == ConnectionState.Open)
                CN.Close();
        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }
        
    }
}
