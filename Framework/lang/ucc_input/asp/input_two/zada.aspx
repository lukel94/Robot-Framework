<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zadaca1.aspx.cs" Inherits="AUD05_IT2015.Zadaca1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 67px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:ListBox ID="lstAvtori" runat="server" Height="197px" Width="249px" AutoPostBack="True" OnSelectedIndexChanged="lstAvtori_SelectedIndexChanged"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPoraka" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPromeni" runat="server" Text="???????" OnClick="btnPromeni_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" Text="???????" OnClick="btnClear_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnVnesi" runat="server" Text="?????" OnClick="btnVnesi_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnIzbrisi" runat="server" OnClick="btnIzbrisi_Click" Text="???????" />
                </td>
            </tr>
            <tr>
                <td>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbID" runat="server" Font-Bold="True" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label2" runat="server" Text="???:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbIme" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label3" runat="server" Text="???????:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbPrezime" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label4" runat="server" Text="???????:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbTelefon" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label5" runat="server" Text="??????:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbAdresa" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label6" runat="server" Text="????:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbGrad" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label7" runat="server" Text="??????:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbDrzava" runat="server" Font-Bold="True"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>