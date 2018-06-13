Imports System.Data.SqlClient
Imports System.Data.OleDb

Public Class DataOperations_Pengirim
    Private PengirimDataTable As DataTable

    Public Function ReadIDPengirim(ByVal value As Integer) As Integer
        Dim Identifier As Integer = 0

        Using cmd As New SqlCommand With {.Connection = connection}
            cmd.CommandText = "SELECT ID FROM [pengirim] WHERE ID = @ID"
            cmd.Parameters.AddWithValue("@ID", value)
            Identifier = CInt(cmd.ExecuteScalar)
        End Using

        Return Identifier

    End Function

    Public Sub getDataPengirim(id As Integer)
       
        If connection.State = ConnectionState.Closed Then
            connection.ConnectionString = connString
            connection.Open()
        End If

        Using connection
            Dim command As SqlCommand = New SqlCommand( _
              "SELECT nama_kontak, alamat, provinsi, kabupaten, kecamatan, telepon, hp, email, fee, pembayaran_fee, bank, " &
              "no_rekening, rekening_atas_nama, keterangan, direvisi_oleh, start_jam_revisi, end_jam_revisi FROM pengirim " &
              "WHERE id = @id", connection)

            command.Parameters.AddWithValue("@id", id)

            Dim reader As SqlDataReader = command.ExecuteReader()

            If reader.HasRows Then
                Do While reader.Read()
                    pengirim.lblID.Text = id
                    pengirim.txtNamaKontak.Text = reader.GetString(0)
                    pengirim.txtAlamat.Text = reader.GetString(1)
                    pengirim.cbxProvinsi.Text = reader.GetString(2)
                    kabupaten = reader.GetString(3)
                    kecamatan = reader.GetString(4)
                    pengirim.txtTlpRumah.Text = reader.GetString(5)
                    pengirim.txtTlpSelular.Text = reader.GetString(6)
                    pengirim.txtEmail.Text = reader.GetString(7)
                    pengirim.txtFee.Text = Convert.ToString(reader.GetInt32(8))
                    pembayaranFee = reader.GetString(9)
                    namaBank = reader.GetString(10)
                    pengirim.txtNoRekening.Text = Convert.ToString(reader.GetInt32(11))
                    pengirim.txtAtasNama.Text = reader.GetString(12)
                    pengirim.txtKeterangan.Text = reader.GetString(13)
                    pengirim.lblJamMulaiRevisi.Text = reader.GetString(14)
                Loop
            Else
                Console.WriteLine("No rows found.")
            End If

            reader.Close()
        End Using
    End Sub

#Region "Add new pengirim"
    Private SQLCommand_InsertPengirim As String = "INSERT INTO [pengirim] (nama_kontak, alamat, provinsi, kabupaten, kecamatan, telepon, " &
                                      "hp, email, fee, pembayaran_fee, bank, no_rekening, rekening_atas_nama, keterangan, " &
                                      "direvisi_oleh, start_jam_revisi, end_jam_revisi) " &
                                      "VALUES (@nama, @alamat, @provinsi, @kabupaten, @kecamatan, @tlp_rumah," &
                                      " @tlp_selular, @email, @fee, @pembayaran_fee, @bank, @no_rekening, @rekening_atas_nama, @keterangan, " &
                                      "@direvisi_oleh, @start_jam_revisi, @end_jam_revisi);"

    Public Function AddNewPengirim(ByVal nama_kontak As String, ByVal alamat As String, ByVal provinsi As String,
                                 ByVal kabupaten As String, ByVal kecamatan As String, ByVal tlp_rumah As Integer,
                                ByVal tlp_selular As Integer, ByVal email As String, ByVal fee As Integer, ByVal pembayaran_fee As String,
                                ByVal bank As String, ByVal no_rekening As Integer, ByVal rekening_atas_nama As String,
                                ByVal keterangan As String, ByVal direvisi_oleh As String, ByVal start_jam_revisi As String,
                                ByVal end_jam_revisi As String) As String


        cmd = New SqlCommand(SQLCommand_InsertPengirim, connection)

        cmd.Parameters.Add("@nama", SqlDbType.Char)
        cmd.Parameters("@nama").Value = nama_kontak
        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.Add("@tlp_rumah", SqlDbType.Int)
        cmd.Parameters("@tlp_rumah").Value = tlp_rumah

        cmd.Parameters.Add("@tlp_selular", SqlDbType.Int)
        cmd.Parameters("@tlp_selular").Value = tlp_selular

        cmd.Parameters.AddWithValue("@email", email)

        cmd.Parameters.Add("@fee", SqlDbType.Int)
        cmd.Parameters("@fee").Value = fee

        cmd.Parameters.AddWithValue("@pembayaran_fee", pembayaran_fee)
        cmd.Parameters.AddWithValue("@bank", bank)

        cmd.Parameters.Add("@no_rekening", SqlDbType.Int)
        cmd.Parameters("@no_rekening").Value = no_rekening

        cmd.Parameters.AddWithValue("@rekening_atas_nama", rekening_atas_nama)
        cmd.Parameters.AddWithValue("@keterangan", keterangan)
        cmd.Parameters.AddWithValue("@direvisi_oleh", direvisi_oleh)
        cmd.Parameters.AddWithValue("@start_jam_revisi", start_jam_revisi)
        cmd.Parameters.AddWithValue("@end_jam_revisi", end_jam_revisi)
        Try
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            My.Dialogs.ExceptionDialog(ex.Message)
            Return False
        End Try

    End Function
