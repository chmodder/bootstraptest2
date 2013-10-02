<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="opretbruger.aspx.cs" Inherits="opretbruger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Opret ny bruger</h1>

    <div class="row">
        <div class="col-sm-6 col-md-4 col-lg-4">
            <%-- Besked --%>
            <%-- Div-boks med succes-meddelelse. Ikke synlig --%>
            <asp:Panel ID="PanelMsgSuccess" runat="server" CssClass="alert alert-success alert-dismissable" Visible="False">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Brugeren</strong> er blevet oprettet
            </asp:Panel>
            <%-- Div-boks med fejlmeddelelse. Ikke synlig --%>
            <asp:Panel ID="PanelMsgFejl" runat="server" CssClass="alert alert-danger alert-dismissable" Visible="False">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Bruger</strong> blev ikke oprettet på grund af fejl i filhåndtering.
            </asp:Panel>

            <%-- Inputfelter --%>
            <div class="form-group">
                <label>Brugernavn</label>
                <asp:TextBox ID="TextBoxNavn" runat="server" CssClass="form-control" Placeholder="Brugernavn"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNavn" runat="server" ErrorMessage="skal udfyldes" ValidationGroup="form" ControlToValidate="TextBoxNavn" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="skal udfyldes" ValidationGroup="form" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="er ikke en email adresse" ValidationGroup="form" ValidationExpression="\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\b" ControlToValidate="TextBoxEmail" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label>Telefon nummer</label>
                <asp:TextBox ID="TextBoxTelefon" runat="server" CssClass="form-control" Placeholder="Telefon nummer"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorTelefon" runat="server" ErrorMessage="er ikke et telefonnummer" ValidationGroup="form" ValidationExpression="\d{8}" ControlToValidate="TextBoxTelefon" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="skal udfyldes" ValidationGroup="form" ControlToValidate="TextBoxPassword" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Bruger billede</label>
                <asp:FileUpload ID="FileUploadAvatar" runat="server" />
            </div>
            <asp:Button ID="ButtonOpretBruger" runat="server" Text="Opret bruger" CssClass="btn btn-success" OnClick="ButtonOpretBruger_Click" ValidationGroup="form" />
        </div>
    </div>

</asp:Content>

