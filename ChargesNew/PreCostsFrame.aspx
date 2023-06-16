<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreCostsFrame.aspx.cs" Inherits="M_Main.ChargesNew.PreCostsFrame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            padding-top: 3px;
            overflow: hidden;
        }
    </style>
</head>
<body style="">
    <form id="frmForm">
        <input id="CustID" name="CustID" type="hidden" runat="server" />
        <input id="RoomID" name="RoomID" type="hidden" runat="server" />
        <input id="RoomSign" name="RoomSign" type="hidden" runat="server" />
        <input id="CustName" name="CustName" type="hidden" runat="server" />
        <input id="CostID" name="CostID" type="hidden" runat="server" />
        <input id="CostName" name="CostName" type="hidden" runat="server" />
        <input id="PrecAmount" name="PrecAmount" type="hidden" runat="server" />

        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="PreCostsInsManage" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">预存收款</a>
                </li>
                <li class="" refpage="PreCostsBrowse" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">预存查询</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="PreCostsInsManage" src="PreCostsInsManage.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="PreCostsBrowse" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 40;
                $(".Frm").css({ "height": h + "px" });

                document.getElementById('PreCostsInsManage').src = "PreCostsInsManage.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val() + "&CostID=" + $("#CostID").val() + "&CostName=" + $("#CostName").val() + "&PrecAmount=" + $('#PrecAmount').val();
            }


            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function LoadPreCostsInsManageSrc() {
                if (GetQueryString("ShowType") == "1") {
                    var h = $(window).height() - 40;
                    $(".Frm").css({ "height": h + "px" });
                    $("#PreCostsInsManage").attr("src", "PreCostsInsManage.aspx?ShowType=1")
                } else {

                    InitTableHeight();
                }
            }

            function Close() {
                HDialog.Close();
            }


            LoadPreCostsInsManageSrc();
            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {

                    $("#" + refpage).attr("src", refpage + ".aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val());
                    $(this).attr("refsel", "1");
                }
            });
        </script>
    </form>
</body>
</html>
