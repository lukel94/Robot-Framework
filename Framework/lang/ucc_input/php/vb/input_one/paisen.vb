Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing.Imaging

Public Class DataOperations_Pasien

#Region "Read ID dan ID Max"
    Public Function ReadIDPasien() As Integer
        Dim Identifier As Integer = 0

        Using cmd As New SqlCommand With {.Connection = connection}
            cmd.CommandText = "SELECT ID FROM [pasien]"
            Identifier = CInt(cmd.ExecuteScalar)
        End Using

        Return Identifier

    End Function

    Public Function ReadMaxIDPasien() As Integer
        Dim returnID As Integer

        Using cmd As New SqlCommand With {.Connection = connection}
            cmd.CommandText = "SELECT MAX(ID) FROM [pasien]"
            returnID = CInt(cmd.ExecuteScalar)
        End Using

        Return returnID

    End Function

#End Region

#Region "Ambil data pasien dari database untuk di tampilkan di form anak"
    Public Sub getDataPasien(id As Integer)

        If connection.State = ConnectionState.Closed Then
            connection.ConnectionString = connString
            connection.Open()
        End If

        Using connection
            Dim command As SqlCommand = New SqlCommand( _
                                        "SELECT nama, photo, status, jenis_kelamin, tempat_lahir, tgl_lahir, gol_darah, rhesus, pendidikan, " &
                                        "pekerjaan, alamat, provinsi, kabupaten, kecamatan, tlp_rumah, tlp_seluler, email, " &
                                        "keterangan, direvisi_oleh, start_jam_revisi, end_jam_revisi, " &
                                        "tgl_revisi FROM pasien WHERE id = @id", connection)

            command.Parameters.AddWithValue("@id", id)

            Dim reader As SqlDataReader = command.ExecuteReader()

            Dim imageData As Byte()

            If reader.HasRows Then
                Do While reader.Read()
                    pasien.lblID.Text = id
                    pasien.txtNama.Text = reader.GetString(0)

                    imageData = reader.GetValue(1)
                    Dim memStr As New MemoryStream(imageData)
                    pasien.pbxPhoto.BackgroundImage = Image.FromStream(memStr)
                    pasien.pbxPhoto.BackgroundImageLayout = ImageLayout.Zoom

                    statusPasien = reader.GetString(2)
                    jenkelPasien = reader.GetString(3)
                    tmplahirPasien = reader.GetString(4)
                    tgllahirPasien = reader.GetDateTime(5)
                    golDarahPasien = reader.GetString(6)
                    rhesusPasien = reader.GetString(7)
                    pendidikanPasien = reader.GetString(8)
                    pekerjaanPasien = reader.GetString(9)
                    pasien.txtAlamat.Text = reader.GetString(10)
                    provinsi = reader.GetString(11)
                    kabupaten = reader.GetString(12)
                    kecamatan = reader.GetString(13)
                    pasien.txtEmail.Text = reader.GetString(14)
                Loop
            Else
                Console.WriteLine("No rows found.")
            End If

            reader.Close()
        End Using
    End Sub
#End Region
    
#Region "Add New Pasien"

    Private InsertPasien As String = "INSERT INTO [pasien] (photo, nama, status, jenis_kelamin, tempat_lahir, tgl_lahir, " &
                                        "gol_darah, rhesus, pendidikan, pekerjaan, alamat, provinsi, kabupaten, kecamatan, tlp_rumah, " &
                                        "tlp_seluler, email, keterangan, direvisi_oleh, start_jam_revisi, end_jam_revisi, tgl_revisi) " &
                                        "VALUES (@photo, @nama, @status, @jenkel, @tempat_lahir, @tgl_lahir, @gol_darah, @rhesus, @pendidikan, " &
                                        "@pekerjaan, @alamat, @provinsi, @kabupaten, @kecamatan, @tlp_rumah, @tlp_seluler, @email, " &
                                        "@keterangan, @direvisi_oleh, @start_jam_revisi, @end_jam_revisi, @tgl_revisi);"

    Public Function AddNewPasien(ByVal photo As Byte(), ByVal nama As String, ByVal status As String, ByVal jenkel As String, ByVal tempat_lahir As String,
                                 ByVal tgl_lahir As Date, ByVal gol_darah As String, ByVal rhesus As String, ByVal pendidikan As String,
                                 ByVal pekerjaan As String, ByVal alamat As String, ByVal provinsi As String, ByVal kabupaten As String,
                                 ByVal kecamatan As String, ByVal tlp_rumah As Integer, ByVal tlp_seluler As Integer, ByVal email As String,
                                 ByVal keterangan As String, ByVal direvisi_oleh As String, ByVal start_jam_revisi As String,
                                 ByVal end_jam_revisi As String, ByVal tgl_revisi As Date) As String


        cmd = New SqlCommand(InsertPasien, connection)

        cmd.Parameters.Add("@photo", SqlDbType.Image)

        If Not photo Is Nothing Then
            cmd.Parameters("@photo").Value = photo
        Else
            'photo = Nothing
            cmd.Parameters("@photo").Value = DBNull.Value
        End If

        cmd.Parameters.AddWithValue("@jenkel", jenkel)
        cmd.Parameters.AddWithValue("@nama", nama)
        cmd.Parameters.AddWithValue("@status", status)
        cmd.Parameters.AddWithValue("@tempat_lahir", tempat_lahir)

        cmd.Parameters.Add("@tgl_lahir", SqlDbType.Date)
        cmd.Parameters("@tgl_lahir").Value = tgl_lahir

        cmd.Parameters.AddWithValue("@gol_darah", gol_darah)
        cmd.Parameters.AddWithValue("@rhesus", rhesus)
        cmd.Parameters.AddWithValue("@pendidikan", pendidikan)
        cmd.Parameters.AddWithValue("@pekerjaan", pekerjaan)
        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.Add("@tlp_rumah", SqlDbType.Int)
        cmd.Parameters("@tlp_rumah").Value = tlp_rumah

        cmd.Parameters.Add("@tlp_seluler", SqlDbType.Int)
        cmd.Parameters("@tlp_seluler").Value = tlp_seluler

        cmd.Parameters.AddWithValue("@email", email)
        cmd.Parameters.AddWithValue("@keterangan", keterangan)
        cmd.Parameters.AddWithValue("@direvisi_oleh", direvisi_oleh)
        cmd.Parameters.AddWithValue("@start_jam_revisi", start_jam_revisi)
        cmd.Parameters.AddWithValue("@end_jam_revisi", end_jam_revisi)
        cmd.Parameters.AddWithValue("@tgl_revisi", tgl_revisi)
        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            My.Dialogs.ExceptionDialog(ex.Message)
            Return False
        End Try

    End Function