#End Region
   
#Region "Edit data pengirim"
    Private SQLCommand_UpdatePengirim As String = "UPDATE [pengirim] SET nama_kontak = @nama_kontak, alamat = @alamat, provinsi = @provinsi, kabupaten = @kabupaten, " &
                                     "kecamatan = @kecamatan, telepon = @tlp_rumah, hp = @tlp_selular, email = @email, fee = @fee, pembayaran_fee = @pembayaran_fee, " &
                                     "bank = @bank, no_rekening = @no_rekening, rekening_atas_nama = @rekening_atas_nama, keterangan = @keterangan, " &
                                     "direvisi_oleh = @direvisi_oleh, start_jam_revisi = @start_jam_revisi, end_jam_revisi = @end_jam_revisi WHERE id = @id; "

    Public Function UpdatePengirim(ByVal id As Integer, ByVal nama_kontak As String, ByVal alamat As String, ByVal provinsi As String,
                                 ByVal kabupaten As String, ByVal kecamatan As String, ByVal tlp_rumah As Integer,
                                ByVal tlp_selular As Integer, ByVal email As String, ByVal fee As Integer, ByVal pembayaran_fee As String,
                                ByVal bank As String, ByVal no_rekening As Integer, ByVal rekening_atas_nama As String,
                                ByVal keterangan As String, ByVal direvisi_oleh As String, ByVal start_jam_revisi As String,
                                ByVal end_jam_revisi As String) As String


        cmd = New SqlCommand(SQLCommand_UpdatePengirim, connection)

        cmd.Parameters.Add("@id", SqlDbType.Int)
        cmd.Parameters("@id").Value = id

        cmd.Parameters.AddWithValue("@nama_kontak", nama_kontak)
        cmd.Parameters.AddWithValue("@alamat", alamat)
        cmd.Parameters.AddWithValue("@provinsi", provinsi)
        cmd.Parameters.AddWithValue("@kabupaten", kabupaten)
        cmd.Parameters.AddWithValue("@kecamatan", kecamatan)

        cmd.Parameters.AddWithValue("@tlp_rumah", tlp_rumah)
        cmd.Parameters.AddWithValue("@tlp_selular", tlp_selular)
        cmd.Parameters.AddWithValue("@email", email)

        cmd.Parameters.Add("@fee", SqlDbType.Int)
        cmd.Parameters("@fee").Value = fee

        cmd.Parameters.AddWithValue("@pembayaran_fee", pembayaran_fee)
        cmd.Parameters.AddWithValue("@bank", bank)

        cmd.Parameters.Add("@no_rekening", SqlDbType.Int)
        cmd.Parameters("@no_rekening").Value = no_rekening

        cmd.Parameters.AddWithValue("@rekening_atas_nama", rekening_atas_nama)
        cmd.Parameters.AddWithValue("@keterangan", keterangan)
        cmd.Parameters.AddWithValue("@direvisi_oleh", direvisi_oleh)
        cmd.Parameters.AddWithValue("@start_jam_revisi", start_jam_revisi)
        cmd.Parameters.AddWithValue("@end_jam_revisi", end_jam_revisi)
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