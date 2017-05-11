<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="FrmPrint01.aspx.cs" Inherits="UI.HPAReport.Web.FrmPrint01" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control:max-age=0"  content="no-cache" />
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
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoTimePicker.js")%>" type="text/javascript"></script>--%>
    <%-- ↑↑jquery.MyKendo 所需檔案↑↑ --%>
    <%-- ↓↓KendoUI(民國) 所需檔案↓↓ --%>
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

		    function ChangeOpt(Opt1, Opt2) {
		        var Tmp_value = Opt1.value;
		        var Tmp_text = Opt1.text;
		        var Tmp_selected = Opt1.selected;
		        Opt1.value = Opt2.value;
		        Opt1.text = Opt2.text;
		        Opt1.selected = Opt2.selected;
		        Opt2.value = Tmp_value;
		        Opt2.text = Tmp_text;
		        Opt2.selected = Tmp_selected;
		    }
		    function putUp(setObj) {
		        var ChgCnt = 0;
		        for (var i = 0; i < setObj.options.length; i++)
		            if (setObj.options[i].selected && i > 0) {
		                ChangeOpt(setObj.options[i], setObj.options[i - 1]);
		                ChgCnt++;
		            }
		        return ChgCnt;
		    }
		    function putDn(setObj) {
		        var ChgCnt = 0;
		        for (var i = setObj.options.length - 1; i >= 0; i--)
		            if (setObj.options[i].selected && i < setObj.options.length - 1) {
		                ChangeOpt(setObj.options[i], setObj.options[i + 1]);
		                ChgCnt++;
		            }
		        return ChgCnt;
		    }
		    function putUpEnd(setObj) {
		        var ChgCnt = 0;
		        var Cnt;
		        if (setObj.options.length > 0)
		            while (!setObj.options[0].selected)
		                if ((Cnt = putUp(setObj)) <= 0) break;
		                else ChgCnt += Cnt;
		        return ChgCnt;
		    }
		    function putDnEnd(setObj) {
		        var ChgCnt = 0;
		        var Cnt;
		        if (setObj.options.length > 0)
		            while (!setObj.options[setObj.options.length - 1].selected)
		                if ((Cnt = putDn(setObj)) <= 0) break;
		                else ChgCnt += Cnt;
		        return ChgCnt;
		    }
		    function moveOpt(setObj, setObjDest, AllFlag) {
		        var MovCnt = 0;
		        var MovFirstIdx = -1;
		        for (var i = 0; i < setObj.options.length; i++)
		            if (setObj.options[i].selected || AllFlag) {
		                if (MovFirstIdx == -1) {
		                    for (var j = 0; j < setObjDest.options.length; j++)
		                        setObjDest.options[j].selected = false;
		                    MovFirstIdx = i;
		                }
		                setObjDest.options.add(new Option(setObj.options[i].text, setObj.options[i].value));
		                setObjDest.options[setObjDest.options.length - 1].selected = setObj.options[i].selected;
		                setObj.options.remove(i);
		                MovCnt++;
		                i--;
		            }
		        if (!AllFlag) {
		            if (MovFirstIdx < 0) MovFirstIdx = 0;
		            if (MovFirstIdx >= setObj.options.length) MovFirstIdx = setObj.options.length - 1;
		            if (MovFirstIdx >= 0) setObj.options[MovFirstIdx].selected = true;
		        }
		        return MovCnt;
		    }
		    function getSeleOptVal(setObj, AllFlag, Spc) {
		        var OptVal = "";
		        for (var i = 0; i < setObj.options.length; i++)
		            if (setObj.options[i].selected || AllFlag) {
		                if (Spc && OptVal != "") OptVal += Spc + setObj.options[i].value;
		                else OptVal += setObj.options[i].value;
		            }

		        return OptVal;
		    }

		</script>
    <style type="text/css">
        #Text1 {
            width: 46px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style=" table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; border-color:#666668; background-color:#dadee9; padding:5px; width:830px;" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="5" width="100%" border="0">
										<tr>
											<td class="TDTitle100">日期區間</td>
											<td colspan="2"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox>
                                                至<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox>
												<br />
												<asp:label id="Label2" runat="server">(日期範例:095/09/28)</asp:label></td>
											<td><asp:checkbox id="CBMonthly" runat="server" Visible="False" Text="月結"></asp:checkbox></td>
											<td><input id="TBGroupFiled" type="hidden" runat="server" /></td>
										</tr>
										<tr>
											<td class="TDTitle100"><font face="新細明體"><asp:label id="Label1" runat="server" Width="72px" Visible="False">帳別名稱</asp:label></font></TD>
											<td width="150"><asp:dropdownlist id="DDLTeamName" runat="server" Visible="False" width="144px"></asp:dropdownlist></TD>
											<td class="TDTitle100"><asp:label id="LBYear" runat="server" Width="72px">年 度</asp:label></td>
											<td style="WIDTH: 150px" align="left"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
											<td rowspan="7">
												<table id="TABLE1" style="BORDER-COLLAPSE: collapse" borderColor="#ccff99" height="100%"
													cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
													<tr>
														<td></td>
														<td vAlign="middle" align="center"><font size="2">已選項目</font></td>
														<td></td>
														<td vAlign="middle" align="center"><font size="2">待選項目</font></td>
													</tr>
													<tr>
														<td><input title="置頂" onclick="if (putUpEnd(document.all.ListBox1) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="╤" /><br />
															<input title="上移" onclick="if (putUp(document.all.ListBox1) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="↑" /><br />
															<input title="下移" onclick="if (putDn(document.all.ListBox1) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="↓" /><br />
															<input title="置底" onclick="if (putDnEnd(document.all.ListBox1) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="╧" />
														</td>
														<td><asp:listbox id="ListBox1" runat="server" Width="110px" Height="200px" SelectionMode="Multiple"></asp:listbox></td>
														<td><input title="全部左移" onclick="if (moveOpt(document.all.ListBox2, document.all.ListBox1, true) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="<<" /><br />
															<input title="左移" onclick="if (moveOpt(document.all.ListBox2, document.all.ListBox1) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="＜" /><br />
															<input title="右移" onclick="if (moveOpt(document.all.ListBox1, document.all.ListBox2) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value="＞" /><br />
															<input title="全部右移" onclick="if (moveOpt(document.all.ListBox1, document.all.ListBox2, true) > 0) document.all.TBGroupFiled.value = getSeleOptVal(document.all.ListBox1, true);"
																type="button" value=">>" />
														</td>
														<td><asp:listbox id="ListBox2" runat="server" Width="110px" Height="200px" SelectionMode="Multiple">
																<asp:ListItem Value="來">來源(預算)</asp:ListItem>
																<asp:ListItem Value="門">門別</asp:ListItem>
																<asp:ListItem Value="預">經費單位</asp:ListItem>
																<asp:ListItem Value="申">執行單位</asp:ListItem>
                                                                <asp:ListItem Value="承">承辦業務</asp:ListItem>																
																<asp:ListItem Value="計">計畫科目</asp:ListItem>
																<asp:ListItem Value="用">用途別科目</asp:ListItem>
																<asp:ListItem Value="版">預算年度</asp:ListItem>
																<asp:ListItem Value="總">總計(項目)</asp:ListItem>																
																<asp:ListItem Value="全">[顯示完整名稱]</asp:ListItem>
															</asp:listbox></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="TDTitle100">預算來源</td>
											<td width="150"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="144px"></asp:dropdownlist></td>
											<td class="TDTitle100">經資門別</td>
											<td style="WIDTH: 150px" align="left"><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td class="TDTitle100">經費單位</td>
											<td width="150"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td class="TDTitle100">執行單位</td>
											<td style="WIDTH: 150px" align="left"><font face="新細明體"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></font></td>
										</tr>
										<tr >
											<td align="right"  width="90">承辦業務</td>
											<td width="150" ><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></td>
											<td class="TDTitle100">承辦人員</td>
											<td style="WIDTH: 150px" align="left"><asp:textbox id="TBStaffName" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr>
											<td class="TDTitle100">動支編號</td>
											<td width="150"><asp:textbox id="TBacmWordNum" runat="server" Width="144px"></asp:textbox></td>
											<td class="TDTitle100" >案號名稱</td>
											<td style="WIDTH: 150px;" align="left"  ><asp:textbox id="TBCaseNo" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr>
											<td class="TDTitle100">摘要</td>
											<td width="150"><asp:textbox id="TBMemo" runat="server" Width="144px"></asp:textbox></td>
											<td class="TDTitle100">
                                                <asp:Label ID="LBPayName" runat="server" Text="廠商名稱" ></asp:Label></td>
											<td style="WIDTH: 150px" align="left"><asp:textbox id="TBPayName" runat="server" Width="144px" ></asp:textbox></td>
										</tr>
                                        <tr>
                                            <td></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
										<tr style="display:none">
											<td class="TDTitle100"><font face="新細明體">簽證</font></td>
											<td class=" " width="150"><asp:dropdownlist id="DDLVisa" style="font-SIZE: 12px" runat="server" Width="120">
                            <asp:ListItem Value="">已登記數</asp:ListItem><asp:ListItem Value="1">會計已審核</asp:ListItem>                            
                            <asp:ListItem Value="0">會計未審核</asp:ListItem>
                            </asp:dropdownlist></td>
											<td class="TDTitle100">報支</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLPay" style="font-SIZE: 12px" runat="server" Width="120">
						<asp:ListItem Value="">全部</asp:ListItem>
                                                <asp:ListItem Value="1">會計已審核</asp:ListItem>                    
                            <asp:ListItem Value="0">會計未審核</asp:ListItem></asp:dropdownlist></td>
										</tr>
										<tr>
											<td class="TDTitle100"></td>
											<td></td>
											<td class="TDTitle100"></td>
											<td align="left" width="150"></td>
											<td><font face="新細明體"><asp:checkbox id="CBShowLevel" runat="server" Text="層級式列表" Checked="True"></asp:checkbox></font></td>
										</tr>
										<tr>
											<td vAlign="top" align="left" colSpan="5">
												<table cellSpacing="0" cellPadding="0" width="100%">
													<tr>
														<td align="right" width="87">計畫科目</td>
														<td width="243" colSpan="2">
                                                            <%--<asp:dropdownlist id="DDLPlan" runat="server" Width="430px" AutoPostBack="True"></asp:dropdownlist>--%>
                                                            <asp:ListBox ID="DDLPlan" runat="server" Width="430px" AutoPostBack="True" MyKendoMultiSelect="MyKendoMultiSelect" SelectionMode="Multiple"></asp:ListBox>
														</td>
														<td rowSpan="2"><asp:checkboxlist id="CBLPlanLevel" runat="server" Width="208px" Height="16px" RepeatColumns="2">
																<asp:ListItem Value="2">業務計畫</asp:ListItem>
																<asp:ListItem Value="3">工作計畫</asp:ListItem>
																<asp:ListItem Value="4">分支計畫</asp:ListItem>
																 
															    <asp:ListItem Value="5">分項計畫</asp:ListItem>
																 
															</asp:checkboxlist></td>
													</tr>
													<tr>
														<td align="right" width="87"></td>
														<td width="157"><asp:checkbox id="CBPlanKind" runat="server" Visible="False" Text="區分經資門"></asp:checkbox></td>
														<td align="right" width="83"></td>
													</tr>
													<tr>
														<td align="right" width="87">用途別科目</td>
														<td width="243" colSpan="2"><asp:dropdownlist id="DDLOul" runat="server" Width="430px"></asp:dropdownlist></td>
														<td rowSpan="2"><asp:checkboxlist id="CBLOulLevel" runat="server" Width="217px" Height="16px" RepeatColumns="2">
																<asp:ListItem Value="1">一級用途別</asp:ListItem>
																<asp:ListItem Value="2">二級用途別</asp:ListItem>
																<asp:ListItem Value="3">三級用途別</asp:ListItem>
																<asp:ListItem Value="4">四級用途別</asp:ListItem>
															</asp:checkboxlist></td>
													</tr>
													<tr>
														<td vAlign="top" align="right" width="87"></td>
														<td colSpan="2"><asp:checkbox id="CBOulKind" runat="server" Visible="False" Text="區分經資門"></asp:checkbox></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr style="display:none">
											<td class="TDTitle100"></td>
											<td>
												<asp:checkbox id="CBMemoType" runat="server" Text="列印用途說明" 
                                                    Visible="False"></asp:checkbox></td>
											<td class="TDTitle100"></td>
											<td align="left" width="150"><font face="新細明體"></font></td>
											<td></td>
										</tr>
										<tr>
											<td>
                                                &nbsp;</td>
											<td colSpan="4"><asp:checkbox id="CBBidMoney" runat="server" Text="已決標數"></asp:checkbox><asp:checkbox id="CBBidLeft" runat="server" Text="標餘款"></asp:checkbox><asp:checkbox id="CBOffSetLeft" runat="server" Text="未轉正數"></asp:checkbox><asp:checkbox id="CBCloseLeft" runat="server" Text="未結案數"></asp:checkbox>
												<asp:checkbox id="CBAccNo" runat="server" Text="已開傳票"></asp:checkbox></td>
										</tr>
										<tr style="display:none">
											<td class="TDTitle100" ></td>
											<td >
                                               </td>
											<td align="left"  colspan="3"><asp:CheckBox ID="CBOrderFlag" runat="server" Text="依 動支編號、再簽日期、決標日期、報支日期、轉正日期  排序" Visible="False" /></td>
										</tr>
										<tr>
											<td class="TDTitle100"><asp:button id="BtnPrint" runat="server" Width="75px" Text="列出報表" Height="22px" OnClick="BtnPrint_Click"></asp:button></td>
											<td align="right" width="150">最大列印帳務數</td>
											<td align="left" width="90"><asp:textbox id="TBMaxRec" runat="server" Width="56px">90</asp:textbox></td>
											<td width="150"><asp:checkbox id="CBDownLoad" runat="server" Text="轉製成EXCEL" Checked="True"></asp:checkbox></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
        <input id="hdfDownloadToken" type="hidden" runat="server" />
    	<COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR>
    <COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day" DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>

        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" EnableModelValidation="True" GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

    </div>
    </form>
</body>
</html>
