<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrint03.aspx.cs" Inherits="UI.HPAReport.Web.FrmPrint03" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control:max-age=0"  content="no-cache" />
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
     <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/MyLibraryJs/MyLibraryJs.min.js")%>" type="text/javascript"></script>
    <%-- ↓↓其他 plugin↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.cookie/jquery.cookie.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.blockUI/jquery.blockUI.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑其他 plugin↑↑ --%>    
    <%-- ↓↓jquery.MyKendo 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoAll.min.js")%>" type="text/javascript"></script>
    <%--<script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoAutoComplete.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoComboBox.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoDatePicker.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoDateTimePicker.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoMultiSelect.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoNumericTextBox.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoTimePicker.js")%>" type="text/javascript"></script>--%><%-- ↑↑jquery.MyKendo 所需檔案↑↑ --%><%-- ↓↓KendoUI(民國) 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web-chinese.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/cultures/kendo.culture.zh-TW-chinese.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver-themebuilder.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI(民國) 所需檔案↑↑ --%>

    
		<script language="javascript" type="text/javascript">

		    $(function () {
		        //2013.12.02：Add：查詢資料時，先出現資料處理中的訊息
		        $("#BtnPrint").click(function () {
		            MyLibraryJs.JqPluginExt.fnBlockUIForDownload($("[id$='hdfDownloadToken']"), "hdfDownloadToken", "資料產生中...");
		        });


		    });

		    $(function () {
		        $.MyKendoMultiSelect({ placeholder: "......" });
		    });




		    function UCBDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBBDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }
		    function UCEDate_Change(calendar) {
		        var vDay = new Date(calendar.GetSelectedDate());
		        document.getElementById("TBEDate").value = (vDay.getFullYear() - 1911) + '/' + (vDay.getMonth() + 1) + '/' + vDay.getDate();
		    }
		    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
       	<table style="table-layout: fixed;margin-top: 10px; margin-left: 10px; border-collapse: collapse; padding:5px; width:600px; border:1"
				borderColor="#666668" cellPadding="5" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="border-collapse: collapse" borderColor="#ffffff" cellPadding="1" width="100%" 	border="1">
							<tr>
								<td>
                                    <table>
                                            <tr>
                                                <td style="text-align:right; width:100px">預借日期：</td>
                                                <td>至<asp:TextBox ID="TBEDate" runat="server" Width="120px" style="text-align:center" ondblclick="JavaScript: UCEDate.Show();"></asp:TextBox>
												<asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; width:100px">經費單位：</td>
                                                <td><asp:dropdownlist id="DDLBgtDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; width:100px">動支編號：</td>
                                                <td>
                                                    <asp:TextBox ID="TBAcmWordNum" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right">計畫科目：</td>
                                                <td><asp:ListBox ID="DDLPlan" runat="server" Width="430px" AutoPostBack="True" MyKendoMultiSelect="MyKendoMultiSelect" SelectionMode="Multiple"></asp:ListBox></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right">用途別：</td>
                                                <td><asp:dropdownlist id="DDLOul" runat="server" Width="430px"></asp:dropdownlist></td>
                                            </tr>
                                    </table>

								</td>
							</tr>							
							<tr>
							    <td style="text-align:left"><input id="hdfDownloadToken" type="hidden" runat="server" />
							        <asp:button id="BtnPrint" runat="server" Width="75px" Text="列印" Height="22px" OnClick="BtnPrint_Click" ></asp:button>
							   </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
             	<COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>

    </div>
    </form>
</body>
</html>
