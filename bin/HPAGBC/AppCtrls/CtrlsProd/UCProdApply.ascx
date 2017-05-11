﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProdApply.ascx.vb" Inherits="AppCtrls.UCProdApply" %>
<script language="javascript">


    function check_Num() {
        if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
            return true;
        }
        else { event.keyCode = 0; false; }
    }



</script>

<table _ondblclick="alert('20:UCProdApply.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
    <tr>
        <td>
            <!-- ↓折疊項目(20) -->
            <table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
                <tr>
                    <td height="20" class="sFoldTitle">
                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                            <tr>
                                <td width="1%" align="right">
                                    <img id="img_FoldTitle_20" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_20', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_20')">請購項目<font color="red" size="2pt">←請展開</font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_20" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">

                        <table cellpadding="5" cellspacing="0" style="table-layout: fixed" border="0">
                            <tr style="display: none">
                                <td width="620" colspan="2">
                                    <asp:TextBox ID="TBAcmYear" runat="server" Width="50px"></asp:TextBox><asp:TextBox ID="TBAcmMonth" runat="server" Width="50px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td width="100" align="right">
                                    <img id="img20" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" />
                                    <span style="cursor: hand" onclick='img20.fireEvent("onclick")'>請購項目</span></td>
                                <td width="520" align="right" style="padding-right: 0px">
                                    <table border="0" cellpadding="0" style="border-collapse: collapse">
                                        <tr>
                                            <td><font size="2">最低價格合計｜</font></td>
                                            <td>
                                                <asp:TextBox ID="TBExtraTotal" runat="server" MyName="TBExtraTotal" Style="text-align: right" BackColor="Transparent" Width="90px" onkeypress="return check_Num()" onfocus="this.blur();"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <div id="div_UCProdApply" class="DIV2_width" alt="DIV2">
                                        <asp:DataGrid ID="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False">
                                            <HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
                                            <ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
                                            <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
                                            <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <HeaderStyle Width="15px"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small" HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgNo" runat="server"><%# Container.ItemIndex +1 %></asp:Label>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="140" style="display: none">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:TextBox ID="TBdgMinPrice" runat="server" Width="70px" MyName="TBdgMinPrice" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="1"></asp:TextBox></td>
                                                                <td align="center">
                                                                    <asp:TextBox ID="TBdgMinMoney" runat="server" Width="70px" MyName="TBdgMinMoney" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="1"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="品　　　　名">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <asp:Literal ID="LdgProdName" runat="server">品　　　　　　名<font size=2 color=red>(限22個字)</font> </asp:Literal>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgProdName" runat="server" Width="200" ondblclick="fnCallPhraseDialog(this.id);" MyName="TBdgProdName" MyIndex="<%# Container.ItemIndex%>" Style="background-color: #ffffe0" MaxLength="22"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <%--20151015 [add]:增加費用申請單費用別欄位--%>
                                                <asp:TemplateColumn HeaderText="費用別" Visible="false">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <asp:Literal ID="LdgType" runat="server">費用別</asp:Literal>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="DDLdgType" runat="server" Width="200" Style="background-color: #FFFFE0" MyName="DDLdgType" MyIndex='<%# Container.ItemIndex %>'>
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="規　　　　格">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <asp:Literal ID="LdgProdRule" runat="server">規　　　　格<br /><font size=2 color=red>(限100個字)</font> </asp:Literal>
                                                    </HeaderTemplate>

                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgProdRule" runat="server" Width="80" ondblclick="fnCallPhraseDialog(this.id);" MyName="TBdgProdRule" MyIndex="<%# Container.ItemIndex%>" Style="background-color: #ffffe0" MaxLength="100"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用　途　說　明">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgAcdMemo" runat="server" Width="150" ondblclick="fnCallPhraseDialog(this.id);" MyName="TBdgAcdMemo" MyIndex="<%# Container.ItemIndex%>" Style="background-color: #ffffe0"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="單位">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgProdUnit" runat="server" Width="30" Style="text-align: center; background-color: #ffffe0" MyName="TBdgProdUnit" MyIndex="<%# Container.ItemIndex%>"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="數量">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"></HeaderStyle>
                                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgProdQry" runat="server" Width="50" Style="text-align: center; background-color: #ffffe0" MyName="TBdgProdQry" MyIndex="<%# Container.ItemIndex%>" onkeypress="return check_Num()" onblur="GetRowTotal(this);GetMinCol();"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="廠商1" Visible="true">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" Wrap="False" Width="140px"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <table border="0" width="100%" cellpadding="1" cellspacing="0" style="height: 100%; table-layout: fixed; margin-left: -20; margin-right: -10; vertical-align: middle; text-align: center;">

                                                            <tr style="height: 100%;">
                                                                <td style="color: #ffffff; vertical-align: middle; text-align: center; padding-top: 10px; height: 100%; border-right: #ffffff 1px solid;"><font size="2" color="white">單價</font></td>
                                                                <td style="color: #ffffff; vertical-align: middle; text-align: Center; padding-top: 10px;"><font size="2" color="white">總價</font></td>
                                                            </tr>
                                                            <%--20150826 [mdf]:隱藏 廠商--%>
                                                            <%--   <tr>--%>
                                                            <tr style="display: none; height: 100%; border-right: #ffffff 1px solid;">
                                                                <td valign="top" colspan="2" style="color: #ffffff; text-align: Center"><font size="2" color="white">廠商</font>
                                                                    <asp:TextBox ID="TBdgProdFactory1" runat="server" Width="100" MyName="TBdgProdFactory1" Enabled="false"></asp:TextBox></td>
                                                            </tr>
                                                            <tr style="display: none; height: 100%; border-right: #ffffff 1px solid;">
                                                                <td valign="top" colspan="2" style="color: #ffffff; text-align: Center"><font size="2" color="white">總價</font>
                                                                    <asp:TextBox ID="TBdgProdMoney1" runat="server" Width="100" MyName="TBdgProdMoney1" Enabled="false" Style="background-color: #ffffe0; text-align: right" onfocus="this.blur()"></asp:TextBox></td>
                                                            </tr>


                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Size="X-Small" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgPrice1" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px"
                                                            onFocus="this.select();" onkeypress="return check_Num()" onblur="GetRowTotal(this);GetMinCol();" MyName="TBdgPrice1" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="1"></asp:TextBox>
                                                        <asp:TextBox ID="TBdgMoney1" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px" onFocus="this.select();" onkeypress="return check_Num()" MyName="TBdgMoney1" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="1" onblur="GetMinCol(this);"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <%--20150826 [mdf]:隱藏 廠商2--%>
                                                <%--	<asp:TemplateColumn HeaderText="廠商2" Visible="true">--%>
                                                <asp:TemplateColumn HeaderText="廠商2" Visible="false">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" Wrap="False" Width="140px"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <table border="0" width="100%" cellpadding="1" cellspacing="0" height="100%" style="table-layout: fixed; margin-left: -20; margin-right: -10; margin-top: -3; margin-bottom: -3">
                                                            <tr>
                                                                <td valign="top" colspan="2" style="color: #ffffff; border-bottom: #ffffff 1px solid; text-align: Center"><font size="2" color="white">廠商</font>
                                                                    <asp:TextBox ID="TBdgProdFactory2" runat="server" Width="100" MyName="TBdgProdFactory2" Enabled="false"></asp:TextBox></td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td valign="top" colspan="2" style="color: #ffffff; border-bottom: #ffffff 1px solid; text-align: Center"><font size="2" color="white">總價</font>
                                                                    <asp:TextBox ID="TBdgProdMoney2" runat="server" Width="100" MyName="TBdgProdMoney2" Enabled="false" Style="background-color: #ffffe0; text-align: right" onfocus="this.blur()"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="bottom" align="center" style="color: #ffffff; border-right: #ffffff 1px solid; text-align: Center"><font size="2" color="white">單價</font></td>
                                                                <td valign="bottom" align="center" style="color: #ffffff; text-align: Center; padding-top: 5px"><font size="2" color="white">總價</font></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Size="X-Small" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TBdgPrice2" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px" onFocus="this.select();" onkeypress="return check_Num()" onblur="GetRowTotal(this);GetMinCol();" MyName="TBdgPrice2" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="2"></asp:TextBox>
                                                        <asp:TextBox ID="TBdgMoney2" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px" onFocus="this.select();" onkeypress="return check_Num()" MyName="TBdgMoney2" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="2"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="廠商3" Visible="false">
                                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" Wrap="False" Width="160px"></HeaderStyle>
                                                    <HeaderTemplate>
                                                        <table border="0" width="100%" cellpadding="1" cellspacing="0" height="100%" style="table-layout: fixed; margin-left: -20; margin-right: -10; margin-top: -3; margin-bottom: -3">
                                                            <tr>
                                                                <td valign="top" colspan="2" style="color: #ffffff; border-bottom: #ffffff 1px solid; text-align: Center"><font size="2" color="white">廠商</font>
                                                                    <asp:TextBox ID="TBdgProdFactory3" runat="server" Width="100" MyName="TBdgProdFactory3" Enabled="false" Style="background-color: #ffffe0"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" colspan="2" style="color: #ffffff; border-bottom: #ffffff 1px solid; text-align: Center"><font size="2" color="white">總價</font>
                                                                    <asp:TextBox ID="TBdgProdMoney3" runat="server" Width="100" MyName="TBdgProdMoney3" Enabled="false" Style="background-color: #ffffe0; text-align: right" onfocus="this.blur()"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="bottom" align="center" style="color: #ffffff; border-right: #ffffff 1px solid; text-align: Center"><font size="2" color="white">單價</font></td>
                                                                <td valign="bottom" align="center" style="color: #ffffff; text-align: Center; padding-top: 5px"><font size="2" color="white">總價</font></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemStyle Font-Size="X-Small" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="140">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:TextBox ID="TBdgPrice3" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px" onFocus="this.select();" onkeypress="return check_Num()" onblur="GetRowTotal(this);GetMinCol();" MyName="TBdgPrice3" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="3"></asp:TextBox></td>
                                                                <td align="center">
                                                                    <asp:TextBox ID="TBdgMoney3" Style="text-align: right; background-color: #FFFFE0" runat="server" Width="70px" onFocus="this.select();" onkeypress="return check_Num()" MyName="TBdgMoney3" MyIndex="<%# Container.ItemIndex  %>" MyColIndex="3"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="移除">
                                                    <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="DarkOrange" Width="30px"></HeaderStyle>
                                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <input id="CBdgDel" type="checkbox" runat="server" tooltip="移除勾選的資料列" myname="CBdgDel" myindex="<%# Container.ItemIndex %>" onclick="GetMinCol(this);" />&nbsp;
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                                            <PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="3" style="border-collapse: collapse; margin-bottom: -2px; width: 100%" border="0">
                            <tr>
                                <td>
                                    <asp:Button ID="BtnAddRow" runat="server" Width="75px" Height="22px" Text="增加列數" Enabled="False"></asp:Button>
                                    <asp:TextBox ID="TBQty" runat="server" Width="60px" ToolTip="指定增加列數1~20列"
                                        onkeypress="return check_Num()" Style="text-align: center" Enabled="False">1</asp:TextBox>
                                </td>
                                <td align="right"></td>
                            </tr>
                        </table>
                        <!-- Insert 項目內容 here -->
                    </td>
                </tr>
            </table>
            <!-- 折疊項目(20)↑ -->
        </td>
    </tr>
</table>
