<%@ Page Language="C#" AutoEventWireup="true" CodeFile="agency.aspx.cs"Theme="TestTheme" Inherits="agency" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 254px; width: 1396px;">
    <form id="form1" runat="server">
    <div style="background-image: url('Image/??m.jpg'); height: 769px;">
    
        <br />
        <div style="height: 81px; background-image: url('Image/123123123.jpg'); width: 589px; margin-left: 249px;">
        </div>
    
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/agency.aspx" 
            Text="???????????" Width="189px" Height="38px" ForeColor="Red" />
        <asp:Button ID="Button2" runat="server" PostBackUrl="~/client.aspx" 
            style="margin-bottom: 0px" Text="??????????" Width="186px" Height="36px" />
        <asp:Button ID="Button3" runat="server" PostBackUrl="~/medicine.aspx" 
            Text="??????????" Width="169px" Height="35px" />
        <asp:Button ID="Button6" runat="server" PostBackUrl="~/??????.aspx" 
            Text="??????????????" Width="208px" Height="36px" />
        <asp:Button ID="Button5" runat="server" PostBackUrl="~/???????.aspx" 
            Text="????" Height="37px" Width="83px" />
        <asp:Button ID="Button8" runat="server" PostBackUrl="~/??????/agency.aspx" 
            Text="????" Height="36px" Width="93px" />
        <asp:Button ID="Button4" runat="server" PostBackUrl="~/Default.aspx" 
            Text="????" Height="35px" Width="92px" />
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:MediDB1ConnectionString %>" 
            DeleteCommand="DELETE FROM [agency] WHERE [ano] = @original_ano AND (([aname] = @original_aname) OR ([aname] IS NULL AND @original_aname IS NULL)) AND (([asex] = @original_asex) OR ([asex] IS NULL AND @original_asex IS NULL)) AND (([aphone] = @original_aphone) OR ([aphone] IS NULL AND @original_aphone IS NULL)) AND (([aremark] = @original_aremark) OR ([aremark] IS NULL AND @original_aremark IS NULL))" 
            InsertCommand="INSERT INTO [agency] ([ano], [aname], [asex], [aphone], [aremark]) VALUES (@ano, @aname, @asex, @aphone, @aremark)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [agency]" 
            
            UpdateCommand="UPDATE [agency] SET [aname] = @aname, [asex] = @asex, [aphone] = @aphone, [aremark] = @aremark WHERE [ano] = @original_ano AND (([aname] = @original_aname) OR ([aname] IS NULL AND @original_aname IS NULL)) AND (([asex] = @original_asex) OR ([asex] IS NULL AND @original_asex IS NULL)) AND (([aphone] = @original_aphone) OR ([aphone] IS NULL AND @original_aphone IS NULL)) AND (([aremark] = @original_aremark) OR ([aremark] IS NULL AND @original_aremark IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ano" Type="String" />
                <asp:Parameter Name="original_aname" Type="String" />
                <asp:Parameter Name="original_asex" Type="String" />
                <asp:Parameter Name="original_aphone" Type="String" />
                <asp:Parameter Name="original_aremark" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ano" Type="String" />
                <asp:Parameter Name="aname" Type="String" />
                <asp:Parameter Name="asex" Type="String" />
                <asp:Parameter Name="aphone" Type="String" />
                <asp:Parameter Name="aremark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="aname" Type="String" />
                <asp:Parameter Name="asex" Type="String" />
                <asp:Parameter Name="aphone" Type="String" />
                <asp:Parameter Name="aremark" Type="String" />
                <asp:Parameter Name="original_ano" Type="String" />
                <asp:Parameter Name="original_aname" Type="String" />
                <asp:Parameter Name="original_asex" Type="String" />
                <asp:Parameter Name="original_aphone" Type="String" />
                <asp:Parameter Name="original_aremark" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        &nbsp;&nbsp;??<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        ??<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        ??<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        ??<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        ??<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:Button ID="Button7" runat="server"  Text="??" onclick="Button7_Click" />
        <br />
        <br />
        <div style="margin-left: 376px">
        <asp:GridView ID="GridView5" runat="server">

        </asp:GridView>
            <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            onrowcommand="GridView1_RowCommand1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ano" HeaderText="??" SortExpression="ano" />
                <asp:BoundField DataField="aname" HeaderText="??" SortExpression="aname" />
                <asp:BoundField DataField="asex" HeaderText="??" SortExpression="asex" />
                <asp:BoundField DataField="aphone" HeaderText="??" SortExpression="aphone" />
                <asp:BoundField DataField="aremark" HeaderText="??" SortExpression="aremark" />
                <asp:ButtonField CommandName="Insert" Text="??" />
            </Columns>
            <EmptyDataTemplate>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="ano" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                    Height="50px" oniteminserted="DetailsView1_ItemInserted" Width="295px">
                    <Fields>
                        <asp:BoundField DataField="ano" HeaderText="??" ReadOnly="True" 
                            SortExpression="ano" />
                        <asp:BoundField DataField="aname" HeaderText="??" SortExpression="aname" />
                        <asp:BoundField DataField="asex" HeaderText="??(?/?)" SortExpression="asex" />
                        <asp:BoundField DataField="aphone" HeaderText="??" SortExpression="aphone" />
                        <asp:BoundField DataField="aremark" HeaderText="??" SortExpression="aremark" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </EmptyDataTemplate>
        </asp:GridView>
    
        </div>
        <br />
    
    </div>
    </form>
</body>
</html>