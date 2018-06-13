<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EMailRegistrationForm.aspx.cs" Inherits="Lab04_IT.EMailRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style5 {
            height: 23px;
            }
        .auto-style7 {
        }
        .auto-style8 {
            width: 130px;
        }
        .auto-style10 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:MultiView ID="EMailForm" runat="server">
            <asp:View ID="Pogled1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="???:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="tbIme" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbIme" Display="None" ErrorMessage="??????? ???!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label2" runat="server" Text="???????:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="tbPrezime" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPrezime" Display="None" ErrorMessage="??????? ???????!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label3" runat="server" Text="????? ID:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="tbID" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbID" Display="None" ErrorMessage="?????????? ?????? ?? ID!" ForeColor="Red" ValidationExpression="^[0-9A-Za-z](?:\.|[0-9A-Za-z])*$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbID" Display="None" ErrorMessage="ID-?? ? ????????????!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblFinki" runat="server" Font-Bold="True" Text="@finki.ukim.mk"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td colspan="2">
                            <asp:Label ID="Label7" runat="server" Font-Size="Small" ForeColor="DarkGray" Text="???? ?? ?? ?????? ??????? a-z, 0-9,_ ? ???????? ???? ?????"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label5" runat="server" Text="???????:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="tbLozinka" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label6" runat="server" Text="??????? ???????:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="tbPotrvda" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbLozinka" ControlToValidate="tbPotrvda" Display="None" ErrorMessage="???????? ???????!" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="3">
                            <asp:Button ID="btnSledno" runat="server" OnClick="btnSledno_Click" Text="??????" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Pogled2" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label8" runat="server" Text="??????:"></asp:Label>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="tbAdresa" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbAdresa" ErrorMessage="????? ??????!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label9" runat="server" Text="???????:"></asp:Label>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="tbTelefon" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbTelefon" ErrorMessage="????????? ??????!" ForeColor="Red" ValidationExpression="07[125678]\d{6}"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbTelefon" Display="Dynamic" ErrorMessage="????????? ? ????????????!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label10" runat="server" Text="???:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" Width="70px">
                                <asp:ListItem Value="0" Selected="True">M</asp:ListItem> <asp:ListItem Value="1">F</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="?????? ???!" ForeColor="Red" InitialValue="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="3">????? ?? ??????:</td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="3">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="145px" NextPrevFormat="ShortMonth" Width="179px">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                <DayStyle BackColor="#CCCCCC" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="#999999" ForeColor="White" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="3">
                            <asp:Button ID="btnNazad" runat="server" OnClick="btnNazad_Click" Text="?????" />
                            &nbsp;&nbsp;&nbsp;<asp:Button ID="btnSledno1" runat="server" OnClick="btnSledno1_Click" Text="??????" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Pogled3" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style10" colspan="2">
                            <asp:Label ID="Label11" runat="server" Text="????????:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10" colspan="2">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>-????????-</asp:ListItem>
                                <asp:ListItem>?????????</asp:ListItem>
                                <asp:ListItem>??? ????????</asp:ListItem>
                                <asp:ListItem>??? ?????????</asp:ListItem>
                                <asp:ListItem>????????</asp:ListItem>
                                <asp:ListItem>???????</asp:ListItem>
                                <asp:ListItem>?????</asp:ListItem>
                                <asp:ListItem>?????</asp:ListItem>
                                <asp:ListItem>???????</asp:ListItem>
                                <asp:ListItem>?????????</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="???????? ????????!" ControlToValidate="DropDownList1" ForeColor="Red" InitialValue="-????????-"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Label ID="Label12" runat="server" Text="?????? ?? ?????? ?? ????????? ???????:"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10" colspan="2">
                            <asp:TextBox ID="tbGodini" runat="server"></asp:TextBox>&nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="????????? ??????!" ForeColor="Red" ValidationExpression="^[0-9]+$" ControlToValidate="tbGodini"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnNazad1" runat="server" Text="?????" OnClick="btnNazad1_Click" />&nbsp;&nbsp;
                            <asp:Button ID="btnSledno2" runat="server" Text="??????" OnClick="btnSledno2_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Pogled4" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblKorisnik" runat="server"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnPocetok" runat="server" OnClick="btnPocetok_Click" Text="????? ?? ?? ???????" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>