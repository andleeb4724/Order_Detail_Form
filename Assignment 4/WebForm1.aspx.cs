using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Xml.Linq;

namespace Assignment_4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LPCL-PG033YKN;Initial Catalog=Ecommerce;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Product_Name"), new DataColumn("Price"), new DataColumn("Quantity"), new DataColumn("Total_Amount") });
                ViewState["Customers"] = dt;

                this.BindGrid();
            }
            if (IsPostBack)
            {
                LoadRecord();
                LoadRecord3();
            }

        }
        protected void BindGrid()
        {
            GridView2.DataSource = (DataTable)ViewState["Customers"];
            GridView2.DataBind();
        }

        protected void Insert(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Customers"];
            dt.Rows.Add(DropDownList3.SelectedValue.Trim(), TextBox4.Text.Trim(), TextBox6.Text.Trim(), TextBox5.Text.Trim());
            ViewState["Customers"] = dt;
            this.BindGrid();
            DropDownList3.SelectedValue = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox5.Text = string.Empty;

        }


        //protected void Button2_Click(object sender, EventArgs e)
        //{

        //    LoadRecord();


        //}

        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select CUSTOMER_ID , PHONE_NO , EMAIL, BILLING_ADDRESS, SHIPPING_ADDRESS from CUSTOMER_DETAILS where NAME = '" + DropDownList1.SelectedValue + "'", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            TextBox5.Text = Convert.ToString((Convert.ToDouble(this.TextBox6.Text.Trim())) * (Convert.ToDouble(this.TextBox4.Text.Trim())));
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            DataTable dt = ViewState["Customers"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Customers"] = dt;
            BindGrid();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadRecord();

        }
        void LoadRecord3()
        {
            con.Open();
            SqlCommand comm = new SqlCommand("select Product_ID,Amount from [Product_Details] where Name = '" + DropDownList3.SelectedValue + "';", con);
            comm.Parameters.AddWithValue("@Name", DropDownList3.SelectedValue);
            SqlDataReader da = comm.ExecuteReader();
            while (da.Read())
            {
                TextBox3.Text = da.GetValue(0).ToString();
                TextBox4.Text = da.GetValue(1).ToString();
            }
            con.Close();
        }
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadRecord3();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["EcommerceConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);

            foreach(GridViewRow gr in GridView2.Rows)
            {
                string sqlquery = "insert into Order_Details values (@Product_Name,@Price,@Quantity,@Total_Amount)";
                SqlCommand sqlcomm = new SqlCommand(sqlquery,sqlconn);
                sqlcomm.Parameters.AddWithValue("@Product_Name", gr.Cells[0].Text);
                sqlcomm.Parameters.AddWithValue("@Price", gr.Cells[1].Text);
                sqlcomm.Parameters.AddWithValue("@Quantity", gr.Cells[2].Text);
                sqlcomm.Parameters.AddWithValue("@Total_Amount", gr.Cells[3].Text);

                sqlconn.Open();
                sqlcomm.ExecuteNonQuery();
                sqlconn.Close();

            }

            //foreach (GridViewRow gr1 in GridView1.Rows)
            //{
            //    string sqlquery = "insert into All_Details values (@CUSTOMER_ID,@Phone_NO,@EMAIL,@BILLING_ADDRESS,@SHIPPING_ADDRESS)";
            //    SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            //    //sqlcomm.Parameters.AddWithValue("@Product_Name", gr.Cells[0].Text);
            //    //sqlcomm.Parameters.AddWithValue("@Price", gr.Cells[1].Text);
            //    //sqlcomm.Parameters.AddWithValue("@Quantity", gr.Cells[2].Text);
            //    //sqlcomm.Parameters.AddWithValue("@Total_Amount", gr.Cells[3].Text);
            //    sqlcomm.Parameters.AddWithValue("@customer_id", gr1.Cells[4].Text);
            //    sqlcomm.Parameters.AddWithValue("@phone_no", gr1.Cells[5].Text);
            //    sqlcomm.Parameters.AddWithValue("@email", gr1.Cells[6].Text);
            //    sqlcomm.Parameters.AddWithValue("@billing_address", gr1.Cells[7].Text);
            //    sqlcomm.Parameters.AddWithValue("@shipping_address", gr1.Cells[8].Text);

            //    sqlconnn.Open();
            //    sqlcomm.ExecuteNonQuery();
            //    sqlconnn.Close();

            //}
        }
    }
}


