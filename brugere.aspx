<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="brugere.aspx.cs" Inherits="brugere" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataBrugere" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [brugere] ORDER BY [Id], [brugernavn]"></asp:SqlDataSource>

        <table class="table table-striped">

        <tr>
            <th>Id</th>
            <th>Navn</th>
            <th>Email</th>
            <th>Telefon</th>
            <th>Password</th>
        </tr>

    <asp:Repeater ID="RepeaterBrugere" DataSourceID="SqlDataBrugere" runat="server">

    


        <ItemTemplate>

            <tr>
                <th><%# Eval ("Id") %></th>
                <th><%# Eval ("brugernavn") %></th>
                <th><%# Eval ("email") %></th>
                <th><%# Eval ("telefon") %></th>
                <th><%# Eval ("password") %></th>
            </tr>

        </ItemTemplate>

</asp:Repeater>

    </table>

</asp:Content>

