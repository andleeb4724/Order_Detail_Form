<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Assignment_4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 2px solid #000000;
            background-color: #CCCCFF;
        }
        .auto-style3 {
            height: 89px;
            width: 356px;
            background-color: #CCFFCC;
        }
        .auto-style5 {
            height: 89px;
            width: 365px;
            background-color: #CCFFCC;
        }
        .auto-style10 {
            margin-left: 124px;
            color: #FFFFFF;
            background-color: #0099FF;
        }
        .auto-style20 {
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style23 {
            width: 365px;
            background-color: #CCFFCC;
        }
        .auto-style24 {
            width: 356px;
            background-color: #CCFFCC;
        }
        .auto-style27 {
            background-color: #FEFFFF;
        }
        .auto-style28 {
            width: 100%;
        }
        .auto-style29 {
            background-color: #CCFFCC;
        }
        .auto-style32 {
            color: #C0C0C0;
            background-color: #999999;
        }
        .auto-style33 {
            background-color: #999999;
        }
        .auto-style31 {
            height: 89px;
            width: 365px;
            background-color: #CCCCCC;
        }
        .auto-style30 {
            background-color: #CCCCCC;
        }
        .auto-style18 {
            color: #FFFFFF;
            margin-left: 275px;
            background-color: #000000;
        }
        </style>
</head>
<body>
    <h1 style="background-color:#92a8d1;" align ="Center">Order Form</h1>
    <form id="form1" runat="server">
        <table class="auto-style1" color ="#6666ff">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Text="Order ID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="200px" CssClass="auto-style30"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Enter Name"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="NAME" Height="25px" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="auto-style33">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EcommerceConnectionString %>" SelectCommand="SELECT [NAME] FROM [CUSTOMER_DETAILS]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:Label ID="Label2" runat="server" Text="Order Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="200px" CssClass="auto-style31" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style24">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style29" Text="Payment Mode"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="200px" CssClass="auto-style32" ForeColor="Black">
                        <asp:ListItem>Debit Card</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>UPI</asp:ListItem>
                        <asp:ListItem>Pay on Delivery</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;</td>
                <td class="auto-style24">
                    &nbsp;</td>
            </tr>
            </table>
        <span class="auto-style29">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="auto-style27"><br class="auto-style29" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table border="2" class="auto-style28">
            <tr>
                <td class="auto-style29">Product Name </td>
                <td class="auto-style29">Product ID&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style29">Price </td>
                <td class="auto-style29">Quantity&nbsp; </td>
                <td class="auto-style29">Total Amount</td>
            </tr>
            <tr>
                <td class="auto-style29">
            <asp:DropDownList ID="DropDownList3" runat="server" Width ="200px" Height ="25px" AutoPostBack="True" CssClass="auto-style27" BackColor="#CCCCCC">
                <asp:ListItem>NoteBook</asp:ListItem>
                <asp:ListItem>Sneakers</asp:ListItem>
                <asp:ListItem Selected="True">Smart Watch</asp:ListItem>
                <asp:ListItem>Power Bank</asp:ListItem>
                <asp:ListItem>Smart Phone</asp:ListItem>
                <asp:ListItem>Airdopes</asp:ListItem>
                <asp:ListItem>Bag</asp:ListItem>
            </asp:DropDownList>
                    </td>
                <td class="auto-style29">
        <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="200px" CssClass="auto-style33" BackColor="#CCCCCC"></asp:TextBox>
                    </td>
                <td class="auto-style29"> <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="200px" OnTextChanged="TextBox4_TextChanged" CssClass="auto-style27" BackColor="#CCCCCC"></asp:TextBox>
                    </td>
                <td class="auto-style29">
            <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="200px" CssClass="auto-style27" BackColor="#CCCCCC"></asp:TextBox>
                    </td>
                <td class="auto-style29">
            <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="200px" CssClass="auto-style27" BackColor="#CCCCCC"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style29">
            <asp:Button ID="Button4" OnClick="Button4_Click" runat="server" CssClass="auto-style10" Height="48px" Text="Calculate" Width="120px" Font-Bold="True" BackColor="#0099FF" ForeColor="Black" />
                </td>
            </tr>
        </table>
        </span>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" OnClick="Insert" runat="server" Text="Add to cart" CssClass="auto-style20" Height="48px" BackColor="#0099FF" Font-Bold="True" ForeColor="Black" Width="120px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Text="Place Order" OnClick="Button6_Click" CssClass="auto-style18" Height="48px" Width="120px" BackColor="#0099FF" Font-Bold="True" ForeColor="Black" />
        <p>
           <asp:GridView ID="GridView2" CssClass="Grid" runat="server" OnRowDeleting="OnRowDeleting" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
    EmptyDataText="No records has been added." CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
        </asp:BoundField>
         <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Total_Amount" HeaderText="Total_Amount" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
        </asp:BoundField>
        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
    </Columns>
               <EditRowStyle BackColor="#2461BF" />
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#EFF3FB" />
               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F5F7FB" />
               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
               <SortedDescendingCellStyle BackColor="#E9EBEF" />
               <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
            <br />
&nbsp;&nbsp;
            <p>
            &nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p>
            &nbsp;
        </p>
    </form>
</body>
</html>
