<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpIncidentTypeContainer.aspx.cs" Inherits="M_Main.IncidentNewJH.CorpIncidentTypeContainer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</head>
<body>
    <form id="frmForm">
        <%-- <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="CorpIncidentTypeBrowse"  refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">报事类别设置</a>
                </li>
                <li class="" refpage="CorpIncidentTypeTransfer" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">报事类别发送</a>
                </li>
                <li class="" refpage="CorpIncidentCodeFrame" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">报事编号设置</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="CorpIncidentTypeBrowse" src="CorpIncidentTypeBrowse.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="CorpIncidentTypeTransfer" src="CorpIncidentTypeTransfer.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="CorpIncidentCodeFrame" src="CorpIncidentCodeFrame.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">报事设置</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    <a id="Rp_11" data-url="../IncidentNewJH/CorpIncidentTypeBrowse.aspx">1、报事类别设置</a><br />
                                    <a id="Rp_12" data-url="../IncidentNewJH/CorpIncidentTypeTransfer.aspx">2、报事类别发送</a><br />
                                    <a id="Rp_13" data-url="../IncidentNewJH/CorpIncidentCodeFrame.aspx">3、报事编号设置</a><br />
                                    <a id="Rp_14" data-url="../IncidentNew/CorpIncidentTypeWarning.aspx">4、报事预警设置</a><br />
                                    <%--<a id="Rp_19" data-url="../IncidentNew/SmsInfoBrowse.aspx">5、报事短信设置</a><br />--%>

                                    <a id="Rp_19" data-url="../IncidentNewJH/IncidentPushSettingFrame.aspx">5、报事推送设置</a><br />

                                    <a id="Rp_15" data-url="../IncidentNew/ReportMatterAuditSetFrom.aspx">6、报事审核设置</a><br />
                                    <a id="Rp_16" data-url="../IncidentNewJH/IncidentPublicLocaleFrom.aspx">7、公共区域设置</a><br />
                                    <a id="Rp_20" data-url="../IncidentNewJH/IncidentControlModelSet.aspx">8、报事管控设置</a><br />
                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 25px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
