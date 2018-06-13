Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing.Imaging

Public Class DataOperations_Dokter
        
#Region "Read ID and ID Max"
    Public Function ReadIDDocter() As Integer

        If connection.State = ConnectionState.Closed Then
            connection.ConnectionString = connString
            connection.Open()
        End If

        Dim Identifier As Integer = 0

        Using cmd As New SqlCommand With {.Connection = connection}
            cmd.CommandText = "SELECT ID FROM [dokter]"
            Identifier = CInt(cmd.ExecuteScalar)
        End Using

        Return Identifier

    End Function

    Public Function ReadMaxIDDocter() As Integer

        If connection.State = ConnectionState.Closed Then
            connection.ConnectionString = connString
            connection.Open()
        End If

        Dim returnID As Integer

        Using cmd As New SqlCommand With {.Connection = connection}
            cmd.CommandText = "SELECT MAX(ID) FROM [dokter]"
            returnID = CInt(cmd.ExecuteScalar)
        End Using

        Return returnID

    End Function
#End Region

#Region "Ambil data dari database untuk di tampilkan di form anak"
    Public Sub getDataDokter(id As Integer)

        If connection.State = ConnectionState.Closed Then
            connection.ConnectionString = connString
            connection.Open()
        End If

        Using connection
            Dim command As SqlCommand = New SqlCommand( _
                                        "SELECT nama, jenis_kelamin, spesialisasi, tgl_lahir, gol_darah, rhesus, photo, alamat, provinsi, " &
                                        "kabupaten, kecamatan, tlp_rumah, tlp_seluler, fee, pembayaran_fee, bank, no_rekening, " &
                                        "rekening_atas_nama, keterangan, direvisi_oleh, start_jam_revisi, end_jam_revisi, " &
                                        "tgl_revisi FROM dokter WHERE id = @id", connection)

            command.Parameters.AddWithValue("@id", id)

            Dim reader As SqlDataReader = command.ExecuteReader()

            Dim imageData As Byte()

            If reader.HasRows Then
                Do While reader.Read()
                    dokter.lblID.Text = id
                    dokter.txtNama.Text = reader.GetString(0)
                    jenkelDokter = reader.GetString(1)
                    spesialisasiDokter = reader.GetString(2)
                    dokter.dtpTglLahir.Value = reader.GetDateTime(3)
                    golDarahDokter = reader.GetString(4)
                    rhesusDokter = reader.GetString(5)

                    imageData = reader.GetValue(6)
                    Dim memStr As New MemoryStream(imageData)
                    dokter.pbxPhoto.BackgroundImage = Image.FromStream(memStr)
                    dokter.pbxPhoto.BackgroundImageLayout = ImageLayout.Zoom

                    dokter.txtAlamat.Text = reader.GetString(7)
                    provinsi = reader.GetString(8)
                    kabupaten = reader.GetString(9)
                    kecamatan = reader.GetString(10)
                    dokter.txtTlpRumah.Text = reader.GetInt32(11)
                    dokter.txtTlpSelular.Text = reader.GetInt32(12)
                    dokter.txtFee.Text = Convert.ToString(reader.GetInt32(13))
                    pembayaranFee = reader.GetString(14)
                    namaBank = reader.GetString(15)
                    dokter.txtNoRekening.Text = Convert.ToString(reader.GetInt32(16))
                    dokter.txtAtasNama.Text = reader.GetString(17)
                    dokter.txtKeterangan.Text = reader.GetString(18)
                    dokter.lblDirevisiOleh.Text = reader.GetString(19)                    
                Loop
            Else
                Console.WriteLine("No rows found.")
            End If

            reader.Close()
        End Using
    End Sub
#End Region

