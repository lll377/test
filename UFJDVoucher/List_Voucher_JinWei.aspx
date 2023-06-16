<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List_Voucher_JinWei.aspx.cs" Inherits="M_Main.UFJDVoucher.List_Voucher_JinWei" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>功能列表</title>
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
                        <input type="hidden" name="hicorpID" id="hicorpID" value="0" runat="server" />

                          <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server" />
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">功能列表</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    1、基础档案<br />
                                    <a id="Rp_01" data-funcode="020101" data-url="../UFJDVoucher/UFJDAccountBrowse.aspx">(1) 会计主体</a><br />
                                    <a id="Rp_02" data-funcode="020102" data-url="../UFJDVoucher/UFJDCustBrowse.aspx">(2) 客商档案</a><br />
                                    <a id="Rp_03" data-funcode="020103" data-url="../UFJDVoucher/UFJDAccSubjBrowse.aspx">(3) 会计科目</a><br />
                                    <a id="Rp_04" data-funcode="020104" data-url="../UFJDVoucher/UFJDCurrentItemBrowse.aspx">(4) 往来项目</a><br />                                    
                                    <a id="Rp_05" data-funcode="020105" data-url="../UFJDVoucher/UFJDFundPropertyBrowse.aspx">(5) 款项性质</a><br />
                                    <a id="Rp_06" data-funcode="020106" data-url="../UFJDVoucher/UFJDCashFlowBrowse.aspx">(6) 现金流量</a><br />
                                    <a id="Rp_07" data-funcode="020107" data-url="../UFJDVoucher/UFJDBankAccountBrowse.aspx">(7) 银行账户</a><br />
                                    <a id="Rp_08" data-funcode="020108" data-url="../UFJDVoucher/UFJDPropertyIncomeBrowse.aspx">(8) 物业收入</a><br />
                                    <a id="Rp_09" data-funcode="020109" data-url="../UFJDVoucher/UFJDChargeModeBrowse.aspx">(9) 结算方式</a><br />
                                    <a id="Rp_10" data-funcode="020110" data-url="../UFJDVoucher/UFJDRollProjetBrowse.aspx">(10) 资金计划项目</a><br />

                                    <a id="Rp_11" data-funcode="020111" data-url="../UFJDVoucher/UFJDAuxAccountBrowse.aspx">(11) 辅助核算</a><br />
<%--                                <a id="Rp_02" data-funcode="020102" data-url="../UFJDVoucher/UFJDDeptBrowse.aspx">(2) 部门档案</a><br />
                                    <a id="Rp_11" data-funcode="020111" data-url="../UFJDVoucher/UFJDCustTypeBrowse.aspx">(5) 客商类别</a><br />
                                    <a id="Rp_08" data-funcode="020108" data-url="../UFJDVoucher/UFJDDsignBrowse.aspx">(9) 凭证类别</a><br />
                                    <a id="Rp_02" data-funcode="020101" data-url="../UFJDVoucher/UFProjectBrowse.aspx">(2) 房地产项目</a><br />
                                    <a id="Rp_03" data-funcode="020102" data-url="../UFJDVoucher/UFTradeTypeBrowse.aspx">(3) 交易类型</a><br />                                    
                                    <a id="Rp_09" data-funcode="020108" data-url="../UFJDVoucher/UFCurrTypeBrowse.aspx">(9) 币种档案</a><br />
                                    <a id="Rp_10" data-funcode="020109" data-url="../UFJDVoucher/UFBankTypeBrowse.aspx">(10) 银行类别</a><br />                                    
                                    <a id="Rp_12" data-funcode="020111" data-url="../UFJDVoucher/UFCashAccountBrowse.aspx">(12) 现金账户</a><br />
                                    <a id="Rp_13" data-funcode="020107" data-url="../UFJDVoucher/UFProductBrowse.aspx">(13) 业态档案参照</a><br />--%>
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    2、推送设置<br />
                                   <a id="Rp_21" data-funcode="020201" data-url="../UFJDVoucher/UFJDConfigSet_JinWei_AccountBrowse.aspx">(1) 账套设置</a><br />
                                   <a id="Rp_22" data-funcode="020202" data-url="../UFJDVoucher/UFJDConfigSet_JinWei_AccSubjBrowse.aspx">(2) 收费科目设置</a><br />
                                   <a id="Rp_23" data-funcode="020203" data-url="../UFJDVoucher/UFJDConfigSet_JinWei_ChargeModeBrowse.aspx">(3) 结算方式设置</a><br />
                                   <a id="Rp_24" data-funcode="020204" data-url="../UFJDVoucher/UFJDConfigSet_JinWei_CustBrowse.aspx">(4) 客商档案设置</a><br />
                                    
                                    3、推送单据<br />
                                    <a id="Rp_32" data-funcode="020302" data-url="../UFJDVoucher/UFJDPushHead_JinWei_ChargeBrowse.aspx">(1) 收款单推送</a><br />
                                    <a id="Rp_34" data-funcode="020304" data-url="../UFJDVoucher/UFJDPushHead_JinWei_Search.aspx">(2) 推送单查询</a><br />
                                   <%-- <a id="Rp_32" data-funcode="020302" data-url="../UFJDVoucher/UFJDPushFees_JinWei_ChargeBrowse.aspx">(1) 凭证推送</a><br />
                                    <a id="Rp_34" data-funcode="020304" data-url="../UFJDVoucher/UFJDPushFees_JinWei_Search.aspx">(2) 推送凭证查询</a><br />--%>
                                    <a id="Rp_35" data-funcode="020305" data-url="../UFJDVoucher/UFJDPush_JinWei_CustomerBrowse.aspx">(3) 租户同步推送</a><br />
                                    <a id="Rp_36" data-funcode="020306" data-url="../UFJDVoucher/UFJDPush_JinWei_CustomerSearch.aspx">(4) 租户同步查询</a><br />
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

            //$(function () {
            //    $("a").each(function () {
            //        var FunCode = $(this).attr("data-funcode");
            //        var id = $(this).attr("id");
            //        $.tool.DataGet('RootRight', 'CheckIsCanOperate', 'FunCode=' + FunCode,
            //            function Init() {
            //            },
            //            function callback(_Data) {
            //                if (_Data == "true") {
            //                    $("#" + id + "").show();
            //                } else {
            //                    $("#" + id + "").hide();
            //                }
            //            },
            //            function completeCallback() {
            //            },
            //            function errorCallback() {
            //            });
            //    });
            //    if ($("#hicorpID").val() == "1977") {
            //        $("#Rp_19").css("display","block");

            //    } else {

            //        $("#Rp_19").css("display","none")
            //    }
            //});
        </script>
    </form>
</body>
</html>