﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="brugere.aspx.cs" Inherits="brugere" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

        <table class="table table-striped">

        <tr>
            <th>Id</th>
            <th>Navn</th>
            <th>Email</th>
            <th>Telefon</th>
            <th>Password</th>
        </tr>

    <asp:Repeater ID="RepeaterBrugere" DataSourceID="SqlDataBrugere" runat="server"></asp:Repeater>

    


        <ItemTemplate>

            <tr>
                <th><%# Eval ("Id") %></th>
                <th><%# Eval ("navn") %></th>
                <th><%# Eval ("email") %></th>
                <th><%# Eval ("telefon") %></th>
                <th><%# Eval ("password") %></th>
            </tr>

        </ItemTemplate>



    </table>

</asp:Content>

