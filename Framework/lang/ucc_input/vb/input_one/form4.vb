Public Class FrmInformacion

    Private Sub Cancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancelar.Click
        Application.Exit()
    End Sub

    Private Sub TextBox7_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TxtNumero.KeyPress
        Dim valor As Boolean
        Dim Numero_Convertido As Double
        valor = Double.TryParse(TxtNumero.Text, Numero_Convertido)

        If e.KeyChar() = ChrW(Keys.Enter) AndAlso valor = True Then
            LstDivisores.Items.Clear()
            Divisores(TxtNumero.Text)
            TxtCifras_Impares.Text = CType(SumaDeCifrasImpares(TxtNumero.Text), String)
            TxtCifrasPares.Text = CType(SumaDeCifrasPares(TxtNumero.Text), String)
            TxtSuma_Cifras.Text = CType(SumaTotalDeCifras(TxtNumero.Text), String)
            TxtCifra_Mayor.Text = CType(CifraMayor(TxtNumero.Text), String)
            TxtCifra_Menor.Text = CType(CifraMenor(TxtNumero.Text), String)
            CantidadDeCifras(TxtNumero.Text)
        End If

    End Sub

    Private Sub TextBox7_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TxtNumero.TextChanged

    End Sub

    Private Sub BtnLimpiar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnLimpiar.Click

        For Each control As Control In Me.Controls
            If TypeOf control Is GroupBox Then
                For Each controlText As Control In Me.GrpInformacion.Controls
                    If TypeOf controlText Is TextBox Then
                        CType(controlText, TextBox).Clear()
                    End If
                Next
            End If
        Next

        TxtNumero.Clear()
        LstDivisores.Items.Clear()

    End Sub


    Private Sub CantidadDeCifras(ByVal Numero As String)
        TxtCantidad_Cifras.Text = CType(Numero.Length(), String)

    End Sub

    Private Function String_a_Vector(ByVal Numero As String) As Integer()
        Dim Vector As Integer()
        Vector = New Integer(Numero.Length - 1) {}
        Dim verdad As Boolean
        For i = 0 To Numero.Length - 1

            verdad = Integer.TryParse(Numero.Substring(i, 1), Vector(i))
            If verdad = True Then
                Vector(i) = CType(Numero.Substring(i, 1), Integer)
            End If
            REM 1,5,4
            REM 0,1,2
        Next
        REM Falta hacerlo

        Return Vector
    End Function

    Private Function SumaDeCifrasImpares(ByVal Numero As String) As Integer
        Dim Vector() As Integer
        Dim Suma_Impares As Integer

        Suma_Impares = 0

        Vector = String_a_Vector(Numero)

        For i = 0 To Vector.Length - 1

            If Not (Vector(i) Mod 2) = 0 Then

                Suma_Impares = Vector(i) + Suma_Impares

            End If

        Next

        Return Suma_Impares
    End Function


    Private Function SumaDeCifrasPares(ByVal Numero As String) As Integer
        Dim Vector() As Integer
        Dim Suma_Pares As Integer

        Suma_Pares = 0

        Vector = String_a_Vector(Numero)

        For i = 0 To Vector.Length - 1

            If (Vector(i) Mod 2) = 0 Then

                Suma_Pares = Vector(i) + Suma_Pares

            End If

        Next

        Return Suma_Pares
    End Function

    Private Function SumaTotalDeCifras(ByVal Numero As String) As Integer
        Return SumaDeCifrasImpares(Numero) + SumaDeCifrasPares(Numero)
    End Function

    Private Function CifraMayor(ByVal Numero As String) As Integer
        Dim Vector() As Integer
        Dim Mayor As Integer

        Mayor = 0

        Vector = String_a_Vector(Numero)

        For i = 0 To Vector.Length - 1

            If Vector(i) > Mayor Then

                Mayor = Vector(i)

            End If

        Next

        Return Mayor

    End Function

    Private Function CifraMenor(ByVal Numero As String) As Integer

        Dim Vector() As Integer
        Dim Menor As Integer

        Menor = 9

        Vector = String_a_Vector(Numero)

        For i = 0 To Vector.Length - 1

            If Vector(i) < Menor Then

                Menor = Vector(i)

            End If

        Next

        Return Menor

    End Function


    Private Sub Divisores(ByVal Numero As String)
        Dim Numero_Convertido = CType(Numero, Double)

        For i = 1 To Numero_Convertido

            If Numero_Convertido Mod i = 0 Then
                LstDivisores.Items.Add(i)
            End If

        Next

    End Sub

End Class