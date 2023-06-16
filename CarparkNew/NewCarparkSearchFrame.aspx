<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCarparkSearchFrame.aspx.cs" Inherits="M_Main.CarparkNew.NewCarparkSearchFrame" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../jscript/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
       
            overflow: hidden;
        }
    </style>
</head>
<body style="">
    <form id="frmForm">
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="ParkingSelSearch" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">当前使用查询</a></li>
                <li class="" refpage="ParkingHandHisBrowse" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">使用历史查询</a></li>    
                <li class=""  refpage="ParkingSearchHis" refsel="0"><a data-toggle="tab"  href="#tab-3" aria-expanded="false">转让历史查询</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="ParkingSelSearch" src="ParkingSelSearch.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="ParkingHandHisBrowse" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>     
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="ParkingSearchHis" style="width: 100%; border: none;" class="Frm"></iframe>
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
                var sm = getQueryStr("sy").replace('?v', '');
          
                if (sm == "1") 
                { 
                    $("#ParkingSearchHis").attr("src", "ParkingSearchHis.aspx?sy=1"); 
                }
            }

            $(function () {
                InitTab();
            }) 
        </script>
    </form>
</body>
</html>
