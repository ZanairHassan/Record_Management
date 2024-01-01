<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGoodRecord.aspx.cs" Inherits="Record_Management.AddGoodRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
     
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="suplycalander" runat="server" Visible="false" OnSelectionChanged="suplycalander_SelectionChanged"></asp:Calendar>
            <asp:Calendar ID="Gpdatecalander" runat="server" Visible="false" OnSelectionChanged="Gpdatecalander_SelectionChanged"></asp:Calendar>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div class="auto-style1">

            <asp:Label ID="txtWarehouse" runat="server" Text="WareHouse"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtwarehoseu" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Dep2" runat="server" Text="Department:"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtdepartmentID" runat="server" Width="63px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="grn" runat="server" Text="TID"></asp:Label>
            &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTid" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="grn2" runat="server" Text="GRN No:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGrnno" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="sup" runat="server" Text="Suplier:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSuplier" runat="server" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtsupID" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtsuplierdescription" runat="server" Width="278px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="pono" runat="server" Text="Phone No:"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPhoneNo" runat="server" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="suplyfrom" runat="server" Text="Supply From:"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSuplyFrom" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnSuplyfromDate" runat="server" OnClick="btnSuplyfromDate_Click">Pick</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="gpdate" runat="server" Text="GP Date:"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGpDate" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnGpdate" runat="server" OnClick="btnGpdate_Click">pick</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="btnAddTransaction" OnClick="btnAddTransaction_Click" > Add Transaction </asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="btnTransactionlist" OnClick="btnTransactionlist_Click">Transaction List</asp:LinkButton>

            <hr  />
        </div>
        <div class="auto-style1">

            <asp:Label ID="Itemid" runat="server" Text="Item Id"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="desc" runat="server" Text="Description"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="unit" runat="server" Text="unit"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="quanity" runat="server" Text="quanity"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="rate" runat="server" Text="rate"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="value" runat="server" Text="value"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="des" runat="server" Text="desc."></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="gst" runat="server" Text="GST%"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="fright" runat="server" Text="fright"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="amount" runat="server" Text="Amount"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtItemID" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDescription" runat="server" Width="128px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:TextBox ID="txtUnit" runat="server" Width="100px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:TextBox ID="txtQuanity" runat="server" Width="102px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtRate" runat="server" Width="98px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtValue" runat="server" Width="73px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:TextBox ID="txtxDes" runat="server" Width="65px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:TextBox ID="txtGST" runat="server" Width="68px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFright" runat="server" Width="58px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtAmount" runat="server" Width="59px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="btnAddData" OnClick="btnAddData_Click"> Add Data </asp:LinkButton>
        </div>
        <div>
            <br /><br />
            <asp:GridView runat="server" AutoGenerateColumns="false" DataKeyNames="ItemID" 
                OnRowEditing="ItemGridView_RowEditing" OnRowUpdating="ItemGridView_RowUpdating"  
               OnRowCancelingEdit="ItemGridView_RowCancelingEdit"   OnRowDeleting="ItemGridView_RowDeleting"
                ID="ItemGridView" OnRowDataBound="ItemGridView_RowDataBound" >

                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="Item ID" SortExpression="ItemID" />
                    <asp:TemplateField HeaderText="Description" SortExpression="ItemDescription">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditDescription" runat="server" Text='<%# Bind("ItemDescription") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("ItemDescription") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Unit" SortExpression="Unit">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditUnit" runat="server" Text='<%# Bind("Unit") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblUnit" runat="server" Text='<%# Bind("Unit") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="Rate" SortExpression="Rate">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditRate" runat="server" Text='<%# Bind("Rate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblRate" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="ItemValue" SortExpression="ItemValue">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditItemValue" runat="server" Text='<%# Bind("ItemValue") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblItemValue" runat="server" Text='<%# Bind("ItemValue") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="ItemDes" SortExpression="ItemDes">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditDes" runat="server" Text='<%# Bind("ItemDes") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblDes" runat="server" Text='<%# Bind("ItemDes") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="GST" SortExpression="GST">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditGST" runat="server" Text='<%# Bind("GST") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblGST" runat="server" Text='<%# Bind("GST") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="Fright" SortExpression="Fright">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditFright" runat="server" Text='<%# Bind("Fright") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblFright" runat="server" Text='<%# Bind("Fright") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
            <EditItemTemplate>
                <asp:TextBox ID="txtEditAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
            </ItemTemplate>
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
<%--                    <asp:BoundField DataField="ItemDescription" HeaderText="Description" SortExpression="ItemDescription" />
                    <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                    <asp:BoundField DataField="ItemValue" HeaderText="ItemValue" SortExpression="ItemValue" />
                    <asp:BoundField DataField="ItemDes" HeaderText="ItemDes" SortExpression="ItemDes" />
                    <asp:BoundField DataField="GST" HeaderText="GST%" SortExpression="GST" />
                    <asp:BoundField DataField="Fright" HeaderText="Fright" SortExpression="" />
                    <asp:BoundField  DataField="Amount" HeaderText="Amount" SortExpression="Amount"/>--%>
                    <asp:CommandField ShowDeleteButton="True"  ItemStyle-Width="10%" />
   
                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
