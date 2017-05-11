<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCPrePayList.ascx.cs" Inherits="UI.SignFlow.Web.Form.Expense.ascx.UCPrePayList" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>
<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false" OnRowCommand="grid_RowCommand">
<Columns>

<asp:TemplateField HeaderText="表單類型">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("表單名稱")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="單據編號" ItemStyle-CssClass="num">
<ItemStyle HorizontalAlign="Center" Width="60px" />
<ItemTemplate><asp:Literal ID="Num" Text='<%# Eval("單據編號")%>' runat="server" /></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="說明">
<ItemStyle HorizontalAlign="Left" />
<ItemTemplate><asp:Literal ID="Descript" runat="server" Text='<%# Eval("說明") %>'></asp:Literal></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="申請資訊">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<%# Eval("承辦人") %> 先生/小姐
<br />
<%# Eval("流程開始時間")%>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="決行資訊">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<%# Eval("決行人")%> 先生/小姐
<br />
<%# Eval("決行時間")%>
</ItemTemplate>
</asp:TemplateField> 

<asp:TemplateField HeaderText="執行">
<ItemStyle HorizontalAlign="Center" Width="210px" />
<ItemTemplate>
<asp:HiddenField ID="CID" runat="server" Value='<%# Eval("CaseID") %>' />
<asp:HiddenField ID="FID" runat="server" Value='<%# Eval("FormID") %>' />
<asp:HiddenField ID="K" runat="server" Value='<%# Eval("FormPK") %>' />
<%--<asp:Button ID="back" Text="退上一關" runat="server" CommandName="BackToPreviouLevel" OnClientClick="if(!confirm('確定退回?'))return false;"
 Enabled='<%# Eval("EnableBackToPrevious") %>' />--%>
<asp:Button ID="exp" Text="修改" runat="server" CommandName="Expense" OnClientClick="if(!confirm('確定修改預支?'))return false;" 
Enabled='<%# Eval("EnablePrexpense") %>' />
</ItemTemplate>
</asp:TemplateField>
</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataRowStyle CssClass="empty" />
<EmptyDataTemplate>
無任何資料。
</EmptyDataTemplate>
</asp:GridView>
<TM:PagerStyle1 ID="pager" runat="server" PageSize="10" PageIndexParameterName="p" />
<asp:HiddenField ID="use" runat="server" Value="1" />
<asp:HiddenField ID="expenseurl" runat="server" Value="UI.ATDPageProxy.Web/FrmSFWProxy.aspx" />