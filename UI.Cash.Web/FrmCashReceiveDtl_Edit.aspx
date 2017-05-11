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
				ByVal csmYear As Integer,  _
			ByVal csmMainNo As Integer,  _
				ByVal csmNo As Integer,  _
				ByVal acmYear As Integer,  _
				ByVal acmNo As Integer,  _
				ByVal acvNo As Integer,  _
				ByVal acmNo1 As Integer,  _
				ByVal acvNo1 As Integer,  _
				ByVal acmNo2 As Integer,  _
				ByVal acvNo2 As Integer,  _
				ByVal acpPayYear As Integer,  _
				ByVal acpPayNo As Integer,  _
				ByVal acvSubNo As Integer,  _
				ByVal acpPayNo1 As Integer,  _
				ByVal acvSubNo1 As Integer,  _
				ByVal csmDNo As Integer,  _
				ByVal payCode As String,  _
				ByVal csmPayName As String,  _
				ByVal csmEmpNum As String,  _
				ByVal csmPayMemo As String,  _
				ByVal csmPaySubMemo As String,  _
				ByVal csmPayCnt As Integer,  _
				ByVal csmAmount As Decimal, _
				ByVal csmEMail As String,  _
				ByVal csmBankNo As String,  _
				ByVal csmBankSubNo As String,  _
				ByVal csmBankName As String,  _
				ByVal csmAccountNo As String,  _
				ByVal csmAccountName As String,  _
				ByVal csmAccountID As String,  _
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
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmMainNo", csmMainNo, False))	'A21003新增
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
				ByVal csmYear As Integer,  _
				ByVal csmMainNo As Integer,  _
				ByVal csmNo As Object,  _
				ByVal csmBatchNo As String,  _
				ByVal csmAccNo As String,  _
				ByVal csmBankNo As String,  _
				ByVal csmDate As Object,  _
				ByVal csmCount As Object,  _
				ByVal csmAmount As Object,  _
				ByVal csmFee As Object,  _
				ByVal csmBillAmount As Object,  _
				ByVal csmCheckNo As String,  _
				ByVal csmEpayVouNo As String,  _
				ByVal csmUser As String,  _
				ByVal csmDTime As Object,  _
				ByVal csmResult As String,  _
				ByVal csmBillFlag As String,  _
				ByVal csmBillDate As Object,  _
				ByVal csmInvalidFlag As String,  _
				ByVal csmInvalidDate As Object,  _
				ByVal csmMarkUser As String,  _
				ByVal csmMarkDTime As Object,  _
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
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBankNo", csmBankNo))	'撥還批號(C102001~999)
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDate", csmDate))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Int32, "@csmCount", csmCount, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmAmount", csmAmount, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmFee", csmFee, False))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.Currency, "@csmBillAmount", csmBillAmount, False))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmCheckNo", csmCheckNo))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmEpayVouNo", csmEpayVouNo))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmUser", csmUser))		'匯款人員
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmDTime", csmDTime))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmResult", csmResult))	'處理結果

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmBillFlag", csmBillFlag))		'入帳否
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmBillDate", csmBillDate))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmInvalidFlag", csmInvalidFlag))	'作廢否
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmInvalidDate", csmInvalidDate))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmMarkUser", csmMarkUser))
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.DateTime, "@csmMarkDTime", csmMarkDTime))

			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameKind", csmPayNameKind))	'1:計程車/直接核銷 2:國內差旅/學分 3:自行輸入
			dbCommand.Parameters.Add(creatParameter(System.Data.DbType.String, "@csmPayNameDesc", csmPayNameDesc))

		Dim rowsAffected As Integer = 0
			rowsAffected = dbCommand.ExecuteNonQuery

		Return rowsAffected
	End Function

