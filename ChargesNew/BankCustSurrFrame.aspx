<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankCustSurrFrame.aspx.cs" Inherits="M_Main.ChargesNew.BankCustSurrFrame" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
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
        <input name="ModifyType" type="hidden" id="ModifyType" value="1" />
        <input name="ModifyType1" type="hidden" id="ModifyType1" value="2" />
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">在线缴费列表</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                 <%--   1、收费标准查询<br />--%>
                                    <a id="Rp_01" data-url="../ChargesNew/BankCustSurrUnionPay.aspx">1、银联支付通道 </a><br />
                                    <a id="Rp_02" data-url="../ChargesNew/BankCustSurrAlipay.aspx">2、支付宝支付通道 </a><br />
                                    <a id="Rp_03" data-url="../ChargesNew/BankCustSurrWeiXinpay.aspx">3、微信支付通道 </a><br />
                                    <a id="Rp_04" data-url="../ChargesNew/MobilePayAccountFrame.aspx">4、通联支付通道（支持支付宝、微信、银联卡）</a><br />
                                    <a id="Rp_06" data-url="../ChargesNew/PaymentEnquiryBrowse.aspx">5、通联支付通道(新)</a><br />
                                    <%--<a id="Rp_05" data-url="../ChargesNew/BankCustSurrJiaoTongpay.aspx">5、交通银行支付通道（支持微信）</a>--%><br />
                                                      
                                </div>
 <%--                               <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                     3、实收费用查询<br />
                                    <a id="Rp_12" data-url="../InquiriesNew/NewFeesPaidSearchFrame.aspx">（1）实收/预存费用查询</a><br />
                                    <a id="Rp_13" data-url="../ChargesNew/ModifyReceiptsUpdateDateBrowse.aspx">（2）修改收款时间查询</a><br />
                                    <a id="Rp_14" data-url="../ChargesNew/ModifyReceiptsUpdateModeBrowse.aspx">（3）修改收款方式查询</a><br />
                                     4、欠收费用查询<br />
                                    <a id="Rp_15" data-url="../Inquiries/NewAlgorithmFeesDebtCutSearch.aspx">（1）客户欠费明细记录查询</a><br />
                                    <a id="Rp_16" data-url="../Inquiries/NewAlgorithmFeesDebtCut2Search.aspx">（2）按客户、费项欠费查询</a><br />
                                    <a id="Rp_17" data-url="../Inquiries/NewAlgorithmFeesDebtCut7Search.aspx">（3）按客户、费项、年度欠费查询</a><br />
                                    <a id="Rp_18" data-url="../Inquiries/NewFeesDebtCut1Search.aspx">（4）按客户、费项、月份欠费查询</a><br />
                                    <a id="Rp_19" data-url="../Inquiries/NewAlgorithmFeesDebtCut9Search.aspx">（5）按费项、账龄欠费查询</a><br />
                                    <a id="Rp_20" data-url="../Inquiries/NewFeesDebtCut8Search.aspx">（6）按组团欠费查询</a><br />
                                    <a id="Rp_21" data-url="../Inquiries/NewFeesDebtCut3Search.aspx">（7）按组团、费项欠费查询</a><br />
                                    <a id="Rp_22" data-url="../Inquiries/NewFeesDebtCut4Search.aspx">（8）按主体欠费查询</a><br />
                                    <a id="Rp_23" data-url="../Inquiries/NewFeesDebtCut5Search.aspx">（9）按原因欠费查询</a><br />
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                    5、退款费用查询<br />
                                    <a id="Rp_24" data-url="../InquiriesNew/NewFeesRefundSearchFrame.aspx">（1）已退款费用查询</a><br />
                                    <a id="Rp_25" data-url="../InquiriesNew/NewFeesDueRefundSearch.aspx">（2）未退款费用查询</a><br />
                                    6、减免费用查询<br />
                                    <a id="Rp_26" data-url="../ChargesNew/WaiversFeeOffSetSearch.aspx">（1）本金减免冲抵查询</a><br />
                                    <a id="Rp_27" data-url="../ChargesNew/WaiversLateFeeOffsetSearch.aspx">（2）违约金减免查询</a><br />
                                    7、预交费用查询<br />
                                    <a id="Rp_28" data-url="../ChargesNew/PreCostsSearch.aspx">（1）当前预交余额查询</a><br />
                                    <a id="Rp_29" data-url="../ChargesNew/NewPreCostsCutSearch.aspx">（2）截点预交余额查询</a><br />
                                    <a id="Rp_30" data-url="../ChargesNew/PreCostsOffsetSearch.aspx">（3）预交冲抵费用查询</a><br />
                                    <a id="Rp_31" data-url="../ChargesNew/RepealOffsetPrecHisBrowse.aspx">（4）撤销预交冲抵查询</a><br />
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">补充查询列表</span>
                        </div>

                        <div class="ibox-content">

                            <div class="row">
                                &nbsp;&nbsp;&nbsp;&nbsp;暂无查询
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
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
