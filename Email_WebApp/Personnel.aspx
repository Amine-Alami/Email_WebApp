<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Personnel.aspx.cs" Inherits="Email_WebApp.Personnel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="assets/css/Filter.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .treeview{
            max-height: 300px;
            max-width:250px; 
            overflow: auto;
            margin : auto;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div style="margin:2%">
        <div class="container-fluid">

            <%-- DASHBOARD --%>
            <div class="d-sm-flex justify-content-between align-items-center mb-4">
                <h3 class="text-dark mb-0">Dashboard</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#"><i class="fa fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
            </div>
            <br /><br /><br />
            <%-- CARDS --%>
            <asp:UpdatePanel ID="UpdatePanelCards" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6 col-xl-6 mb-6">
                            <div class="card shadow border-left-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span>Total jours</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalEmp" runat="server"></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fa fa-users fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-6 mb-6">
                            <div class="card shadow border-left-success py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-success font-weight-bold text-xs mb-1"><span>Total heures</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalHs" runat="server"></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fa fa-calendar fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>             
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="TextBoxAU" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="TextBoxDU" EventName="TextChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
            
            <div class="card shadow">
                <div class="card-header py-3">
                    <p class="text-primary m-0 font-weight-bold">Employee Info</p>
                </div>
                <div class="card-body">
                    <%-- Filter --%>
                    <div class="filter">
                        <div class="row">
                            <div class="col-lg-6" style="text-align:center">
                                <asp:TextBox ID="TextBoxDU" textmode="Date" runat="server" AutoPostBack="True" OnTextChanged="TextBoxDU_TextChanged"></asp:TextBox>
                            </div>
                            <div class="col-lg-6" style="text-align:center">
                                <asp:TextBox ID="TextBoxAU" textmode="Date" runat="server" AutoPostBack="True" OnTextChanged="TextBoxAU_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- TABLE --%>
                <div class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info" >
                    <%-- GridView --%>
                    <asp:UpdatePanel ID="UpdatePanelGridView" runat="server">
                        <ContentTemplate>
                            <div style="max-height: 700px; overflow: auto">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive-lg my-0" AllowPaging="false" ShowHeaderWhenEmpty="True" AllowSorting="True" OnSorting="GridView1_Sorting">
                                    <Columns>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="TextBoxAU" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="TextBoxDU" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <%-- Here i will put send buttons --%>
    <div class="col-lg-4 col-xl-3">
                    
    </div>

</asp:Content>