'====================================================================================================

	Sub Initialize()

	End Sub

	Sub Page_Load(Sender As Object, E As EventArgs)
		If Session("default_Year") Is Nothing Then
			Response.Write("<script" & ">self.alert('操作逾時或主機更新，請重新登入系統。');window.close();</" & "script>")
			Exit Sub
		End If

		If Request.QueryString("MyKey") <> Nothing AndAlso Len(Request.QueryString("MyKey")) <> 0 Then
			text_MyKey.Text = Request.QueryString("MyKey")
		Else
'			Response.Write("<script" & ">self.alert('未提供程式足夠的運作參數');window.close();</" & "script>")
'			Exit Sub
		End If

		If Not Page.IsPostBack Then

			If text_MyKey.Text <> "" Then
				Dim e_btn_ReadList As System.EventArgs
				btn_ReadList_Click(btn_ReadList, e_btn_ReadList)
			End If
		End If

	End Sub

	Sub btn_ReadList_Click(sender As Object, e As EventArgs)

		BindGrid(True)

		Panel1.Visible = False
	End Sub

	Sub BindGrid(Optional ByVal autoAdd As Boolean = False)

		Dim tmKeys() As String = Split(text_MyKey.Text, ",")

		Dim DT As DataTable = get_cashPayNameList( _
				tmKeys(0), _
				tmKeys(1), _
				tmKeys(2), _
				tmKeys(3), _
				tmKeys(4), _
				tmKeys(5), _
				tmKeys(6), _
				tmKeys(7), _
				tmKeys(8), _
				tmKeys(9), _
				tmKeys(10), _
				tmKeys(11), _
				tmKeys(12), _
				tmKeys(13))

		text_csmAmountTotal.Text = Val(tmKeys(14))

		If DT.Rows.Count = 0 Then

			If autoAdd = True Then
				Dim e_btn_addRow As System.EventArgs
				btn_addRow_Click(btn_addRow, e_btn_addRow)
			Else
				DataGrid1.DataSource = Nothing
			End If
		Else
			DataGrid1.DataSource = DT
		End If

		DataGrid1.DataBind()
	End Sub

	Sub DataGrid1_ItemDataBound(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
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

		End If
	End Sub

	Sub btn_addRow_Click(sender As Object, e As EventArgs)

		Dim DT As DataTable = get_cashPayNameList(0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1)	'取得空表
		Dim last_csmDNo As Integer = 0
		Dim csmPayMoneyTotal As Double = Val(text_csmAmountTotal.Text)

		Dim dr1 As System.Data.DataRow

		If DataGrid1.Items.Count > 0 Then
			'暫存表格內容
			Dim dgi As DataGridItem
			For i As Integer = 0 To DataGrid1.Items.Count-1
				dgi = DataGrid1.Items(i)

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
					If IsDate( WebDateFun.StrToDate(get_tccVAL(dgi.FindControl("text_csmEMailSendDate"))) ) = True Then
						dr1("csmEMailSendDate") = CDate( WebDateFun.StrToDate(get_tccVAL(dgi.FindControl("text_csmEMailSendDate"))) )
					End If

					DT.Rows.Add(dr1)

					csmPayMoneyTotal = csmPayMoneyTotal - dr1("csmAmount")
					last_csmDNo += 1
				End If
			Next i
		End If

		'加列
		dr1 = DT.NewRow()
		dr1("csmDNo") = last_csmDNo + 1
		dr1("csmAmount") = IIf(csmPayMoneyTotal > 0, csmPayMoneyTotal, 0)
		DT.Rows.Add(dr1)

		DataGrid1.DataSource = DT
		DataGrid1.DataBind()
	End Sub

	Sub btn_update_Click(sender As Object, e As EventArgs)
		Dim tmKeys() As String = Split(text_MyKey.Text, ",")
		Dim csmPayMoneyTotal As Double = Val(tmKeys(14))
'?MyKey=102,23,102,1230,1,0,0,0,0,102,1,1,0,0,145,11
		Dim csmYear, csmNo, acmYear, acmNo, acvNo, acmNo1, acvNo1, acmNo2, acvNo2, acpPayYear, acpPayNo, acvSubNo, acpPayNo1, acvSubNo1, csmDNo, csmMainNo As Integer
			csmYear = Val(tmKeys(0))
			csmNo = Val(tmKeys(1))
			acmYear = Val(tmKeys(2))
			acmNo = Val(tmKeys(3))
			acvNo = Val(tmKeys(4))
			acmNo1 = Val(tmKeys(5))
			acvNo1 = Val(tmKeys(6))
			acmNo2 = Val(tmKeys(7))
			acvNo2 = Val(tmKeys(8))
			acpPayYear = Val(tmKeys(9))
			acpPayNo = Val(tmKeys(10))
			acvSubNo = Val(tmKeys(11))
			acpPayNo1 = Val(tmKeys(12))
			acvSubNo1 = Val(tmKeys(13))
			csmMainNo = Val(tmKeys(15))	'A21003新增

			Dim _Connection As New System.Data.SqlClient.SqlConnection(ConnectionString)
			Dim _Command As New System.Data.SqlClient.SqlCommand()

			Dim _Transact As System.Data.SqlClient.SqlTransaction

			Try
				_Connection.Open()
				_Transact = _Connection.BeginTransaction()

				_Command.Connection = _Connection
				_Command.Transaction = _Transact


				'先刪除明細***
				Dim delStr As String = "DELETE FROM [cashPayNameList] " & _
										"WHERE (csmYear = @csmYear) " & _
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
											"AND (acvSubNo1 = @acvSubNo1)"

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


					Try
						MsDbFun.GetDbExec(delStr, MyParams, _Connection, _Transact)
					Catch
						ToolsFun.WebMsgFun.Show("刪除失敗：cashPayNameList")
						Exit Sub
					End Try

				'儲存表格內容
				Dim DtlNum As Integer = 0
				Dim DtlTotal As Integer = 0

				Dim payCode, csmPayName, csmPayMemo As String
				Dim csmEmpNum, csmPaySubMemo As String
				Dim csmPayCnt As Integer
				Dim csmPayMoney As Double

				Dim csmEMail, csmBankNo, csmBankSubNo, csmBankName, csmAccountNo, csmAccountName, csmAccountID As String

				Dim dgi As DataGridItem
				'csmDNo = 1
				'A21003
				Dim queryString As String = "SELECT MAX(csmDNo) FROM [cashPayNameList] WHERE (csmYear=@csmYear) AND (csmMainNo=@csmMainNo)"
					queryString = queryString.Replace("@csmYear",csmYear).Replace("@csmMainNo",csmMainNo)
'Response.Write(queryString)
				csmDNo = StrFun.atoi(MsDbFun.GetDbVal(queryString, Nothing, _Connection, _Transact)) + 1

				For i As Integer = 0 To DataGrid1.Items.Count-1
					dgi = DataGrid1.Items(i)

					If CType(dgi.FindControl("CheckBox1"), CheckBox).Checked = False _
						And Trim(get_tccVAL(dgi.FindControl("text_csmPayName"))) <> "" _
						And StrFun.atof(get_tccVAL(dgi.FindControl("text_csmAmount"))) > 0 Then

						payCode = get_tccVAL(dgi.FindControl("hid_payCode"))
						csmPayName = Trim(get_tccVAL(dgi.FindControl("text_csmPayName")))
						csmEmpNum = Trim(get_tccVAL(dgi.FindControl("text_csmEmpNum")))
						csmPayMemo = Trim(get_tccVAL(dgi.FindControl("text_csmPayMemo")))
						csmPaySubMemo = Trim(get_tccVAL(dgi.FindControl("text_csmPaySubMemo")))
						csmPayCnt = StrFun.atoi(get_tccVAL(dgi.FindControl("text_csmPayCnt")))
						csmPayMoney = StrFun.atof(get_tccVAL(dgi.FindControl("text_csmAmount")))

						csmEMail = Trim(get_tccVAL(dgi.FindControl("text_csmEMail")))
						csmBankNo = Trim(get_tccVAL(dgi.FindControl("text_csmBankNo")))
						csmBankSubNo = Trim(get_tccVAL(dgi.FindControl("text_csmBankSubNo")))
						csmBankName = Trim(get_tccVAL(dgi.FindControl("text_csmBankName")))
						csmAccountNo = Trim(get_tccVAL(dgi.FindControl("text_csmAccountNo")))
						csmAccountName = Trim(get_tccVAL(dgi.FindControl("text_csmAccountName")))
						csmAccountID = Trim(get_tccVAL(dgi.FindControl("text_csmAccountID")))


							If add_cashPayNameList( _
										csmYear, csmMainNo, csmNo, _
										acmYear, acmNo, _
										acvNo, acmNo1, acvNo1, acmNo2, acvNo2, _
										acpPayYear, acpPayNo, _
										acvSubNo, _
										acpPayNo1, acvSubNo1, _
										csmDNo, _
										payCode, _
										csmPayName, csmEmpNum, _
										csmPayMemo, csmPaySubMemo, _
										csmPayCnt, _
										csmPayMoney, _
										csmEMail, csmBankNo, csmBankSubNo, csmBankName, _
										csmAccountNo, csmAccountName, csmAccountID, _
										_Connection,  _Transact) < 0 Then

								ToolsFun.WebMsgFun.Show("儲存失敗：cashPayNameList")
								Exit Sub
							Else
								csmDNo += 1

								'統計筆數、總金額
								DtlNum += 1
								DtlTotal += csmPayMoney
							End If

					End If

				Next i




				If DtlNum = 0 Then

					_Transact.Rollback()

					ToolsFun.WebMsgFun.Show("至少需有一筆正確的受款人資料")

					Exit Sub

				Else If DtlTotal <> csmPayMoneyTotal Then

					_Transact.Rollback()

					ToolsFun.WebMsgFun.Show("明細金額($" & Format(DtlTotal, "#,#0") & ")與動支金額($" & Format(csmPayMoneyTotal,"#,#0") & ")不符，請返回修正。")

					Exit Sub
				Else

					_Transact.Commit()

					'Response.Write("<script" & ">alert('儲存更新成功'); returnValue='ok'; window.close();</" & "script>")
					Response.Write("<script" & ">alert('儲存更新成功');;</" & "script>")
				End If

				BindGrid()

				'text_DtlTotal.Text = Format(DtlTotal, "#,#0")
				'text_DtlCount.Text = DtlNum

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
		For i As Integer = 0 To DG.Items.Count-1
			dgi = DG.Items(i)
			If CType(dgi.FindControl("chk_Email"), CheckBox).Checked = True Then
				csmYear = get_tccVAL(dgi.FindControl("hid_csmYear"))
				csmMainNo = get_tccVAL(dgi.FindControl("hid_csmMainNo"))
				csmDNo = get_tccVAL(dgi.FindControl("text_csmDNo"),True)
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
				"FROM [cashPayNameList] PNL " & _
					"INNER JOIN [cashPayName] PN ON PNL.csmYear=PN.csmYear AND PNL.csmMainNo=PN.csmMainNo " & _
				"WHERE (PNL.csmYear=@csmYear) AND (PNL.csmMainNo=@csmMainNo) " & _
					"AND (PNL.csmDNo IN ({csmDNos})) " & _
				"ORDER BY PNL.csmDNo"

		queryString = queryString.Replace("{csmDNos}", csmDNos)

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
		Dim DT As DataTable = get_EmailDT(DataGrid1)

		DataGrid2.DataSource = DT
		DataGrid2.DataBind()

		'strMsg = EmailSendBill(DT, "1")
	End Sub

</script>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<base target="_self" />
<style>
.applyBorder	{ background-color: transparent; border: 2px buttonhighlight inset }
.removeBorder	{ background-color: transparent; border: none; padding-left: 2px; padding-right: 3px }
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
		//員工編號 A21014
		if(infoArray[12]=="1"){document.all(prvID + 'text_csmEmpNum').value = infoArray[0];};
	}
}

