<%@ Page Language=VB Debug=true %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OLEDB" %>
<script runat=server>
Sub Page_Load(ByVal Sender as Object, ByVal E as EventArgs)
    If Not IsPostBack Then
        BuildDataList
    End If
End Sub
Sub DataList_Delete(sender As Object, e As DataListCommandEventArgs)
    Dim TheID as String
    TheID = CType(e.Item.FindControl("lblID"), Label).Text
    Dim DBConn as OleDbConnection
    Dim DBDelete As New OleDbCommand
    DBConn = New OleDbConnection( _
        "PROVIDER=Microsoft.Jet.OLEDB.4.0;" _
        & "DATA SOURCE=" _
        & Server.MapPath("EmployeeDatabase.mdb;"))
    DBDelete.CommandText = "Delete From Employee Where " _
        & "ID = " & TheID
    DBDelete.Connection = DBConn
    DBDelete.Connection.Open
    DBDelete.ExecuteNonQuery()
    DBConn.Close
    BuildDataList
End Sub
Sub BuildDataList ()
        Dim DBConn as OleDbConnection
        Dim DBCommand As OleDbDataAdapter
        Dim DSPageData as New DataSet
        DBConn = New OleDbConnection( _
            "PROVIDER=Microsoft.Jet.OLEDB.4.0;" _
            & "DATA SOURCE=" _
            & Server.MapPath("EmployeeDatabase.mdb;"))
        DBCommand = New OleDbDataAdapter _
            ("Select ID, FirstName, LastName " _
            & "From Employee " _
            & "Order By FirstName", DBConn)
        DBCommand.Fill(DSPageData, _
            "Employee")
        dlDepts.DataSource = _
            DSPageData.Tables("Employee").DefaultView
        dlDepts.DataBind()   
End Sub
</SCRIPT>
<HTML>
<HEAD>
<TITLE>Removing Rows from a DataList Control</TITLE>
</HEAD>
<Body LEFTMARGIN="40">
<form runat="server">
<BR><BR>
<asp:Label 
    id="lblMessage" 
    Font-Size="12pt"
    Font-Bold="True"
    Font-Name="Lucida Console"
    text="Below is a list of all the Employee"
    runat="server"
/>
<BR><BR>
<asp:datalist 
    id="dlDepts" 
    runat="server" 
    OnDeleteCommand="DataList_Delete"
    gridlines="Both"
    backcolor="lightyellow"
    forecolor="darkred"
>
    <itemtemplate>
        <B>Department: </B>
        <asp:label
            id="lblID"
            runat="server"
            text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
            visible="False"
        />
        <%# DataBinder.Eval(Container.DataItem, "FirstName") _
            & " - " _
            & DataBinder.Eval(Container.DataItem, "LastName") 
         %>
         <asp:LinkButton 
             id="butDelete" 
              Text="Delete" 
              CommandName="Delete"
              runat="server"
          />
    </itemtemplate>
</asp:datalist>
</form>
</BODY>
</HTML>