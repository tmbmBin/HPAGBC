<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCActPayVisaMix.ascx.vb" Inherits="UI.ActMixPay.UC.UCActPayVisaMix" %>
<table _ondblclick="alert('15:UCActPayVisaMix.ascx')" cellpadding="0" style="border-collapse: collapse; margin-top: -1; width: 100%" border="0">
    <tr>
        <td>
            <!-- ↓折疊項目(15) -->
            <table cellpadding="0" style="border-collapse: collapse; width: 100%" border="1" bordercolor="#FFFFFF">
                <tr>
                    <td height="20" class="sFoldTitle">
                        <table cellpadding="0" style="border-collapse: collapse" border="0">
                            <tr>
                                <td width="1%" align="right">
                                    <img id="img_FoldTitle_15" border="0" src="images/minus.gif" onclick="show_item('FoldTitle_15', this.id)" align="top" style="margin-left: 0px; cursor: hand" alt="Collapse/Expand" /></td>
                                <td width="99%" class="sFoldTitleFont" onclick="show_item('FoldTitle_15')">預算動支項目<font color="red" size="2pt">←請展開</font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FoldTitle_15" style="display: block" onpropertychange="sync_title_img(this)">
                    <td style="padding: 5px">
                        <table cellpadding="5" cellspacing="0" style="table-layout: fixed" border="0">
                            <tr>
                                <td width="150" align="right">
                                    <img id="img15" border="0" src="images/plus.gif" onclick="scale_item(this.id)" align="top" style="margin-left: -5px; cursor: hand" alt="Collapse/Expand" /><span style="cursor: hand" onclick='img15.fireEvent("onclick")'>預算動支項目</span></td>
                                <td width="440" style="padding-right: 0px">
                                    <div id="MyshowDeductReason" runat="server" visible="false">
                                        <asp:CheckBox ID="chkacpOption6" runat="server" Text="分期付款：" />
                                        第
                                        <asp:TextBox ID="txtacpWho6" runat="server" Width="20" MaxLength="2" onkeypress="return check_Num()" onfocus="this.select();"></asp:TextBox>
                                        期，扣款
                                        <asp:TextBox ID="txtacpWho26" runat="server" Width="50" onkeypress="return check_Num()" onfocus="this.select();"></asp:TextBox>
                                        元，扣款原因
                                        <asp:TextBox ID="txtacpWho36" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>

                                    <div id="div_UCActPayVisaMix" class="DIV4_width" alt="DIV1">
                                        <input type="hidden" id="savescrollpos" name="savescrollpos" runat="server" />
                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Width="1050px">
                                            <HeaderStyle Font-Size="X-Small" Wrap="False" HorizontalAlign="Center" ForeColor="White" BackColor="#003366"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
                                            <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                                            <SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <HeaderStyle Width="15px"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo" MyName="LBdgAcvNo" MyIndex='<%# Container.ItemIndex %>' MyParentIndex='<%# Container.ItemIndex %>' runat="server" Style="text-align: center" Width="15px" Text='<%# Container.ItemIndex + 1  %>' onclick="setShowBudget(this)"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="預付">
                                                    <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                        Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                                    <HeaderStyle Width="50px" Wrap="False" Font-Size="XX-Small"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="50px"></ItemStyle>
                                                    <ItemTemplate>
                                                        <input id="TBAcPrePayFlag" runat="server" type="hidden" myname="TBAcPrePayFlag" myindex='<%# Container.ItemIndex %>' />
                                                        <asp:Image ID="IMdAcvPrePayFlag" runat="server" ImageUrl="~/UI.ActMixPay.UC/images/PrePayFlag.png" ToolTip="本筆資料為預付" />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <HeaderTemplate>
                                                        <table style="table-layout: fixed; width: 830px" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 8pt; width: 30px; color: #ffffff; text-align: center">
                                                                    <asp:Label ID="LBPKDetailNoTitle" runat="server" Text="核銷明細號"></asp:Label></td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 30px; color: #ffffff; text-align: center">年</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 26px; color: #ffffff; text-align: center">月</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 66px; color: #ffffff; text-align: center">門別</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 66px; color: #ffffff; text-align: center;">預算來源</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 110px; color: #ffffff; text-align: center">經費單位</td>
                                                                <td style="border-right: #ffffff 1px solid; display: none; font-size: 10pt; width: 80px; color: #ffffff; text-align: center">承辦業務</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 200px; color: #ffffff; text-align: center">計畫科目</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 150px; color: #ffffff; text-align: center">用途別科目</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 90px; color: #ffffff; text-align: center">動支金額</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 110px; color: #ffffff; text-align: center;">就地審計</td>
                                                                <td style="border-right: #ffffff 1px solid; font-size: 10pt; width: 90px; color: #ffffff; text-align: center; display: none" myname="gpTrl">分攤機關</td>
                                                                <td style="font-size: 10pt; width: 60px; color: #ffffff; text-align: center">新增移除</td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                        <table style="margin-left: 0px; table-layout: fixed" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="left">
                                                                    <table style="margin-left: 0px; table-layout: fixed" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="border-right: #ffffff 1px solid; width: 30px;"></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 30px;">
                                                                                <asp:TextBox ID="TBdgBgtYear" runat="server" Width="30px" onfocus="this.blur();" Style="text-align: center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtYear"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 26px;">
                                                                                <asp:TextBox ID="TBdgBgtMonth" runat="server" Width="25px" onfocus="this.blur();" Style="text-align: center" MyIndex="<%# Container.ItemIndex  %>" MyName="TBdgBgtMonth"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 66px;">
                                                                                <asp:TextBox ID="TBdgAccKindName" runat="server" Width="65px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAccKindName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 66px;">
                                                                                <asp:TextBox ID="TBdgBgtSourName" runat="server" Width="65px" onfocus="this.blur()" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtSourName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 110px;">
                                                                                <asp:TextBox ID="TBdgBgtDepName" runat="server" Width="109px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBgtDepName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 80px; display: none;">
                                                                                <asp:TextBox ID="TBdgBizName" runat="server" Width="79px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgBizName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 200px;">
                                                                                <asp:TextBox ID="TBdgPlanName" runat="server" Width="197px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgPalnName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 150px;">
                                                                                <asp:TextBox ID="TBdgOulName" runat="server" Width="150px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgOulName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 90px;">
                                                                                <asp:TextBox ID="TBdgAcvMoney" runat="server" Width="90px" onfocus="this.blur();" Style="text-align: right" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgAcvMoney"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 110px;">
                                                                                <asp:TextBox ID="TBdgInspectName" runat="server" Width="110px" onfocus="this.blur();" MyIndex="<%# Container.ItemIndex %>" MyName="TBdgInspectName"></asp:TextBox></td>
                                                                            <td style="border-right: #ffffff 1px solid; width: 90px; display: none" myname="gpTrl">&nbsp; </td>
                                                                            <td style="font-size: 10pt; width: 40px; color: #ffffff; text-align: center">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="12" align="left">
                                                                                <asp:DataList ID="DataList1" runat="server" Style="margin-right: 0px" OnItemCreated="DataList1_ItemCreated" OnItemDataBound="DataList1_ItemDataBound">
                                                                                    <ItemTemplate>
                                                                                        <table style="margin-left: 0px; table-layout: fixed" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td style="border-right: #ffffff 1px solid; text-align: center; width: 30px; font-size: 10px" nowrap>
                                                                                                    <asp:Label ID="LBdlPKDetailNo" runat="server" Text="" ToolTip="請於核銷後將此編號抄寫至憑證上"></asp:Label></td>
                                                                                                <td style="border-right: #ffffff 1px solid; text-align: right; width: 30px" nowrap>
                                                                                                    <asp:Image ID="IMdlacvExchNo" runat="server" ImageUrl="~/Images/034.gif" /></td>
                                                                                                <td style="border-right: #ffffff 1px solid; text-align: center" width="26px" nowrap>
                                                                                                    <asp:Label ID="LBdlNo" runat="server" widht="25px" Style="text-align: center; cursor: help" onclick="setShowBudget(this)"><%# Container.ItemIndex +1 %></asp:Label>&nbsp;&nbsp;</td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 66px;">
                                                                                                    <asp:DropDownList ID="DDLdlAccKind" runat="server" Width="65px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlAccKind"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 66px;">
                                                                                                    <asp:DropDownList ID="DDLdlBgtSour" runat="server" Width="65px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBgtSour"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 110px;">
                                                                                                    <asp:DropDownList ID="DDLdlBgtDepName" runat="server" Width="109px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBgtDepName"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 80px; display: none;">
                                                                                                    <asp:DropDownList ID="DDLdlBizName" runat="server" Width="79px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlBizName"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 200px;">
                                                                                                    <asp:DropDownList ID="DDLdlPlanName" runat="server" Width="197px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlPlanName" AutoPostBack="true" onmousedown="tranSeleGroup(this, '*');"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 150px;">
                                                                                                    <asp:DropDownList ID="DDLdlOulName" runat="server" Width="150px" Style="background-color: #FFFFE0" MyIndex="<%# Container.ItemIndex %>" MyName="DDLdlOulName" onmousedown="tranSeleGroup(this, '*');"></asp:DropDownList></td>
                                                                                                <%-- CheckUpLevlMoney(this);GetTotalPayMoney(); --%>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 90px;">
                                                                                                    <asp:TextBox ID="TBdlAcvMoney" runat="server" Width="90px" onfocus="this.value=replaceString(this.value,',','');this.select()" Style="background-color: #FFFFE0; text-align: right" onkeypress="javascript:MoneyOnly();" MyName="TBdlAcvMoney" onblur=" if(this.value != ''){this.value=fmtMoney(this.value,0 , '.', ',');};"></asp:TextBox></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 110px;">
                                                                                                    <asp:DropDownList ID="DDLdlInspect" runat="server" Width="110px" MyName="DDLdlInspect"></asp:DropDownList></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 90px; display: none">
                                                                                                    <asp:TextBox ID="TBdlAcvDesc" runat="server" Width="90px" Style="background-color: #FFFFE0;" MyName="TBdlAcvDesc"></asp:TextBox></td>
                                                                                                <td style="border-right: #ffffff 1px solid; width: 30px; background-color: #FFFFE0">
                                                                                                    <asp:CheckBox ID="CBdlDel" runat="server" ToolTip="移除本列資料" Enabled="false" />
                                                                                                    <input id="TBdlExchNo" runat="server" type="hidden" myname="TBdlExchNo" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlTranID" runat="server" type="hidden" myname="TBdlTranID" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlTranBNo" runat="server" type="hidden" myname="TBdlTranBNo" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlTranDTime" runat="server" type="hidden" myname="TBdlTranDTime" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlTranUser" runat="server" type="hidden" myname="TBdlTranUser" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlAcvMixPayGrpNo" runat="server" type="hidden" myname="TBdlAcvMixPayGrpNo" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlVisaNo" runat="server" type="hidden" myname="TBdlVisaNo" myindex='<%# Container.ItemIndex %>' />
                                                                                                    <input id="TBdlDetailNo" runat="server" type="hidden" myname="TBdlDetailNo" myindex='<%# Container.ItemIndex %>' />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="width: 20px" valign="bottom">
                                                                    <asp:Button ID="BtnSplit" runat="server" Style="margin-bottom: 4px" Text="+" CssClass="<%# Container.ItemIndex %>" MyName="BtnSplit" MyIndex="<%# Container.ItemIndex %>" OnClick="BtnSplit_Click" Height="21px"></asp:Button></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="結案">
                                                    <HeaderStyle Width="80px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="X-Small" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"></HeaderStyle>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="False" />
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:CheckBox ID="CBdgClose" runat="server" Enabled="false" MyName="BtnClose" MyIndex="<%# Container.ItemIndex %>" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="bottom">
                                                                    <asp:TextBox ID="TBdgAdjustMoney" runat="server" Style="margin-bottom: 2px; text-align: right" MyName="TBdgAdjustMoney" MyIndex="<%# Container.ItemIndex %>" Width="80px" Enabled="false" ToolTip="繳回金額"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="bottom">
                                                                    <asp:TextBox ID="TBdgRePayNo" runat="server" Style="margin-bottom: 2px; text-align: center" MyName="TBdgRePayNo" MyIndex="<%# Container.ItemIndex %>" Width="80px" Enabled="false" ToolTip="繳回號碼"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <!-- Insert 項目內容 here -->
                    </td>
                </tr>
            </table>
            <!-- 折疊項目(15)↑ -->
        </td>
    </tr>
</table>
