<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceBaseAuditingFrame.aspx.cs" Inherits="M_Main.ResourceBaseAuditing.ResourceBaseAuditingFrame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">

    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">

    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }

        .active {
            background-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="refsel" />
        <div class="tabs-container">
            <div class="tabs-left" style="margin: 0px;">
                <ul class="nav nav-tabs">
                    <li class="active" refsel="1" refid="Tab1" refpage="RegionLockBrowse" reftype="">
                        <a data-toggle="tab" href="#tab-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>组团区域审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab2" refpage="BuildingLockBrowse" reftype="楼宇信息审核">
                        <a data-toggle="tab" href="#tab-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>楼宇资料审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab3" refpage="HouseLockBrowse" reftype="房屋资料审核">
                        <a data-toggle="tab" href="#tab-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>房屋资料审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab4" refpage="CustomerLockBrowse" reftype="客户资料审核">
                        <a data-toggle="tab" href="#tab-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>客户资料审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab5" refpage="HouseholdLockBrowse" reftype="家庭成员审核">
                        <a data-toggle="tab" href="#tab-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>家庭成员审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab6" refpage="ParkIngBaseLockBrowse" reftype="车位区域基础设置审核">
                        <a data-toggle="tab" href="#tab-6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>车位区域审核</a>
                    </li>
                    
                    <li class="" refsel="0" refid="Tab8" refpage="ParkIngDataLockBrowse" reftype="车位资料审核">
                        <a data-toggle="tab" href="#tab-8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>车位资料审核</a>
                    </li>
                    
                    <li class="" refsel="0" refid="Tab10" refpage="NewCustomerBankLockBrowse" reftype="绑定在客户上的银行账号审核">
                        <a data-toggle="tab" href="#tab-10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>客户银行账号审核</a>
                    </li>
                    <li class="" refsel="0" refid="Tab11" refpage="NewCustomerBankLiveLockBrowse" reftype="绑定在客户上的银行账号审核">
                        <a data-toggle="tab" href="#tab-11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i></i>房屋银行账号审核</a>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab1" src="RegionLockBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab2" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab3" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab4" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab5" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab6" src="ParkIngBaseLockBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div> 
                    <div id="tab-8" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab8" src="ParkIngDataLockBrowse.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                     
                    <div id="tab-10" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab10"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-11" class="tab-pane">
                        <div class="panel-body" style="padding: 0px; position: absolute;">
                            <iframe id="Tab11"  style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $(".Frm").css({ "height": h + "px" });
            }
            InitTableHeight();

            $(".tabs-container li").click(function () {

                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                var reftype = $(this).attr("reftype");
                var refid = $(this).attr("refid");
                if (refsel == 0) {
                    $("#" + refid).attr("src", refpage + ".aspx?AuditType=" + reftype);
                    $(this).attr("refsel", "1");
                }
            });
        </script>
    </form>
</body>
</html>
