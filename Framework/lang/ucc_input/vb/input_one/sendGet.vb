''' <summary>
''' atualiza dados externos por get
''' </summary>
''' <remarks>ENJOY</remarks>
Sub sendGet()
  Dim SendArr As String = ""
  Using MyConn As New MySqlConnection(ConString("schema1")) '//MysqlClient Data String Connection
      MyConn.Open()
      Using CidArr As MySqlDataReader = BuscaCidade(MyConn, "FIELD0 = '01000'")
          While CidArr.Read()
              ENDERECO(CidArr.Item("FIELD1").ToString, CidArr.Item("FIELD2").ToString)
          End While
      End Using
      MyConn.Dispose()
  End Using
End Sub

''' <summary>
''' SEND DATA BY GET
''' </summary>
''' <param name="cidContrato">STRING [5]</param>
''' <param name="Base">STRING [6]</param>
''' <remarks>ENJOY</remarks>
Private Sub ENDERECO(ByVal cidContrato As String, ByVal Base As String)
  '// QEY FOR ORACLE
  Dim QryStr As String = EnderLogr.EnderecoLogradouroQuery(cidContrato) '// send back ORA query
  Try
      Using OraConn As New OracleConnection(StrConection(Base)) '//connect to ora
          OraConn.Open()

          Dim QryCommand As OracleCommand
          Dim JsonTxt As String = ""
          QryCommand = New OracleCommand(QryStr, OraConn)

          Dim req As Object = CreateObject("Msxml2.XMLHttp.6.0")
          Dim url As String

          Using GetRow As OracleDataReader = QryCommand.ExecuteReader()
              While GetRow.Read()
                  url = "http://xxx.xx.xxx.xxx/insere.php?codigoCidade=" & GetRow.Item("FIELD1") & "&nomeRua=" & GetRow.Item("FIELD2")
                  req.open("GET", url, False)
                  req.send()
              End While
              req = Nothing
              OraConn.Dispose()
          End Using
      End Using
  Catch ex As Exception
      ErrCatcher.LogErro(System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "")
  End Try
End Sub
    
''' <summary>
''' MySQL Data client connection String
''' </summary>
''' <param name="schemaDados">Schama para conectar</param>
''' <returns>String</returns>
''' <remarks>ENJOY</remarks>    
Private Function ConString(ByVal schemaDados As String) As String
  ConnStr = "server=" & strServer & ";"
  ConnStr += "user id=" & strUser & ";"
  ConnStr += "password=" & strPass & ";"
  ConnStr += "database=" & schemaDados & ";Pooling=true;Min Pool Size=13;Max Pool Size=100;Connection Lifetime=0;"

  Return ConnStr
End Function

''' <summary>
''' Cidade select query
''' </summary>
''' <param name="GetConn">MysqlConnection</param>
''' <param name="cfg">Where's param</param>
''' <returns>MySqlDataReader result</returns>
''' <remarks>ENJOY</remarks>
Private Function BuscaCidade(ByVal GetConn As MySqlConnection, ByVal cfg As String) As MySqlDataReader
    '// SEND STRSELECT WITH DIC OBJECT
    Dim QryString As New Dictionary(Of String, String)
    Dim JsonString As New Dictionary(Of String, String)

    QryString("Select") = "FIELD3, FIELD4, FIELD5, LOWER(FIELD6) AS NMFIELD"
    QryString("From") = "TB.CIDADE"
    QryString("Where") = IIf(Len(cfg) > 0, cfg, "ESPELHO = 1") '// IF HAVE STRING IN cfg
    Dim QryStr As String = QryConstructor(QryString)

    Dim QryCommand As MySqlCommand
    QryCommand = New MySqlCommand(QryStr, GetConn)

    Return QryCommand.ExecuteReader()
End Function

''' <summary>
''' QUERY CONSTRUCTOR
''' </summary>
''' <param name="QryString">DICTIONARY AS OBJECT</param>
''' <returns>STRING</returns>
''' <remarks>ENJOY</remarks>
Private Function QryConstructor(ByVal QryString As Object) As String

    Dim query As String = ""

    For Each StringQuery As KeyValuePair(Of String, String) In QryString
        query += StringQuery.Key.Replace("_", " ") & " " & StringQuery.Value & " "
    Next

    Return query
End Function

