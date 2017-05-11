<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCarryFun.aspx.vb" Inherits="UI.CarryOver.Web.FrmCarryFun" %>

<%@ Import Namespace="Microsoft.Security.Application" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <script type="text/javascript" src="../ScriptFiles/setAllCtrl.js"></script>
    <style type="text/css">
        .Freezing {
            Z-INDEX: 10;
            POSITION: relative;
            TOP: expression(this.offsetParent.scrollTop+0);
            HEIGHT: 24px;
        }

        .FreezingCol0 {
            BORDER-RIGHT: 0px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol1 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .FreezingCol2 {
            BORDER-RIGHT: 1px solid;
            BORDER-TOP: #ffffff 0px solid;
            Z-INDEX: 9;
            LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }
    </style>

    <script type="text/javascript">

        function check_Num() {
            if ((event.keyCode >= 48 && event.keyCode <= 57)) { return true; }
            else { event.keyCode = 0; false; }
        }

        function check_inputVal(parObj) {
            if (parseFloat(replaceString(parObj.value, ",", "")) < 0) {
                alert("不得輸入小於零數值。");
                parObj.value = 0;
                parObj.focus();
            }
        }



        function replaceString(sString, sReplaceThis, sWithThis) {
            if (sReplaceThis != "" && sReplaceThis != sWithThis) {
                var counter = 0;
                var start = 0;
                var before = "";
                var after = "";

                while (counter < sString.length) {
                    start = sString.indexOf(sReplaceThis, counter);
                    if (start == -1)
                        break;
                    else {
                        before = sString.substr(0, start);
                        after = sString.substr(start + sReplaceThis.length, sString.length);
                        sString = before + sWithThis + after;
                        counter = before.length + sWithThis.length;
                    }
                }
            }

            return sString;
        }


        function Setfocus(parObj) {
            parObj.value = replaceString(parObj.value, ",", "");
            parObj.select();
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse; width: 98%; background-color: #dadee9; padding: 1px;">
            <tr>
                <td style="border: 1pt solid; border-color: #666668">
                    <table style="border-collapse: collapse; border-color: #ffffff; width: 100%; padding: 1px; border: 1px;">
                        <tr>
                            <td>
                                <table style="table-layout: fixed; width: 100%; padding: 1px; border: 0px;">
                                    <tr>
                                        <td style="vertical-align: bottom; text-align: right; width: 80px;"></td>
                                        <td style="vertical-align: bottom; text-align: left; width: 80px;"></td>
                                        <td style="vertical-align: bottom; text-align: left; width: 80px;"></td>
                                        <td style="vertical-align: bottom; text-align: left;" colspan="4">

                                            <table style="border-collapse: collapse" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td><font face="新細明體" color="#ff6633"><asp:label id="Label1" runat="server" Visible="False">指定類別</asp:label></font></td>
                                                    <td><font face="新細明體" color="#ff6633"><asp:checkboxlist id="CBLOutlay" runat="server" Visible="False" ForeColor="#ff6633"></asp:checkboxlist></font></td>
                                                    <td><font face="新細明體" color="#ff6633"><asp:label id="Label2" runat="server" Visible="False">科目年度別</asp:label></font></td>
                                                    <td><font face="新細明體" color="#ff6633"><asp:textbox onkeypress="return check_Num()" id="TBNextYear" style="TEXT-ALIGN: center" runat="server"
																	Width="50px" Visible="False" ForeColor="#ff6633"></asp:textbox></font></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <table style="table-layout: fixed" cellpadding="1" width="100%" border="0">
                                    <tr>
                                        <td style="text-align: right; width: 80px;">年度</td>
                                        <td style="text-align: left; width: 80px;">
                                            <asp:TextBox onkeypress="return check_Num()" ID="TBYear" Style="text-align: center" runat="server" onfocus="this.blur()" Width="50px" BackColor="Transparent"></asp:TextBox></td>
                                        <td style="text-align: right; width: 80px;">動支編號</td>
                                        <td style="text-align: left; width: 100px;">
                                            <asp:TextBox ID="TBacmWordNum" runat="server" Width="92px" Style="text-align: center"></asp:TextBox></td>
                                        <td style="text-align: right; width: 100px">經費單位</td>
                                        <td style="width: 200px">
                                            <asp:DropDownList ID="DDLBgtDep" runat="server" Width="98%"></asp:DropDownList></td>
                                        <td style="text-align: right; width: 100px">執行單位</td>
                                        <td style="width: 200px">
                                            <asp:DropDownList ID="DDLWorkDep" runat="server" Width="98%"></asp:DropDownList></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: bottom; text-align: right; width: 80px;">計畫</td>
                                        <td colspan="10">
                                            <asp:DropDownList ID="DDLPlan" runat="server" Width="600px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: bottom; text-align: right; width: 80px;">用途別</td>
                                        <td style="vertical-align: bottom; text-align: left;" colspan="11">
                                            <asp:DropDownList ID="DDLOul" runat="server" Width="300px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 250px;" colspan="11">
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料"></asp:Button></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="table-layout: fixed" cellspacing="0" cellpadding="3" border="0">
                                    <tr>
                                        <td style="width: 150px;">
                                            <asp:Button ID="BtnCarryNext" runat="server" Width="100px" Text="結轉至下年度" Height="22px"></asp:Button></td>
                                        <td style="width: 150px; text-align: right;">
                                            <asp:Button ID="BtnDelReserve" runat="server"
                                                Width="100px" Text="刪除已保留資料" Height="22px" Visible="False"></asp:Button></td>
                                        <td style="width: 74px" width="74"><font face="新細明體">申請總數</font></td>
                                        <td style="width: 100px;">
                                            <asp:Label ID="LBVisaTotal" runat="server" Width="100%"></asp:Label></td>
                                        <td style="width: 77px" width="77"><font face="新細明體">剩餘總數</font></td>
                                        <td style="width: 148px" width="148"><font face="新細明體"><asp:label id="LBVisaLeftTotal" runat="server" Width="100%"></asp:label></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="freezingDiv1" style="border-right: 1px groove; border-top: 1px groove; overflow: auto; border-left: 1px groove; width: 100%; border-bottom: 1px groove; height: '<%= strGrid1Height %>'">
                                    <asp:DataGrid ID="DataGrid1" runat="server" BorderStyle="None" BackColor="White"
                                        CellPadding="4" AutoGenerateColumns="False" Width="100%" BorderColor="#3366CC" BorderWidth="1px">
                                        <SelectedItemStyle Font-Bold="True" BackColor="#009999" ForeColor="#CCFF99"></SelectedItemStyle>
                                        <ItemStyle Font-Size="X-Small" BackColor="White" ForeColor="#003399"></ItemStyle>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center"
                                            ForeColor="#CCCCFF" CssClass="Freezing"
                                            BackColor="#003399" Font-Bold="True"></HeaderStyle>
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="選取">
                                                <HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBSelectAll1" onclick="AllCheck('DataGrid1_,,CBdgSelect',this.checked);" runat="server"
                                                        ToolTip="打勾全選"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgSelect" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="保留原因">
                                                <HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TBReason" runat="server" Width="200px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container, "DataItem.acmReason") %>'>
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="保留數準備">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TBdgReserveMoney" onFocus="Setfocus(this)" onblur="check_inputVal(this);" runat="server" Width="80px" Style="text-align: Right" Text='<%# IIF(Val(DataBinder.Eval(Container, "DataItem.ResPayNo").ToString()) >0 Or  Val(DataBinder.Eval(Container, "DataItem.ResPayNo1").ToString()) >0  , DataBinder.Eval(Container, "DataItem.保留數準備","{0:#,0}" ),  DataBinder.Eval(Container, "DataItem.TotalMoneyUnPaid","{0:#,0}" )) %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="應付歲出款">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TBdgPayableMoney" onFocus="Setfocus(this)" onblur="check_inputVal(this);" runat="server" Width="80px" Style="text-align: Right" Text='<%# DataBinder.Eval(Container, "DataItem.歲出應付款","{0:#,0}")  %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="釋放金額">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TBdgAdjustMoney" onFocus="Setfocus(this)" onblur="check_inputVal(this);" runat="server" Width="80px" Style="text-align: Right" Text='<%# DataBinder.Eval(Container, "DataItem.結轉釋放預算","{0:#,0}")  %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支日期">
                                                <HeaderStyle Width="60px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="LBdgAcmMarkDate" Text='<%# DataBinder.Eval(Container, "DataItem.acmMarkDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
                                                <HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString())%>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70px" />
                                                <ItemStyle Font-Bold="True" Font-Italic="False" Font-Overline="False"
                                                    Font-Size="Small" Font-Strikeout="False" Font-Underline="False" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPayNo").ToString())%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                    Font-Size="10px" Font-Strikeout="False" Font-Underline="False" Width="30px" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
                                                <HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
                                                <ItemStyle Wrap="False" Width="100px"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
                                                <HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
                                                <ItemStyle Wrap="False" Width="60px"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
                                                <HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right" Width="80px"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="剩餘金額">
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgTotalMoneyUnPaid" Style="text-align: right" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.TotalMoneyUnPaid", "{0:#,0}").ToString()) %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right" Width="80px"></ItemStyle>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="保留調整金額" Visible="false">
                                                <HeaderStyle Width="60px" />
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcvAdjustMoney" Style="text-align: right" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.結轉釋放預算", "{0:#,0}").ToString()) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="刪除" Visible="false">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px"></ItemStyle>
                                                <HeaderStyle Width="30px" />
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label1" runat="server" BackColor="Transparent" ToolTip="刪除保留資料">刪除</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBDel" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>

                                            <asp:TemplateColumn Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmYear").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo1").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo2").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo2").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPayYear").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvSubNo").ToString())%>'></asp:Label>

                                                    <asp:Label ID="LBdgAcvPlanCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvPlanCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvOutlayYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayYear").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvOutlayCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayCode").ToString())%>'></asp:Label>

                                                    <asp:Label ID="LBdgAcvBgtSourceCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtSourceCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvAccKind" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvAccKind").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvBizCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBizCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtDepCode").ToString())%>'></asp:Label>

                                                    <asp:Label ID="LBdgBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtUnitNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgResPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.ResPayNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgResPayNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.ResPayNo1").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNoPrv" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNoPrv").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgDoneFlag" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DoneFlag").ToString())%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>

                                        </Columns>
                                        <PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC"
                                            Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10"><font face="新細明體"></font></td>
            </tr>
            <tr style="<%=strShowFlag %>">
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid"
                    bordercolor="#666668">
                    <table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="5" width="100%"
                        border="1">
                        <tr>
                            <td valign="bottom" align="left">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td width="120">
                                            <asp:Button ID="BtnDelete" runat="server" Text="刪除已結轉" Height="22"></asp:Button></td>
                                        <td>
                                            <asp:Button ID="BtnPrint" runat="server" Width="75px" Visible="False" Text="列印" Height="22px"></asp:Button></td>
                                        <td width="50"><font face="新細明體"></font></td>
                                        <td style="width: 70px"><font face="新細明體">結轉總數</font></td>
                                        <td><font face="新細明體"><asp:label id="LBCarryTotal" runat="server" Width="100%"></asp:label></font></td>
                                        <td><font face="新細明體"></font></td>
                                        <td><font face="新細明體"></font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="freezingDiv2" style="border-right: 1px groove; border-top: 1px groove; overflow: auto; border-left: 1px groove; width: 1200px; border-bottom: 1px groove; height: 300px">
                                    <asp:DataGrid ID="DataGrid2" runat="server" Width="100%" CellSpacing="1" BorderStyle="None" BackColor="White"
                                        CellPadding="3" GridLines="None" AutoGenerateColumns="False">
                                        <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                        <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                        <ItemStyle Font-Size="x-Small" BackColor="WhiteSmoke"></ItemStyle>
                                        <HeaderStyle Font-Size="x-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" CssClass="Freezing"
                                            BackColor="#003366"></HeaderStyle>
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="選取">
                                                <HeaderStyle Wrap="False" Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect2',this.checked);" runat="server"
                                                        ToolTip="打勾全選" Visible="false"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CBdgSelect2" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmReason" SortExpression="acmReason" HeaderText="保留原因">
                                                <HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmMarkDate" SortExpression="acmMarkDate" HeaderText="簽證日期">
                                                <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmYear" SortExpression="acmYear" HeaderText="年度">
                                                <HeaderStyle Wrap="False" Width="30px"></HeaderStyle>
                                                <ItemStyle Font-Size="x-Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmWordNum").ToString()) %>' ToolTip='<%# AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString()) %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="80px" />
                                                <ItemStyle Font-Bold="True" Font-Size="Small" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="報支號">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acpPayNo").ToString())%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                    Font-Size="10px" Font-Strikeout="False" Font-Underline="False" Width="30px" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="WorkDepName" SortExpression="WorkDepName" HeaderText="執行單位">
                                                <HeaderStyle Wrap="False" Width="120px"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" SortExpression="acmWorkUserNo" HeaderText="承辦人員">
                                                <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvBgtKindSet" SortExpression="acvBgtKindSet" HeaderText="保留種類">
                                                <HeaderStyle Wrap="False" Width="70px"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMoney" SortExpression="acvMoney" HeaderText="動支金額" DataFormatString="{0:#,0}">
                                                <HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
                                                <ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="TotalMoneyUnPaid" SortExpression="TotalMoneyUnPaid" HeaderText="剩餘金額"
                                                DataFormatString="{0:#,0}">
                                                <HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
                                                <ItemStyle Font-Size="Small" Font-Names="Verdana" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acmMemo" SortExpression="acmMemo" HeaderText="事由"></asp:BoundColumn>
                                            <asp:TemplateColumn Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmYear").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo1").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo1" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo1").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNo2").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvNo2" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvNo2").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvPlanCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvPlanCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvOutlayYear" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayYear").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvOutlayCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvOutlayCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtDepCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvBgtSourceCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBgtSourceCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBAcvAccKind" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvAccKind").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcvBizCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acvBizCode").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgBgtDepCode" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmBgtUnitNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgResPayNo" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.ResPayNo").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgAcmNoPrv" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.acmNoPrv").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgDoneFlag" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.DoneFlag").ToString())%>'></asp:Label>
                                                    <asp:Label ID="LBdgPayCnt" runat="server" Text='<%#AntiXss.HtmlEncode(DataBinder.Eval(Container, "DataItem.PayCnt").ToString())%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
