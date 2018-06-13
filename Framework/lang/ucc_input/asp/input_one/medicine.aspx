<%@ Page Language="C#" AutoEventWireup="true" CodeFile="medicine.aspx.cs" Theme="TestTheme"Inherits="medicine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            color: #3333CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-image: url('Image/??m.jpg'); height: 771px;">
    
        <div style="height: 81px; background-image: url('Image/123123123.jpg'); width: 589px; margin-left: 248px;">
        </div>
    
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/agency.aspx" 
            Text="???????????" Width="173px" Height="35px" />
        <asp:Button ID="Button2" runat="server" PostBackUrl="~/client.aspx" 
            Text="??????????" Width="163px" Height="35px" />
        <asp:Button ID="Button3" runat="server" PostBackUrl="~/medicine.aspx" 
            Text="??????????" Width="188px" Height="33px" ForeColor="Red" />
        <asp:Button ID="Button6" runat="server" PostBackUrl="~/??????.aspx" 
            Text="??????????????" Width="205px" Height="33px" />
        <asp:Button ID="Button5" runat="server" PostBackUrl="~/???????.aspx" 
            Text="????" Width="76px" Height="31px" />
        <asp:Button ID="Button8" runat="server" PostBackUrl="~/??????/agency.aspx" 
            Text="????" Height="31px" Width="92px" />
        <asp:Button ID="Button4" runat="server" PostBackUrl="~/Default.aspx" 
            Text="????" Height="31px" Width="91px" />
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:MediDB1ConnectionString %>" 
            DeleteCommand="DELETE FROM [medicine] WHERE [mno] = @original_mno AND (([mname] = @original_mname) OR ([mname] IS NULL AND @original_mname IS NULL)) AND (([mmode] = @original_mmode) OR ([mmode] IS NULL AND @original_mmode IS NULL)) AND (([mefficacy] = @original_mefficacy) OR ([mefficacy] IS NULL AND @original_mefficacy IS NULL))" 
            InsertCommand="INSERT INTO [medicine] ([mno], [mname], [mmode], [mefficacy]) VALUES (@mno, @mname, @mmode, @mefficacy)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [medicine]" 
            
            UpdateCommand="UPDATE [medicine] SET [mname] = @mname, [mmode] = @mmode, [mefficacy] = @mefficacy WHERE [mno] = @original_mno AND (([mname] = @original_mname) OR ([mname] IS NULL AND @original_mname IS NULL)) AND (([mmode] = @original_mmode) OR ([mmode] IS NULL AND @original_mmode IS NULL)) AND (([mefficacy] = @original_mefficacy) OR ([mefficacy] IS NULL AND @original_mefficacy IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_mno" Type="String" />
                <asp:Parameter Name="original_mname" Type="String" />
                <asp:Parameter Name="original_mmode" Type="String" />
                <asp:Parameter Name="original_mefficacy" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mmode" Type="String" />
                <asp:Parameter Name="mefficacy" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mmode" Type="String" />
                <asp:Parameter Name="mefficacy" Type="String" />
                <asp:Parameter Name="original_mno" Type="String" />
                <asp:Parameter Name="original_mname" Type="String" />
                <asp:Parameter Name="original_mmode" Type="String" />
                <asp:Parameter Name="original_mefficacy" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div style="height: 388px; width: 796px; margin-left: 197px">
            ??<strong><span class="style1"><em><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </em></span></strong>??<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            ????<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            ??<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="??" />
        <br />
            <asp:GridView ID="GridView2" runat="server">
          

            </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="mno" 
            DataSourceID="SqlDataSource1" onrowcommand="GridView1_RowCommand" 
            >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="mno" HeaderText="??" ReadOnly="True" 
                    SortExpression="mno" />
                <asp:BoundField DataField="mname" HeaderText="??" SortExpression="mname" />
                <asp:BoundField DataField="mmode" HeaderText="????" SortExpression="mmode" />
                <asp:BoundField DataField="mefficacy" HeaderText="??" 
                    SortExpression="mefficacy" />
                <asp:ButtonField CommandName="Insert" Text="??" />
            </Columns>
            <EmptyDataTemplate>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="mno" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                    Height="50px" oniteminserted="DetailsView1_ItemInserted" Width="462px">
                    <Fields>
                        <asp:BoundField DataField="mno" HeaderText="??" ReadOnly="True" 
                            SortExpression="mno" />
                        <asp:BoundField DataField="mname" HeaderText="??" SortExpression="mname" />
                        <asp:BoundField DataField="mmode" HeaderText="????(??“??”??“??”)" 
                            SortExpression="mmode" />
                        <asp:BoundField DataField="mefficacy" HeaderText="??" 
                            SortExpression="mefficacy" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </EmptyDataTemplate>
        </asp:GridView>
    
        </div>
    
    </div>
    </form>
</body>
</html>