#End Region

#Region "Update Pasien"

    Private SQLCommand_UpdatePasien As String = "UPDATE [pasien] SET photo = @photo, nama = @nama, status = @status, jenis_kelamin = @jenis_kelamin, tempat_lahir = @tempat_lahir, tgl_lahir = @tgl_lahir, " &
                                     "gol_darah = @gol_darah, rhesus = @rhesus, pendidikan = @pendidikan, pekerjaan = @pekerjaan, alamat = @alamat, provinsi = @provinsi, kabupaten = @kabupaten, " &
                                     "kecamatan = @kecamatan, tlp_rumah = @tlp_rumah, tlp_seluler = @tlp_seluler, email = @email, keterangan = @keterangan, direvisi_oleh = @direvisi_oleh, " &
                                     "start_jam_revisi = @start_jam_revisi, end_jam_revisi = @end_jam_revisi, tgl_revisi = @tgl_revisi WHERE id = @id "

    Public Function Update_Pasien(ByVal id As String, ByVal photo As Byte(), ByVal nama As String, ByVal status As String, ByVal jenkel As String, ByVal tempat_lahir As String,
                                 ByVal tgl_lahir As Date, ByVal gol_darah As String, ByVal rhesus As String, ByVal pendidikan As String,
                                 ByVal pekerjaan As String, ByVal alamat As String, ByVal provinsi As String, ByVal kabupaten As String,
                                 ByVal kecamatan As String, ByVal tlp_rumah As Integer, ByVal tlp_seluler As Integer, ByVal email As String,
                                 ByVal keterangan As String, ByVal direvisi_oleh As String, ByVal start_jam_revisi As String,
                                 ByVal end_jam_revisi As String, ByVal tgl_revisi As Date) As String


        cmd = New SqlCommand(SQLCommand_UpdatePasien, connection)

        cmd.Parameters.AddWithValue("@id", id)

        If Not photo Is Nothing Then
            cmd.Parameters.Add("@photo", SqlDbType.Image)
            cmd.Parameters("@photo").Value = photo
        Else
            cmd.Parameters("@photo").Value = Nothing
        End If

        cmd.Parameters.AddWithValue("@jenkel", jenkel)
        cmd.Parameters.AddWithValue("@nama", nama)
        cmd.Parameters.AddWithValue("@status", status)
        cmd.Parameters.AddWithValue("@tempat_lahir", tempat_lahir)

        cmd.Parameters.Add("@tgl_lahir", SqlDbType.Date)
        cmd.Parameters("@tgl_lahir").Value = tgl_lahir

        cmd.Parameters.AddWithValue("@gol_darah", gol_darah)
        cmd.Parameters.AddWithValue("@rhesus", rhesus)
        cmd.Parameters.AddWithValue("@pendidikan", pendidikan)
        cmd.Parameters.AddWithValue("@pekerjaan", pekerjaan)
        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.Add("@tlp_rumah", SqlDbType.Int)
        cmd.Parameters("@tlp_rumah").Value = tlp_rumah

        cmd.Parameters.Add("@tlp_seluler", SqlDbType.Int)
        cmd.Parameters("@tlp_seluler").Value = tlp_seluler

        cmd.Parameters.AddWithValue("@email", email)
        cmd.Parameters.AddWithValue("@keterangan", keterangan)
        cmd.Parameters.AddWithValue("@direvisi_oleh", direvisi_oleh)
        cmd.Parameters.AddWithValue("@start_jam_revisi", start_jam_revisi)
        cmd.Parameters.AddWithValue("@end_jam_revisi", end_jam_revisi)

        cmd.Parameters.Add("@tgl_revisi", SqlDbType.Date)
        cmd.Parameters("@tgl_revisi").Value = tgl_revisi

        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            My.Dialogs.ExceptionDialog(ex.Message)
            Return False
        End Try

    End Function
#End Region

End Class