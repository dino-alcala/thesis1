<%-- 
    Document   : sidebar
    Created on : 10 7, 18, 1:18:43 PM
    Author     : Dino Alcala
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

    </head>

    <body>
        <!--Sidebar for MULTIPLE.name pages-->
        <div id="sidebar-container">
            <%if (session.getAttribute("unit").toString().equals("Center for Social Concern and Action (COSCA)")) {

            %>

            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="COSCA-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                    <%                           
                        if (session.getAttribute("position").toString().equals("COSCA - Sir Neil Position") || session.getAttribute("position").toString().equals("COSCA - Director")) {
                    %>
                    <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                    </a>
                    <%
                        }
                    %>                        

                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
            %>

            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="OVPLM-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>

                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                    <%
                        if (session.getAttribute("position").toString().equals("OVPLM - Vice President for Lasallian Mission")) {
                    %>
                    <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                    </a>
                    <%
                        }
                    %>
                    <%
                        if (session.getAttribute("position").toString().equals("OVPLM - Vice President for Lasallian Mission")) {
                    %>
                    <a href="MULTIPLE-seProgramsForPRSUpload.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For PRS Approval</span>
                    </a>
                    <%
                        }
                    %>
                </div>
                <a href="#submenuUnits" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuUnits" class="collapse sidebar-submenu">
                    <a href="OVPLM-addUnit.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Unit</span>
                    </a>
                    <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Units</span>
                    </a>
                </div>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-viewBudget.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-money fa-fw mr-2"></span>
                        <span class="menu-collapsed">Budget</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuKRA" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuKRA" class="collapse sidebar-submenu">
                    <a href="OVPLM-createKRA.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create KRA</span>
                    </a>
                    <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Edit KRA</span>
                    </a>
                    <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">KRAs List</span>
                    </a>
                </div>
                <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-bar-chart fa-fw mr-2"></span>
                        <span class="menu-collapsed">Reports</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuReports" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-seReportsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Accomplishment</span>
                    </a>
                    <a href="OVPLM-budgetPerformanceReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Budgets</span>
                    </a>
                    <a href="OVPLM-perCommunityReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                    <a href="OVPLM-perUnitReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Units</span>
                    </a>
                    <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                    </a>
                </div>
                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Dean of Student Affairs (DSA)")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                    <!-- Menu with submenu -->
                    <a href="DSA-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-home fa-fw mr-2"></span>
                            <span class="menu-collapsed">Home</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-folder-open fa-fw mr-2"></span>
                            <span class="menu-collapsed">Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuProposals" class="collapse sidebar-submenu">
                        <a href="DSA-encodeSE.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Encode SE Proposal</span>
                        </a>
                        <a href="DSA-encodeFF.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Encode FF Proposal</span>
                        </a>
                        <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                        </a>
                        <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                        </a>
                        <%
                            if (session.getAttribute("position").toString().equals("DSA - Dean")) {
                        %>
                        <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                        </a>                        
                        <%
                            }
                        %>
                    </div>
                    <a href="#submenuUnits" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-group fa-fw mr-2"></span>
                            <span class="menu-collapsed">Units</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuUnits" class="collapse sidebar-submenu">
                        <a href="DSA-addStudentOrg.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Add Student Org</span>
                        </a>
                        <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                            <span class="menu-collapsed" id="subMenuCategory">Units</span>
                        </a>
                    </div>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-building fa-fw mr-2"></span>
                            <span class="menu-collapsed">Communities</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check-square-o fa-fw mr-2"></span>
                            <span class="menu-collapsed">Key Result Areas</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-bar-chart fa-fw mr-2"></span>
                            <span class="menu-collapsed">Reports</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
                    <div id="submenuReports" class="collapse sidebar-submenu">
                        <a href="MULTIPLE-seReportsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Accomplishment</span>
                    </a>
                    <%
                        if (session.getAttribute("position").toString().equals("DSA - Dean")) {
                     %>
                    <a href="OVPLM-budgetPerformanceReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Budgets</span>
                    </a>
                    <a href="OVPLM-perCommunityReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                    <a href="OVPLM-perUnitReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Units</span>
                    </a>
                    <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                    </a>
                    <%
                        }
                        %>
                    </div>
                </ul>
            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Laguna Campus Lasallian Mission (LCLM)")) {
            %>

            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="LCLM-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-bar-chart fa-fw mr-2"></span>
                        <span class="menu-collapsed">Reports</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuReports" class="collapse sidebar-submenu">
                    <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                    </a>
                </div>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Lasallian Mission Director (LMD)")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="LMD-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-bar-chart fa-fw mr-2"></span>
                        <span class="menu-collapsed">Reports</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuReports" class="collapse sidebar-submenu">
                    <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                    </a>
                </div>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Lasallian Pastoral Office (LSPO)")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="LSPO-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                    <%
                        if (session.getAttribute("position").toString().equals("LSPO - Director")) {
                    %>
                    <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                    </a>
                    <%
                        }
                    %>  
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Office of Personnel Management Director (OPMD)")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="OPMD-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                </div>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>

                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("position").toString().contains("Unit Representative")){
            %>

            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="UR-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>

                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("unit").equals("Lasallian Mission Council (LMC)")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="LMC-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                    <%
                        if (session.getAttribute("position").toString().equals("DSA - Dean") || session.getAttribute("position").toString().equals("LCLM - Executive Director")
                                || session.getAttribute("position").toString().equals("LSPO - Director") || session.getAttribute("position").toString().equals("COSCA - Director")
                                || session.getAttribute("position").toString().equals("DLSU Vocations Director") || session.getAttribute("position").toString().equals("TRED - Chair")
                                || session.getAttribute("position").toString().equals("TRED - Director LCC")) {
                    %>
                    <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                    </a>
                    <%
                        }
                    %>
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuReports" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-bar-chart fa-fw mr-2"></span>
                        <span class="menu-collapsed">Reports</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuReports" class="collapse sidebar-submenu">
                    <a href="OVPLM-termEndReport.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Term-End</span>
                    </a>
                </div>
            </ul>

            <%
                }
            %>

            <%
                if (session.getAttribute("position").toString().contains("ADEALM")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!--Menu with submenu-->
                <a href="ADEALM-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuProposals" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-folder-open fa-fw mr-2"></span>
                        <span class="menu-collapsed">Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuProposals" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-createSE.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create SE Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-createFF.jsp"  class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Create FF Program Proposal</span>
                    </a>
                    <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">SE Programs</span>
                    </a>
                    <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">FF Programs</span>
                    </a>
                    <a href="MULTIPLE-seProgramsForApproval.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">For Approval</span>
                    </a>
                </div>
                <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuCommunity" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-building fa-fw mr-2"></span>
                        <span class="menu-collapsed">Communities</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuCommunity" class="collapse sidebar-submenu">
                    <a href="MULTIPLE-addCommunity.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Community</span>
                    </a>
                    <a href="MULTIPLE-communityList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Communities</span>
                    </a>
                </div>
                <a href="MULTIPLE-krasList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Key Result Areas</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="OVPLM-perUnitReport.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-bar-chart fa-fw mr-2"></span>
                        <span class="menu-collapsed">Per Unit Report</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-evaluationSEResponsesList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-pencil-square-o fa-fw mr-2"></span>
                        <span class="menu-collapsed">Evaluation Forms</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>

            <%
                if (session.getAttribute("unit").equals("Admin")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="ADMIN-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="#submenuUnits" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-group fa-fw mr-2"></span>
                        <span class="menu-collapsed">Units</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <div id="submenuUnits" class="collapse sidebar-submenu">
                    <a href="OVPLM-addUnit.jsp" class="list-group-item list-group-item-action" id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Add Unit</span>
                    </a>
                    <a href="MULTIPLE-unitsList.jsp" class="list-group-item list-group-item-action"  id="subMenuCategoryBox">
                        <span class="menu-collapsed" id="subMenuCategory">Units</span>
                    </a>
                </div>
                <a href="signUp.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span>&nbsp;+ &nbsp;</span>
                        <span class="menu-collapsed">Add User</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>

            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Department Chair")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check fa-fw mr-2"></span>
                        <span class="menu-collapsed">SE Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").equals("CCS - Dean") || session.getAttribute("position").equals("COS - Dean")
                        || session.getAttribute("position").equals("GCOE - Dean") || session.getAttribute("position").equals("RVRCOB - Dean") || session.getAttribute("position").equals("COL - Dean")
                        || session.getAttribute("position").equals("BAGCED - Dean") || session.getAttribute("position").equals("CLA - Dean") || session.getAttribute("position").equals("SOE - Dean")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check fa-fw mr-2"></span>
                        <span class="menu-collapsed">SE Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Chairperson")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home2.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("ADLM")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home2.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Unit Head")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home2.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Director") && !session.getAttribute("unit").equals("Lasallian Pastoral Office (LSPO)") && !session.getAttribute("position").toString().contains("Social Engagement")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home2.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-faithFormationProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                        <div class="d-flex w-100 justify-content-start align-items-center">
                            <span class="fa fa-check fa-fw mr-2"></span>
                            <span class="menu-collapsed">FF Programs</span>
                            <span class="submenu-icon ml-auto"></span>
                        </div>
                    </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Unit Chair")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check fa-fw mr-2"></span>
                        <span class="menu-collapsed">SE Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("Social Engagement Director")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check fa-fw mr-2"></span>
                        <span class="menu-collapsed">SE Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>
            
            <%
                //sidebar for college deans (signatories)
                if (session.getAttribute("position").toString().contains("VP/VC")) {
            %>
            <ul class="list-group sticky-top sticky-offset">
                <!-- Menu with submenu -->
                <a href="SIGNATORIES-home.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-home fa-fw mr-2"></span>
                        <span class="menu-collapsed">Home</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
                <a href="MULTIPLE-socialEngagementProgramsList.jsp" class="list-group-item list-group-item-action flex-column align-items-start" id="sidebarCategory">
                    <div class="d-flex w-100 justify-content-start align-items-center">
                        <span class="fa fa-check fa-fw mr-2"></span>
                        <span class="menu-collapsed">SE Programs</span>
                        <span class="submenu-icon ml-auto"></span>
                    </div>
                </a>
            </ul>
            <% }%>
            
            
            <!-- List Group END-->

        </div>
    </body>
</html>
