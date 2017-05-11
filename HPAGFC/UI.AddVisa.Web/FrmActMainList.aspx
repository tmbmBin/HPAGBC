<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmActMainList.aspx.cs" Inherits="UI.AddVisa.Web.FrmActMainList" %>
 

<%@ Import Namespace="MyExtensionsTools" %>
<%--<%@ Import Namespace="MyEncryptTools" %>--%>
<%@ Register assembly="MyDataPager" namespace="MyDataPager" tagprefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="5" style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" bgcolor="#dadee9" width="550">
            <tr>
                <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
                    <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <table border="0" width="100%" cellpadding="1" style="BORDER-COLLAPSE: collapse">
                                    <tr>
                                        <td align="right" class="auto-style1"><FONT face="新細明體">門別</FONT></td>
                                        <td align="left" class="auto-style2"><asp:DropDownList id="DDLAccKind" runat="server"></asp:DropDownList></td>
                                        <td align="right" class="auto-style1"><FONT face="新細明體">預算來源</FONT></td>
                                        <td align="left" class="auto-style3"><asp:DropDownList id="DDLBgtSource" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">經費單位</td>
                                        <td align="left" style="width: 200px"><asp:DropDownList id="DDLBgtDep" runat="server"></asp:DropDownList></td>
                                        <td align="right" style="width: 80px">承辦單位</td>
                                        <td align="left"><asp:DropDownList id="DDLWorkDep" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">承辦業務</td>
                                        <td align="left" style="width: 200px"><asp:DropDownList id="DDLWorkUnit" runat="server"></asp:DropDownList></td>
                                        <td align="right" style="width: 80px">簽證月份</td>
                                        <td align="left">
                                            <asp:dropdownlist id="DDLMonth" runat="server" AutoPostBack="True" Width="50px">
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
                                            </asp:dropdownlist>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">計畫</TD>
                                        <td align="left" colspan="3"><asp:DropDownList id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">用途別</td>
                                        <td align="left" colspan="3"><asp:DropDownList id="DDLOul" runat="server" 
                                                Width="400px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px;">承辦人員</td>
                                        <td align="left" ><asp:TextBox id="TBStaff" runat="server" Width="116px"></asp:TextBox></td>
                                        <td  align="right" style="width: 80px;">動支編號</td><td><asp:TextBox id="TBAcmWordNum" runat="server" Width="115px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">主檔事由</td>
                                        <td align="left" style="width: 200px"><asp:TextBox id="TBMemo" runat="server" Width="150px"></asp:TextBox></td>
                                        <td align="right" style="width: 80px">主檔金額</TD>
                                        <td align="left"><asp:TextBox id="TBMoney" runat="server" Width="116px" onkeypress="return check_Num()"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 80px">用途說明</td>
                                        <td align="left" style="width: 200px"><asp:TextBox id="TBAcvMemo" runat="server" Width="150px"></asp:TextBox></td>
                                        <td align="right" style="width: 80px">動支金額</td>
                                        <td align="left"><asp:TextBox id="TBacvMoney" runat="server" Width="116px" onkeypress="return check_Num()"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                    <asp:Button ID="btnList" runat="server" Text="列出資料" OnClick="btnList_Click" />
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        
                <table cellpadding="5" style="margin-top: 10px; margin-left: 10px; border-collapse: collapse" bgcolor="#dadee9" width="1000">
            <tr>
                <td bordercolor="#666668" style="BORDER-RIGHT:#666668 1pt solid; BORDER-TOP:#666668 1pt solid; BORDER-LEFT:#666668 1pt solid; BORDER-BOTTOM:#666668 1pt solid">
                    <table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="100%">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCreated="GridView1_RowCreated" >
                                    <AlternatingRowStyle BackColor="#DCDCDC"/>
                                    <Columns>
                                        <asp:TemplateField HeaderText="序號">
                                            <HeaderStyle Width="35px" />
                                            <ItemTemplate>
                                                <asp:Label ID="ctl_DataNo" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="明細資料">
                                            <ItemTemplate>
                                                <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/UI.ActProdApply.Web/FrmActApply.aspx?MenuID=1321&WorkStatus=Copy&acmYear=" + Eval("acmYear") + "&acmNo="+ Eval("acmNo") + "&acmTopWordNum=" +  Eval("acmWordNum")   %>'>瀏覽</asp:HyperLink>--%>
                                                <asp:HyperLink ID="HyperLink2" Target="_blank" runat="server" NavigateUrl='<%# "FrmActVisaDtl.aspx?acmYear=" + Eval("acmYear") + "&acmNo="+ Eval("acmNo") + "&acmWordNum=" +  Eval("acmWordNum")   %>'>瀏覽</asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" Width="60px" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="編輯">
                                            <ItemTemplate>
                                                <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/UI.ActProdApply.Web/FrmActApply.aspx?MenuID=1321&WorkStatus=Copy&acmYear=" + Eval("acmYear") + "&acmNo="+ Eval("acmNo") + "&acmTopWordNum=" +  Eval("acmWordNum")   %>'>瀏覽</asp:HyperLink>--%>
                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "../UI.Comm.Web/FrmActDataProxy.aspx?WorkStatus=Copy&acmYear=" + Eval("acmYear") + "&acmNo="+ Eval("acmNo") + "&acmTopWordNum=" +  Eval("acmWordNum")   %>'>瀏覽</asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="年度" SortExpression="acmYear">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# Eval("acmYear") %>'></asp:Label>
<input id="TBdgAcmNo" type="hidden" runat="server" value='<%# Eval("acmNo") %>'  />
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>                                    
                                        <asp:TemplateField HeaderText="請示日期" SortExpression="acmMarkDate">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmMarkDate" runat="server" Text='<%# Eval("acmMarkDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="動支編號" SortExpression="acmWordNum">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%#Eval("acmWordNum") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="承辦單位" SortExpression="acmWorkUnitName">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmWorkUnitName" runat="server" Text='<%#Eval("acmWorkUnitName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="承辦人員" SortExpression="acmWorkUserNo">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmWorkUserNo" runat="server" Text='<%#Eval("acmWorkUserNo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="動支金額" SortExpression="acmMoney">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmMoney" runat="server" Text='<%#Eval("acmMoney", "{0:#,0}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="控帳事由" SortExpression="acmMemo">
                                            <ItemTemplate>
                                                <asp:Label ID="LBdgAcmMemo" runat="server" Text='<%#Eval("acmMemo").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                    
                                    <asp:MyDataPager ID="MyDataPager1" runat="server" PageSize="10" OnPageChanged="MyDataPager1_PageChanged1" />
                                    
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
         
    </form>
</body>
</html>
