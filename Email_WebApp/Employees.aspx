<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Email_WebApp.Main" %>
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

            <%-- CARDS --%>
            <asp:UpdatePanel ID="UpdatePanelCards" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6 col-xl-4 mb-4">
                            <div class="card shadow border-left-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span>Total employés</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalEmp" runat="server"></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fa fa-users fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-4 mb-4">
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
                        <div class="col-md-6 col-xl-4 mb-4">
                            <div class="card shadow border-left-warning py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-warning font-weight-bold text-xs mb-1"><span>Total departements</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span id="TotalDep" runat="server"></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fa fa-building fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>             
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="TextBoxSearch" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="TextBoxAU" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="TextBoxDU" EventName="TextChanged" />
                </Triggers>
            </asp:UpdatePanel>
            

            <%-- BOTTOM --%>
            <div class="row">

                <%-- TABLE and FILTER container--%>
                <div class="col-lg-8 col-xl-9">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Employees Info</p>
                        </div>
                        <div class="card-body">

                            <%-- Filter --%>
                            <div class="filter">
                                <asp:UpdatePanel ID="UpdatePanelFilter" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-4" style="text-align:center">
                                                <asp:TextBox ID="TextBoxDU" textmode="Date" runat="server" AutoPostBack="True" OnTextChanged="TextBoxDU_TextChanged"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4" style="text-align:center">
                                                <%-- TREEView --%>
                                                <asp:TreeView ID="TreeView1" runat="server" CssClass="treeview" ShowCheckBoxes="All" ImageSet="Simple" OnTreeNodeCheckChanged="TreeView1_TreeNodeCheckChanged" BackColor="#CCCCCC" NodeIndent="10" ShowLines="True">
                                                        <HoverNodeStyle Font-Underline="True" ForeColor="#DD5555" />
                                                        <Nodes>
                                                            <asp:TreeNode Text="GROUPE" Value="1" NavigateUrl="#" SelectAction="Expand">
                                                                <asp:TreeNode Text="AGADIR" Value="1000">
                                                                    <asp:TreeNode Text="OSC." Value="1001">
                                                                        <asp:TreeNode Text="SEM-OSC" Value="10011">
                                                                            <asp:TreeNode Text="MPF" Value="100111">
                                                                                <asp:TreeNode Text="PROD_" Value="1001111"></asp:TreeNode>
                                                                                <asp:TreeNode Text="AUTRE-PF" Value="1001112"></asp:TreeNode>
                                                                            </asp:TreeNode>
                                                                            <asp:TreeNode Text="MSF" Value="100112">
                                                                                <asp:TreeNode Text="JR-SF" Value="1001121"></asp:TreeNode>
                                                                                <asp:TreeNode Text="NT-SF" Value="1001122"></asp:TreeNode>
                                                                                <asp:TreeNode Text="AUTRE-SF" Value="1001123"></asp:TreeNode>
                                                                            </asp:TreeNode>
                                                                            <asp:TreeNode Text="PROD" Value="100113">
                                                                                <asp:TreeNode Text="TRT" Value="1001131"></asp:TreeNode>
                                                                                <asp:TreeNode Text="NET" Value="1001132"></asp:TreeNode>
                                                                                <asp:TreeNode Text="SERT" Value="1001133"></asp:TreeNode>
                                                                            </asp:TreeNode>
                                                                        </asp:TreeNode>
                                                                        <asp:TreeNode Text="QZ-OSC." Value="10012">
                                                                            <asp:TreeNode Text="AUTRE-PFQZ" Value="100121"></asp:TreeNode>
                                                                        </asp:TreeNode>
                                                                        <asp:TreeNode Text="OCCASIONNEL" Value="10013"></asp:TreeNode>
                                                                    </asp:TreeNode>
                                                                    <asp:TreeNode Text="SAC." Value="1002">
                                                                        <asp:TreeNode Text="MENSUEL" Value="10021"></asp:TreeNode>
                                                                    </asp:TreeNode>
                                                                    <asp:TreeNode Text="SMAC" Value="1003">
                                                                        <asp:TreeNode Text="MAN-SMIC" Value="10031"></asp:TreeNode>
                                                                        <asp:TreeNode Text="QZ-SMIC" Value="10032"></asp:TreeNode>
                                                                    </asp:TreeNode>
                                                                    <asp:TreeNode Text="CASA" Value="1004">
                                                                        <asp:TreeNode Text="TANGER" Value="10041"></asp:TreeNode>
                                                                        <asp:TreeNode Text="QZ-TAN" Value="10042"></asp:TreeNode>
                                                                    </asp:TreeNode>
                                                                </asp:TreeNode>
                                                                <asp:TreeNode Text="ARCHIVE" Value="2000">
                                                                </asp:TreeNode>
                                                                <asp:TreeNode Text="DEMO" Value="2">
                                                                </asp:TreeNode>
                                                            </asp:TreeNode>
                                                        </Nodes>
                                                        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
                                                        <ParentNodeStyle Font-Bold="False" />
                                                        <SelectedNodeStyle Font-Underline="True" ForeColor="#DD5555" HorizontalPadding="0px" VerticalPadding="0px" />
                                                    </asp:TreeView>
                                            </div>
                                            <div class="col-lg-4" style="text-align:center">
                                                <asp:TextBox ID="TextBoxAU" textmode="Date" runat="server" AutoPostBack="True" OnTextChanged="TextBoxAU_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:TextBox ID="TextBoxSearch" runat="server" placeholder="Rechercher par matricule ou par nom" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>
                                        <br>
                                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                            <%-- TABLE --%>
                            <div class="table-responsive table mt-2" role="grid" aria-describedby="dataTable_info" >

                                <%--Reset Row--%>
                                <div class="row">
                                    <div class="col-lg-4">
                                        &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBoxSelectAll" runat="server" OnCheckedChanged="CheckBoxSelectAll_CheckedChanged" AutoPostBack="True"/>&nbsp;&nbsp;Selectionner tout
                                    </div>
                                    <div class="col-lg-4" style="text-align:center">
                                        <asp:Button runat="server" ID="Reset" Text="Reset Filters" OnClick="Reset_Click"/>
                                    </div>
                                    <div class="col-lg-4" style="text-align:end">
                                        <asp:DropDownList ID="DropDownListDetails" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListDetails_SelectedIndexChanged">
                                            <asp:ListItem Text="Total" Value="Total" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Details" Value="Details"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <%-- GridView --%>
                                <asp:UpdatePanel ID="UpdatePanelGridView" runat="server">
                                    <ContentTemplate>
                                        <div style="max-height: 700px; overflow: auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive-lg my-0" AllowPaging="false" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" ShowHeaderWhenEmpty="True" AllowSorting="True" OnSorting="GridView1_Sorting">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Select
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBoxBody" runat="server" OnCheckedChanged="CheckBoxBody_CheckedChanged" AutoPostBack="true"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="pagination-ys" />
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>"/>
                                            </asp:GridView>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="TextBoxSearch" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="CheckBoxSelectAll" EventName="CheckedChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="TextBoxAU" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="TextBoxDU" EventName="TextChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownListDetails" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="TreeView1" EventName="TreeNodeCheckChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Here i will put send buttons --%>
                <div class="col-lg-4 col-xl-3">
                    
                </div>

            </div>

        </div>
    </div>



    <script type="text/javascript">

    </script> 
</asp:Content>
