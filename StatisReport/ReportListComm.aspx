<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportListComm.aspx.cs" Inherits="M_Main.StatisReport.ReportListComm" %>

<%@ Import Namespace="System.Data" %>
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
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">基础报表列表</span>
                            <input type="hidden" id="txtCorpID" runat="server" />
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    一、应收报表<br />
                                    <a id="Rp_1" data-url="../StatisReport/FeesReportNew1.aspx">（1）实际应收统计报表</a><br />
                                    <a id="Rp_1_1" data-url="../StatisReport/FeesReportNew1_1.aspx">（2）理论应收统计报表</a><br />
                                    二、收款报表<br />
                                    <a id="Rp_01" data-funcode="020101" data-url="../NoticesNew/FeesDailyChargeModeCommissBrowse.aspx">（1）按收款方式统计</a><br />
                                    <a id="Rp_02" data-funcode="020102" data-url="../NoticesNew/FeesDailyCostPeriodCommissBrowse.aspx">（2）按费用月份/季度/年度统计</a><br />
                                    <%--按费用期间统计--%>
                                    <a id="Rp_08" data-funcode="0204" data-url="../NoticesNew/NewFeesTransferDailyBrowse.aspx">（3）按费用期间统计</a><br />
                                    <%--期间结算报表--%>
                                    <a id="Rp_03" data-funcode="020103" data-url="../NoticesNew/NewFeesDailyReceBrowse.aspx">（4）按票据明细统计</a><br />
                                    <a id="Rp_04" data-funcode="020104" data-url="../NoticesNew/FeesDailyReceiptsCommissBrowse.aspx">（5）按票据类别统计</a><br />
                                     
                                    <a id="Rp_05" data-funcode="020702" data-url="../StatisReport/PaidDecomReport.aspx">（6）实收分解表</a><br />
                                    <br />
                                </div>

                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    三、退款报表<br />
                                    <a id="Rp_06" data-funcode="0202" data-url="../StatisReport/RefundReport.aspx">（1）退款统计报表</a><br />
                                    <%--项目退款报表--%>
                                    四、缴款报表<br />
                                    <a id="Rp_07" data-funcode="0203" data-url="../NoticesNew/NewFeesDailyCorpCommissBrowse.aspx">（1）项目缴款报表</a><br />
                                    五、综合报表<br />
                                    <a id="Rp_102" data-funcode="020501" data-url="../CorpCostStatistNew/FeesColligateStat.aspx">（1）综合统计报表</a><br />
                                    六、收费率报表<br />
                                    <a id="Rp_103" data-funcode="020502" data-url="../CorpCostStatistNew/FeesChargeRateStat.aspx">（1）收费率报表(按期间)</a><br />
                                    <a id="Rp_103_1" data-url="../StatisReport/FeesCorpChargeRateStat_zt.aspx">（2）收费率报表(按年月)</a><br />
                                    <br />
                                </div>

                                <div id="divzc" runat="server" class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px; display: none;">
                                    七、项目汇总报表<br />
                                    <a id="Rp_701" data-funcode="020701" data-url="../StatisReport/CommSummaryArrearsBrowse.aspx">（1）欠费汇总表</a><br />
                                    <a id="Rp_702" data-funcode="020702" data-url="../StatisReport/AccountsReceivableBrowse.aspx">（2）应收汇总表</a><br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">补充统计列表</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                <a id="Rp_108" data-funcode="020505" data-url="../StatisReport/SecondSupplyWaterStatReport.aspx">（1）二次供水统计报表</a>
                                <br />
                                <a id="Rp_109" data-funcode="020507" data-url="../StatisReport/IncomeStatistics.aspx">（2）实收汇总表</a>
                                <br />
                                <a id="Rp_110" data-funcode="020508" data-url="../StatisReport/ConstructionWasteCleanRemoveReport.aspx">（3）建渣清运费收支表</a>
                                <br />
                                <a id="Rp_111" data-funcode="020509" data-url="../StatisReport/PropertyFeesPaidReport.aspx">（4）物管费实收分解表</a>
                                <br />
                                <a id="Rp_112" data-funcode="020510" data-url="../StatisReport/FinancialMonthReport.aspx">（5）财务月报表</a>
                                <br />

                                <a id="Rp_107" data-funcode="020505" data-url="../StatisReport/ComprehensiveStatisticsReport.aspx">（1）综合统计报表（T+1）</a>
                                <br />
                                <a id="Rp_104" data-funcode="020503" data-url="../CorpCostStatistNew/LedgerStatementNew.aspx">（1）扎帐报表</a>
                                <br />
                                <a id="Rp_105" data-funcode="020504" data-url="../CorpCostStatistNew/MultiFeesCorpHousekeeperFeesRate.aspx">（2）收费率报表（按管家）</a>
                                <br />
                                <a id="Rp_106" data-funcode="020505" data-url="../NoticesNew/FeesDailyChargeModeCommissBrowse_New.aspx">（1）按收款方式统计（新）</a>
                                <br />
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

            $(function () {
                if ($("#txtCorpID").val().search("彰泰") == -1) {
                    $("#Rp_104").hide();
                    $("#Rp_105").hide();
                }
                if ($("#txtCorpID").val().search("时时") == -1) {
                    $("#Rp_106").hide();
                }
                if ($("#txtCorpID").val().search("融信") == -1) {
                    $("#Rp_107").hide();
                }
            });

            $("a").click(function () {
                var dataurl = $(this).attr("data-url");
                var datatitle = $(this).html();
                var id = this.id.substr(6);
                n(dataurl, id, datatitle);
            });


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
                    var r = '<iframe class="J_iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '?v=4.0" frameborder="0" data-id="' + t + '" seamless></iframe>';
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
