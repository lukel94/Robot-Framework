<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab2_IT.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 90%;
            height: 388px;
        }
        .auto-style2 {
            width: 86px;
        }
        .auto-style3 {
            width: 149px;
        }
        .auto-style4 {
            width: 86px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 100%;
            height: 449px;
        }
        .auto-style7 {
            height: 136px;
        }
        .auto-style8 {
            width: 66px;
        }
        .auto-style9 {
            width: 66px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 720px">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="pnlMain" runat="server" Width="345px" style="margin-top: 0px">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label1" runat="server" Text="???:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbIme" runat="server" Width="140px" Font-Names="Arial" Font-Size="Small"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label2" runat="server" Text="???????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbPrezime" runat="server" Width="140px" Font-Names="Arial" Font-Size="Small"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label3" runat="server" Text="??:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOd" runat="server" Font-Names="Arial" Font-Size="Small">
                                        <asp:ListItem Value="??????">??????</asp:ListItem>
                                        <asp:ListItem>????????</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label4" runat="server" Text="??:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDo" runat="server" Font-Names="Arial" Font-Size="Small">
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>????????</asp:ListItem>
                                        <asp:ListItem>???????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>????????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>???????</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>?????????</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>?????????</asp:ListItem>
                                        <asp:ListItem>??????</asp:ListItem>
                                        <asp:ListItem>?????????</asp:ListItem>
                                        <asp:ListItem>???</asp:ListItem>
                                        <asp:ListItem>?????</asp:ListItem>
                                        <asp:ListItem>?????????</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label5" runat="server" Text="????? ?? ??????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:DropDownList ID="ddlDen" runat="server" Font-Names="Arial" Font-Size="Small">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlMesec" runat="server" Font-Names="Arial" Font-Size="Small">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlGodina" runat="server" Font-Names="Arial" Font-Size="Small">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label6" runat="server" Text="????? ?? ??????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlVreme" runat="server" Font-Names="Arial" Font-Size="Small">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label7" runat="server" Text="???????? ????????:"></asp:Label>
                                </td>
                                <td>
                                    <asp:ListBox ID="lstSredstvo" runat="server">
                                        <asp:ListItem Value="Sliki/avion.jpg">?????</asp:ListItem>
                                        <asp:ListItem Value="Sliki/voz.jpg">???</asp:ListItem>
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label8" runat="server" Text="????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rblZona" runat="server" Width="198px" Font-Names="Arial" Font-Size="Small">
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label9" runat="server" Text="?????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rblKlasa" runat="server" Width="245px" Font-Names="Arial" Font-Size="Small">
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label10" runat="server" Text="???????:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cblPosluga" runat="server" Width="202px" Font-Names="Arial" Font-Size="Small">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style5">
                                    <asp:Button ID="btnPodnesi" runat="server" Text="???????" style="margin-left:100px" OnClick="btnPodnesi_Click" Font-Names="Arial" Font-Size="Small"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="pnlPanela1" runat="server" Height="463px" style="margin-top: 0px" BackColor="#FFFF99" Width="382px">
                        <table class="auto-style6">
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text="????????? ???????," ForeColor="Navy" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblPatnik" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label12" runat="server" Text="???????? ?? ? ????? ??" ForeColor="Navy" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblSredstvo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" runat="server" Text="?? ??????? ???????????" ForeColor="Navy" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblOd" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label14" runat="server" Text="? ?????? ???????????" ForeColor="Navy" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblDo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="??????? ?? ??????? ?:" ForeColor="Navy" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblVreme" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label17" runat="server" ForeColor="Navy" Text="?????? ????? ?? ?????? ?? ???? ?? ?????? ??" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblZona" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                    &nbsp;<asp:Label ID="Label18" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Navy" Text="??"></asp:Label>
                                    &nbsp;<asp:Label ID="lblKlasa" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                    &nbsp;<asp:Label ID="Label19" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Navy" Text="????? ? ?? ????? ?? "></asp:Label>
                                    <br />
&nbsp;<asp:Label ID="Label20" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Navy" Text="?????????? ?? ?????? ????????? ??"></asp:Label>
                                    &nbsp;&nbsp;<asp:Label ID="lblPosluga" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="Small" ForeColor="Navy"></asp:Label>
                                    <br />
                                    <asp:Image ID="imgSlika" runat="server" Height="137px" Width="373px" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label16" runat="server" ForeColor="Navy" Text="?? ??????????? ?? ????????? ? ?? ?????????? ?????? ???" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                    !</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
    </div>
        <p>
    
        <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Font-Names="Arial"></asp:Label>
    
        </p>
    </form>
</body>
</html>