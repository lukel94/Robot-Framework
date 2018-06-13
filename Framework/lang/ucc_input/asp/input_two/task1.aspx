<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task1.aspx.cs" Inherits="WebApplication16.Task1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.2.1.js"></script>
</head>
<body class="container">
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="StartView" runat="server">
                    <div class="panel-heading">
                        <h2>Basic info</h2>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-xs-4">
                                <label for="name">Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" ControlToValidate="name" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">This field is required</asp:RequiredFieldValidator>
                                <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-4">
                                <label for="surname">Surname</label>
                                <asp:TextBox ID="surname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-4">
                                <label for="email">Email</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="" ForeColor="Red" SetFocusOnError="True" ControlToValidate="email" Display="Dynamic">This field is required</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Incorrect email</asp:RegularExpressionValidator>
                                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-4">
                                <label for="phone">Phone</label>
                                <%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Display="Dynamic" ControlToValidate="phone" MaximumValue="999999999" MinimumValue="100000000" ForeColor="Red" Type="Integer">Incorrect Phone</asp:RangeValidator>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                     ValidationExpression="[1-9][0-9]{8}" ControlToValidate="phone">Incorrect Phone</asp:RegularExpressionValidator>
                                <asp:TextBox ID="phone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-3">
                                <label for="CustomerChoiceList">Who are you?</label>
                                <asp:DropDownList ID="CustomerChoiceList" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="CustomerChoiceList_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                    <asp:ListItem Value="0">Current Client</asp:ListItem>
                                    <asp:ListItem Value="1">New Client</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <hr />
                    </div>
                </asp:View>
                <asp:View ID="EndView" runat="server">
                    <div class="panel-heading">
                        <h2>Summary</h2>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="contact">Your preffered form of contact</label>
                                <asp:DropDownList ID="contact" runat="server" CssClass="form-control">
                                    <asp:ListItem>Phone</asp:ListItem>
                                    <asp:ListItem>Email</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <asp:Button ID="endSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="endSubmit_Click"/>
                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="ThankYouView" runat="server">
                    <div class="panel-heading">
                        <h2>Thank you</h2>
                    </div>
                    <div class="panel-body">
                        <h4>Thank you for filling the form.</h4>
                    </div>
                </asp:View>
            </asp:MultiView>
            <asp:MultiView ID="MultiView2" runat="server">
                <asp:View ID="CurrentCustomerView" runat="server">
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="mostBoughtCategory">From which category did you buy stuff the most?</label>
                                <asp:DropDownList ID="mostBoughtCategory" runat="server" CssClass="form-control">
                                    <asp:ListItem>Spozywcze</asp:ListItem>
                                    <asp:ListItem>Chemia</asp:ListItem>
                                    <asp:ListItem>Przemyslowe</asp:ListItem>
                                    <asp:ListItem>RTV</asp:ListItem>
                                    <asp:ListItem>AGD</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="date">When did you recently go shopping?</label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" 
                                    ControlToValidate="date">dd-mm-yyyy</asp:RegularExpressionValidator>
                                <asp:TextBox ID="date" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="shoppingMoney">How much do you approximately spend on shopping?</label>
                                <asp:TextBox ID="shoppingMoney" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="rate">Rate us</label>
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                    <asp:ListItem>Very Well</asp:ListItem>
                                    <asp:ListItem>Good</asp:ListItem>
                                    <asp:ListItem>Poor</asp:ListItem>
                                    <asp:ListItem>Really Bad</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <asp:Button ID="currentSubmit" runat="server" Text="Next" CssClass="btn btn-primary btn-block" OnClick="currentSubmit_Click"  />
                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="NewCustomerView" runat="server">
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="mostInterestingCategory">Products from which category do You find the most interesting?</label>
                                <asp:DropDownList ID="mostInterestingCategory" runat="server" CssClass="form-control">
                                    <asp:ListItem>Spozywcze</asp:ListItem>
                                    <asp:ListItem>Chemia</asp:ListItem>
                                    <asp:ListItem>Przemyslowe</asp:ListItem>
                                    <asp:ListItem>RTV</asp:ListItem>
                                    <asp:ListItem>AGD</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="farKokos">How far do you live from our shop?</label>
                                <asp:TextBox ID="farKokos" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="farOtherShop">How far do you live from the shop you have been doing shopping the most often?</label>
                                <asp:TextBox ID="farOtherShop" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <label for="shoppingMoney2">How much do you approximately spend on shopping?</label>
                                <asp:TextBox ID="shoppingMoney2" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-5">
                                <asp:Button ID="newSubmit" runat="server" Text="Next" CssClass="btn btn-primary btn-block" OnClick="newSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>