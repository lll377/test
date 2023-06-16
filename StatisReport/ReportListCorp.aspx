<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportListCorp.aspx.cs" Inherits="M_Main.StatisReport.ReportListCorp" %>

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
        <input type="hidden" id="hiOrganCode" name="hiOrganCode" runat="server" />
        <input type="hidden" id="txtCorpID" name="txtCorpID" runat="server" />
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">基础报表列表</span>
                        </div>

                        <div class="ibox-content">

                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    一、应收报表<br />
                                    <a id="Rp_1" data-url="../StatisReport/FeesReportNew1.aspx">（1）实际应收统计报表（T+1）</a><br />
                                    <a id="Rp_1_1" data-url="../StatisReport/FeesReportNew1_1.aspx">（2）理论应收统计报表（T+0）</a><br />
                                    二、收款报表<br />
                                    <a id="Rp_2" data-url="../StatisReport/ChargeAmontStatic.aspx">（1）收款统计报表（按收款方式，T+1）</a><br />
                                    <a id="Rp_10" data-url="../StatisReport/FeesReportNew2.aspx">（2）收款统计报表（按费用项目，T+1）</a><br />
                                    <a id="Rp_11" data-url="../StatisReport/FeesReportNew3.aspx">（3）预存统计报表（按费用项目，T+1）</a><br />
                                    <a id="Rp_14" data-url="../StatisReport/FeesReportNew4.aspx">（4）收款冲刺报表（T+0）</a><br />

                                    三、退款报表<br />
                                    <a id="Rp_6" data-url="../StatisReport/RefundReportOrgan.aspx">（1）退款统计报表（T+1）</a><br />

                                    四、欠费报表<br />
                                    <a id="Rp_04_2" data-funcode="010303" data-url="../Inquiries/CorpNewAlgorithmFeesDebtCutSearch.aspx">（1）欠费明细报表（T+0）</a><br />
                                    <a id="Rp_5" data-url="../StatisReport/ArrearageAgingReport.aspx">（2）欠费账龄报表（T+1）</a>
                                    <br />
                                    五、综合报表<br />
                                    <a id="Rp_3" data-url="../StatisReport/ComprehensiveStatisticsReport.aspx">（1）综合统计报表（T+1）</a><br />

                                    六、收费率报表<br />
                                    <%--<a id="Rp_7" data-url="../StatisReport/ChargeRateReport.aspx">（1）收费率报表(按月份，T+1)</a><br />--%>
                                    <a id="Rp_4" data-url="../CorpCostStatistNew/FeesCorpChargeRateStat.aspx">（1）收费率报表(按期间，T+1)</a><br />
                                    <a id="Rp_4_1" data-url="../StatisReport/FeesCorpChargeRateStat_zt.aspx">（2）收费率报表(按年月，T+0)</a><br />
                                </div>

                                <div id="divzc" runat="server" class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px; display: none;">
                                    七、项目汇总报表<br />
                                    <a id="Rp_701" data-funcode="020701" data-url="../StatisReport/CommSummaryArrearsBrowse.aspx">（1）欠费汇总表</a><br />
                                    <a id="Rp_702" data-funcode="020702" data-url="../StatisReport/AccountsReceivableBrowse.aspx">（2）应收汇总表</a><br />
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
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

                            <div class="row" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                <a id="Rp_104" runat="server" data-funcode="020503" data-url="../CorpCostStatistNew/CorpEnergyInfo.aspx">（1）能源统计报表</a>
                                <%--<a id="Rp_105" data-funcode="020505" data-url="../CorpCostStatistNew/CorpEnergyInfo.aspx">（2）能源统计报表</a>--%>
                                <br />
                                <a id="Rp_105" data-funcode="020503" data-url="../CorpCostStatistNew/IncomeSearch.aspx">（2）收入报表</a>
                                <br />
                                <a id="Rp_106" data-funcode="020504" data-url="../CorpCostStatistNew/ExpenditureSearch.aspx">（3）支出报表</a>
                                <br />
                                <a id="Rp_107" data-funcode="020504" data-url="../CorpCostStatistNew/ArrearsReasonSearch.aspx">（4）欠费原因统计表</a>
                                <br />
                                <a id="Rp_108" data-funcode="020504" data-url="../StatisReport/OperateAgeingReport.aspx">（5）运营账龄报表</a>
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
