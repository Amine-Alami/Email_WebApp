<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Email_WebApp.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="assets/css/Filter.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /*Pagination style
            https://sufiawan.wordpress.com/2014/09/26/asp-net-use-bootstrap-pagination-on-gridview/
        */
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }
 
        .pagination-ys table > tbody > tr > td {
            display: inline;
        }
 
        .pagination-ys table > tbody > tr > td > a,
        .pagination-ys table > tbody > tr > td > span {
            position: relative;
            float: left;
            padding: 8px 12px;
            line-height: 1.42857143;
            text-decoration: none;
            color: #dd4814;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            margin-left: -1px;
        }
 
        .pagination-ys table > tbody > tr > td > span {
            position: relative;
            float: left;
            padding: 8px 12px;
            line-height: 1.42857143;
            text-decoration: none;    
            margin-left: -1px;
            z-index: 2;
            color: #aea79f;
            background-color: #f5f5f5;
            border-color: #dddddd;
            cursor: default;
        }
 
        .pagination-ys table > tbody > tr > td:first-child > a,
        .pagination-ys table > tbody > tr > td:first-child > span {
            margin-left: 0;
            border-bottom-left-radius: 4px;
            border-top-left-radius: 4px;
        }
 
        .pagination-ys table > tbody > tr > td:last-child > a,
        .pagination-ys table > tbody > tr > td:last-child > span {
            border-bottom-right-radius: 4px;
            border-top-right-radius: 4px;
        }
 
        .pagination-ys table > tbody > tr > td > a:hover,
        .pagination-ys table > tbody > tr > td > span:hover,
        .pagination-ys table > tbody > tr > td > a:focus,
        .pagination-ys table > tbody > tr > td > span:focus {
            color: #97310e;
            background-color: #eeeeee;
            border-color: #dddddd;
        }
        /**************************************************************/


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div style="margin:2%">
        <div class="container-fluid">

            <%-- Dashboard --%>
            <div class="d-sm-flex justify-content-between align-items-center mb-4">
                <h3 class="text-dark mb-0">Dashboard</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#"><i class="fa fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
            </div>

            <%-- Dashboard Cards --%>
            <div class="row">
                <div class="col-md-6 col-xl-3 mb-4">
                    <div class="card shadow border-left-primary py-2">
                        <div class="card-body">
                            <div class="row align-items-center no-gutters">
                                <div class="col mr-2">
                                    <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span>Total employees</span></div>
                                    <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalEmp" runat="server">200</span></div>
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
                                    <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalHs" runat="server">28,000 h</span></div>
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
                                    <div class="text-uppercase text-info font-weight-bold text-xs mb-1"><span>Emails sending</span></div>
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
                                    <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalDep" runat="server">5</span></div>
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
                <div class="col-lg-8 col-xl-9">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Employees Info</p>
                        </div>
                        <div class="card-body">

                            <%-- Filter --%>
                            <div class="filter">
                                <asp:TextBox ID="TextBoxSearch" runat="server" placeholder="Rechercher par matricule ou par nom" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox><br>
                                
                                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="Genre" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Homme" Value="MOHA"></asp:ListItem>
                                    <asp:ListItem Text="Femme" Value="FA"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBoxSelectAll" runat="server" OnCheckedChanged="CheckBoxSelectAll_CheckedChanged" AutoPostBack="True" Text="Selectionner tout"/>
                            <%-- GridView --%>
                            <div class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info" >
                                <asp:UpdatePanel ID="UpdatePanelPage" runat="server">
                                    <ContentTemplate>
                                        <div style="height: 700px; overflow: auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive-lg my-0" AllowPaging="false" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" ShowHeaderWhenEmpty="True">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Select
                                                    </HeaderTemplate>

                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBoxBody" runat="server"  />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>"/>
                                        </asp:GridView>
                                        </div>
                                   </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />
                                        <asp:AsyncPostBackTrigger ControlID="TextBoxSearch" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="CheckBoxSelectAll" EventName="CheckedChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                        </div>
                    </div>
                </div>

                <%-- Here i will put send buttons --%>
                <div class="col-lg-4 col-xl-3">
                    <%--<asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All" ImageSet="Arrows" OnTreeNodeCheckChanged="TreeView1_TreeNodeCheckChanged">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                        <Nodes>
                            <asp:TreeNode Text="New Node" Value="New Node">
                                <asp:TreeNode Text="New Node" Value="New Node">
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="New Node" Value="New Node">
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="New Node" Value="New Node">
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                    <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                </asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                            <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                        </Nodes>
                        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                    </asp:TreeView>--%>
                </div>

            </div>

        </div>
    </div>



    <script type="text/javascript">

    </script> 
</asp:Content>
