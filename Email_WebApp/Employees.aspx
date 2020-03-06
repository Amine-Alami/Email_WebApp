<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Email_WebApp.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="assets/css/Filter.css">
    <style>
        .select {
    width: 170px;
    padding: 5px;
    border-radius: 5px;
    border: none;
    box-shadow: 0 0 2px #aaa;
    margin: 10px;
    background: #eee;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="margin:2%">
        <div class="container-fluid">

            <%-- Dashboard Head--%>
            <div class="d-sm-flex justify-content-between align-items-center mb-4">
                <h3 class="text-dark mb-0">Dashboard</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#"><i class="fa fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
            </div>

            <%-- Dashboard Cards--%>
            <div class="row">
                <div class="col-md-6 col-xl-3 mb-4">
                    <div class="card shadow border-left-primary py-2">
                        <div class="card-body">
                            <div class="row align-items-center no-gutters">
                                <div class="col mr-2">
                                    <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span>Total employees</span></div>
                                    <div class="text-dark font-weight-bold h5 mb-0"><span>200</span></div>
                                </div>
                                <div class="col-auto"><i class="fa fa-users fa-2x text-gray-300"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3 mb-4">
                    <div class="card shadow border-left-success py-2">
                        <div class="card-body">
                            <div class="row align-items-center no-gutters">
                                <div class="col mr-2">
                                    <div class="text-uppercase text-success font-weight-bold text-xs mb-1"><span>Total hours worked</span></div>
                                    <div class="text-dark font-weight-bold h5 mb-0"><span>28,000 h</span></div>
                                </div>
                                <div class="col-auto"><i class="fa fa-calendar fa-2x text-gray-300"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3 mb-4">
                    <div class="card shadow border-left-info py-2">
                        <div class="card-body">
                            <div class="row align-items-center no-gutters">
                                <div class="col mr-2">
                                    <div class="text-uppercase text-info font-weight-bold text-xs mb-1"><span>Emails sending progress</span></div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="text-dark font-weight-bold h5 mb-0 mr-3"><span>70%</span></div>
                                        </div>
                                        <div class="col">
                                            <div class="progress progress-sm">
                                                <div class="progress-bar bg-info" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 70%;"><span class="sr-only">50%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto"><i class="fa fa-tasks fa-2x text-gray-300"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3 mb-4">
                    <div class="card shadow border-left-warning py-2">
                        <div class="card-body">
                            <div class="row align-items-center no-gutters">
                                <div class="col mr-2">
                                    <div class="text-uppercase text-warning font-weight-bold text-xs mb-1"><span>Total departements</span></div>
                                    <div class="text-dark font-weight-bold h5 mb-0"><span>5</span></div>
                                </div>
                                <div class="col-auto"><i class="fa fa-building fa-2x text-gray-300"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%-- Bottom --%>
            <div class="row">

                <%-- Table --%>
                <div class="col-lg-7 col-xl-8">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Employees Info</p>
                        </div>
                        <div class="card-body">

                            <%-- Filter --%>
                            <div class="filter">
                                <input placeholder="Search by id or by name"/><br>
                                <select>
                                    <option value="">Genre</option>
                                    <option value="">Homme</option>
                                    <option value="">Femme</option>
                                </select>
                                <select>
                                    <option value="">Departement</option>
                                    <option value="">Dep01</option>
                                    <option value="">Dep02</option>
                                    <option value="">Dep03</option>
                                </select>
                                <select>
                                    <option value="">Hours worked</option>
                                    <option value="">35 <</option>
                                    <option value="">36 - 70</option>
                                    <option value="">71 - 105</option>
                                    <option value="">106 - 140</option>
                                    <option value="">> 140</option>
                                </select>
                            </div>

                            <%-- DataTable --%>
                            <div class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info">
                                <table class="table dataTable my-0" id="dataTable" style="text-align:center">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" /></th>
                                            <th>Matricule</th>
                                            <th>Prenom</th>
                                            <th>Date</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody id="datatableBody" runat="server">
                                    </tbody>
                                </table>
                            </div>

                            <%-- Page number --%>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
                                </div>
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Here i will put send buttons --%>
                <div class="col-lg-5 col-xl-4">
                    
                </div>

            </div>
            <%-- Old table --%> 
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
                    <asp:BoundField DataField="MATRICULE_152" HeaderText="MATRICULE" ItemStyle-Width="30" ><ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PRENOM_152" HeaderText="PRENOM" ItemStyle-Width="150" ><ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL_152" HeaderText="EMAIL" ItemStyle-Width="200" ><ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DATE_COMPT_210" HeaderText="JOUR" ItemStyle-Width="200" ><ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PERIODE" HeaderText="PERIODE" ItemStyle-Width="600" ><ItemStyle Width="600px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="CUMUL_ARRONDI_210" HeaderText="TOTAL" ItemStyle-Width="200" ><ItemStyle Width="200px"></ItemStyle>
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
            <asp:DropDownList ID="DropDownList1" CssClass="select" runat="server">
                <asp:ListItem>hhhhh</asp:ListItem>
                <asp:ListItem>hhhhh</asp:ListItem>
                <asp:ListItem>hhhhh</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

</asp:Content>
