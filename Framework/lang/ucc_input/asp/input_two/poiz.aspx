<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proizvodi.aspx.cs" Inherits="Aud2_IT2015.Proizvodi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 80%;
        }
        .auto-style2 {
            width: 589px;
        }
        .auto-style3 {
            width: 589px;
            height: 201px;
        }
        .auto-style4 {
            height: 201px;
        }
        .auto-style5 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 764px">
    
        <table class="auto-style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblKorisnici" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:Label ID="lblKorisnik" runat="server" Font-Bold="True" ForeColor="#FF0066"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                   <center> <asp:Label ID="lblKategorija" runat="server" Font-Size="XX-Large"></asp:Label></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                   <center> <asp:Label ID="Label2" runat="server" Text="?????????"></asp:Label></center>
                </td>
                <td>
                   <center> <asp:Label ID="Label3" runat="server" Text="????"></asp:Label></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3">
                    <asp:ListBox ID="lstProizvodi" runat="server" AutoPostBack="True" Height="196px" OnSelectedIndexChanged="lstProizvodi_SelectedIndexChanged" style="margin-top: 0px" Width="585px"></asp:ListBox>
                </td>
                <td class="auto-style4">
                    <asp:ListBox ID="lstCeni" runat="server" Height="198px" Width="172px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Katalog.aspx">???????</asp:HyperLink>
                </td>
                <td class="auto-style2" colspan="2">
                   <center> <asp:Button ID="btnAddToShoppingCart" runat="server" Text="?????? ?? ????????" OnClick="btnAddToShoppingCart_Click" /></center>
                </td>
                <td>
                   <center><asp:Label ID="lblPromeni" runat="server"></asp:Label></center> 
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="3">
                    <asp:ListBox ID="lstKosnicka" runat="server" Height="186px" Width="581px"></asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="3">
                  <center> <asp:Button ID="btnKupi" runat="server" Text="????" OnClick="btnKupi_Click" /></center> 
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>