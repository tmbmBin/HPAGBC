<%@ Page Language="VB" Debug="true" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Import Namespace="System.Data" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="ToolsFun" %>
<!-- #include file="Default.bas" -->
<script runat="server">

    Dim connectionString As String = System.Configuration.ConfigurationSettings.AppSettings("SqlDbConnStr")

    Function get_cashPayNameList( _
                ByVal csmYear As Integer, _
                ByVal csmNo As Integer, _
                ByVal acmYear As Integer, _
                ByVal acmNo As Integer, _
                ByVal acvNo As Integer, _
                ByVal acmNo1 As Integer, _
                ByVal acvNo1 As Integer, _
                ByVal acmNo2 As Integer, _
                ByVal acvNo2 As Integer, _
                ByVal acpPayYear As Integer, _
                ByVal acpPayNo As Integer, _
                ByVal acvSubNo As Integer, _
                ByVal acpPayNo1 As Integer, _
                ByVal acvSubNo1 As Integer, _
                Optional ByVal csmDNo As Object = Nothing) As System.Data.DataTable

        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim selectString As String = "SELECT csmYear, csmMainNo, " & _
                                            "csmNo, csmDNo, " & _
                                            "acmYear, acmNo, acvNo, " & _
                                            "acmNo1, acvNo1, " & _
                                            "acmNo2, acvNo2, " & _
                                            "acpPayYear, acpPayNo, " & _
                                            "acvSubNo, acpPayNo1, acvSubNo1, " & _
                                            "payCode, csmPayName, " & _
                                            "csmEMail, csmEMailSendDate, " & _
                                            "(CASE ISNULL(csmEMailSendDate,'') WHEN '' THEN '0' ELSE '1' END) AS [sendFlag], " & _
                                            "csmBankNo, csmBankSubNo, csmBankName, " & _
                                            "csmAccountNo, csmAccountName, csmAccountID, " & _
                                            "csmEmpNum, " & _
                                            "csmPayMemo, csmPaySubMemo, " & _
                                            "csmPayCnt, csmAmount, csmFee, csmBillAmount " & _
                                    "FROM [cashPayNameList] "

        Dim whereString As String = "WHERE (csmYear = @csmYear) " & _
                                        "AND (csmNo = @csmNo) " & _
                                        "AND (acmYear = @acmYear) " & _
                                        "AND (acmNo = @acmNo) " & _
                                        "AND (acvNo = @acvNo) " & _
                                        "AND (acmNo1 = @acmNo1) " & _
                                        "AND (acvNo1 = @acvNo1) " & _
                                        "AND (acmNo2 = @acmNo2) " & _
                                        "AND (acvNo2 = @acvNo2) " & _
                                        "AND (acpPayYear = @acpPayYear) " & _
                                        "AND (acpPayNo = @acpPayNo) " & _
                                        "AND (acvSubNo = @acvSubNo) " & _
                                        "AND (acpPayNo1 = @acpPayNo1) " & _
                                        "AND (acvSubNo1 = @acvSubNo1) "

        If Not csmDNo Is Nothing Then

            If csmDNo > 0 Then
                whereString &= "AND (csmDNo = @csmDNo) "
            Else
                whereString = "WHERE (1=2) "
            End If

        End If

        Dim orderString As String = "ORDER BY csmDNo ASC"

        Dim queryString As String = selectString & whereString & orderString


        Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acvNo", acvNo, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acvNo1", acvNo1, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acmNo2", acmNo2, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acvNo2", acvNo2, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acpPayYear", acpPayYear, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acpPayNo", acpPayNo, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acvSubNo", acvSubNo, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acpPayNo1", acpPayNo1, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@acvSubNo1", acvSubNo1, False))

        Dim DT As System.Data.DataTable
        Try
            DT = MsDbFun.GetDbTable(queryString, MyParams, dbConnection)
        Catch ex As Exception
            ToolsFun.WebMsgFun.Show(ex.Message.Replace("\", "\\").Replace("""", "\""").Replace("'", "\'"))
        End Try

        Return DT
    End Function

    Function add_cashPayNameList( _
                ByVal csmYear As Integer, _
            ByVal csmMainNo As Integer, _
                ByVal csmNo As Integer, _
                ByVal acmYear As Integer, _
                ByVal acmNo As Integer, _
                ByVal acvNo As Integer, _
                ByVal acmNo1 As Integer, _
                ByVal acvNo1 As Integer, _
                ByVal acmNo2 As Integer, _
                ByVal acvNo2 As Integer, _
                ByVal acpPayYear As Integer, _
                ByVal acpPayNo As Integer, _
                ByVal acvSubNo As Integer, _
                ByVal acpPayNo1 As Integer, _
                ByVal acvSubNo1 As Integer, _
                ByVal csmDNo As Integer, _
                ByVal payCode As String, _
                ByVal csmPayName As String, _
                ByVal csmEmpNum As String, _
                ByVal csmPayMemo As String, _
                ByVal csmPaySubMemo As String, _
                ByVal csmPayCnt As Integer, _
                ByVal csmAmount As Decimal, _
                ByVal csmEMail As String, _
                ByVal csmBankNo As String, _
                ByVal csmBankSubNo As String, _
                ByVal csmBankName As String, _
                ByVal csmAccountNo As String, _
                ByVal csmAccountName As String, _
                ByVal csmAccountID As String, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "INSERT INTO [cashPayNameList] " & _
                                    "(" & _
                                        "[csmYear], [csmMainNo], [csmNo], " & _
                                        "[acmYear], [acmNo], " & _
                                        "[acvNo], [acmNo1], " & _
                                        "[acvNo1], [acmNo2], " & _
                                        "[acvNo2], " & _
                                        "[acpPayYear], [acpPayNo], " & _
                                        "[acvSubNo], " & _
                                        "[acpPayNo1], [acvSubNo1], " & _
                                        "[csmDNo], " & _
                                        "[payCode], [csmPayName], [csmEmpNum], " & _
                                        "[csmPayMemo], [csmPaySubMemo], " & _
                                        "[csmPayCnt], " & _
                                        "[csmAmount], [csmFee], [csmBillAmount], " & _
                                        "csmEMail, csmBankNo, csmBankSubNo, csmBankName, " & _
                                        "csmAccountNo, csmAccountName, csmAccountID" & _
                                    ") " & _
                                    "VALUES " & _
                                    "(" & _
                                        "@csmYear, @csmMainNo, @csmNo, " & _
                                        "@acmYear, @acmNo, " & _
                                        "@acvNo, @acmNo1, " & _
                                        "@acvNo1, @acmNo2, " & _
                                        "@acvNo2, " & _
                                        "@acpPayYear, @acpPayNo, " & _
                                        "@acvSubNo, " & _
                                        "@acpPayNo1, @acvSubNo1, " & _
                                        "@csmDNo, " & _
                                        "@payCode, @csmPayName, @csmEmpNum, " & _
                                        "@csmPayMemo, @csmPaySubMemo, " & _
                                        "@csmPayCnt, " & _
                                        "@csmAmount, @csmFee, @csmBillAmount, " & _
                                        "@csmEMail, @csmBankNo, @csmBankSubNo, @csmBankName, " & _
                                        "@csmAccountNo, @csmAccountName, @csmAccountID" & _
                                    ")"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))  'A21003新增
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmYear", acmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo", acmNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo", acvNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo1", acmNo1, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo1", acvNo1, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acmNo2", acmNo2, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvNo2", acvNo2, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acpPayYear", acpPayYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acpPayNo", acpPayNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvSubNo", acvSubNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acpPayNo1", acpPayNo1, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@acvSubNo1", acvSubNo1, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmDNo", csmDNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayName", csmPayName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEmpNum", csmEmpNum))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayMemo", csmPayMemo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPaySubMemo", csmPaySubMemo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmPayCnt", csmPayCnt))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", 0, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmAmount - 0, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEMail", csmEMail))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankNo", csmBankNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankSubNo", csmBankSubNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankName", csmBankName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountNo", csmAccountNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountName", csmAccountName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountID", csmAccountID))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    '====================================================================================================

    Function get_cashPayName1(ByVal csmYear As Integer, ByVal csmMainNo As Integer) As System.Data.DataTable

        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT " & _
                                        "csmYear, " & _
                                        "csmMainNo, " & _
                                        "csmNo, " & _
                                        "csmBatchNo, " & _
                                        "csmAccNo, csmBankNo, " & _
                                        "csmDate, csmCount, " & _
                                        "csmAmount, csmFee, csmBillAmount, " & _
                                        "csmCheckNo, csmEpayVouNo, " & _
                                        "csmUser, csmDTime, csmResult, " & _
                                        "csmBillFlag, csmBillDate, " & _
                                        "csmInvalidFlag, csmInvalidDate, " & _
                                        "csmMarkUser, csmMarkDTime, " & _
                                        "csmPayNameKind, csmPayNameDesc " & _
                                    "FROM [cashPayName1] " & _
                                    "WHERE ([csmYear] = @csmYear) AND ([csmMainNo] = @csmMainNo)"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet.Tables(0)
    End Function

    Function get_cashPayNameList1(ByVal csmYear As Integer, ByVal csmMainNo As Integer) As System.Data.DataTable

        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT " & _
                                        "csmYear, csmMainNo, " & _
                                        "csmNo, csmDNo, " & _
                                        "acmYear, acmNo, acvNo, " & _
                                        "acmNo1, acvNo1, " & _
                                        "acmNo2, acvNo2, " & _
                                        "acpPayYear, acpPayNo, " & _
                                        "acvSubNo, acpPayNo1, acvSubNo1, " & _
                                        "payCode, csmPayName, " & _
                                        "csmEMail, csmEMailSendDate, " & _
                                        "(CASE ISNULL(csmEMailSendDate,'') WHEN '' THEN '0' ELSE '1' END) AS [sendFlag], " & _
                                        "csmBankNo, csmBankSubNo, csmBankName, " & _
                                        "csmAccountNo, csmAccountName, csmAccountID, " & _
                                        "csmEmpNum, " & _
                                        "csmPayMemo, csmPaySubMemo, " & _
                                        "csmPayCnt, csmAmount, csmFee, csmBillAmount, " & _
                                        "csmAccYear, csmAccMainNo, " & _
                                        "csmAccVouKind, csmAccPayeeOrderNo, " & _
                                        "csmPayKind, csmCheckNo " & _
                                    "FROM [cashPayNameList1] " & _
                                    "WHERE ([csmYear] = @csmYear) AND ([csmMainNo] = @csmMainNo)"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet.Tables(0)
    End Function

    Function add_cashPayName1( _
                ByVal csmYear As Integer, ByVal csmMainNo As Integer, _
                ByVal csmNo As Object, _
                ByVal csmBatchNo As String, _
                ByVal csmAccNo As String, ByVal csmBankNo As String, _
                ByVal csmCount As Object, _
                ByVal csmAmount As Object, ByVal csmFee As Object, _
                ByVal csmUser As String, ByVal csmDate As Object, ByVal csmDTime As Object, ByVal csmResult As String, _
                ByVal csmBillFlag As String, ByVal csmBillDate As Object, _
                ByVal csmInvalidFlag As String, ByVal csmInvalidDate As Object, _
                ByVal csmMarkUser As String, ByVal csmMarkDTime As Object, _
                ByVal csmPayNameKind As String, _
                ByVal csmPayNameDesc As String, _
                ByVal createDTime As Object, ByVal createUser As String, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "INSERT INTO [cashPayName1] (" & vbCrLf & _
                                                                    "[csmYear], [csmMainNo], [csmNo], [csmBatchNo], " & vbCrLf & _
                                                                    "[csmAccNo], [csmBankNo], [csmCount], " & vbCrLf & _
                                                                    "[csmAmount], [csmFee], [csmBillAmount], " & vbCrLf & _
                                                                    "[csmUser], [csmDate], [csmDTime], [csmResult], " & vbCrLf & _
                                                                    "[csmBillFlag], [csmBillDate], " & vbCrLf & _
                                                                    "[csmInvalidFlag], [csmInvalidDate], " & vbCrLf & _
                                                                    "[csmMarkUser], [csmMarkDTime], " & vbCrLf & _
                                                                    "[csmPayNameKind], [csmPayNameDesc], " & vbCrLf & _
                                                                    "[CreateDTime], [CreateUser]" & vbCrLf & _
                                                                ") VALUES (" & vbCrLf & _
                                                                    "@csmYear, @csmMainNo, @csmNo, @csmBatchNo, " & vbCrLf & _
                                                                    "@csmAccNo, @csmBankNo, @csmCount, " & vbCrLf & _
                                                                    "@csmAmount, @csmFee, @csmBillAmount, " & vbCrLf & _
                                                                    "@csmUser, @csmDate, @csmDTime, @csmResult, " & vbCrLf & _
                                                                    "@csmBillFlag, @csmBillDate, " & vbCrLf & _
                                                                    "@csmInvalidFlag, @csmInvalidDate, " & vbCrLf & _
                                                                    "@csmMarkUser, @csmMarkDTime, " & vbCrLf & _
                                                                    "@csmPayNameKind, @csmPayNameDesc, " & vbCrLf & _
                                                                    "@CreateDTime, @CreateUser" & vbCrLf & _
                                                                ")"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo, True))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBatchNo", csmBatchNo))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccNo", csmAccNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankNo", csmBankNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmCount", csmCount, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", csmFee, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmAmount - csmFee, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmUser", csmUser))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDate", csmDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDTime", csmDTime))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmResult", csmResult))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBillFlag", csmBillFlag))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmBillDate", IIf(csmBillFlag = "1", csmBillDate, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmInvalidFlag", csmInvalidFlag))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmInvalidDate", IIf(csmInvalidFlag = "1", csmInvalidDate, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmMarkUser", IIf(csmBillFlag = "1" Or csmInvalidFlag = "1", csmMarkUser, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmMarkDTime", IIf(csmBillFlag = "1" Or csmInvalidFlag = "1", csmMarkDTime, Nothing)))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameKind", csmPayNameKind))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameDesc", csmPayNameDesc))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@CreateDTime", createDTime))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@CreateUser", createUser))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    Function upd_cashPayName1(ByVal csmYear As Integer, ByVal csmMainNo As Integer, _
                            ByVal csmPayNameDesc As String, _
                            ByVal csmCount As Object, _
                            ByVal csmAmount As Object, ByVal csmFee As Object, _
                            ByVal csmBillFlag As String, ByVal csmBillDate As Object, _
                            ByVal csmInvalidFlag As String, ByVal csmInvalidDate As Object, _
                            ByVal csmMarkUser As String, ByVal csmMarkDTime As Object, _
                            ByVal modifyDTime As Object, ByVal modifyUser As String, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "UPDATE [cashPayName1] " & vbCrLf & _
                                    "SET [csmPayNameDesc]=@csmPayNameDesc, " & vbCrLf & _
                                        "[csmCount]=@csmCount, " & vbCrLf & _
                                        "[csmAmount]=@csmAmount, [csmFee]=@csmFee, [csmBillAmount]=@csmBillAmount, " & vbCrLf & _
                                        "[csmBillFlag]=@csmBillFlag, [csmBillDate]=@csmBillDate, " & vbCrLf & _
                                        "[csmInvalidFlag]=@csmInvalidFlag, [csmInvalidDate]=@csmInvalidDate, " & vbCrLf & _
                                        "[csmMarkDTime]=@csmMarkDTime, [csmMarkUser]=@csmMarkUser, " & vbCrLf & _
                                        "[ModifyDTime]=@ModifyDTime, [ModifyUser]=@ModifyUser " & vbCrLf & _
                                    "WHERE ([csmYear] = @csmYear) AND ([csmMainNo] = @csmMainNo)"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameDesc", csmPayNameDesc))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmCount", csmCount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", csmFee, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmAmount - csmFee, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBillFlag", csmBillFlag))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmBillDate", IIf(csmBillFlag = "1", csmBillDate, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmInvalidFlag", csmInvalidFlag))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmInvalidDate", IIf(csmInvalidFlag = "1", csmInvalidDate, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmMarkUser", IIf(csmBillFlag = "1" Or csmInvalidFlag = "1", csmMarkUser, Nothing)))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmMarkDTime", IIf(csmBillFlag = "1" Or csmInvalidFlag = "1", csmMarkDTime, Nothing)))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@ModifyDTime", modifyDTime))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@ModifyUser", modifyUser))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    Function add_cashPayNameList1( _
                ByVal csmYear As Integer, _
                ByVal csmMainNo As Integer, _
                ByVal csmDNo As Integer, _
                ByVal csmNo As Object, _
                ByVal payCode As String, _
                ByVal csmPayName As String, ByVal csmEmpNum As String, _
                ByVal csmPayMemo As String, ByVal csmPaySubMemo As String, _
                ByVal csmPayCnt As Object, _
                ByVal csmEMail As String, ByVal csmEMailSendDate As Object, _
                ByVal csmBankNo As String, ByVal csmBankSubNo As String, ByVal csmBankName As String, _
                ByVal csmAccountNo As String, ByVal csmAccountName As String, ByVal csmAccountID As String, _
                ByVal csmAmount As Object, ByVal csmFee As Object, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "INSERT INTO [cashPayNameList1] (" & vbCrLf & _
                                                                        "[csmYear], [csmMainNo], [csmDNo], [csmNo], " & vbCrLf & _
                                                                        "[payCode], [csmPayName], [csmEmpNum], " & vbCrLf & _
                                                                        "[csmPayMemo], [csmPaySubMemo], " & vbCrLf & _
                                                                        "[csmPayCnt], " & vbCrLf & _
                                                                        "[csmEMail], [csmEMailSendDate], " & vbCrLf & _
                                                                        "[csmBankNo], [csmBankSubNo], [csmBankName], " & vbCrLf & _
                                                                        "[csmAccountNo], [csmAccountName], [csmAccountID], " & vbCrLf & _
                                                                        "[csmAmount], [csmFee], [csmBillAmount]" & vbCrLf & _
                                                                    ") VALUES (" & vbCrLf & _
                                                                        "@csmYear, @csmMainNo, @csmDNo, @csmNo, " & vbCrLf & _
                                                                        "@payCode, @csmPayName, @csmEmpNum, " & vbCrLf & _
                                                                        "@csmPayMemo, @csmPaySubMemo, " & vbCrLf & _
                                                                        "@csmPayCnt, " & vbCrLf & _
                                                                        "@csmEMail, @csmEMailSendDate, " & vbCrLf & _
                                                                        "@csmBankNo, @csmBankSubNo, @csmBankName, " & vbCrLf & _
                                                                        "@csmAccountNo, @csmAccountName, @csmAccountID, " & vbCrLf & _
                                                                        "@csmAmount, @csmFee, @csmBillAmount" & vbCrLf & _
                                                                    ")"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmDNo", csmDNo, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo, True))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@payCode", payCode))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayName", csmPayName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEmpNum", csmEmpNum))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayMemo", csmPayMemo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPaySubMemo", csmPaySubMemo))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmPayCnt", csmPayCnt, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEMail", csmEMail))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmEMailSendDate", csmEMailSendDate))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankNo", csmBankNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankSubNo", csmBankSubNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankName", csmBankName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountNo", csmAccountNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountName", csmAccountName))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccountID", csmAccountID))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", csmFee, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmAmount - csmFee, False))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    '====================================================================================================

    Function add_cashMain(ByVal csmYear As Integer, ByVal csmNo As Integer, _
                            ByVal csmSDate As Object, ByVal csmEDate As Object, _
                            ByVal csmMemo As String, ByVal csmCnt As Object, ByVal csmMoney As Object, _
                            ByVal csmInFlag As String, ByVal csmInDate As Object, ByVal csmInMoney As Object, _
                            ByVal createDTime As Object, ByVal createUser As String, _
                            ByVal csmBatchNo As String, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "INSERT INTO [cashMain] " & vbCrLf & _
                                    "(" & vbCrLf & _
                                        "[csmYear], [csmNo], " & vbCrLf & _
                                        "[csmSDate], [csmEDate], " & vbCrLf & _
                                        "[csmMemo], [csmCnt], [csmMoney], " & vbCrLf & _
                                        "[csmInFlag], [csmInDate], [csmInMoney], " & vbCrLf & _
                                        "[CreateDTime], [CreateUser], " & vbCrLf & _
                                        "[csmBatchNo]" & vbCrLf & _
                                    ") VALUES " & vbCrLf & _
                                    "(" & vbCrLf & _
                                        "@csmYear, @csmNo, " & vbCrLf & _
                                        "@csmSDate, @csmEDate, " & vbCrLf & _
                                        "@csmMemo, @csmCnt, @csmMoney, " & vbCrLf & _
                                        "@csmInFlag, @csmInDate, @csmInMoney, " & vbCrLf & _
                                        "@CreateDTime, @CreateUser, " & vbCrLf & _
                                        "@csmBatchNo" & vbCrLf & _
                                    ")"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmSDate", csmSDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmEDate", csmEDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmMemo", csmMemo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmCnt", csmCnt, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmMoney", csmMoney, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmInFlag", csmInFlag))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmInDate", csmInDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmInMoney", csmInMoney))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@CreateDTime", createDTime))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@CreateUser", createUser))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBatchNo", csmBatchNo))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    Function add_cashPayName( _
                ByVal csmYear As Integer, _
                ByVal csmMainNo As Integer, _
                ByVal csmNo As Object, _
                ByVal csmBatchNo As String, _
                ByVal csmAccNo As String, _
                ByVal csmBankNo As String, _
                ByVal csmDate As Object, _
                ByVal csmCount As Object, _
                ByVal csmAmount As Object, _
                ByVal csmFee As Object, _
                ByVal csmBillAmount As Object, _
                ByVal csmCheckNo As String, _
                ByVal csmEpayVouNo As String, _
                ByVal csmUser As String, _
                ByVal csmDTime As Object, _
                ByVal csmResult As String, _
                ByVal csmBillFlag As String, _
                ByVal csmBillDate As Object, _
                ByVal csmInvalidFlag As String, _
                ByVal csmInvalidDate As Object, _
                ByVal csmMarkUser As String, _
                ByVal csmMarkDTime As Object, _
                ByVal csmPayNameKind As String, _
                ByVal csmPayNameDesc As String, _
            myConnection As System.Data.SqlClient.SqlConnection, myTransaction As System.Data.SqlClient.SqlTransaction) As Integer

        Dim dbConnection As System.Data.IDbConnection = myConnection

        Dim queryString As String = "INSERT INTO [cashPayName] " & vbCrLf & _
                                    "(" & vbCrLf & _
                                        "[csmYear], [csmMainNo], " & vbCrLf & _
                                        "[csmNo], [csmBatchNo], " & vbCrLf & _
                                        "[csmAccNo], [csmBankNo], [csmDate], [csmCount], " & vbCrLf & _
                                        "[csmAmount], [csmFee], [csmBillAmount], " & vbCrLf & _
                                        "[csmCheckNo], [csmEpayVouNo], " & vbCrLf & _
                                        "[csmUser], [csmDTime], " & vbCrLf & _
                                        "[csmResult], " & vbCrLf & _
                                        "[csmBillFlag], [csmBillDate], " & vbCrLf & _
                                        "[csmInvalidFlag], [csmInvalidDate], " & vbCrLf & _
                                        "[csmMarkUser], [csmMarkDTime], " & vbCrLf & _
                                        "[csmPayNameKind], [csmPayNameDesc]" & vbCrLf & _
                                    ") VALUES " & vbCrLf & _
                                    "(" & vbCrLf & _
                                        "@csmYear, @csmMainNo, " & vbCrLf & _
                                        "@csmNo, @csmBatchNo, " & vbCrLf & _
                                        "@csmAccNo, @csmBankNo, @csmDate, @csmCount, " & vbCrLf & _
                                        "@csmAmount, @csmFee, @csmBillAmount, " & vbCrLf & _
                                        "@csmCheckNo, @csmEpayVouNo, " & vbCrLf & _
                                        "@csmUser, @csmDTime, " & vbCrLf & _
                                        "@csmResult, " & vbCrLf & _
                                        "@csmBillFlag, @csmBillDate, " & vbCrLf & _
                                        "@csmInvalidFlag, @csmInvalidDate, " & vbCrLf & _
                                        "@csmMarkUser, @csmMarkDTime, " & vbCrLf & _
                                        "@csmPayNameKind, @csmPayNameDesc" & vbCrLf & _
                                    ")"

        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        dbCommand.Transaction = myTransaction

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmNo", csmNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBatchNo", csmBatchNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmAccNo", csmAccNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankNo", csmBankNo))    '撥還批號(C102001~999)
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDate", csmDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmCount", csmCount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", csmFee, False))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmBillAmount, False))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmCheckNo", csmCheckNo))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEpayVouNo", csmEpayVouNo))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmUser", csmUser))        '匯款人員
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDTime", csmDTime))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmResult", csmResult))    '處理結果

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBillFlag", csmBillFlag))        '入帳否
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmBillDate", csmBillDate))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmInvalidFlag", csmInvalidFlag))  '作廢否
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmInvalidDate", csmInvalidDate))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmMarkUser", csmMarkUser))
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmMarkDTime", csmMarkDTime))

        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameKind", csmPayNameKind))  '1:計程車/直接核銷 2:國內差旅/學分 3:自行輸入
        dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameDesc", csmPayNameDesc))

        Dim rowsAffected As Integer = 0
        rowsAffected = dbCommand.ExecuteNonQuery

        Return rowsAffected
    End Function

    '====================================================================================================

    Sub Initialize()
        text_MyKey.Text = ""

        text_csmYear.Text = ""
        text_csmYear.ToolTip = ""
        hid_csmMainNo.Value = ""
        text_csmNo.Text = ""
        text_csmBatchNo.Text = ""
        text_csmAccNo.Text = ""
        text_csmBankNo.Text = ""
        text_csmUser.Text = ""
        text_csmDate.Text = "/　/"
        text_csmCount.Text = ""
        text_csmAmount.Text = ""
        text_csmFee.Text = ""
        text_csmBillAmount.Text = ""
        hid_csmPayNameKind.Value = ""
        text_csmPayNameDesc.Text = ""
        chk_csmBillFlag.Checked = False
        text_csmBillDate.Text = "/　/"
        text_csmMarkUser.Text = ""
        chk_csmInvalidFlag.Checked = False
        text_csmInvalidDate.Text = "/　/"
        text_csmMarkDTime.Text = "/　/"

        dg_cashPayNameList.DataSource = Nothing
        dg_cashPayNameList.DataBind()
    End Sub

    
    Sub Page_Load(Sender As Object, E As EventArgs)
        'Session("default_Year") = 102
        'Session("default_UserNo") = "99999"
        'Session("default_UserName") = "王小明"
        'Session("login_UserNo") = "99999"
        'Session("login_UserName") = "王小明"

        If Session("default_Year") Is Nothing Then
            Response.Write("<script" & ">self.alert('操作逾時或主機更新，請重新登入系統。');window.close();</" & "script>")
            Exit Sub
        End If

        If Request.QueryString("MyKey") <> Nothing AndAlso Len(Request.QueryString("MyKey")) <> 0 Then
            text_MyKey.Text = Request.QueryString("MyKey")

            Enable_eMail(True)  'A21107
        Else
            '			Response.Write("<script" & ">self.alert('未提供程式足夠的運作參數');window.close();</" & "script>")
            '			Exit Sub
            '新增
            btn_new.Visible = False
            btn_delete.Visible = False
            '2014.03.10：Edit：新增時不要顯示郵件通知的按鈕
            btn_eMail.Visible = False
            Enable_eMail(False)
        End If

        If Not Page.IsPostBack Then

            If text_MyKey.Text <> "" Then

                Dim tmKeys() As String = Split(text_MyKey.Text, ",")
                If tmKeys.Length > 0 Then
                    text_csmYear.Text = tmKeys(0)
                    hid_csmMainNo.Value = tmKeys(1)
                End If

                Dim e_btn_ReadList As System.EventArgs
                btn_ReadList_Click(btn_ReadList, e_btn_ReadList)
            End If

            btn_delete.Attributes.Add("onclick", "return confirm('按一下[確定]，永遠刪除此筆資料。您無法復原這項變更。');")
        End If

    End Sub

    
    Sub Page_PreRender(Sender As Object, E As EventArgs)
        '2014.03.10：Fix：一進入頁面即新增模式
        If Not IsPostBack _
            AndAlso String.IsNullOrEmpty(Request.QueryString("MyKey")) Then
            btn_new_Click(Sender, New EventArgs())
        End If
    End Sub
    
    
    
    Sub btn_ReadList_Click(sender As Object, e As EventArgs)

        BindGrid(True)

        Panel1.Visible = False
    End Sub

    Sub BindGrid(Optional ByVal autoAdd As Boolean = False)

        '		Initialize()

        Dim tmKeys() As String = Split(text_MyKey.Text, ",")
        '		Dim tmKeys(2) As String

        Dim cashPayNameDT As DataTable
        If tmKeys.Length > 0 Then
            '		If Val(text_csmYear.Text) > 0 AndAlso Val(hid_csmMainNo.Value) > 0 Then
            '			tmKeys(0) = Val(text_csmYear.Text)
            '			tmKeys(1) = Val(hid_csmMainNo.Value)

            cashPayNameDT = get_cashPayName1(tmKeys(0), tmKeys(1))
        Else
            cashPayNameDT = get_cashPayName1(0, -1) '傳回空表
        End If

        If cashPayNameDT.Rows.Count > 0 Then

            text_csmYear.Text = cashPayNameDT.Rows(0)("csmYear")
            text_csmYear.ToolTip = cashPayNameDT.Rows(0)("csmMainNo")
            hid_csmMainNo.Value = cashPayNameDT.Rows(0)("csmMainNo") & ""
            text_csmNo.Text = cashPayNameDT.Rows(0)("csmNo") & ""
            text_csmBatchNo.Text = cashPayNameDT.Rows(0)("csmBatchNo") & ""
            text_csmAccNo.Text = cashPayNameDT.Rows(0)("csmAccNo") & ""
            text_csmBankNo.Text = cashPayNameDT.Rows(0)("csmBankNo") & ""
            text_csmUser.Text = cashPayNameDT.Rows(0)("csmUser") & ""
            text_csmDate.Text = ChtDateSplit(cashPayNameDT.Rows(0)("csmDate") & "", , "　/　/　")
            text_csmCount.Text = StrFun.atoi(cashPayNameDT.Rows(0)("csmCount"))
            text_csmAmount.Text = StrFun.atof(cashPayNameDT.Rows(0)("csmAmount"))
            text_csmFee.Text = StrFun.atof(cashPayNameDT.Rows(0)("csmFee"))
            text_csmBillAmount.Text = StrFun.atof(cashPayNameDT.Rows(0)("csmBillAmount"))
            hid_csmPayNameKind.Value = cashPayNameDT.Rows(0)("csmPayNameKind") & ""
            'A21014
            If hid_csmPayNameKind.Value = "3" Then
                btn_delete.Visible = True
            Else
                btn_delete.Visible = False
            End If

            text_csmPayNameDesc.Text = cashPayNameDT.Rows(0)("csmPayNameDesc") & ""
            chk_csmBillFlag.Checked = Str2Bool(cashPayNameDT.Rows(0)("csmBillFlag"))
            text_csmBillDate.Text = ChtDateSplit(cashPayNameDT.Rows(0)("csmBillDate") & "", , "　/　/　")
            text_csmMarkUser.Text = cashPayNameDT.Rows(0)("csmMarkUser") & ""
            chk_csmInvalidFlag.Checked = Str2Bool(cashPayNameDT.Rows(0)("csmInvalidFlag"))
            text_csmInvalidDate.Text = ChtDateSplit(cashPayNameDT.Rows(0)("csmInvalidDate") & "", , "　/　/　")
            text_csmMarkDTime.Text = ChtDateSplit(cashPayNameDT.Rows(0)("csmMarkDTime") & "", , "　/　/　")

            Dim cashPayNameListDT As DataTable = get_cashPayNameList1(tmKeys(0), tmKeys(1))
            If cashPayNameListDT.Rows.Count > 0 Then
                dg_cashPayNameList.DataSource = cashPayNameListDT
            Else
                If autoAdd = True Then
                    Dim e_btn_addRow As System.EventArgs
                    btn_addRow_Click(btn_addRow, e_btn_addRow)
                Else
                    dg_cashPayNameList.DataSource = Nothing
                End If
            End If

        Else
            '新增
            text_csmBatchNo.Text = "*"

            Dim e_btn_addRow As System.EventArgs
            btn_addRow_Click(btn_addRow, e_btn_addRow)
        End If

        dg_cashPayNameList.DataBind()


        'Enable_dg_cashPayNameList(False)
    End Sub


    Sub dg_cashPayNameList_ItemCreated(sender As Object, e As DataGridItemEventArgs)
        If e.Item.ItemType = ListItemType.Header Then
            '平均分配標題行字距
            Dim divStart As String = "<div class='title'>"
            Dim divEnd As String = "</div>"
            For i As Integer = 0 To e.Item.Cells.Count - 1
                Select Case i
                    Case 2, 11
                        '	e.Item.Cells(i).Text = "<div class='titlePadding'>" & e.Item.Cells(i).Text & divEnd
                    Case Else
                        'e.Item.Cells(i).Text = divStart.Replace("'title'", "'title' title='" & i & " - " & e.Item.Cells(i).Text & "'") & e.Item.Cells(i).Text & divEnd
                        '2014.03.10：Fix：和日曆的 CSS 有衝突，會套到日曆的 CSS，改掉其名稱
                        e.Item.Cells(i).Text = divStart.Replace("'title'", "'title2' title='" & i & " - " & e.Item.Cells(i).Text & "'") & e.Item.Cells(i).Text & divEnd
                End Select
                '				e.Item.Cells(i).Attributes("Style") = "BACKGROUND-COLOR: #EEEEEE;"
            Next i
            '			e.Item.Cells(e.Item.Cells.Count-1).Attributes("Style") = "BACKGROUND-COLOR: #EEEEEE;"	'最後一欄

        End If

    End Sub

    Sub dg_cashPayNameList_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            '自動裁切過長用途說明
            'Dim ellipsisStart As String = "<div style='text-overflow: ellipsis; overflow: hidden; width: 100px; cursor: help' onmouseover='this.title=this.innerText' onclick='try{document.all(" & Chr(34) & "text_acmMemo" & Chr(34) & ").value=this.innerText;}catch(e){;}'><nobr><u><font color='#FF8C00'>"
            'Dim ellipsisEnd As String = "</font></u></nobr></div>"
            'e.Item.Cells(2).Text = ellipsisStart & e.Item.Cells(2).Text & ellipsisEnd

            Dim chk_Email As CheckBox = e.Item.FindControl("chk_Email")
            Dim text_csmEMail As TextBox = e.Item.FindControl("text_csmEMail")
            If DataBinder.Eval(e.Item.DataItem, "csmEMail") & "" = "" Then
                chk_Email.Visible = False
            Else
                If IsDate(DataBinder.Eval(e.Item.DataItem, "csmEMailSendDate") & "") = True Then
                    chk_Email.Checked = False
                    'chk_Email.Enabled = False
                    chk_Email.ToolTip = "此項目已發送過"
                Else
                    chk_Email.Checked = True
                    chk_Email.Enabled = True
                    chk_Email.ToolTip = "發送通知至此信箱"
                End If
                chk_Email.Visible = True
            End If

            Try
                'Session("Enable_eMail") = btn_eMail.Visible
                If text_csmEMail.Text <> "" Then
                    chk_Email.Visible = Session("Enable_eMail")
                Else    'A21107
                    chk_Email.Visible = False
                End If
            Catch
            End Try

        End If
    End Sub

    '====================================================================================================

    Function get_csmBatchNoMAX(ByVal csmYear As Integer, Optional ByVal csmPayNameKind As String = "3", _
                                Optional ByVal FirstWord As String = "C", Optional ByVal StartNum As Integer = 0) As String
        Dim queStr As String = "SELECT " & _
                                    "ISNULL(MAX(csmBatchNo), @fWord + RIGHT('000' + CAST(@csmYear AS varchar), 3) + RIGHT('000' + CAST(@sNum AS varchar), 3) ) AS [csmBatchNoMAX] " & _
                                "FROM [cashPayName1] " & _
                                "WHERE (csmYear = @csmYear) " & _
                                    "AND (csmPayNameKind = @csmPayNameKind)"

        Dim _Connection As New System.Data.SqlClient.SqlConnection(connectionString)
        Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
        MyParams.Add(creatParameter(System.Data.DbType.Int16, "@csmYear", csmYear))
        MyParams.Add(creatParameter(System.Data.DbType.String, "@csmPayNameKind", csmPayNameKind))
        MyParams.Add(creatParameter(System.Data.DbType.String, "@fWord", FirstWord))
        MyParams.Add(creatParameter(System.Data.DbType.Int16, "@sNum", StartNum))

        Dim csmBatchNoMAX As String = ""
        Try
            csmBatchNoMAX = MsDbFun.GetDbVal(queStr, MyParams, _Connection) & ""
            If Len(csmBatchNoMAX) <> 7 Then
                Throw New Exception
            End If
        Catch
            csmBatchNoMAX = FirstWord & Right("000" & csmYear, 3) & Right("000" & StartNum, 3)
        End Try

        Return csmBatchNoMAX
    End Function

    Function get_csmBatchNoNEXT(ByVal csmYear As Integer, Optional ByVal csmPayNameKind As String = "3", _
                                Optional ByVal FirstWord As String = "C", Optional ByVal StartNum As Integer = 0) As String

        Dim csmBatchNoMAX As String = get_csmBatchNoMAX(csmYear, csmPayNameKind, FirstWord, StartNum)

        csmBatchNoMAX = Left(csmBatchNoMAX, 4) & "-" & Right(csmBatchNoMAX, 3)

        Dim csmBatchNoNEXT As String = Replace(get_nextAB(get_AnB(csmBatchNoMAX)), "-", "")

        Return csmBatchNoNEXT
    End Function

    '====================================================================================================

    Sub btn_new_Click(sender As Object, e As EventArgs)
        Initialize()

        text_csmYear.Text = Session("default_Year")
        text_csmBatchNo.Text = "*"  '存檔後用 get_csmBatchNoNEXT(Session("default_Year")) 取得最大號+1

        dg_cashPayNameList.DataSource = Nothing
        dg_cashPayNameList.DataBind()
        Dim e_btn_addRow As System.EventArgs
        btn_addRow_Click(btn_addRow, e_btn_addRow)


    End Sub

    Sub btn_addRow_Click(sender As Object, e As EventArgs)

        Dim DT As DataTable = get_cashPayNameList1(0, -1)    '取得空表
        Dim last_csmDNo As Integer = 0
        Dim csmPayMoneyTotal As Double = Val(text_csmAmountTotal.Text)

        Dim dr1 As System.Data.DataRow

        If dg_cashPayNameList.Items.Count > 0 Then
            '暫存表格內容
            Dim dgi As DataGridItem
            For i As Integer = 0 To dg_cashPayNameList.Items.Count - 1
                dgi = dg_cashPayNameList.Items(i)

                If CType(dgi.FindControl("CheckBox1"), CheckBox).Checked = False Then

                    dr1 = DT.NewRow()
                    dr1("payCode") = get_tccVAL(dgi.FindControl("hid_payCode"))
                    dr1("csmPayName") = Trim(get_tccVAL(dgi.FindControl("text_csmPayName")))
                    dr1("csmEmpNum") = Trim(get_tccVAL(dgi.FindControl("text_csmEmpNum")))
                    dr1("csmPayMemo") = Trim(get_tccVAL(dgi.FindControl("text_csmPayMemo")))
                    dr1("csmPaySubMemo") = Trim(get_tccVAL(dgi.FindControl("text_csmPaySubMemo")))
                    dr1("csmPayCnt") = StrFun.atoi(get_tccVAL(dgi.FindControl("text_csmPayCnt")))

                    dr1("csmAmount") = StrFun.atof(get_tccVAL(dgi.FindControl("text_csmAmount")))
                    dr1("csmFee") = StrFun.atof(get_tccVAL(dgi.FindControl("text_csmFee")))
                    dr1("csmBillAmount") = dr1("csmAmount") - dr1("csmFee")
                    If dr1("csmBillAmount") < 0 Then dr1("csmBillAmount") = 0

                    dr1("csmBankNo") = Trim(get_tccVAL(dgi.FindControl("text_csmBankNo")))
                    dr1("csmBankSubNo") = Trim(get_tccVAL(dgi.FindControl("text_csmBankSubNo")))
                    dr1("csmBankName") = Trim(get_tccVAL(dgi.FindControl("text_csmBankName")))
                    dr1("csmAccountNo") = Trim(get_tccVAL(dgi.FindControl("text_csmAccountNo")))
                    dr1("csmAccountName") = Trim(get_tccVAL(dgi.FindControl("text_csmAccountName")))
                    dr1("csmAccountID") = Trim(get_tccVAL(dgi.FindControl("text_csmAccountID")))

                    dr1("csmEMail") = Trim(get_tccVAL(dgi.FindControl("text_csmEMail")))
                    If IsDate(WebDateFun.StrToDate(get_tccVAL(dgi.FindControl("text_csmEMailSendDate")))) = True Then
                        dr1("csmEMailSendDate") = CDate(WebDateFun.StrToDate(get_tccVAL(dgi.FindControl("text_csmEMailSendDate"))))
                    End If

                    DT.Rows.Add(dr1)

                    'csmPayMoneyTotal = csmPayMoneyTotal - dr1("csmAmount")
                    last_csmDNo += 1
                End If
            Next i
        End If

        '加列
        dr1 = DT.NewRow()
        dr1("csmDNo") = last_csmDNo + 1
        dr1("csmAmount") = 0    'csmPayMoneyTotal
        'dr1("csmFee") = 0
        'dr1("csmBillAmount") = csmPayMoneyTotal - 0
        DT.Rows.Add(dr1)

        dg_cashPayNameList.DataSource = DT
        dg_cashPayNameList.DataBind()
    End Sub


    Sub btn_update_Click(sender As Object, e As EventArgs)

        '檢查有無未輸入
        If Trim(text_csmPayNameDesc.Text) = "" Then
            ToolsFun.WebMsgFun.Show("事由未填寫")
            Exit Sub
        End If


        Dim csmYear, csmMainNo As Integer
        csmYear = Val(text_csmYear.Text)
        Dim csmNo As Object = Nothing
        Dim csmBatchNo As String
        Dim csmAccNo, csmBankNo As String
        Dim csmCount, csmAmount, csmFee As Object
        csmCount = 0
        csmAmount = 0
        csmFee = 0
        Dim csmDate, csmDTime As Object
        Dim csmUser, csmResult As String

        Dim csmBillFlag, csmInvalidFlag, csmMarkUser, createUser, modifyUser As String
        csmBillFlag = Bool2Str(chk_csmBillFlag.Checked)
        csmInvalidFlag = Bool2Str(chk_csmInvalidFlag.Checked)
        csmMarkUser = Session("default_UserName")
        createUser = Session("login_UserName")
        modifyUser = Session("login_UserName")
        Dim csmBillDate, csmInvalidDate, csmMarkDTime, createDTime, modifyDTime As Object
        csmBillDate = EngDate(text_csmBillDate.Text)
        csmInvalidDate = EngDate(text_csmInvalidDate.Text)
        csmMarkDTime = Now()
        createDTime = Now()
        modifyDTime = Now()

        Dim csmPayNameKind As String = "3"
        Dim csmPayNameDesc As String = Trim(text_csmPayNameDesc.Text)

        If text_csmBatchNo.Text = "*" Then
            '新增
            csmMainNo = ToolsFun.MsDbFun.GetDbTableYearInc("cashPayName1", "csmYear", csmYear, "csmMainNo", 1)
            csmBatchNo = get_csmBatchNoNEXT(csmYear)
        Else
            '修改
            csmMainNo = Val(hid_csmMainNo.Value)
            csmBatchNo = text_csmBatchNo.Text
        End If

        Dim _Connection As New System.Data.SqlClient.SqlConnection(connectionString)
        Dim _Command As New System.Data.SqlClient.SqlCommand()

        Dim _Transact As System.Data.SqlClient.SqlTransaction

        Try
            _Connection.Open()
            _Transact = _Connection.BeginTransaction()

            _Command.Connection = _Connection
            _Command.Transaction = _Transact


            If text_csmBatchNo.Text = "*" Then
                '新增

                '主檔
                If add_cashPayName1( _
                        csmYear, csmMainNo, _
                        csmNo, _
                        csmBatchNo, _
                        csmAccNo, csmBankNo, _
                        csmCount, _
                        csmAmount, csmFee, _
                        csmUser, csmDate, csmDTime, csmResult, _
                        csmBillFlag, csmBillDate, _
                        csmInvalidFlag, csmInvalidDate, _
                        csmMarkUser, csmMarkDTime, _
                        csmPayNameKind, _
                        csmPayNameDesc, _
                        createDTime, createUser, _
                    _Connection, _Transact) < 0 Then

                    ToolsFun.WebMsgFun.Show("新增失敗：cashPayName1")
                    Exit Sub
                Else
                    '成功
                End If

            Else
                '修改
                '先刪除明細***
                Dim delStr As String = "DELETE FROM [cashPayNameList1] " & _
                                        "WHERE (csmYear = @csmYear) AND (csmMainNo = @csmMainNo)"
                Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
                MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
                MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))
                Try
                    MsDbFun.GetDbExec(delStr, MyParams, _Connection, _Transact)
                Catch
                    ToolsFun.WebMsgFun.Show("刪除失敗：cashPayNameList1")
                    Exit Sub
                End Try
            End If




            '明細
            Dim DtlNum As Integer = 0 'csmCount
            Dim Total_Amount As Double = 0
            Dim Total_Fee As Double = 0

            Dim payCode, csmPayName, csmPayMemo As String
            Dim csmEmpNum, csmPaySubMemo As String
            Dim csmPayCnt As Integer

            Dim csmEMail, csmEMailSendDate, csmBankSubNo, csmBankName, csmAccountNo, csmAccountName, csmAccountID As String

            Dim dgi As DataGridItem
            Dim csmDNo As Integer = 1
            For i As Integer = 0 To dg_cashPayNameList.Items.Count - 1
                dgi = dg_cashPayNameList.Items(i)

                If CType(dgi.FindControl("CheckBox1"), CheckBox).Checked = False _
                    And Trim(get_tccVAL(dgi.FindControl("text_csmPayName"))) <> "" Then ''_
                    '						And StrFun.atof(get_tccVAL(dgi.FindControl("text_csmAmount"))) > 0 Then

                    payCode = get_tccVAL(dgi.FindControl("hid_payCode"))
                    csmPayName = Trim(get_tccVAL(dgi.FindControl("text_csmPayName")))
                    csmEmpNum = Trim(get_tccVAL(dgi.FindControl("text_csmEmpNum")))
                    csmPayMemo = Trim(get_tccVAL(dgi.FindControl("text_csmPayMemo")))
                    csmPaySubMemo = Trim(get_tccVAL(dgi.FindControl("text_csmPaySubMemo")))

                    csmPayCnt = StrFun.atoi(get_tccVAL(dgi.FindControl("text_csmPayCnt")))
                    csmAmount = StrFun.atof(get_tccVAL(dgi.FindControl("text_csmAmount")))
                    csmFee = StrFun.atof(get_tccVAL(dgi.FindControl("text_csmFee")))

                    csmEMail = Trim(get_tccVAL(dgi.FindControl("text_csmEMail")))
                    csmEMailSendDate = EngDate(get_tccVAL(dgi.FindControl("text_csmEMailSendDate")))

                    csmBankNo = Trim(get_tccVAL(dgi.FindControl("text_csmBankNo")))
                    csmBankSubNo = Trim(get_tccVAL(dgi.FindControl("text_csmBankSubNo")))
                    csmBankName = Trim(get_tccVAL(dgi.FindControl("text_csmBankName")))
                    csmAccountNo = Trim(get_tccVAL(dgi.FindControl("text_csmAccountNo")))
                    csmAccountName = Trim(get_tccVAL(dgi.FindControl("text_csmAccountName")))
                    csmAccountID = Trim(get_tccVAL(dgi.FindControl("text_csmAccountID")))

                    If add_cashPayNameList1( _
                                csmYear, _
                                csmMainNo, _
                                csmDNo, _
                                csmNo, _
                                payCode, _
                                csmPayName, csmEmpNum, _
                                csmPayMemo, csmPaySubMemo, _
                                csmPayCnt, _
                                csmEMail, csmEMailSendDate, _
                                csmBankNo, csmBankSubNo, csmBankName, _
                                csmAccountNo, csmAccountName, csmAccountID, _
                                csmAmount, csmFee, _
                            _Connection, _Transact) < 0 Then

                        ToolsFun.WebMsgFun.Show("儲存失敗：cashPayNameList1")
                        Exit Sub
                    Else
                        csmDNo += 1

                        '統計筆數、總金額
                        DtlNum += 1
                        Total_Amount += csmAmount
                        Total_Fee += csmFee
                    End If

                End If

            Next i

            '主檔
            If upd_cashPayName1(csmYear, csmMainNo, _
                        csmPayNameDesc, _
                        DtlNum, _
                        Total_Amount, Total_Fee, _
                        csmBillFlag, csmBillDate, _
                        csmInvalidFlag, csmInvalidDate, _
                        csmMarkUser, csmMarkDTime, _
                        modifyDTime, modifyUser, _
                    _Connection, _Transact) < 0 Then

                ToolsFun.WebMsgFun.Show("更新失敗：cashPayName1")
                Exit Sub
            End If


            If DtlNum = 0 Then

                _Transact.Rollback()

                ToolsFun.WebMsgFun.Show("至少需有一筆正確的受款人資料")

                Exit Sub
            End If


            _Transact.Commit()

            Response.Write("<script" & ">alert('儲存更新成功');;</" & "script>")

            text_MyKey.Text = csmYear & "," & csmMainNo

            BindGrid(False)

        Catch ex As Exception
            If Not _Transact Is Nothing Then

                ToolsFun.WebMsgFun.Show("儲存失敗：" & ex.Message.Replace("\", "\\").Replace("""", "\""").Replace("'", "\'"))

                _Transact.Rollback()
            Else
                ToolsFun.WebMsgFun.Show("SQL Server 不存在或拒絕存取。")
            End If
        Finally
            _Connection.Close()
        End Try

    End Sub


    Function get_EmailDT(ByRef DG As DataGrid) As DataTable
        Dim csmYear, csmMainNo, csmDNo As Integer
        Dim csmDNos As String = ""

        Dim dgi As DataGridItem
        For i As Integer = 0 To DG.Items.Count - 1
            dgi = DG.Items(i)
            If CType(dgi.FindControl("chk_Email"), CheckBox).Checked = True Then
                csmYear = get_tccVAL(dgi.FindControl("hid_csmYear"))
                csmMainNo = get_tccVAL(dgi.FindControl("hid_csmMainNo"))
                csmDNo = get_tccVAL(dgi.FindControl("text_csmDNo"), True)
                csmDNos &= IIf(csmDNos = "", csmDNo, "," & csmDNo)
            End If
        Next i
        'Response.Write(csmYear & "<br>")
        'Response.Write(csmMainNo & "<br>")
        'Response.Write(csmDNos)

        Dim queryString As String = "" & _
                "SELECT " & _
                    "PNL.*, " & _
                    "PN.csmBillFlag, PN.csmBillDate, " & _
                    "PN.csmBatchNo, " & _
                    "(SELECT empName FROM basEmployee WHERE empNum=PNL.csmEmpNum) AS empName, " & _
                    "(CASE ISNULL(PNL.csmEMailSendDate,'') WHEN '' THEN '0' ELSE '1' END) AS sendFlag " & _
                "FROM [cashPayNameList1] PNL " & _
                    "INNER JOIN [cashPayName1] PN ON PNL.csmYear=PN.csmYear AND PNL.csmMainNo=PN.csmMainNo " & _
                "WHERE (PNL.csmYear=@csmYear) AND (PNL.csmMainNo=@csmMainNo) " & _
                    "AND (PNL.csmDNo IN ({csmDNos})) " & _
                "ORDER BY PNL.csmDNo"

        If Trim(csmDNos) <> "" Then
            queryString = queryString.Replace("{csmDNos}", csmDNos)
        Else    'A21009 無半筆勾選時
            queryString = queryString.Replace("(PNL.csmDNo IN ({csmDNos}))", "(1=2)")
        End If

        Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmYear", csmYear, False))
        MyParams.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))

        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim DT As System.Data.DataTable
        Try
            DT = MsDbFun.GetDbTable(queryString, MyParams, dbConnection)
        Catch ex As Exception
            ToolsFun.WebMsgFun.Show(ex.Message.Replace("\", "\\").Replace("""", "\""").Replace("'", "\'"))
        End Try

        Return DT
    End Function

    Sub btn_eMail_Click(sender As Object, e As EventArgs)
        Dim DT As DataTable = get_EmailDT(dg_cashPayNameList)

        'DataGrid2.DataSource = DT
        'DataGrid2.DataBind()

        If DT.Rows.Count > 0 Then
            '2014.02.19：Fix：寄送郵件
            Dim strMsg As String = DB.Cash.DAT.cashPayNameList1.EmailSendBill(DT, "1")
            If Not String.IsNullOrEmpty(strMsg) Then
                ToolsFun.WebMsgFun.Show(strMsg)
            Else
                ToolsFun.WebMsgFun.Show("郵件寄送成功！")
            End If
        Else
            ToolsFun.WebMsgFun.Show("未勾選任一筆紀錄以發送通知")
        End If
    End Sub

    Sub btn_delete_Click(sender As Object, e As EventArgs)
        If text_csmBatchNo.Text = "*" Then
            '新增
            ToolsFun.WebMsgFun.Show("此作業階段無法刪除")
            Exit Sub
        Else
            Dim csmYear, csmMainNo As Integer
            csmYear = Val(text_csmYear.Text)
            csmMainNo = Val(hid_csmMainNo.Value)

            Dim delStr As String = "" & _
                    "DELETE FROM [cashPayNameList1] WHERE (csmYear = @csmYear) AND (csmMainNo = @csmMainNo);" & _
                    "DELETE FROM [cashPayName1] WHERE (csmYear = @csmYear) AND (csmMainNo = @csmMainNo)"

            Dim MyParams As New ToolsFun.DbClass.ParameterCollection '參數集合
            MyParams.Add(creatParameter(System.Data.DbType.Int16, "@csmYear", csmYear, False))
            MyParams.Add(creatParameter(System.Data.DbType.Int16, "@csmMainNo", csmMainNo, False))
            Try
                MsDbFun.GetDbExec(delStr, MyParams)
            Catch
                ToolsFun.WebMsgFun.Show("刪除失敗：cashPayName1, cashPayNameList1")
                Exit Sub
            End Try
        End If

        ToolsFun.WebMsgFun.Show("刪除完畢")

        Initialize()
    End Sub


    Sub Enable_eMail(TF As Boolean)
        btn_eMail.Enabled = TF

        For i As Integer = 0 To dg_cashPayNameList.Items.Count - 1
            Dim chk_Email As CheckBox = dg_cashPayNameList.Items(i).FindControl("chk_Email")
            chk_Email.Visible = TF
        Next i

        Session("Enable_eMail") = TF
    End Sub

    Sub Enable_dg_cashPayNameList(TF As Boolean)
        For i As Integer = 0 To dg_cashPayNameList.Items.Count - 1
            For j As Integer = 1 To 16  '+-欄時須調整
                Select Case j
                    Case 18 '+-欄時須調整
                        '忽略[機關或私人團體]
                    Case Else
                        Dim Obj As String() = Split(dg_cashPayNameList.Items(i).Cells(j).Controls(1).ToString(), ".")
                        Select Case Obj(UBound(Obj))
                            Case "TextBox"
                                CType(dg_cashPayNameList.Items(i).Cells(j).Controls(1), TextBox).Enabled = TF
                            Case "DropDownList"
                                CType(dg_cashPayNameList.Items(i).Cells(j).Controls(1), DropDownList).Enabled = TF
                            Case "CheckBox"
                                CType(dg_cashPayNameList.Items(i).Cells(j).Controls(1), CheckBox).Enabled = TF
                        End Select
                End Select
            Next j
        Next i
        btn_addRow.Enabled = TF
    End Sub

    Sub Enable_cashPayName(TF As Boolean)
        text_MyKey.Enabled = TF
        text_csmYear.Enabled = TF
        text_csmNo.Enabled = TF
        text_csmBatchNo.Enabled = TF
        text_csmAccNo.Enabled = TF
        text_csmBankNo.Enabled = TF
        text_csmUser.Enabled = TF
        text_csmDate.Enabled = TF
        text_csmCount.Enabled = TF
        text_csmAmount.Enabled = TF
        text_csmFee.Enabled = TF
        text_csmBillAmount.Enabled = TF
        text_csmPayNameDesc.Enabled = TF
        chk_csmBillFlag.Enabled = TF
        text_csmBillDate.Enabled = IIf(chk_csmBillFlag.Enabled And chk_csmBillFlag.Checked, True, False)
        text_csmMarkUser.Enabled = TF
        chk_csmInvalidFlag.Enabled = TF
        text_csmInvalidDate.Enabled = IIf(chk_csmInvalidFlag.Enabled And chk_csmInvalidFlag.Checked, True, False)
        text_csmMarkDTime.Enabled = TF
    End Sub

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet"/>
<base target="_self" />
<style>
.applyBorder	{ background-color: transparent; border: 2px buttonhighlight inset }
.removeBorder	{ background-color: transparent; border: none; padding-left: 2px; padding-right: 3px }
/*.title		{ width: 100%; height: 100%; text-align: justify; text-justify: distribute-all-lines; padding-left: 2px; padding-right: 2px}*/
</style>

<script language="javascript" type="text/javascript">
<!--

//只允許輸入數字(48~57)、負號(-)、小數點(46)
function check_Num(){
    if((event.keyCode>=48 && event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
        return true;}
    else{event.keyCode=0;false;}
}

//if(a[i].type=="checkbox" && a[i].alt==alt)
function checkAll(alt)
{
    var a = document.getElementsByTagName("INPUT");
    var n = a.length;
    for (var i=0; i<n; i++)
        if(a[i].type=="checkbox" && a[i].alt==alt && a[i].disabled != true)
            a[i].checked = window.event.srcElement.checked;
}


//機關或私人團體(受款人)
function requestInfo_accName(thisID, replaceID){
    var url = "basPay_Edit.aspx?UnitNo=&mod=select&sID=" + thisID + "&rID=" + replaceID;

    //A20131 傳入受款人名稱
    var currentValue = document.getElementById(thisID).value;
        url += "&cVal=" + encodeURI(currentValue);

    var sw = 600	//screen.width * 0.6
    var infoStream;
    try{
        infoStream = showModalDialog(url + '&popup=0',window,"dialogWidth: "+ sw + "px ; dialogHeight: 350px; dialogTop: px; dialogLeft: 50px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;");

        set_accName(thisID, replaceID, infoStream);
    }
    catch(err){
        var digT = (screen.availHeight - 350)/2;
        var digL = (screen.width - sw)/2;
        infoStream = window.open(url + '&popup=1','accName','height=350,width='+ sw + ',top=' + digT + ',left=' + digL + ',resizable=yes,scrollbars=yes');
    }
}

function set_accName(thisID, replaceID, infoStream){
    var prvID = thisID.replace(replaceID,'');
    if(infoStream != "Cancel"){
        //資料傳回時：0:受款人代碼;1:統編/身分證;2:受款人名稱;3:聯絡電話１;4:郵遞區號;5:地址;6:銀行別代號;7:分行代號;8:帳號;9:金融機構名稱;10:戶名;11:電子郵件
        //            12:分類(1員工 2專戶 3債權人)
        //alert(infoStream);
        var infoArray = infoStream.split("||");

        //受款人代碼
        document.all(prvID + 'hid_payCode').value = infoArray[0];
        //document.all(prvID + 'hid_payCode').style.fontWeight = 'bold';
        //受款人
        document.all(prvID + 'text_csmPayName').value = infoArray[2];
        document.all(prvID + 'text_csmPayName').style.fontWeight = 'bold';
        //郵遞區號
        //document.all(prvID + 'text_AreaCode').value = infoArray[4];
        //document.all(prvID + 'text_AreaCode').style.fontWeight = 'bold';
        //地址
        //document.all(prvID + 'text_Address').value = infoArray[5];
        //document.all(prvID + 'text_Address').style.fontWeight = 'bold';
        //電話
        //document.all(prvID + 'text_Telephone').value = infoArray[3];
        //document.all(prvID + 'text_Telephone').style.fontWeight = 'bold';
        //金融機構代號
        document.all(prvID + 'text_csmBankNo').value = infoArray[6].replace(' ', '');
        //document.all(prvID + 'text_BankNo').style.fontWeight = 'bold';
        //分行
        document.all(prvID + 'text_csmBankSubNo').value = infoArray[7].replace(' ', '');
        //document.all(prvID + 'text_BankSubNo').style.fontWeight = 'bold';
        //金融機構名稱
        document.all(prvID + 'text_csmBankName').value = infoArray[9];
        //document.all(prvID + 'text_BankName').style.fontWeight = 'bold';
        //戶名
        document.all(prvID + 'text_csmAccountName').value = infoArray[10];
        //document.all(prvID + 'text_AccountName').style.fontWeight = 'bold';
        //帳號
        document.all(prvID + 'text_csmAccountNo').value = infoArray[8].replace(' ', '');
        //document.all(prvID + 'text_AccountNo').style.fontWeight = 'bold';
        //統一編號/身分證號
        document.all(prvID + 'text_csmAccountID').value = infoArray[1];
        //document.all(prvID + 'text_AccountID').style.fontWeight = 'bold';
        //電子郵件
        document.all(prvID + 'text_csmEMail').value = infoArray[11];
        //document.all(prvID + 'text_EMail').style.fontWeight = 'bold';
        //員工編號 A21029
        if(infoArray[12]=="1"){document.all(prvID + 'text_csmEmpNum').value = infoArray[0];};
    }
}

function AddToBill(thisID, defID){
    var pID = thisID.replace(defID, "");
    var csmAmount = 0;
    var csmFee = 0;
    var csmBillAmount = 0;
        csmAmount = Val( document.getElementById(pID + "text_csmAmount").value.replace(",","") );
        csmFee = Val( document.getElementById(pID + "text_csmFee").value.replace(",","") );
        csmBillAmount = csmAmount - csmFee;
    document.getElementById(pID + "text_csmBillAmount").value = csmBillAmount;
}


/* 月曆使用 */
function jRight(text, numb){
    var str = text;
    str = str.substring(str.length-numb, str.length);
    return str;
}

function Point(_x, _y){
    this.x = _x;
    this.y = _y;
}
function realPosition(_obj){
    var currPos = new Point(_obj.offsetLeft,_obj.offsetTop);
    var workPos = new Point(0,0);
    if (_obj.offsetParent.tagName.toUpperCase() != "BODY") {
        workPos = realPosition(_obj.offsetParent);
        currPos.x += workPos.x;
        currPos.y += workPos.y;
    }
    return currPos;
}
var ControlToAssign
function setControlAssigned(ctrl){
    ControlToAssign = ctrl;
}
function showCalendar(button,calendar){
    //calendar.clearSelectedDate();
    calendar.Show();
}
function onCalendar_Control_Change(calendar){
    var vDay = new Date(calendar.GetSelectedDate());
    ControlToAssign.value = (vDay.getFullYear()-1911) + '/' + jRight('0' + (vDay.getMonth()+1),2) + '/' + jRight('0' + vDay.getDate(), 2);
    ControlToAssign.fireEvent('onchange');
}

//-->
</script>
<script language="vbscript">
<!--

Function Val(thisValue)
    On Error Resume next
    Val = CDbl(thisValue)
    If Err.Number <> 0 then
        Val = 0
        Err.Clear
    End If
End Function

-->
</script>

</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="50">
    <form runat="server">
        <!-- Multi-Calendar Start -->
        <div id="oDiv" style="position: absolute; width: 1px; height: 1px; overflow:hidden"><asp:TextBox id="txt_oDiv" runat="server"></asp:TextBox></div>
        <COMPONENTART:CALENDAR id="Calendar1" runat="server" CultureId="1028" CalendarTitleCssClass="ctitle" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="images/cal_nextMonth.gif" PrevImageUrl="images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUp="Custom" ClientSideOnSelectionChanged="onCalendar_Control_Change" PopUpExpandControlId="txt_oDiv" ReactOnSameSelection="true"></COMPONENTART:CALENDAR>
        <!-- Multi-Calendar End -->
        <table cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 10" border="0">
            <tr>
                <td valign="top">
                <table cellpadding="0" style="border-collapse: collapse" border="1" bordercolor="#666668" bgcolor="#DADEE9">
                    <tr>
                        <td style="padding-top: 1px" onpropertychange="try{childNodes.width = this.clientWidth;}catch(e){;};">
    <!-- ↓區塊(1) -->
                        <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                            <tr>
                                <td style="padding: 0px">

                                <table cellpadding="3" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
                                    <tr>
                                        <td width="100" align="right">撥還年度</td>
                                        <td width="100"><asp:TextBox id="text_csmYear" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="50px" onfocus="this.blur()"></asp:TextBox><input type="hidden" id="hid_csmMainNo" runat="server" /></td>
                                        <td width="100" align="right">撥還編號</td>
                                        <td width="100"><asp:TextBox id="text_csmNo" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="50px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">撥還批號</td>
                                        <td width="100"><asp:TextBox id="text_csmBatchNo" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="right">事由</td>
                                        <td width="500" colspan="5"><input type="hidden" id="hid_csmPayNameKind" runat="server" /><asp:TextBox id="text_csmPayNameDesc" style="TEXT-ALIGN: left" runat="server" Width="100%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="right">應付金額</td>
                                        <td width="100"><asp:TextBox id="text_csmAmount" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">手續費</td>
                                        <td width="100"><asp:TextBox id="text_csmFee" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">入帳金額</td>
                                        <td width="100"><asp:TextBox id="text_csmBillAmount" style="TEXT-ALIGN: right; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td width="100" align="right">專戶編號</td>
                                        <td width="100"><asp:TextBox id="text_csmAccNo" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="50px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">匯款銀行</td>
                                        <td width="100"><asp:TextBox id="text_csmBankNo" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">　</td>
                                        <td width="100">　</td>
                                    </tr>
                                    <tr style="display: none">
                                        <td width="100" align="right">匯款人員</td>
                                        <td width="100"><asp:TextBox id="text_csmUser" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right"><font style="font-size: 10pt">匯款時間∕日期</font></td>
                                        <td width="100"><asp:TextBox id="text_csmDate" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">　</td>
                                        <td width="100">　</td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="right">筆數合計</td>
                                        <td width="100"><asp:TextBox id="text_csmCount" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="50px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">入帳否</td>
                                        <td width="100"><asp:CheckBox id="chk_csmBillFlag" runat="server"></asp:CheckBox></td>
                                        <td width="100" align="right">入帳時間</td>
                                        <td width="100"><asp:TextBox id="text_csmBillDate" style="TEXT-ALIGN: center" runat="server" Width="90px" onfocus="if(this.value=='　/　/　') this.value='';" onblur="if(this.value=='') this.value='　/　/　';" ondblclick="JavaScript: oDiv.style.left=realPosition(this).x; oDiv.style.top=realPosition(this).y; txt_oDiv.style.width=this.style.width; setControlAssigned(this); Calendar1.Show();">/　/</asp:TextBox></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td width="100" align="right">作廢否</td>
                                        <td width="100"><asp:CheckBox id="chk_csmInvalidFlag" runat="server"></asp:CheckBox></td>
                                        <td width="100" align="right">作廢時間</td>
                                        <td width="100"><asp:TextBox id="text_csmInvalidDate" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()">/　/</asp:TextBox></td>
                                        <td width="100" align="right">　</td>
                                        <td width="100">　</td>
                                    </tr>
                                </table>

                                </td>
                            </tr>
                        </table>
    <!-- 區塊(1)↑ -->
    <!-- ↓註記 -->
                        <table cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="1" bordercolor="#FFFFFF">
                            <tr>
                                <td style="padding: 0px">

                                <table cellpadding="3" cellspacing="0" style="TABLE-LAYOUT: fixed" border="0">
                                    <tr>
                                        <td width="100" align="right">　</td>
                                        <td width="100">　</td>
                                        <td width="100" align="right">註記人員</td>
                                        <td width="100"><asp:TextBox id="text_csmMarkUser" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()"></asp:TextBox></td>
                                        <td width="100" align="right">註記時間</td>
                                        <td width="100"><asp:TextBox id="text_csmMarkDTime" style="TEXT-ALIGN: center; background-color: #DADEE9" runat="server" Width="90px" onfocus="this.blur()">/　/</asp:TextBox></td>
                                    </tr>
                                </table>

                                </td>
                            </tr>
                        </table>
    <!-- 註記↑ -->
    <!-- Insert 區塊 here -->
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>

        <table border="1" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 10" bgcolor="#DADEE9" bordercolor="#666668">
            <tr>
                <td>
                <table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="#FFFFFF">
                    <asp:Panel id="Panel1" runat="server" Visible="True"><tr>
                        <td>
                        <table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed">
                            <tr>
                                <td width="400" cellpadding="4" nowrap><asp:TextBox id="text_MyKey" style="TEXT-ALIGN: left; background-color: #DADEE9" runat="server" Width="250px" onFocus="this.select()">102,7,102,44,1,0,0,0,0,102,2,1,0,0,980</asp:TextBox><asp:Button id="btn_ReadList" onclick="btn_ReadList_Click" runat="server" Text="讀取" Height="22px"></asp:Button></td>
                            </tr>
                        </table>
                        </td>
                    </tr></asp:Panel>
                    <tr>
                        <td>
                        <table border="0" cellpadding="5" cellspacing="0" style="DISPLAY: none; TABLE-LAYOUT: fixed">
                            <tr>
                                <td width="150" align="right">受款人</td>
                                <td width="450"><asp:TextBox id="text_csmAmountTotal" runat="server" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                        </table>

                        <table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: auto; margin-top: 5">
                            <tr>
                                <td width="700">
                                <div id="freezingDivG2">
                                <asp:DataGrid id="dg_cashPayNameList" runat="server" style="TABLE-LAYOUT: fixed" BorderStyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" AutoGenerateColumns="False" OnItemCreated="dg_cashPayNameList_ItemCreated" OnItemDataBound="dg_cashPayNameList_ItemDataBound">
                                    <HeaderStyle forecolor="White" backcolor="#003366" font-size="X-Small" horizontalalign="Center" wrap="False"></HeaderStyle>
                                    <ItemStyle backcolor="WhiteSmoke" font-size="X-Small" horizontalalign="Center"></ItemStyle>
                                    <AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
                                    <Columns>

                                        <asp:TemplateColumn HeaderText="序號">
                                            <HeaderStyle wrap="False" width="34px"></HeaderStyle>
                                            <ItemStyle backcolor="White"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmDNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" Width="35px" Text='<%# DataBinder.Eval(Container, "ItemIndex") + 1 %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmDNo") %>' class="removeBorder" onfocus="this.blur();" onblur="this.className='removeBorder'"></asp:TextBox>
                                                <input type="hidden" id="hid_csmYear" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>' />
                                                <input type="hidden" id="hid_csmMainNo" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.csmMainNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="員工編號">
                                            <HeaderStyle wrap="False" horizontalalign="Center" width="70px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmEmpNum" runat="server" width="100%" MaxLength="7" text='<%# DataBinder.Eval(Container, "DataItem.csmEmpNum") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<p style='margin-top: -8px'>受款人名稱<sup><font style='font-size: 7pt'>▼</font></sup>">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="150px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmPayName" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayName") %>' ondblclick='requestInfo_accName(this.id,"text_csmPayName");' ToolTip="雙擊可選取受款人"></asp:TextBox>
                                                <input type="hidden" id="hid_payCode" runat="server" name="hid_payCode" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.payCode") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="摘要">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="200px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmPayMemo" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayMemo") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="單據張數">
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmPayCnt" runat="server" width="100%" style="TEXT-ALIGN: center" MaxLength="3" text='<%# DataBinder.Eval(Container, "DataItem.csmPayCnt") %>' onkeypress="return check_Num()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="金額">
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="80px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmAmount" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmAmount", "{0:#,#0}") %>' onkeypress="return check_Num()" onblur="AddToBill(this.id, 'text_csmAmount');"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="手續費">
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmFee" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmFee", "{0:#,#0}") %>' onkeypress="return check_Num()" onblur="AddToBill(this.id, 'text_csmFee');"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="實付金額">
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmBillAmount" runat="server" width="100%" BackColor="Transparent" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmBillAmount", "{0:#,#0}") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="備註">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="1px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmPaySubMemo" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPaySubMemo") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="總行">
                                            <HeaderStyle wrap="False" width="40px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmBankNo" runat="server" style="TEXT-ALIGN: center;" Width="40px" MaxLength="3" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankNo") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="分行代號">
                                            <HeaderStyle wrap="False" width="60px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmBankSubNo" runat="server" style="TEXT-ALIGN: center;" Width="60px" MaxLength="20" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankSubNo") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="銀行名稱">
                                            <HeaderStyle wrap="False" width="0px"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmBankName" runat="server" style="TEXT-ALIGN: left;" Width="120px" MaxLength="82" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankName") %>' ondblclick='requestInfo_codBankSubName(this.id,"text_csmBankName");' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="銀行帳號">
                                            <HeaderStyle wrap="False" width="100px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmAccountNo" runat="server" style="TEXT-ALIGN: left;" Width="100px" MaxLength="20" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountNo") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="帳戶名稱">
                                            <HeaderStyle wrap="False" width="120px"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmAccountName" runat="server" style="TEXT-ALIGN: left;" Width="120px" MaxLength="160" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountName") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="身分證號">
                                            <HeaderStyle wrap="False" width="100px"></HeaderStyle>
                                            <ItemStyle backcolor="#F0FFFF"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmAccountID" runat="server" style="TEXT-ALIGN: left;" Width="100px" MaxLength="10" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountID") %>' onfocus="this.blur()"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="電子郵件">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="200px"></HeaderStyle>
                                            <ItemStyle wrap="False"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox id="chk_Email" runat="server" Font-Names="Verdana" Font-Size="8pt" myKey='<%# DataBinder.Eval(Container, "DataItem.csmDNo") %>' ToolTip="發送通知至此信箱"></asp:CheckBox>
                                                <asp:TextBox id="text_csmEMail" runat="server" width="100%" class="removeBorder" text='<%# DataBinder.Eval(Container, "DataItem.csmEMail") %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="電郵通知日期">
                                            <HeaderStyle wrap="False" width="70px"></HeaderStyle>
                                            <ItemStyle backcolor="#F8F8FF"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox id="text_csmEMailSendDate" runat="server" style="TEXT-ALIGN: center;" Width="70px" Text='<%# ChtDateSplit(DataBinder.Eval(Container, "DataItem.csmEMailSendDate") & "",, "　/　/　") %>' class="removeBorder"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="移除">
                                            <HeaderStyle wrap="False" horizontalalign="Center" forecolor="DarkOrange" width="35px"></HeaderStyle>
                                            <ItemStyle wrap="False" horizontalalign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox id="CheckBox1" runat="server" ToolTip="移除勾選的資料列" Enabled="True" ></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                                </div>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="3" cellspacing="0" Width="100%">
                            <tr>
                                <td>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td><asp:Button id="btn_addRow" runat="server" Width="75px" Height="22px" Text="增加列數" CausesValidation="False" onclick="btn_addRow_Click"></asp:Button></td>
                                    </tr>
                                </table>
                                </td>
                                <td align="right">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>　</td>
                                    </tr>
                                </table>
                                </td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>

        <table border="0" cellpadding="0" style="border-collapse: collapse; margin-left: 10; margin-top: 10" width="100%">
            <tr>
                <td><asp:Button id="btn_update" runat="server" Width="50px" Height="22px" Text="儲存" CausesValidation="False" onclick="btn_update_Click"></asp:Button>
                    <asp:Button id="btn_eMail" runat="server" Width="75px" Height="22px" Text="郵件通知" onclick="btn_eMail_Click"></asp:Button>
                    <asp:Button id="btn_new" runat="server" Width="50px" Height="22px" Text="新增" onclick="btn_new_Click" Visible="False"></asp:Button>
                    <asp:Button id="btn_delete" runat="server" Width="50px" Height="22px" Text="刪除" onclick="btn_delete_Click"></asp:Button>
                    </td>
                <td align="right">　</td>
            </tr>
        </table>

        <!-- Insert content here -->
        <asp:DataGrid id="DataGrid2" runat="server"></asp:DataGrid>
    </form>
<script language="javascript">
<!--
    window.cart_calendar_PostBackOnSameSelection = true; //COMPONENTART:CALENDAR
//-->
</script>
</body>
</html>