//-->
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="50">
	<form runat="server">

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
								<td width="600">
								<div id="freezingDivG2">
								<asp:DataGrid id="DataGrid1" runat="server" style="TABLE-LAYOUT: fixed" BorderStyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" AutoGenerateColumns="False" OnItemDataBound="DataGrid1_ItemDataBound">
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
											<HeaderStyle wrap="False" horizontalalign="Center" width="75px"></HeaderStyle>
											<ItemTemplate>
												<asp:TextBox id="text_csmEmpNum" runat="server" width="100%" MaxLength="7" text='<%# DataBinder.Eval(Container, "DataItem.csmEmpNum") %>'></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="<p style='margin-top: -8px'>受款人名稱<sup><font style='font-size: 7pt'>▼</font></sup>">
											<HeaderStyle wrap="False" horizontalalign="Left" width="150px"></HeaderStyle>
											<ItemTemplate>
												<input type="hidden" id="hid_payCode" runat="server" name="hid_payCode" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.payCode") %>' />
												<asp:TextBox id="text_csmPayName" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayName") %>' ondblclick='requestInfo_accName(this.id,"text_csmPayName");' ToolTip="雙擊可選取受款人"></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="摘要">
											<HeaderStyle wrap="False" horizontalalign="Left" width="200px"></HeaderStyle>
											<ItemTemplate>
												<asp:TextBox id="text_csmPayMemo" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayMemo") %>'></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="單據張數">
											 <HeaderStyle wrap="False" horizontalalign="Center" width="60px"></HeaderStyle>
											<ItemStyle horizontalalign="Center"></ItemStyle>
											<ItemTemplate>
												<asp:TextBox id="text_csmPayCnt" runat="server" width="100%" style="TEXT-ALIGN: center" MaxLength="3" text='<%# DataBinder.Eval(Container, "DataItem.csmPayCnt") %>' onkeypress="return check_Num()"></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="金額">
											 <HeaderStyle wrap="False" horizontalalign="Center" width="80px"></HeaderStyle>
											<ItemStyle horizontalalign="Right"></ItemStyle>
											<ItemTemplate>
												<asp:TextBox id="text_csmAmount" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmAmount", "{0:#,#0}") %>' onkeypress="return check_Num()"></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="手續費">
											 <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
											<ItemStyle horizontalalign="Right"></ItemStyle>
											<ItemTemplate>
												<asp:TextBox id="text_csmFee" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmFee", "{0:#,#0}") %>' onkeypress="return check_Num()"></asp:TextBox>
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
										<asp:TemplateColumn HeaderText="銀行名稱</sup>">
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
											<HeaderStyle wrap="False" horizontalalign="Left" width="1px"></HeaderStyle>
											<ItemStyle wrap="False"></ItemStyle>
											<ItemTemplate>
												<asp:CheckBox id="chk_Email" runat="server" Font-Names="Verdana" Font-Size="8pt" myKey='<%# DataBinder.Eval(Container, "DataItem.csmDNo") %>' ToolTip="發送通知至此信箱"></asp:CheckBox>
												<asp:TextBox id="text_csmEMail" runat="server" width="100%" class="removeBorder" text='<%# DataBinder.Eval(Container, "DataItem.csmEMail") %>' ></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="電郵通知日期">
											<HeaderStyle wrap="False" width="1px"></HeaderStyle>
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
					<asp:Button id="Button1" runat="server" Width="75px" Height="22px" Text="郵件通知" onclick="btn_eMail_Click" Visible="False"></asp:Button></td>
				<td align="right">　</td>
			</tr>
		</table>

		<!-- Insert content here -->
		<asp:DataGrid id="DataGrid2" runat="server"></asp:DataGrid>
	</form>
</body>
</html>
