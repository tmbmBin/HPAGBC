<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashReceive.aspx.vb" Inherits="UI.Cash.Web.FrmCashReceive" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <script language="javascript" src="../ScriptFiles/jquery-1.9.1-fix.min.js" type="text/javascript"></script>

    <link href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet" />
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
            ;
            LEFT: expression(document.getElementById("freezingDiv2").scrollLeft+1);
            BORDER-LEFT: #003366 0px solid;
            BORDER-BOTTOM: 0px solid;
            POSITION: relative;
        }

        .NotVisible {
            display: none;
        }
    </style>

    <script type="text/javascript">
        
        //1020917[add]:控制編輯受款人按鈕是否顯示及是否可用
        $(function () {
            //$("input[id='btnPayNameList']").css("display", "none");
            //電子支付：隱藏欄(受款人)，不需編輯受款人
            var csmKind = $("#txt_csmKind").val();
            if (csmKind == 1) {
                var col = 2;
                $('[MyName="gvList"] tr td:nth-child(' + col + '),[MyName="gvList"] tr th:nth-child(' + col + ')', this).hide(); /*該欄隱藏*/
                //$("[MyName='gvList'] tr:eq('1')").hide();  //隱藏列
            }
            else {
                //新增、修改不得編輯受款人
                if ($("#BtnAdd").attr("disabled") == "disabled") {
                    $("input[id='btnPayNameList']").attr("disabled", "disabled");
                    $("input[id='btnPayNameList']").attr("title", "儲存後才能編輯受款人!");
                }

                if ($("#BtnEdit").attr("disabled") == "disabled") {
                    $("input[id='btnPayNameList']").attr("disabled", "disabled");
                    $("input[id='btnPayNameList']").attr("title", "儲存後才能編輯受款人!");
                }
            }
        });

        //1020903[add]:開啟編輯受款人
        function OpenPayNameList(MyKey) {
            var url = "FrmCashReceiveDtl_Edit.aspx?MyKey=" + MyKey.toString();
            var digW = screen.width - 8 - 100;
            var digH = screen.availHeight - 47 - 150;
            var infoStream = showModalDialog(url,window,"dialogWidth: " + digW + "px; dialogHeight: " + digH + "px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
        }

        
        function check_Num(){
            if((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode==45)||(event.keyCode==46)){
                return true;}
            else{event.keyCode=0;false;}
        }

        function OpenActData(parObj) {

            var arrID = parObj.split("-");
            var strParams;

            strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=" + arrID[0] + "&acmno1=" + arrID[1] + "&acpPayNo=" + arrID[2]
            //strParams = "../UI.Comm.Web/FrmActDataProxy.aspx?acmWordNum=09900001"


            var strReturnVal = showModalDialog(strParams, window, "dialogWidth:800px;dialogHeight:600px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            //var strReturnVal = showModalDialog("../UI.BasicData.Web/FrmChoosePhrase.aspx", window, "dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

        }

        function UCDate_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("TBCsmDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
            // CssClass="Freezing"
        }

        function UCDate2_Change(calendar)
        {
            var vDay = new Date(calendar.GetSelectedDate());
            document.getElementById("txtcsmPayDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
            // CssClass="Freezing"
        }

        function GetTotalCnt(parObj)
        {

            var tmpArray=parObj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex=intIndex.substring(3,intIndex.length);
            var tmpName =  "DataGrid2_ctl"+ intIndex +"_LBdgMoney"
            if (parObj.checked ==true)
            {
                document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) + 1;
                document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) + parseFloat(replaceString( document.all(tmpName).innerText ,",",""))
            }
            else
            {
                document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value,",","")) - 1 ;
                document.all("TBCsmMoney").value =   parseFloat(replaceString(document.all("TBCsmMoney").value,",","")) - parseFloat(replaceString( document.all(tmpName).innerText ,",",""))

            }
        }



        function GetTotalCntV1(parObj)
        {

            var tmpArray = parObj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex = intIndex.substring(3, intIndex.length);
            var tmpName = "DataGrid2_ctl" + intIndex + "_LBdgMoney"


            if (parObj.checked == true) {
                document.all("TBCsmCnt").value = parseFloat(replaceString(document.all("TBCsmCnt").value, ",", "")) + 1;
                document.all("TBCsmMoney").value = parseFloat(replaceString(document.all("TBCsmMoney").value, ",", "")) + parseFloat(replaceString(document.all(tmpName).innerText, ",", ""));
            }
            else {
                document.all("TBCsmCnt").value = 0;
                document.all("TBCsmMoney").value = 0;

            }
        }

        function replaceString(sString, sReplaceThis, sWithThis)
        {
            if (sReplaceThis != "" && sReplaceThis != sWithThis)
            {
                var counter = 0;
                var start = 0;
                var before = "";
                var after = "";

                while (counter<sString.length)
                {
                    start = sString.indexOf(sReplaceThis, counter);
                    if (start == -1)
                    {
                        break;
                    }
                    else
                    {
                        before = sString.substr(0, start);
                        after = sString.substr(start + sReplaceThis.length, sString.length);
                        sString = before + sWithThis + after;
                        counter = before.length + sWithThis.length;
                    }
                }
            }

            return sString;
        }



        function Get_EditStr(obj) {
            var tmpArray = obj.id.split("_");
            var intIndex = tmpArray[1];
            intIndex = intIndex.substring(3, intIndex.length);
            var tmpPlanName = "DataGrid2_ctl" + intIndex + "_lab_plnPlanName";
            var tmpOutlayName = "DataGrid2_ctl" + intIndex + "_lab_oulOutlayName";
            var url = "FrmTestPar.aspx?obj=" + obj;
            var infoStream = showModalDialog(url, window, "dialogWidth: 640px; dialogHeight: 480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            var tmpArrayInfo = infoStream.split("｜");
            var infoStream1 = tmpArrayInfo[0];
            var infoStream2 = tmpArrayInfo[1];
            document.getElementById(tmpPlanName).innerHTML = "<span id='" + tmpPlanName + "'>" + infoStream1 + "</span>";
            document.getElementById(tmpOutlayName).innerHTML = "<span id='" + tmpOutlayName + "'>" + infoStream2 + "</span>";
        }

        function checkAll(alt) {

            var a = document.getElementsByTagName("input");
            var n = a.length;

            document.all("TBCsmCnt").value = 0;
            document.all("TBCsmMoney").value = 0;

            for (var i = 0; i < n; i++)
                if (a[i].type == "checkbox" && a[i].MyName == alt && a[i].disabled != true) {
                    a[i].checked = window.event.srcElement.checked;
                    GetTotalCntV1(a[i]);
                }
        }

        function checkSelect(alt) {

            var a = document.getElementsByTagName("input");
            var n = a.length;
            for (var i = 0; i < n; i++)
                if (a[i].type == "checkbox" && a[i].alt == alt && a[i].disabled != true) {
                    a[i].checked = window.event.srcElement.checked;
                    GetTotalCnt(a[i]);
                }
        }

        function fnFromScan(thisName) {

            var csCode = document.all("ddl_SortList").value;
            var crCode = document.all("ddl_cashRoster").value;
            var intDefYear = document.all("TBCsmYear").value;
            var csmKind = document.all("txt_csmKind").value;
            if (parseFloat(GetIEVer()) > 6)
                var strReturnVal = showModalDialog("../UI.Cash.Web/FrmScanBarCode.aspx?intDefYear=" + intDefYear + "&csCode=" + csCode + "&crCode=" + crCode + "&csmKind=" + csmKind + "&Phase=0", window, "dialogWidth: 640px; dialogHeight: 474px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            else	//W:-8; H:-47
                var strReturnVal = showModalDialog("../UI.Cash.Web/FrmScanBarCode.aspx?intDefYear=" + intDefYear + "&csCode=" + csCode + "&crCode=" + crCode + "&csmKind=" + csmKind + "&Phase=0", window, "dialogWidth: 650px; dialogHeight: 568px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

            if (strReturnVal != "Cancel") {
                var tmpArray = strReturnVal.split("|");
                document.all(thisName).value = tmpArray[0];
                var intTmpCnt = val(document.all("TBCsmCnt").value);
                document.all("TBCsmCnt").value = intTmpCnt + parseInt(tmpArray[1]);
                var intTmpMoney = Val(document.all("TBCsmMoney").value);
                document.all("TBCsmMoney").value = intTmpMoney + parseInt(tmpArray[2]);
                document.all(thisName).onchange();
            } else {
                document.all(thisName).value = "";
            }

        }

        function GetIEVer() {
            var x;
            for (i = 0; i < 10; i++) {
                for (z = 0; z < 10; z++) {
                    if (navigator.appVersion.match("MSIE " + i + "." + z) != null)
                        x = i + "." + z;
                }
            }
            return x;
        }

        function OpenSearchMore(cskKind) {
            var returnVal = showModalDialog("../UI.Cash.Web/FrmSearchMore.aspx?cskKind=" + cskKind + "&cnPhase=0", window, "dialogWidth: 700px; dialogHeight: 474px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");
            //alert(returnVal);
            if (returnVal != "Cancel") {
                document.getElementById('TBSearchSql').value = returnVal;
                document.getElementById('TBSearchSql').onchange();
            }
        }

    </script>
    <script type="text/vbscript">

        Function Val(thisValue)
            On Error Resume next
            Val = CDbl(thisValue)
            If Err.Number <> 0 then
                Val = 0
                Err.Clear
            End If
        End Function
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" cellpadding="5" width="800" bgcolor="#dadee9">
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid; border-color: #666668" width="600" valign="top" align="left">
                    <table style="border-collapse: collapse; border-color: #ffffff" cellpadding="1" width="100%" border="1">
                        <tr>
                            <td>
                                <table border="0" cellpadding="1" cellspacing="1" width="100%" style="table-layout: fixed">
                                    <tr>
                                        <td align="right" style="width: 75px">領用年度</td>
                                        <td style="width: 110px">
                                            <asp:TextBox ID="TBCsmYear" runat="server" Width="105px" BackColor="Transparent" onfocus="this.blur();" Style="text-align: center"></asp:TextBox></td>
                                        <td align="right" style="width: 70px">領用數量</td>
                                        <td style="width: 120px">
                                            <asp:TextBox ID="TBCsmCnt" runat="server" Width="100px"
                                                BackColor="Transparent" onfocus="this.blur();" Style="text-align: center"
                                                MyName="TBAcmMoney"></asp:TextBox></td>
                                        <td align="right" style="width: 85px">領用金額</td>
                                        <td>
                                            <asp:TextBox ID="TBCsmMoney" runat="server" Width="100px" BackColor="Transparent" onfocus="this.blur();" Style="text-align: right" MyName="TBAcmMoney"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 75px">領用日期</td>
                                        <td style="width: 110px">
                                            <asp:TextBox ID="TBCsmDate" runat="server" ondblclick="JavaScript: UCDate.Show();" Width="105px" Style="text-align: center; background-color: #ffffe0"></asp:TextBox></td>
                                        <td align="right" style="width: 70px; display: none;">領用編號</td>
                                        <td style="width: 120px; display: none;">
                                            <asp:TextBox ID="TBCsmNo" runat="server" Width="100px" BackColor="Transparent" onfocus="this.blur();" Style="text-align: center"></asp:TextBox></td>
                                        <td align="right" style="width: 85px">帳 &nbsp; &nbsp; &nbsp; &nbsp;別</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_SortList" runat="server" Width="110px"
                                                Style="background-color: #ffffe0" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td style="width: 75px; text-align: right;">
                                            <asp:TextBox ID="txt_csmKind" runat="server" Width="50px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td style="width: 70px; text-align: right;">名 &nbsp; &nbsp; &nbsp; &nbsp;單</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_cashRoster" runat="server" Width="110px"
                                                Style="background-color: #ffffe0" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" style="width: 85px"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 75px">付款日期</td>
                                        <td style="width: 110px">
                                            <asp:TextBox ID="txtcsmPayDate" runat="server" ondblclick="JavaScript: UCDate2.Show();" Width="105px" Style="text-align: center;"></asp:TextBox></td>
                                        <td align="right" style="width: 70px">領用批號</td>
                                        <td style="width: 120px">
                                            <asp:TextBox ID="txtBatchNo" runat="server" Width="100px" BackColor="Transparent" onfocus="this.blur();" Style="text-align: center"></asp:TextBox></td>
                                        <td align="right" style="width: 85px">&nbsp; </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 75px; text-align: right;">備 &nbsp; &nbsp; &nbsp; &nbsp;註</td>
                                        <td colspan="5">
                                            <asp:TextBox ID="TBMemo" runat="server" Width="480px"></asp:TextBox>
                                            <input id="BtnPhrase" runat="server" type="button" value="..."
                                                disabled="disabled" style="display: none" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:TextBox ID="txt_acmWordNum" runat="server" AutoPostBack="True" Style="display: none"></asp:TextBox>
                                            <input type="button" id="ibtn_FromScan" runat="server" style="width: 120px; height: 22px" value="使用條碼掃描器" onclick="fnFromScan('txt_acmWordNum');" />
                                            <asp:Button ID="btn_Reload" runat="server" Style="width: 80px; height: 22px"
                                                Text="清單重載" />
                                            <asp:Label ID="Label1" runat="server" Text="←如果有異動到核銷資料(含轉正)請按此鈕，重新載入資料。"
                                                Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc"%>
                                <div id="MyDiv" style="border-right: 1px groove; border-top: 1px groove; behavior: url(<%= resolveurl(scrollposurl)%>); overflow: auto; border-left: 1px groove; width: 600px; border-bottom: 1px groove; height: 350px" scrollpos="<%= savescrollpos.value %>" persistid="<%= savescrollpos.uniqueid %>">
                                    <input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
                                    <asp:DataGrid ID="DataGrid2" runat="server" Width="1000px" AutoGenerateColumns="False" MyName="gvList">
                                        <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                        <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                        <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                        <HeaderStyle Font-Size="Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CBdgSelectAll1" runat="server" name="C1"
                                                        onclick="checkAll('C1');" ToolTip="打勾全選" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input id="CBdgSelect" type="checkbox" runat="server" myname="C1" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="受款人">
                                                <HeaderStyle Width="50px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <input id="btnPayNameList" type="button" value="編輯" onclick="OpenPayNameList(' <%# DataBinder.Eval(Container, "DataItem.MyKey") %>    ');" style="margin: 5px;" /><br />
                                                    <asp:Label ID="lblPayNameList" runat="server" Text='<%# Eval("PayNameList") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="動支編號">
                                                <HeaderStyle Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="linkacmWordNum" runat="server" CausesValidation="False" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>' NavigateUrl='<%# "javascript:OpenActData(" & Chr(39) & DataBinder.Eval(Container, "DataItem.acmWordNum") & Chr(39) & ");" %>' CssClass="<%# Container.ItemIndex %>" Style="display: none"></asp:HyperLink>
                                                    <asp:Label ID="labacmWordNum" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.acmWordNum") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="計畫名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="lab_plnPlanName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.plnPlanName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="180px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="left" Width="180px" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="用途別名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="lab_oulOutlayName" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.oulOutlayName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="left" Wrap="False" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="金額">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvPassMoney", "{0:#,#}") %>' MyName="LBdgMoney" MyIndex="<%# Container.ItemIndex %>"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="acmWorkUserNo" HeaderText="申請人">
                                                <HeaderStyle Width="80px" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="acvMemo" HeaderText="用途說明">
                                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="acmYear-7" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacmYear" runat="server" Text='<%# Eval("acmYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo-8" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacmNo" runat="server" Text='<%# Eval("acmNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo-9" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacvNo" runat="server" Text='<%# Eval("acvNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo1-10" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacmNo1" runat="server" Text='<%# Eval("acmNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo1-11" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacvNo1" runat="server" Text='<%# Eval("acvNo1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNo2-12" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacmNo2" runat="server" Text='<%# Eval("acmNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvNo2-13" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacvNo2" runat="server" Text='<%# Eval("acvNo2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayYear-14" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacpPayYear" runat="server" Text='<%# Eval("acpPayYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acpPayNo-15" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacpPayNo" runat="server" Text='<%# Eval("acpPayNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acvSubNo-16" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacvSubNo" runat="server" Text='<%# Eval("acvSubNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="OrderFlag-17" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labOrderFlag" runat="server" Text='<%# Eval("OrderFlag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="acmNoPrv-18" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labacmNoPrv" runat="server" Text='<%# Eval("acmNoPrv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LBdgAcmYear" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                    <asp:Label ID="LBdgPlnPlanCode" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.plnPlanCode") %>'></asp:Label>
                                                    <asp:Label ID="LBdgUnitNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.UnitNo") %>'></asp:Label>
                                                    <asp:Label ID="LBIsReturn" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.IsReturn") %>'></asp:Label>
                                                    <asp:Label ID="lbAcpGroupNo" runat="server"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" width="200" bgcolor="#ffffff" rowspan="3">
                    <iframe id="iFrame" border="0" name="iFrame" src="<%=strShowCashPath %>" frameborder="0" width="200" scrolling="no" height="500"></iframe>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" height="10"></td>
            </tr>
            <tr>
                <td style="border-right: #666668 1pt solid; border-top: #666668 1pt solid; border-left: #666668 1pt solid; border-bottom: #666668 1pt solid; border-color:#666668">
                    <table style="table-layout: fixed; border-collapse: collapse; border-color:#ffffff" cellpadding="5" width="100%" border="1">
                        <tr>
                            <td valign="bottom" align="left">
                                <table cellpadding="1" border="0">
                                    <tr>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnAdd" runat="server" Text="新增" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnEdit" runat="server" Text="修改" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnDelete" runat="server" Text="刪除" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSave" runat="server" Text="儲存" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnCancel" runat="server" Text="取消" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnSearch" runat="server" Text="查詢" Height="22" Visible="False"></asp:Button></td>
                                        <td valign="bottom" align="center">
                                            <asp:Button ID="BtnPrint" runat="server" Text="列印" Visible="False" Height="22"></asp:Button></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center"></td>
                                        <td valign="bottom" align="center">
                                            <asp:TextBox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" ID="TBSearchSql" onblur="if(this.value==''){this.value='尋找領用編號';}" Style="text-align: center; display: none;" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找領用編號</asp:TextBox>
                                            <asp:TextBox onkeypress="if(event.keyCode==13) {this.blur();return false;} else return check_Num()" ID="TBSearchSql2" onblur="if(this.value==''){this.value='尋找領用批號';}" Style="text-align: center" onfocus="this.select()" onclick="this.value=''" runat="server" Width="100px" AutoPostBack="True">尋找領用批號</asp:TextBox>
                                            <input style="font-size: 8pt; width: 16px; font-family: Webdings; height: 22px" type="button" value="s" />
                                        </td>
                                        <td>
                                            <input id="TBFindSql" style="width: 23px; height: 22px" type="hidden" size="1" name="TBFindSql" runat="server" /></td>
                                        <td>
                                            <input id="TBOrderTxt" style="width: 23px; height: 22px" type="hidden" size="1" name="TBOrderTxt" runat="server" />
                                        </td>
                                        <td>
                                            <input id="ibtnSearchAcmWordNum" type="button" value="尋找動支編號" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" Width="600px" AutoGenerateColumns="False" AllowSorting="True"
                                    AllowPaging="True" PageSize="5">
                                    <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                    <ItemStyle Font-Size="Small" BackColor="WhiteSmoke"></ItemStyle>
                                    <HeaderStyle Font-Size="Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
                                        BackColor="#003366"></HeaderStyle>
                                    <Columns>
                                        <asp:ButtonColumn Text="□" HeaderText="選取" CommandName="Select">
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                            <HeaderStyle Width="30px" />
                                        </asp:ButtonColumn>
                                        <asp:BoundColumn DataField="csmYear" HeaderText="年度">
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="領用編號">
                                            <HeaderStyle Width="60px" CssClass="NotVisible"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" CssClass="NotVisible"></ItemStyle>
                                            <FooterStyle CssClass="NotVisible" />
                                            <ItemTemplate>
                                                <asp:Label ID="LBCsmNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="領用批號">
                                            <HeaderStyle Width="60px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblBatch" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BatchNo") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="csmSDate" HeaderText="領用日期">
                                            <HeaderStyle Width="60px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="csmCnt" HeaderText="領用數量">
                                            <HeaderStyle Width="60px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="csmMoney" HeaderText="領用金額" DataFormatString="{0:#,#}">
                                            <HeaderStyle Width="100px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="csmMemo" HeaderText="備註"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="帳別">
                                            <ItemTemplate>
                                                <asp:Label ID="LBSort" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.csName") %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csCode") & "," & DataBinder.Eval(Container, "DataItem.crCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table style="border-collapse: collapse" cellpadding="0" border="0">
                                    <tr>
                                        <td><font size="2">只列出｜</font></td>
                                        <td>&nbsp;<asp:DropDownList ID="DDLSortMonth" runat="server" Width="50px" AutoPostBack="True">
                                            <asp:ListItem Value="">......</asp:ListItem>
                                            <asp:ListItem Value="1">&#160;&#160;1月</asp:ListItem>
                                            <asp:ListItem Value="2">&#160;&#160;2月</asp:ListItem>
                                            <asp:ListItem Value="3">&#160;&#160;3月</asp:ListItem>
                                            <asp:ListItem Value="4">&#160;&#160;4月</asp:ListItem>
                                            <asp:ListItem Value="5">&#160;&#160;5月</asp:ListItem>
                                            <asp:ListItem Value="6">&#160;&#160;6月</asp:ListItem>
                                            <asp:ListItem Value="7">&#160;&#160;7月</asp:ListItem>
                                            <asp:ListItem Value="8">&#160;&#160;8月</asp:ListItem>
                                            <asp:ListItem Value="9">&#160;&#160;9月</asp:ListItem>
                                            <asp:ListItem Value="10">10月</asp:ListItem>
                                            <asp:ListItem Value="11">11月</asp:ListItem>
                                            <asp:ListItem Value="12">12月</asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_Sort" runat="server" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddl_PaymentKind" runat="server" AutoPostBack="true"
                                                Visible="False">
                                                <asp:ListItem Value="cash">零用金</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDLSortDep" runat="server" AutoPostBack="True"
                                                DataSourceID="sqlds_Unit" DataTextField="dptName" DataValueField="csuUnit" Visible="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <ComponentArt:Calendar ID="UCDate" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
        <ComponentArt:Calendar ID="UCDate2" runat="server" CalendarCssClass="calendar" CalendarTitleCssClass="title"
            ClientSideOnSelectionChanged="UCDate2_Change" CultureId="1028" DayCssClass="day"
            DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month"
            NextImageUrl="../images/cal_nextMonth.gif" OtherMonthDayCssClass="othermonthday"
            PickerFormat="Long" PopUp="Custom" PopUpExpandControlId="TBAcmMarkDate" PrevImageUrl="../images/cal_prevMonth.gif"
            SelectedDayCssClass="selectedday">
        </ComponentArt:Calendar>
        <asp:SqlDataSource ID="sqlds_Unit" runat="server"></asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </form>
</body>
</html>
