<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sfwAtdBPMSettingAdd.aspx.cs" Inherits="sfwAtdBPMSettingAdd" %>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script language="javascript">
<!--

var infoStream = "";

function fnCallDialog(){
	showModalDialog("../Addon/psc_Employee.aspx?",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
}
function fnUpdate(){
	var infoArray = infoStream.split("^");
	try{
		document.getElementById('txt_EMPNUM').value = infoArray[0];
		document.getElementById('txt_EMPNAME').value = infoArray[1];
		document.getElementById('txt_EMPNO').value = infoArray[2];
		//document.getElementById('txtDepCode').value = infoArray[3];
	} catch(e){;}
}

//-->
</script>
<style>
.btn	{ border: 1px solid #D4D0C8; background-color: #EEEEEE; }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

		<table style="border-collapse: collapse; margin-top: 5" cellpadding="0" border="1" bordercolor="#D4D0C8" bgcolor="#FFFFFF">
			<tr>
				<td style="padding-left: 5px; padding-right: 5px" align="right" nowrap>現有流程</td>
				<td width="30" style="padding-right: -2px"><div style="width: 300px; OVERFLOW: hidden;"><asp:DropDownList id="ddl_absMemo" runat="server" style="margin-bottom:-1" Width="301" BackColor="Info" AutoPostBack="True"></asp:DropDownList></div></td>
			</tr>
		</table>

		<table style="border-collapse: collapse; margin-top: 5" cellpadding="0" border="1" bordercolor="#D4D0C8" bgcolor="#FFFFFF">
			<tr>
				<td style="padding-left: 5px; padding-right: 5px" align="right" nowrap>流程人員</td>
				<td width="65"><div style="width: 65px; height: auto; OVERFLOW: hidden;"><asp:TextBox id="txt_EMPNO" runat="server" style="margin-bottom:-2; margin-top:-1; TEXT-ALIGN: center;" Height="22px" Width="66px" BackColor="Info" onclick="fnCallDialog()"></asp:TextBox></div></td>
			</tr>
		</table>
		<table style="border-collapse: collapse; margin-top: 5" cellpadding="0" border="1" bordercolor="#D4D0C8" bgcolor="#FFFFFF">
			<tr>
				<td style="padding-left: 5px; padding-right: 5px" align="right" nowrap>員工編號</td>
				<td width="65"><div style="width: 65px; height: auto; OVERFLOW: hidden;"><asp:TextBox id="txt_EMPNUM" runat="server" style="margin-bottom:-2; margin-top:-1; TEXT-ALIGN: center;" Height="22px" Width="66px" BackColor="WhiteSmoke" onfocus="blur()"></asp:TextBox></div></td>
				<td style="padding-left: 5px; padding-right: 5px" align="right" nowrap>員工姓名</td>
				<td width="95"><div style="width: 95px; height: auto; OVERFLOW: hidden;"><asp:TextBox id="txt_EMPNAME" runat="server" style="margin-bottom:-2; margin-top:-1; TEXT-ALIGN: center;" Height="22px" Width="96px" BackColor="WhiteSmoke" onfocus="blur()"></asp:TextBox></div></td>
			</tr>
		</table>

		<table border="0" cellpadding="0" style="border-collapse: collapse; margin-top: 15; margin-bottom: 15">
			<tr>
				<td style="padding-right: 1px"><asp:Button id="BtnSaveEdit" runat="server" class="btn" Width="75px" Height="22px"  Text="儲存" onclick="BtnSaveEdit_Click"></asp:Button></td>
				<td style="padding-right: 1px"><asp:Button id="btnClose" runat="server" class="btn" Width="45px" Height="22px" Text="關閉" onclick="btnClose_Click"></asp:Button></td>
			</tr>
		</table>

    </div>
        <div style="display:none">
             <asp:TextBox ID="txt_EMPNO_OLD" runat="server"></asp:TextBox><!--員工系統號原始--->
             <asp:TextBox ID="txtMode" runat="server"></asp:TextBox>
             <asp:TextBox ID="txt_DPNO" runat="server" ></asp:TextBox> <!--流程序號--->
             <asp:TextBox ID="txt_Number" runat="server"></asp:TextBox><!--流水號--->
             <asp:TextBox ID="txt_DPName" runat="server" ></asp:TextBox><!--部門名稱--->
        </div>
    </form>
</body>
</html>
