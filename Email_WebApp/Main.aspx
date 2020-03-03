<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Email_WebApp.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 307px;
            height: 119px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvitems" runat="server" AutoGenerateColumns="False" Width="483px">    
        <Columns>    
            <asp:CheckBoxField />
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
    </asp:GridView>
    <textarea id="TextArea1" name="S1" runat="server" class="auto-style7"></textarea>

</asp:Content>
