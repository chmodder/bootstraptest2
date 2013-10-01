<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="PanelMsgFejl" runat="server" CssClass="alert alert-danger alert-dismissable" Visible="False">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Forkert</strong> Brugernavn aller password
           
    </asp:Panel>

    <div class="form-group">
        <label class="col-lg-2 control-label">Email</label>
        <div class="col-lg-10">
            <asp:TextBox ID="inputEmail1" CssClass="form-control" Placeholder="Email" runat="server"></asp:TextBox>
            <%--<input type="email" class="form-control" id="inputEmail1" placeholder="Email">--%>
        </div>

    </div>
    <div class="form-group">
        <label class="col-lg-2 control-label">Password</label>
        <div class="col-lg-10">
            <asp:TextBox ID="inputPassword1" CssClass="form-control" Placeholder="Password" runat="server"></asp:TextBox>
            <%--<input type="password" class="form-control" id="inputPassword1" placeholder="Password">--%>
        </div>

    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox">
                    Remember me
                </label>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <%--<button type="submit" class="btn btn-default">Sign in</button>--%>
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="btn btn-default" OnClick="ButtonLogin_Click" />
        </div>
    </div>


</asp:Content>

