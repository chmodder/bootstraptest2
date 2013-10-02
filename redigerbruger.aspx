<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="redigerbruger.aspx.cs" Inherits="redigerbruger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Rediger bruger</h1>

    <div class="row">
        <div class="col-sm-6 col-md-4 col-lg-4">
            <%-- Besked --%>
            <%-- Div-boks med succes-meddelelse. Ikke synlig --%>
            <asp:Panel ID="PanelMsgSuccess" runat="server" CssClass="alert alert-success alert-dismissable" Visible="False">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Ændringerne</strong> er blevet gemt
            </asp:Panel>
            <%-- Div-boks med fejlmeddelelse. Ikke synlig --%>
            <asp:Panel ID="PanelMsgFejl" runat="server" CssClass="alert alert-danger alert-dismissable" Visible="False">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Ændringerne</strong> blev ikke gemt på grund af fejl.
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="skal udfyldes" ValidationGroup="form" ControlToValidate="TextBoxEmail" Display="Dynamic"></asp:RequiredFieldValidator>
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
                <div class="row row_med_billede_i_rediger_bruger_form">
                    <asp:Image ID="ImageAvater" runat="server" CssClass="col-xs-6 col-sm-4 col-md-3 col-lg-3"/>
                    <asp:Label ID="LabelAvatar" runat="server" Text="" CssClass="col-sx-6 col-sm-8 col-md-9 col-lg-9"></asp:Label>
                </div>
                <asp:FileUpload ID="FileUploadAvatar" runat="server" />
            </div>
            <asp:Button ID="ButtonRedigerBruger" runat="server" Text="Gem ændringer" CssClass="btn btn-success" OnClick="ButtonRedigerBruger_Click" ValidationGroup="form" />
            <a href="BrugereSDS.aspx" class="btn btn-default">Annuller</a>
        </div>
    </div>

</asp:Content>

