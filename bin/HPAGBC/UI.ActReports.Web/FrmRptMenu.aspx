<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmRptMenu.aspx.vb" Inherits="UI.ActReports.Web.FrmRptMenu" %>

<%@ Import Namespace="Microsoft.Security.Application" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
    <script src="../ScriptFiles/jquery-1.9.1-fix.min.js" type="text/javascript"></script>
    <script language="javascript" src="../ScriptFiles/setFrameSize.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //2013.11.01：Add：報表：經費動支申請
            //  增加可選條件：用途別顯示層級、是否依用途別做加總
            //#region 報表：經費動支申請
            $("[MyName='RBRptList'] :radio").click(function () {
                var $this = $(this);
                if ($this.val() == "Case01.xls") {
                    $("[MyName='pnlInfo']").show();
                } else {
                    $("[MyName='pnlInfo']").hide();
                }
            });
            //#endregion
        });


        function stateChangeIE(_frame) {
            if (_frame.readyState == "interactive") //state: loading ,interactive,   complete
            {
                var loader = document.getElementById("load");
                loader.innerHTML = "";
                loader.style.display = "none";
            }
        }
        function stateChangeFirefox(_frame) {
            var loader = document.getElementById("load");
            loader.innerHTML = "";
            loader.style.display = "none";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">


        <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse" bordercolor="#666668" cellpadding="5" width="500" bgcolor="#dadee9" border="1">
            <tr>
                <td>
                    <table style="border-collapse: collapse; table-layout: fixed" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr style="display: none">
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 90px; text-align: right;" nowap>動支編號：</td>
                                        <td style="width: 150px; text-align: left">
                                            <asp:Label ID="LBAacmWordNum"
                                                runat="server"></asp:Label></td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 90px; text-align: right;" nowap>&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style="display: none">
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="text-align: left" colspan="3">
                                            <asp:CheckBox ID="CBPrintThisDataOnly" runat="server"
                                                Text="本筆為補簽資料，是否單獨列印本補簽資料" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left" colspan="2">可列印報表如下：</td>
                                        <td style="width: 90px; text-align: right">&nbsp;</td>
                                        <td style="width: 150px; text-align: left">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Left" colspan="5">
                                            <div style="text-align: center">
                                                <asp:Panel ID="pnlInfo" MyName="pnlInfo" runat="server" GroupingText="經費動支申請" Width="70%" HorizontalAlign="Center" Style="display: none">
                                                    用途別列印的層級：
                                                    <asp:RadioButtonList ID="rblOulLevel" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="1">第一層</asp:ListItem>
                                                        <asp:ListItem Value="99" Selected="True">最細層</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:CheckBox ID="chkIsSumOul" runat="server" Text="加總相同業務計畫、用途別" Checked="true" Style="display: none" />
                                                </asp:Panel>
                                            </div>
                                            <asp:RadioButtonList ID="RBRptList" MyName="RBRptList" runat="server">
                                            </asp:RadioButtonList>
                                            <asp:Label ID="LBMsg" runat="server" Text="無報表可以列印" Visible="false"></asp:Label>
                                            <asp:Label ID="LBMsg1" runat="server" Text="因為本筆動支編號已有再簽資料，故無法再進行列印"
                                                Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="border-collapse: collapse" width="100%" border="0" cellpadding="1" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnList" runat="server" Text="列出資料" Visible="False" />
                                            <asp:Button ID="BtnPrint" runat="server" Text="預覽報表" />
                                            <asp:CheckBox ID="CBExcel" runat="server" Text="轉製成EXCEL" Checked="True" Visible="false"></asp:CheckBox>
                                            <input id="Button1" type="button" value="列印" onclick="try { if (rptFrame.location != 'about:blank') { rptFrame.focus(); rptFrame.print(); } } catch (e) {; };" />
                                            <asp:Button ID="btnSetmark" runat="server" Text="【開啟】分期付款備註設定" />
                                            <asp:TextBox ID="txtbtnSetmarkpara" runat="server" Style="display: none"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>


        <script type="text/javascript">

            //2013.11.01：Add：報表：經費動支申請
            //  增加可選條件：用途別顯示層級、是否依用途別做加總
            //2013.11.04：Add：移至頁尾，避免畫面會閃
            if ($("[MyName='RBRptList'] :radio:checked").val() == "Case01.xls") {
                $("[MyName='pnlInfo']").show();
            } else {
                $("[MyName='pnlInfo']").hide();
            }

            //#region 設定備註
            $("#btnSetmark").click(function () {
                //黏存單付款說明
                var tmpPara = $("#txtbtnSetmarkpara").val();


                var src2 = "../UI.tsbPayAttPaidFrom.Web/Default.aspx?" + tmpPara
                document.getElementById("Payinstructions").src = src2;

                var tmpOpenFlag = 0;
                if ($("#btnSetmark").val() == '【開啟】分期付款備註設定') {
                    tmpOpenFlag = 1;
                    $('#divPX').show();
                    $("#btnSetmark").prop('value', '【關閉】分期付款備註設定');
                }
                else {
                    $('#divPX').hide();
                    $("#btnSetmark").prop('value', '【開啟】分期付款備註設定');
                }

                return false;

            });
            //#endregion


        </script>
        <!---顯示列印設定---->
        <div id="divPX" style="display: 1none">
            <iframe id="Payinstructions" name="Payinstructions" style="height: 140px; width: 100%; visibility: inherit; z-index: 2" scrolling="no" frameborder="0" src=""></iframe>
        </div>


        <div align="center" style="position: absolute; width: 100px; height: 100px; z-index: 1; left: 158px; top: 300px" id="load">
            <img src="../Images/ajax-loader.gif" />&nbsp;loading...</div>
        <iframe onload="setiFrameBox(this,-1);stateChangeFirefox(this)" id="rptFrame" name="rptFrame" border="0" frameborder="0" width="100%" scrolling="no" height="100%" src="<%=AntiXss.HtmlEncode(strFrameSrc)%>" onreadystatechange="stateChangeIE(this)"></iframe>
    </form>
</body>
</html>
