<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Email_WebApp.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="ProfileFilesbootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="ProfileFilescss/Profile-Edit-Form-1.css">
    <link rel="stylesheet" href="ProfileFilescss/Profile-Edit-Form.css">
    <link rel="stylesheet" href="ProfileFilescss/styles.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container profile profile-view" id="profile">
        <div class="row">
            <div class="col-md-12 alert-col relative">
                <div class="alert alert-info absolue center" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><span>Profile save with success</span></div>
            </div>
        </div>
            <div class="form-row profile-row">
                <div class="col-md-4 relative">
                    <div class="avatar">
                        <div class="avatar-bg center"></div>
                    </div>
                    <input type="file" class="form-control" name="avatar-file">
                </div>
                <div class="col-md-8">
                    <h1>Profile </h1>
                    <hr>

                    <div class="form-row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Matricule </label><input class="form-control" type="text" name="firstname"></div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Prenom </label><input class="form-control" type="text" name="lastname"></div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Prenom </label><input class="form-control" type="text" name="lastname"></div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Email </label><input class="form-control" type="email" autocomplete="off" required="" name="email"></div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Ancient mot de passe </label><input class="form-control" type="password" name="password" autocomplete="off" required=""></div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Nouveau mot de passe</label><input class="form-control" type="password" name="confirmpass" autocomplete="off" required=""></div>
                        </div>
                    </div>
                    <hr>
                    <div class="form-row">
                        <div class="col-md-12 content-right">
                            <button class="btn btn-primary form-btn" type="submit">SAVE </button>
                            <button class="btn btn-danger form-btn" type="reset">CANCEL </button>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <script src="ProfileFilesjs/jquery.min.js"></script>
    <script src="ProfileFilesbootstrap/js/bootstrap.min.js"></script>
    <script src="ProfileFilesjs/Profile-Edit-Form.js"></script>

</asp:Content>
