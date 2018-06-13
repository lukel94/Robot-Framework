'' <summary>
''' MYSQL DATA CLIENT CONNECTION (Imports MySql.Data.MySqlClient)
''' </summary>
''' <param name="schemaDados"></param>
''' <returns></returns>
''' <remarks></remarks>
Function MySqlConnection(ByVal schemaDados As String)
    Dim erro As Integer = 0
    Dim ConnStr As String = ""

    ConnStr = "server=192.168.1.1;"   '#  Server address
    ConnStr += "user id=notRoot;"     '#  MySQL User
    ConnStr += "password=321;"        '#  MySQL Pass
    ConnStr += "database=schemaData;" '#  MySQL Schema to Connect
    ConnStr += "Pooling=true;Min Pool Size=3;Max Pool Size=100;Connection Lifetime=0;"

    Return ConnStr
End Function


''' <summary>
''' MYSQL INSERT QUERY FUNCTION
''' </summary>
''' <param name="IfIgnores">IGNORE OR NOT</param>
''' <param name="TBL">TABLE WITH SCHEMA, LIKE 'schema.table' </param>
''' <param name="STR">VALUES OF INSERT</param>
''' <param name="HVDTL">HAVE DETAIL OF INSERTATIOS, LIKE 'ON DUPLICATE...'</param>
''' <param name="myComm">MySQL COMMAND</param>
''' <param name="myConn">MySQL CONNECTION</param>
''' <remarks>ENJOY</remarks>
Sub MysqlAdd(ByVal IfIgnores As String, ByVal TBL As String, ByVal STR As String, ByVal HVDTL As String, ByVal myComm As MySqlCommand, ByVal myConn As MySqlConnection)
    Dim REQUEST As Boolean = True
    Dim strComando As String

    strComando = "INSERT " & IfIgnores & " INTO " & TBL & " VALUES " & STR & " " & HVDTL

    myComm = New MySqlCommand(strComando, myConn)
    myComm.ExecuteNonQuery()

End Sub

''' <summary>
''' MYSQL UPDATE QUERY FUNCTION
''' </summary>
''' <param name="Tbl">schemma.table</param>
''' <param name="strSet">SET FIELD = DATA</param>
''' <param name="strWhere">WHERE FIELD = DATA</param>
''' <param name="myConn">MySQL Client Connection</param>
''' <param name="myComm">MySQL Client Command</param>
''' <remarks></remarks>
Sub MysqlUpdate(ByVal Tbl As String, ByVal strSet As String, ByVal strWhere As String, ByVal myConn As MySqlConnection, ByVal myComm As MySqlCommand)
    Dim strComando As String

    If strWhere <> "" Then strWhere = " WHERE " & strWhere

    strComando = "UPDATE " & Tbl & " SET " & strSet & " " & strWhere

    myComm = New MySqlCommand(strComando, myConn)
    myComm.CommandTimeout = 0

    myComm.ExecuteNonQuery()
End Sub

''' <summary>
''' MYSQL DELETE QUERY FUNCTION
''' </summary>
''' <param name="Tbl">schemma.table</param>
''' <param name="strWhere">WHERE FIELD = DATA</param>
''' <param name="myConn">MySQL Client Connection</param>
''' <param name="myComm">MySQL Client Command</param>
''' <remarks></remarks>
Sub MysqlDelete(ByVal Tbl As String, ByVal strWhere As String, ByVal myConn As MySqlConnection, ByVal myComm As MySqlCommand)
    Dim strComando As String

    If strWhere <> "" Then strWhere = " WHERE " & strWhere

    strComando = "DELETE FROM " & Tbl & " " & strWhere

    myComm = New MySqlCommand(strComando, myConn)
    myComm.CommandTimeout = 0

    myComm.ExecuteNonQuery()
End Sub