#Region "Add New Dokter"
    Private SQLCommand_InsertDocter As String = "INSERT INTO [dokter] (jenis_kelamin, nama, spesialisasi, tgl_lahir, " &
                                       "gol_darah, rhesus, photo, alamat, provinsi, kabupaten, kecamatan, tlp_rumah, " &
                                       "tlp_seluler, fee, pembayaran_fee, bank, no_rekening, rekening_atas_nama, keterangan, " &
                                       "direvisi_oleh, start_jam_revisi, end_jam_revisi, tgl_revisi)" &
                                       "VALUES (@jenkel, @nama, @spesialisasi, @tgl_lahir, @gol_darah, @rhesus, @photo, @alamat, " &
                                       "@provinsi, @kabupaten, @kecamatan, @tlp_rumah, @tlp_selular, @fee, @pembayaran_fee, " &
                                       "@bank, @no_rekening, @rekening_atas_nama, @keterangan, @direvisi_oleh, @start_jam_revisi, " &
                                        " @end_jam_revisi, @tgl_revisi);"
    Public Function AddNewDocter(ByVal jenkel As String, ByVal nama As String, ByVal spesialisasi As String,
                                 ByVal tgl_lahir As Date, ByVal gol_darah As String, ByVal rhesus As String, ByVal photo As Byte(),
                                 ByVal alamat As String, ByVal provinsi As String, ByVal kabupaten As String,
                                 ByVal kecamatan As String, ByVal tlp_rumah As Integer, ByVal tlp_selular As Integer,
                                 ByVal fee As Integer, ByVal pembayaranFee As String, ByVal bank As String, ByVal no_rekening As Integer,
                                 ByVal rekening_atas_nama As String, ByVal keterangan As String, ByVal direvisi_oleh As String,
                                 ByVal start_jam_revisi As String, ByVal end_jam_revisi As String, ByVal tgl_revisi As String) As String


        cmd = New SqlCommand(SQLCommand_InsertDocter, connection)

        cmd.Parameters.AddWithValue("@jenkel", jenkel)
        cmd.Parameters.AddWithValue("@nama", nama)
        cmd.Parameters.AddWithValue("@spesialisasi", spesialisasi)

        cmd.Parameters.Add("@tgl_lahir", SqlDbType.Date)
        cmd.Parameters("@tgl_lahir").Value = tgl_lahir

        cmd.Parameters.AddWithValue("@gol_darah", gol_darah)
        cmd.Parameters.AddWithValue("@rhesus", rhesus)

        cmd.Parameters.Add("@photo", SqlDbType.Image)
        cmd.Parameters("@photo").Value = photo

        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.Add("@tlp_rumah", SqlDbType.Int)
        cmd.Parameters("@tlp_rumah").Value = tlp_rumah

        cmd.Parameters.Add("@tlp_selular", SqlDbType.Int)
        cmd.Parameters("@tlp_selular").Value = tlp_selular

        cmd.Parameters.Add("@fee", SqlDbType.Int)
        cmd.Parameters("@fee").Value = fee

        cmd.Parameters.AddWithValue("@pembayaran_fee", pembayaranFee)
        cmd.Parameters.AddWithValue("@bank", bank)

        cmd.Parameters.Add("@no_rekening", SqlDbType.Int)
        cmd.Parameters("@no_rekening").Value = no_rekening

        cmd.Parameters.AddWithValue("@rekening_atas_nama", rekening_atas_nama)
        cmd.Parameters.AddWithValue("@keterangan", keterangan)
        cmd.Parameters.AddWithValue("@direvisi_oleh", direvisi_oleh)
        cmd.Parameters.AddWithValue("@start_jam_revisi", start_jam_revisi)
        cmd.Parameters.AddWithValue("@end_jam_revisi", end_jam_revisi)
        cmd.Parameters.AddWithValue("@tgl_jam_revisi", tgl_revisi)
        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            My.Dialogs.ExceptionDialog(ex.Message)
            Return False
        End Try

    End Function


#End Region

#Region "Edit Dokter"

    Private SQLCommand_UpdateDokter As String = "UPDATE [dokter] SET jenis_kelamin = @jenis_kelamin, nama = @nama, spesialisasi = @spesialisasi, tgl_lahir = @tgl_lahir, " &
                                       "gol_darah = @gol_darah, rhesus = @rhesus, photo = @photo, alamat = @alamat, provinsi = @provinsi, kabupaten = @kabupaten, kecamatan = @kecamatan, tlp_rumah = @tlp_rumah, " &
                                       "tlp_seluler = @tlp_seluler, fee = @fee, pembayaran_fee = @pembayaran_fee, bank = @bank, no_rekening = @no_rekening, rekening_atas_nama = @rekening_atas_nama, keterangan = @keterangan, " &
                                       "direvisi_oleh = @direvisi_oleh, start_jam_revisi = @start_jam_revisi, end_jam_revisi = @end_jam_revisi, tgl_revisi = @tgl_revisi " &
                                       "WHERE id = @id; "

    Public Function UpdateDocter(ByVal id As String, ByVal jenis_kelamin As String, ByVal nama As String, ByVal spesialisasi As String,
                                 ByVal tgl_lahir As Date, ByVal gol_darah As String, ByVal rhesus As String, ByVal photo As Byte(),
                                 ByVal alamat As String, ByVal provinsi As String, ByVal kabupaten As String,
                                 ByVal kecamatan As String, ByVal tlp_rumah As Integer, ByVal tlp_seluler As Integer,
                                 ByVal fee As Integer, ByVal pembayaranFee As String, ByVal bank As String, ByVal no_rekening As Integer,
                                 ByVal rekening_atas_nama As String, ByVal keterangan As String, ByVal direvisi_oleh As String,
                                 ByVal start_jam_revisi As String, ByVal end_jam_revisi As String, ByVal tgl_revisi As Date) As String


        cmd = New SqlCommand(SQLCommand_UpdateDokter, connection)

        cmd.Parameters.AddWithValue("@id", id)
        cmd.Parameters.AddWithValue("@jenis_kelamin", jenis_kelamin)
        cmd.Parameters.AddWithValue("@nama", nama)
        cmd.Parameters.AddWithValue("@spesialisasi", spesialisasi)

        cmd.Parameters.Add("@tgl_lahir", SqlDbType.Date)
        cmd.Parameters("@tgl_lahir").Value = tgl_lahir

        cmd.Parameters.AddWithValue("@gol_darah", gol_darah)
        cmd.Parameters.AddWithValue("@rhesus", rhesus)

        cmd.Parameters.Add("@photo", SqlDbType.Image)
        cmd.Parameters("@photo").Value = photo

        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.Add("@tlp_rumah", SqlDbType.Int)
        cmd.Parameters("@tlp_rumah").Value = tlp_rumah

        cmd.Parameters.Add("@tlp_seluler", SqlDbType.Int)
        cmd.Parameters("@tlp_seluler").Value = tlp_seluler

        cmd.Parameters.Add("@fee", SqlDbType.Int)
        cmd.Parameters("@fee").Value = fee

        cmd.Parameters.AddWithValue("@pembayaran_fee", pembayaranFee)
        cmd.Parameters.AddWithValue("@bank", bank)

        cmd.Parameters.Add("@no_rekening", SqlDbType.Int)
        cmd.Parameters("@no_rekening").Value = no_rekening

        cmd.Parameters.AddWithValue("@rekening_atas_nama", rekening_atas_nama)
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