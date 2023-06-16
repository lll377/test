<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoList.aspx.cs" Inherits="M_Main.MyOa.InfoList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>待办工作</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

</head>
<body class="gray-bg">
    <form id="frmForm" runat="server">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">信息列表</span>
                        </div>

                        <div class="ibox-content">

                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">

                                    <a id="Rp_01" data-funcode="lblfwzt" data-url="../HouseNew/RoomSearchFrame.aspx?sy=1">本月房屋状态变更：<asp:Label ID="lblfwzt" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_02" data-funcode="lblfwzn" data-url="../RentalNew/LeaseRoomSearchFrame.aspx?sy=1">本月房屋租赁办理：<asp:Label ID="lblfwzn" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_03" data-funcode="lblfwzr" data-url="../HouseNew/SaleRoomSearch.aspx?sy=1">本月房屋转让办理：<asp:Label ID="lblfwzr" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_04" data-funcode="lblcwzr" data-url="../CarparkNew/NewCarparkSearchFrame.aspx?sy=1">本月车位转让办理：<asp:Label ID="lblcwzr" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_05" data-funcode="lblznht" data-url="../RentalNew/LeaseRoomSearchFrame.aspx?sy=2">本月租赁合同到期：<asp:Label ID="lblznht" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_06" data-funcode="lbljyht" data-url="../ContractNew/NewContractSearchFrame.aspx?sy=1">本月经营合同到期：<asp:Label ID="lbljyht" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_07" data-funcode="lblwwht" data-url="../CostManageNew/FromTabsContractSelectList.aspx?sy=1">本月外委合同到期：<asp:Label ID="lblwwht" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_08" data-funcode="lblldht" data-url="../PersonnelManage/PersonnelContractledgerManagement.aspx?sy=1">本月劳动合同到期：<asp:Label ID="lblldht" runat="server" Text="0"></asp:Label></a><br />
                                    <a id="Rp_09" data-funcode="lblrwmx" data-url="../MyOa/TaskList.aspx" style="display:none">当前任务明细查询：<asp:Label ID="lblrwmx" runat="server" Text="0"></asp:Label></a><br />
                                    <br />


                                </div>

                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                </div>

                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                </div> 
                            </div>


                        </div>
                    </div>
                </div>
            </div>


        </div>
        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
        <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

        <script type="text/javascript">


            $("a").click(function () {
                var dataurl = $(this).attr("data-url");
                var funcode = $(this).attr("data-funcode");
                var datatitle = $(this).html();
                var id = this.id.substr(6);
                 
                var isr = $("#" + funcode).attr("isR"); 
                if (isr == "1") {
                    n(dataurl, id, datatitle);
                }
                else {
                    alert("您没有详情查看权限！");
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
            function t(t) {
                var e = 0;
                return top.$(t).each(function () {
                    e += $(this).outerWidth(!0)
                }), e
            }

            function e(e) {
                var a = t(top.$(e).prevAll()),
                    i = t(top.$(e).nextAll()),
                    n = t(top.$(".content-tabs").children().not(".J_menuTabs")),
                    s = top.$(".content-tabs").outerWidth(!0) - n,
                    r = 0;
                if (top.$(".page-tabs-content").outerWidth() < s) r = 0;
                else if (i <= s - top.$(e).outerWidth(!0) - top.$(e).next().outerWidth(!0)) {
                    if (s - top.$(e).next().outerWidth(!0) > i) {
                        r = a;
                        for (var o = e; r - top.$(o).outerWidth() > top.$(".page-tabs-content").outerWidth() - s;) r -= top.$(o).prev().outerWidth(), o = top.$(o).prev()
                    }
                } else a > s - top.$(e).outerWidth(!0) - top.$(e).prev().outerWidth(!0) && (r = a - top.$(e).prev().outerWidth(!0));
                top.$(".page-tabs-content").animate({
                    marginLeft: 0 - r + "px"
                }, "fast")
            }

            function n(href, index, title) {
                var t = href,
                    a = index,
                    i = title,
                    n = !0;
                if (void 0 == t || 0 == top.$.trim(t).length) return !1;
                if (top.$(".J_menuTab").each(function () {
                    return top.$(this).data("id") == t ? (top.$(this).hasClass("active") || (top.$(this).addClass("active").siblings(".J_menuTab").removeClass("active"), e(this), top.$(".J_mainContent .J_iframe").each(function () {
                        return top.$(this).data("id") == t ? (top.$(this).show().siblings(".J_iframe").hide(), !1) : void 0
                    })), n = !1, !1) : void 0
                }), n) {
                    var s = '<a href="javascript:;" class="active J_menuTab" data-id="' + t + '">' + i + ' <i class="fa fa-times-circle"></i></a>';
                    top.$(".J_menuTab").removeClass("active");
                    var r = '<iframe class="J_iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '" frameborder="0" data-id="' + t + '" seamless></iframe>';
                    top.$(".J_mainContent").find("iframe.J_iframe").hide().parents(".J_mainContent").append(r);
                    var o = parent.layer.load(2, {
                        shade: [0.1, '#ffffff']
                    });
                    top.$(".J_mainContent iframe:visible").load(function () {
                        parent.layer.close(o);
                    }), top.$(".J_menuTabs .page-tabs-content").append(s), e(top.$(".J_menuTab.active"))
                }
                return !1
            }
        </script>
    </form>
</body>
</html>
