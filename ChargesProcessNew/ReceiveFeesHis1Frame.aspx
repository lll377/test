<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiveFeesHis1Frame.aspx.cs" Inherits="M_Main.ChargesProcessNew.ReceiveFeesHis1Frame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <style  type="text/css">
        body {
            background-color:#f5f5f5;
            overflow:hidden;
        }
        .active {
            background-color:#cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm">
            <input id="CustID" name="CustID" type="hidden" runat="server" />
        <input id="RoomID" name="RoomID" type="hidden" runat="server" />
        <input id="RoomSign" name="RoomSign" type="hidden" runat="server" />
        <input id="CustName" name="CustName" type="hidden" runat="server" />
    <input type="hidden" id="refsel" />
    <div class="tabs-container">
                    <div class="tabs-left" style="margin:0px;">
                        <ul class="nav nav-tabs">
                            <li class="active" refsel="1" refid="Tab1" refpage="NewReceiveFeesHisBrowse" reftype="">
                                <a data-toggle="tab" href="#tab-1"> <i class="fa fa-cogs "></i>票据情况</a>
                            </li>
                            <li class="" refsel="0" refid="Tab2" refpage="NewHaveFeesEnquiries" reftype="明细情况">
                                <a data-toggle="tab" href="#tab-2"><i class="fa fa-cogs "></i>明细情况</a>
                            </li>
<%--                            <li class="" refsel="0" refid="Tab3" refpage="NewReceiveAdvanceFeesHisBrowse" reftype="收据情况（垫付）">
                                <a data-toggle="tab" href="#tab-3"><i class="fa fa-cogs "></i>收据情况（垫付）</a>--%>
                            </li>
                            <li class="" refsel="0"  refid="Tab4" refpage="NewSinglePrecStatementsBrowse" reftype="冲抵票据">
                                <a data-toggle="tab" href="#tab-4"><i class="fa fa-cogs "></i>冲抵票据</a>
                            </li>
                            <li class="" refsel="0"  refid="Tab5" refpage="NewSingleWaivStatementsBrowse" reftype="减免情况">
                                <a data-toggle="tab" href="#tab-5"><i class="fa fa-cogs "></i>减免情况</a>
                            </li>
                            <li class="" refsel="0"  refid="Tab6" refpage="NewPrecOffsetStatementsBrowse" reftype="冲抵情况">
                                <a data-toggle="tab" href="#tab-6"><i class="fa fa-cogs "></i>冲抵情况</a>
                            </li>
                        </ul>
                        <div class="tab-content ">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab1" src="NewReceiveFeesHisBrowse.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab2"  style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                            <div id="tab-3" class="tab-pane">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab3"  style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                            <div id="tab-4" class="tab-pane">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab4"  style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                           <div id="tab-5" class="tab-pane">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab5"  style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                            <div id="tab-6" class="tab-pane">
                                <div class="panel-body" style="padding:0px;position:absolute;">
                                    <iframe id="Tab6"  style="width:100%;border:none;" class="Frm"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
        <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $(".Frm").css({ "height": h + "px" });

            $('#Tab1').attr("src", "NewReceiveFeesHisBrowse.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val());


        }
        InitTableHeight();

        $(".tabs-container li").click(function () {
            var refpage = $(this).attr("refpage");
            var refsel = $(this).attr("refsel");
            var refid = $(this).attr("refid");
            if (refsel == 0) {
                $("#" + refid).attr("src", refpage + ".aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val());
                $(this).attr("refsel", "1");
            }
        });
    </script>
    </form>
</body>
</html>
