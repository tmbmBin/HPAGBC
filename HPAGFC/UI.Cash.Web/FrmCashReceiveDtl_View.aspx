<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCashReceiveDtl_View.aspx.vb" Inherits="UI.Cash.Web.FrmCashReceiveDtl_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: auto; margin-top: 5">
        <tr>
            <td>
                <asp:HiddenField ID="hid_csmYear" runat ="server" />
                <asp:HiddenField ID="hid_csmBatchNo" runat="server" />
                <asp:HiddenField ID="hid_CreatSDTime" runat="server" />
                <asp:HiddenField ID="hid_CreatEDTime" runat ="server" />
                <asp:HiddenField ID="hid_PayCode" runat ="server" />
            </td>
        </tr>
                            <tr>
                                <td width="700">
                                <div id="freezingDivG2">
                                <asp:DataGrid id="DataGrid1" runat="server" style="TABLE-LAYOUT: fixed" BorderStyle="None" BackColor="White" CellSpacing="1" CellPadding="3" GridLines="None" AutoGenerateColumns="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Font-Size="Small" >
                                    <HeaderStyle forecolor="White" backcolor="#003366" font-size="Small" horizontalalign="Center" wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
                                    <ItemStyle backcolor="WhiteSmoke" font-size="Small" horizontalalign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                                    <AlternatingItemStyle backcolor="#E0E0E0"></AlternatingItemStyle>
                                    <Columns>

                                        <asp:TemplateColumn HeaderText="序號">
                                            <HeaderStyle wrap="False" width="30px"></HeaderStyle>
                                            <ItemStyle backcolor="White"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmDNo" runat="server" style="TEXT-ALIGN: center; margin-top: -1" Width="35px" Text='<%# DataBinder.Eval(Container, "ItemIndex") + 1 %>' ToolTip='<%# DataBinder.Eval(Container, "DataItem.csmDNo") %>' class="removeBorder" onfocus="this.blur();" onblur="this.className='removeBorder'"></asp:label>
                                                <input type="hidden" id="hid_csmYear" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.csmYear") %>' />
                                                <input type="hidden" id="hid_csmMainNo" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.csmMainNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="狀態">
                                            <HeaderStyle wrap="False" horizontalalign="Center" width="70px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_cmsStatus" runat="server" width="100%" MaxLength="7" text='<%# DataBinder.Eval(Container, "DataItem.cmsStatus")%>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="批號">
                                            <HeaderStyle wrap="False" horizontalalign="Center" width="70px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmBatchNo" runat="server" width="100%" MaxLength="7" text='<%# DataBinder.Eval(Container, "DataItem.csmBatchNo") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="員工編號">
                                            <HeaderStyle wrap="False" horizontalalign="Center" width="70px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmEmpNum" runat="server" width="100%" MaxLength="7" text='<%# DataBinder.Eval(Container, "DataItem.csmEmpNum") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="受款人名稱">
                                            <HeaderStyle wrap="False" horizontalalign="Center" width="80px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmPayName" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayName") %>' ondblclick='requestInfo_accName(this.id,"text_csmPayName");' ToolTip="雙擊可選取受款人"></asp:label>
                                                <input type="hidden" id="hid_payCode" runat="server" name="hid_payCode" runat="server" value='<%# DataBinder.Eval(Container, "DataItem.payCode") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="摘要">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="200px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmPayMemo" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPayMemo") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="單據張數" Visible="false" >
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmPayCnt" runat="server" width="100%" style="TEXT-ALIGN: center" MaxLength="3" text='<%# DataBinder.Eval(Container, "DataItem.csmPayCnt") %>' onkeypress="return check_Num()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="金額">
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="70px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmAmount" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmAmount", "{0:#,#0}") %>' onkeypress="return check_Num()" onblur="AddToBill(this.id, 'text_csmAmount');"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="手續費" Visible ="false" >
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmFee" runat="server" width="100%" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmFee", "{0:#,#0}") %>' onkeypress="return check_Num()" onblur="AddToBill(this.id, 'text_csmFee');"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="實付金額" Visible ="false" >
                                             <HeaderStyle wrap="False" horizontalalign="Center" width="1px"></HeaderStyle>
                                            <ItemStyle horizontalalign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmBillAmount" runat="server" width="100%" BackColor="Transparent" style="TEXT-ALIGN: right" text='<%# DataBinder.Eval(Container, "DataItem.csmBillAmount", "{0:#,#0}") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="備註" Visible ="false" >
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="1px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmPaySubMemo" runat="server" width="100%" text='<%# DataBinder.Eval(Container, "DataItem.csmPaySubMemo") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="總行">
                                            <HeaderStyle wrap="False" width="40px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmBankNo" runat="server" style="TEXT-ALIGN: center;" Width="40px" MaxLength="3" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankNo") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="分行代號">
                                            <HeaderStyle wrap="False" width="60px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmBankSubNo" runat="server" style="TEXT-ALIGN: center;" Width="60px" MaxLength="20" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankSubNo") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="銀行名稱" Visible ="false" >
                                            <HeaderStyle wrap="False" width="0px"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmBankName" runat="server" style="TEXT-ALIGN: left;" Width="120px" MaxLength="82" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmBankName") %>' ondblclick='requestInfo_codBankSubName(this.id,"text_csmBankName");' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="銀行帳號">
                                            <HeaderStyle wrap="False" width="80px" forecolor="Red"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmAccountNo" runat="server" style="TEXT-ALIGN: left;" Width="100px" MaxLength="20" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountNo") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="帳戶名稱">
                                            <HeaderStyle wrap="False" width="100px"></HeaderStyle>
                                            <ItemStyle backcolor="#E2FFD7"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmAccountName" runat="server" style="TEXT-ALIGN: left;" Width="120px" MaxLength="160" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountName") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="身分證號">
                                            <HeaderStyle wrap="False" width="100px"></HeaderStyle>
                                            <ItemStyle backcolor="#F0FFFF"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmAccountID" runat="server" style="TEXT-ALIGN: left;" Width="100px" MaxLength="10" class="removeBorder" Text='<%# DataBinder.Eval(Container, "DataItem.csmAccountID") %>' onfocus="this.blur()"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="電子郵件">
                                            <HeaderStyle wrap="False" horizontalalign="Left" width="150px"></HeaderStyle>
                                            <ItemStyle wrap="False"></ItemStyle>
                                            <ItemTemplate>
                                                <%--<asp:CheckBox id="chk_Email" runat="server" Font-Names="Verdana" Font-Size="8pt" myKey='<%# DataBinder.Eval(Container, "DataItem.csmDNo") %>' ToolTip="發送通知至此信箱"></asp:CheckBox>--%>
                                                <asp:label id="text_csmEMail" runat="server" width="100%" class="removeBorder" text='<%# DataBinder.Eval(Container, "DataItem.csmEMail") %>' ></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="電郵通知日期">
                                            <HeaderStyle wrap="False" width="70px"></HeaderStyle>
                                            <ItemStyle backcolor="#F8F8FF"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:label id="text_csmEMailSendDate" runat="server" style="TEXT-ALIGN: center;" Width="70px" Text='<%# DataBinder.Eval(Container, "DataItem.csmEMailSendDate") & ""%>' class="removeBorder"></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="移除" Visible ="false" >
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
    </div>
    </form>
</body>
</html>
