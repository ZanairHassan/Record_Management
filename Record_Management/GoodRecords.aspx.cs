using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Record_Management
{
    public partial class GoodRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void linkdatepicker_Click(object sender, EventArgs e)
        {
            datepicker.Visible = true;
        }

        protected void datepicker_SelectionChanged(object sender, EventArgs e)
        {
            txtdatetimepicker.Text = datepicker.SelectedDate.ToShortDateString();
            datepicker.Visible = false;
        }

        protected void linkDateFron_Click(object sender, EventArgs e)
        {
            dateFrompicker.Visible = true;
        }

        protected void dateFrompicker_SelectionChanged(object sender, EventArgs e)
        {
            txtDateTo.Text = dateFrompicker.SelectedDate.ToShortDateString();
            dateFrompicker.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Server.Transfer("AddGoodRecord.aspx");
        }

        protected void BindGridView()
        {
            string connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"; // Replace with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("GetTransactionDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        trancationListGrid.DataSource = dataTable;
                        trancationListGrid.DataBind();
                        //ItemGridView.DataSource = dataTable;
                        //ItemGridView.DataBind();
                        ////GridView1.DataSource = dataTable;
                        ////GridView1.DataBind();
                    }
                    connection.Close();
                }
            }
        }

        private void DeleteTransactionRecord(int transactionID)
        {
          
             var connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("DeleteTransaction", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@TransactionID", transactionID);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        protected void trancationListGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.BackColor = System.Drawing.Color.Blue;
            }

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex % 2 == 0)
            {
                e.Row.BackColor = System.Drawing.Color.LightSeaGreen; // or any other color for even rows
            }
        }

        protected void trancationListGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            trancationListGrid.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void trancationListGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int transactionID = Convert.ToInt32(trancationListGrid.DataKeys[e.RowIndex].Value);
            DeleteTransactionRecord(transactionID);
            BindGridView();
        }

        protected void trancationListGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            trancationListGrid.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void trancationListGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int transactionID = Convert.ToInt32(trancationListGrid.DataKeys[e.RowIndex].Value);
            TextBox txtEditTransactionDate = (TextBox)trancationListGrid.Rows[e.RowIndex].FindControl("txtEditTransactionDate");
            TextBox txtEditTransactionNo = (TextBox)trancationListGrid.Rows[e.RowIndex].FindControl("txtEditTransactionNo");
            TextBox txtEditDepartmentName = (TextBox)trancationListGrid.Rows[e.RowIndex].FindControl("txtEditDepartmentName");
            TextBox txtEditSupplierName = (TextBox)trancationListGrid.Rows[e.RowIndex].FindControl("txtEditSupplierName");

            DateTime date = DateTime.Parse(txtEditTransactionDate.Text);
            string transactionNo = txtEditTransactionNo.Text;
            string departmentName = txtEditDepartmentName.Text;
            string suppilerName = txtEditSupplierName.Text;

            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"))
            {
                using (SqlCommand command = new SqlCommand("UpdateTransaction", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@TransactionID", transactionID);
                    command.Parameters.AddWithValue("@NewTransactionDate", date);
                    command.Parameters.AddWithValue("@NewTransactionNo", transactionNo);
                    command.Parameters.AddWithValue("@NewDepartmentName", departmentName);
                    command.Parameters.AddWithValue("@NewSupplierName", suppilerName);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            trancationListGrid.EditIndex = -1;
            BindGridView();

        }

        protected void trancationListGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            trancationListGrid.EditIndex = -1;
            BindGridView();
        }

        protected void FilterBindGridView(DateTime? startDate, DateTime? endDate)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"; //  connection string

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetFilterdTransactionDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@StartDate", startDate);
                        command.Parameters.AddWithValue("@EndDate", endDate);

                        connection.Open();

                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            trancationListGrid.DataSource = dataTable;
                            trancationListGrid.DataBind();
                        }

                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime? startDate = DateTime.Parse(txtdatetimepicker.Text);
            DateTime? endDate = DateTime.Parse(txtDateTo.Text);

            FilterBindGridView(startDate, endDate);

        }




        //    protected void FilterdBindGridView(DateTime? startDate, DateTime? endDate, string warehouseName, string departmentName)
        //    {
        //        try
        //        {
        //            string connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"; // Replace with your actual connection string

        //            using (SqlConnection connection = new SqlConnection(connectionString))
        //            {
        //                using (SqlCommand command = new SqlCommand("GetTransactionDetails", connection))
        //                {
        //                    command.CommandType = CommandType.StoredProcedure;
        //                    command.Parameters.AddWithValue("@StartDate", startDate.HasValue ? (object)startDate : DBNull.Value);
        //                    command.Parameters.AddWithValue("@EndDate", endDate.HasValue ? (object)endDate : DBNull.Value);
        //                    command.Parameters.AddWithValue("@WarehouseName", string.IsNullOrEmpty(warehouseName) ? DBNull.Value : (object)warehouseName);
        //                    command.Parameters.AddWithValue("@DepartmentName", string.IsNullOrEmpty(departmentName) ? DBNull.Value : (object)departmentName);

        //                    connection.Open();

        //                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
        //                    {
        //                        DataTable dataTable = new DataTable();
        //                        adapter.Fill(dataTable);
        //                        trancationListGrid.DataSource = dataTable;
        //                        trancationListGrid.DataBind();
        //                    }

        //                    connection.Close();
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine($"Exception: {ex.Message}");
        //        }
        //    }


    }
}