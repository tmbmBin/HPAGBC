﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCSignRec.ascx.cs" Inherits="UI.SignFlow.Web.iSignForm.ascx.UCSignRec" %>
<asp:Panel ID="progress" runat="server">
<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false">

<Columns>

<asp:TemplateField HeaderText="關卡審核角色">
<ItemStyle HorizontalAlign="Center" Width="180px" />
<ItemTemplate><%# Eval("簽核人員")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="簽核人員">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate><%# Eval("實際簽核者") %></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="審核結果">
<ItemStyle HorizontalAlign="Center" Width="60px" />
<ItemTemplate><%# Eval("審核結果")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="加註意見">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate><%# Eval("簽核意見")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="簽核日期時間">
<ItemStyle HorizontalAlign="Center" Width="140px" />
<ItemTemplate><%# Eval("簽核日期時間")%></ItemTemplate>
</asp:TemplateField>

</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataTemplate>未設定關卡流程，請洽系統管理人員。</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>