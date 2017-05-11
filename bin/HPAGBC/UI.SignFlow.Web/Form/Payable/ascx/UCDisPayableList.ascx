<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCDisPayableList.ascx.cs" Inherits="UI.SignFlow.Web.Form.Payable.ascx.UCDisPayableList" %>
<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>
<asp:GridView ID="grid" runat="server" CssClass="gridstyle" 
    AutoGenerateColumns="false" OnRowCommand="grid_RowCommand" 
    onselectedindexchanged="grid_SelectedIndexChanged">
<Columns>

<asp:TemplateField HeaderText="表單類型">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("表單名稱")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="承辦人">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("承辦人") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="請購編號" ItemStyle-CssClass="num">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<asp:Literal ID="Num" Text='<%# Eval("請購編號")%>' runat="server" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="說明">
<ItemStyle HorizontalAlign="Left" CssClass="descript" />
<ItemTemplate><%# Eval("說明") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="確認核銷時間">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("確認核銷時間")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="執行">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<asp:HiddenField ID="CID" runat="server" Value='<%# Eval("CaseID") %>' />
<asp:HiddenField ID="FID" runat="server" Value='<%# Eval("FormID") %>' />
<asp:HiddenField ID="K" runat="server" Value='<%# Eval("FormPK") %>' />
<asp:Button ID="pay" Text="檢視" runat="server" CommandName="Pay" />
<asp:Button ID="modify" Text="修改" runat="server" CommandName="Modify" />
</ItemTemplate>
</asp:TemplateField>
</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataRowStyle CssClass="empty" />
<EmptyDataTemplate>尚無任何已報支案件。</EmptyDataTemplate>
</asp:GridView>
<TM:PagerStyle1 ID="pager" runat="server" PageSize="10" PageIndexParameterName="p" />
<asp:HiddenField ID="use" runat="server" Value="1" />
<asp:HiddenField ID="payurl" runat="server" Value="UI.Comm.Web/FrmActDataProxy.aspx" />