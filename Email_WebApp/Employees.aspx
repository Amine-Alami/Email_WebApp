<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Email_WebApp.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style7 {
        width: 307px;
        height: 119px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvitems" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="483px">    
        <AlternatingRowStyle BackColor="White" />
        <Columns>    
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MATRICULE" HeaderText="MATRICULE" ItemStyle-Width="30" >    
<ItemStyle Width="30px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="NOM" HeaderText="NOM" ItemStyle-Width="150" >    
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" ItemStyle-Width="200" >    
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
        </Columns>    
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <textarea id="TextArea1" name="S1" runat="server" class="auto-style7"></textarea>

</asp:Content>
