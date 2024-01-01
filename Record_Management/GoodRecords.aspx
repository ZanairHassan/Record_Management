<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodRecords.aspx.cs" Inherits="Record_Management.GoodRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 1200px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="datepicker" runat="server" Visible="False" OnSelectionChanged="datepicker_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
            <asp:Calendar ID="dateFrompicker" runat="server" Visible="False" OnSelectionChanged="dateFrompicker_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </div>
        <div>
            <table>
                <tr>
                    <td colspan="4" > 
                        <asp:Label ID="Warehouseid" runat="server" >
                            wareHouse  :
                          </asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="Warehousedropdown" runat="server" Height="29px" Width="195px" CssClass="auto-style2" >
                            <asp:ListItem>All</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                
                <tr>
                    <td colspan="2"  > 
                        <asp:Label ID="Dep" runat="server" >
                            Department  :  
                          </asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:DropDownList ID="DepartDropDown" runat="server" Height="30px" Width="200px">
                            <asp:ListItem>All</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                     <td colspan="2" > 
                        <asp:Label ID="status" runat="server" >
                            status  :  
                          </asp:Label>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="StatusDropDown" runat="server" Height="30px" Width="200px">
                            <asp:ListItem>All</asp:ListItem>
                         </asp:DropDownList>

                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" > 
                        <asp:Label ID="datefrom" runat="server" >
                            Date From :
                          </asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:TextBox runat="server" ID="txtdatetimepicker" Height="30px" Width="200px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton runat="server" ID="linkdatepicker" OnClick="linkdatepicker_Click">PickDate </asp:LinkButton>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td colspan="2" > 
                        <asp:Label ID="Label1" runat="server" >
                            Date To :
                          </asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:TextBox runat="server" ID="txtDateTo" Height="30px" Width="200px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton runat="server" ID="linkDateFron" OnClick="linkDateFron_Click">PickDate </asp:LinkButton>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="4" > 
                        <asp:Label ID="search" runat="server" >
                            Search      :
                          </asp:Label>

                 ;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox runat="server" ID="txtsearch" Width="200px" Height="30px"></asp:TextBox>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click">Search</asp:LinkButton>

                    </td>
                </tr>
            </table>
        </div>

        <div class="auto-style1">
            <asp:LinkButton ID="btnBack" OnClick="btnBack_Click" runat="server">Back</asp:LinkButton>
            <br />
            <br />
        </div>
       
<asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="trancationListGrid" runat="server"  DataKeyNames="TransactionID"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnRowDataBound="trancationListGrid_RowDataBound"  
                OnRowEditing="trancationListGrid_RowEditing" OnRowUpdating="trancationListGrid_RowUpdating"  OnRowCancelingEdit="trancationListGrid_RowCancelingEdit" 
                OnPageIndexChanging="trancationListGrid_PageIndexChanging" OnRowDeleting="trancationListGrid_RowDeleting">
                <Columns>
                    <asp:BoundField  DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID"/>
                    
        <asp:TemplateField HeaderText="GR Date" SortExpression="TransactionDate">
            <ItemTemplate>
                <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("TransactionDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditTransactionDate" runat="server" Text='<%# Bind("TransactionDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="GR No" SortExpression="TransactionNo">
            <ItemTemplate>
                <asp:Label ID="lblTransactionNo" runat="server" Text='<%# Eval("TransactionNo") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditTransactionNo" runat="server" Text='<%# Bind("TransactionNo") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Department" SortExpression="DepartmentName">
            <ItemTemplate>
                <asp:Label ID="lblDepartmentName" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditDepartmentName" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Supplier Name" SortExpression="SupplierName">
            <ItemTemplate>
                <asp:Label ID="lblSupplierName" runat="server" Text='<%# Eval("SupplierName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditSupplierName" runat="server" Text='<%# Bind("SupplierName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
                            <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>
                    <%--<asp:BoundField  DataField="TransactionDate" HeaderText="GR Date" SortExpression="TransactionDate"/>
                    <asp:BoundField  DataField="TransactionNo" HeaderText="GR No" SortExpression="TransactionNo" />
                    <asp:BoundField  DataField="DepartmentName" HeaderText="Department" SortExpression="DepartmentName"/>
                    <asp:BoundField  DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName"/>
                    --%><%--<asp:BoundField  DataField="TransactionStatus" HeaderText="Status" SortExpression="TransactionStatus"/>--%>
                    <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="10%" />

                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="Top" FirstPageText="First" LastPageText="Last" PageButtonCount="10" />
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
