<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomSearchFrame.aspx.cs" Inherits="M_Main.RentalNew.LeaseRoomSearchFrame" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
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
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="IsCorp" name="IsCorp" type="hidden" runat="server" />
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" id="zlcx" name="zlcx" refpage="NewLeaseInfoSeach" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true"><span id="infotitle">租赁查询</span></a>
                </li>
                <li class="" name="htcx" id="htcx" refpage="NewLeaseContractSearch" refsel="0"><a id="tba2" data-toggle="tab" href="#tab-2" aria-expanded="false">合同查询</a>
                </li>
                <li class="" name="zjcx" id="zjcx" refpage="NewLeaseFeeSearch" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">租金查询</a>
                </li>
                <li class="" name="zhcx" id="zhcx" refpage="NewLeaseCollectSearch" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">租户查询</a>
                </li>
                <li class="" name="zsl" id="zsl" refpage="NewLeaseRoomStatist" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">租售率</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewLeaseInfoSeach" src="NewLeaseInfoSeach.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewLeaseContractSearch" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewLeaseFeeSearch" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewLeaseCollectSearch" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>

                <div id="tab-5" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="NewLeaseRoomStatist" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 38;
                $(".Frm").css({ "height": h + "px" });

            }
            InitTableHeight();

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    $("#" + refpage).attr("src", refpage + ".aspx");
                    $(this).attr("refsel", "1");
                }
            });

            function getQueryStr(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }
            function InitTab() {
                if (getQueryStr("sy")) {
                    var sm = getQueryStr("sy").replace('?v', '');

                    if (sm == "1") {
                        //window.RoomStateSeach.InitDate();
                        $("#NewLeaseInfoSeach").attr("src", "NewLeaseInfoSeach.aspx?sy=1");
                        // document.getElementById("RoomStateSeach").contentWindow.InitDate();
                    }
                    if (sm == "2") {
                        $("#tba2").click();
                        //window.RoomStateSeach.InitDate();
                        $("#NewLeaseContractSearch").attr("src", "NewLeaseContractSearch.aspx?sy=1");
                    }
                }
            }

            $(function () {
                InitTab();
            })
        </script>
    </form>
</body>
</html>
