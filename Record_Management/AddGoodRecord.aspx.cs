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
    public partial class AddGoodRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSuplyfromDate_Click(object sender, EventArgs e)
        {
            suplycalander.Visible = true;

        }

        protected void btnGpdate_Click(object sender, EventArgs e)
        {
            Gpdatecalander.Visible = true;
        }

        protected void suplycalander_SelectionChanged(object sender, EventArgs e)
        {
            txtSuplyFrom.Text = suplycalander.SelectedDate.ToShortDateString();
            suplycalander.Visible = false;
        }

        protected void Gpdatecalander_SelectionChanged(object sender, EventArgs e)
        {
            txtGpDate.Text = Gpdatecalander.SelectedDate.ToShortDateString();
            Gpdatecalander.Visible = false;
        }

        protected void BindGridView()
        {
            string connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"; // Replace with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("GetItems", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        ItemGridView.DataSource = dataTable;
                        ItemGridView.DataBind();
                        //GridView1.DataSource = dataTable;
                        //GridView1.DataBind();
                    }
                    connection.Close();
                }
            }
        }





        protected void btnAddData_Click(object sender, EventArgs e)
        {


            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True")) 
            {
                using (SqlCommand command = new SqlCommand("InsertItem",connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters
                    command.Parameters.AddWithValue("@ItemID", int.Parse(txtItemID.Text));
                    command.Parameters.AddWithValue("@ItemDescription", txtDescription.Text);
                    command.Parameters.AddWithValue("@Unit", txtUnit.Text);
                    command.Parameters.AddWithValue("@Quantity", int.Parse(txtQuanity.Text));
                    command.Parameters.AddWithValue("@Rate", decimal.Parse(txtRate.Text));
                    command.Parameters.AddWithValue("@ItemValue", decimal.Parse(txtValue.Text));
                    command.Parameters.AddWithValue("@ItemDes", txtxDes.Text);
                    command.Parameters.AddWithValue("@GST", txtGST.Text);
                    command.Parameters.AddWithValue("@Fright", txtFright.Text);
                    command.Parameters.AddWithValue("@Amount", decimal.Parse(txtAmount.Text));

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                        string script = "alert('Item Detailed Added done!.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Exception: {ex.Message}");
                        // Handle the exception as needed (e.g., logging, displaying an error message)
                    }
                }
            }

        }

        protected void btnAddTransaction_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"))
                {
                    using (SqlCommand command = new SqlCommand("InsertTransaction", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        command.Parameters.AddWithValue("@TransactionID", int.Parse(txtTid.Text));
                        command.Parameters.AddWithValue("@DepartmentID", int.Parse(txtdepartmentID.Text));
                        command.Parameters.AddWithValue("@TransactionDate", DateTime.Parse(txtSuplyFrom.Text));
                        command.Parameters.AddWithValue("@TransactionNo", txtGrnno.Text);
                        command.Parameters.AddWithValue("@Warehouse", txtwarehoseu.Text);
                        command.Parameters.AddWithValue("@DepartmentName", txtDepartment.Text);
                        command.Parameters.AddWithValue("@SupplierName", txtsuplierdescription.Text);
                        command.Parameters.AddWithValue("@SupplierID",int.Parse(txtSuplier.Text));

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                        string script = "alert('Transaction completed done!.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine($"Exception: {ex.Message}");
            }
        }

        protected void ItemGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void btnTransactionlist_Click(object sender, EventArgs e)
        {
            Server.Transfer("GoodRecords.aspx");
        }

        private void DeleteItem(int ItemID)
        {

            var connectionString = "Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("DeleteItem", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ItemID", ItemID);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
        protected void ItemGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ItemID = Convert.ToInt32(ItemGridView.DataKeys[e.RowIndex].Value);
            DeleteItem(ItemID);
            BindGridView();
        }

        protected void ItemGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ItemGridView.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void ItemGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int itemID = Convert.ToInt32(ItemGridView.DataKeys[e.RowIndex].Value);
            TextBox txtEditDescription = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditDescription");
            TextBox txtEditUnit = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditUnit");
            TextBox txtEditQuantity = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditQuantity");
            TextBox txtEditRate = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditRate");
            TextBox txtEditItemValue = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditItemValue");
            TextBox txtEditDes = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditDes");
            TextBox txtEditGST = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditGST");
            TextBox txtEditFright = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditFright");
            TextBox txtEditAmount = (TextBox)ItemGridView.Rows[e.RowIndex].FindControl("txtEditAmount");
            // Retrieve the updated values from the textboxes
            string updatedDescription = txtEditDescription.Text;
            string updatedUnit = txtEditUnit.Text;
            string updatedquanity = txtEditQuantity.Text;
            string updatedrate = txtEditRate.Text;
            string updatedItemValue = txtEditItemValue.Text;
            string updateddes = txtEditDes.Text;
            string updatedGst = txtEditGST.Text;
            string updatedFright = txtEditFright.Text;
            string updatedAmount = txtEditAmount.Text;

            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-QQNA2SU;Initial Catalog=Record_Management;Integrated Security=True"))
                {
                    using (SqlCommand command = new SqlCommand("UpdateItem", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@ItemID", itemID);
                        command.Parameters.AddWithValue("@ItemDescription", updatedDescription);
                        command.Parameters.AddWithValue("@Unit", updatedUnit);
                        command.Parameters.AddWithValue("@Quantity", int.Parse(updatedquanity));
                        command.Parameters.AddWithValue("@Rate", decimal.Parse(updatedrate));
                        command.Parameters.AddWithValue("@ItemValue", decimal.Parse(updatedItemValue));
                        command.Parameters.AddWithValue("@ItemDes", updateddes);
                        command.Parameters.AddWithValue("@GST", updatedGst);
                        command.Parameters.AddWithValue("@Fright", updatedFright);
                        command.Parameters.AddWithValue("@Amount", decimal.Parse(updatedAmount));

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }

                ItemGridView.EditIndex = -1;
                // Refresh the GridView after updating
                BindGridView(); // You need to implement this method to bind data to the GridView

                // Additional logic as needed
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
            }
            
        }

        protected void ItemGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ItemGridView.EditIndex = -1;
            BindGridView();
        }
    }
}