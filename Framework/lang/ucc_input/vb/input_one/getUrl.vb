Imports System.Net
Class Tieba
    Private _bduss As String = Nothing
    Private _Name As String = Nothing
    
    Private _CookieContainer As New CookieContainer
    
    Private _Port As Int16 = Nothing
    Private _IP As String = Nothing
    Private _ProxySwitch As Boolean = False
    
    
    Sub New(ByVal bduss As String)
        Dim UserCookie As Cookie = New Cookie("BDUSS", bduss)
        UserContainer.Add(UserCookie)
        
    End Sub
    Public Property ContentType As String = "application/x-www-form-urlencoded"
    Public Property Timeout As Integer = 120000
    Public Property UserAgent As String = "bdtb for Android 6.4.3"
    
    Public Property Proxy As String
        Get
            Return Me._IP & ":" & Me._Port
        End Get
        Set(ByVal value As String)
            Dim GetIP As String = System.Text.RegularExpressions.Regex.Match(value, "((([1-9]?\w)|(1\w\w)|(2[0-4]\w)|(25[0-5]))\.){3}(([1-9]?\w)|(1\w\w)|(2[0-4]\w)|(25[0-5])):(0|[1-9]\w{0,3})").Value
            If Len(GetIP) > 0 Then
                Dim SplitStr As String() = Split(GetIP, ":")
                Me._IP = SplitStr(0)
                Me._Port = CType(SplitStr(1), Integer)
                Me._ProxySwitch = True
            Else
                Me._ProxySwitch = False
            End If
        End Set
    End Property

    Public Property ExpectName As String = ""
    
    Private Function _Get(ByVal Url As String) As String
        Dim Req As HttpWebRequest = CTypr(WebRequest.Create(Url), HttpWebRequest)
        
        Req.Method = "GET"
        'Req.Accept = Me.Accept
        Req.UserAgent = Me.UserAgent
        Req.ContentType = Me.ContentType
        
    End Function
    
    Private Function _Post(ByVal Url As String, ByVal PostStr As String)
            Dim Req As HttpWebRequest = CType(WebRequest.Create(Url), HttpWebRequest)
            Dim MyWebCode As String = ""
            Dim DataStream As System.IO.Stream

            Dim ByteArr As Byte() = System.Text.Encoding.UTF8.GetBytes(PostStr)
            Req.Method = "POST"
            Req.Timeout = Me.Timeout
            Req.ContentType = Me.ContentType
            Req.ContentLength = ByteArr.Length
            Req.UserAgent = Me.UserAgent
            Req.Headers.Add("net", "3")
            Req.Headers.Add("Cookie", "ka=open")
            Req.Headers.Add("Accept-Encoding", "gzip")

            
            If Me._ProxySwitch = True Then
                Req.Proxy = New WebProxy(Me._IP, Me._Port)
            End If

            Try
                DataStream = reqp.GetRequestStream()
                'reqp.CookieContainer = New CookieContainer()
                DataStream.Write(ByteArr, 0, ByteArr.Length)
            Catch ex As Exception
                Return ex.Message
            End Try

            Try
                Dim resp As HttpWebResponse = reqp.GetResponse()
                Dim reader As New IO.StreamReader(resp.GetResponseStream(), System.Text.Encoding.UTF8)
                MyWebCode = reader.ReadToEnd
                resp.Close()
                DataStream.Close()
            Catch ex As Exception
                MyWebCode = ex.Message
            End Try
            Return MyWebCode
        End Function

    
    Public Function Filluname() As String
        Dim Name As String = Me.ExpectName
        Dim Sign As String = MD5("BDUSS=" & Me._bduss & "_client_type=2_client_version=6.4.3_phone_imei=A1000038BEF911un=" & Name & "tiebaclient!!!")
        Dim PostStr As String = "BDUSS=" & Me._bduss & "&_client_type=2&_client_version=6.4.3&_phone_imei=A1000038BEF911&un=" & Post_Encode(Name) & "&sign=" & Sign
        
        Dim Re As String = Me._Post("http://c.tieba.baidu.com/c/s/filluname", PostStr)
        Return Re
    End Function

End Class