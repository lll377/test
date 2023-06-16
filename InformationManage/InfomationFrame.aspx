<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfomationFrame.aspx.cs" Inherits="M_Main.InformationManage.InfomationFrame" %>

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
        <input type="hidden" id="types" />
        <input type="hidden" id="CommId" runat="server" />
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">项目信息列表</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    <%--   1、收费标准查询<br />--%>
                                    <a id="Rp_01" data-url="../InformationManage/ProjectBasicInformation.aspx">1、基础信息 </a>
                                    <a id="Rp_01_01" data-url="../InformationManage/ProjectBasicInformationSearch.aspx">1、基础信息 </a>
                                    <br />
                                    <%--<a id="Rp_02" data-url="../InformationManage/PlanInfo.aspx">2、规划信息 </a><br />--%>
                                    <a id="Rp_03" data-url="../InformationManage/ContractInfo.aspx">3、物业服务合同信息 </a>
                                    <br />
                                    <a id="Rp_04" data-url="../InformationManage/MarketingServiceInfo.aspx">4、协销服务合同信息 </a>
                                    <br />
                                    <a id="Rp_05" data-url="../InformationManage/ApprovalRecordInfo.aspx">5、收费批文/备案信息 </a>
                                    <br />

                                    <a id="Rp_06" data-url="../InformationManage/ParkingFeeInfo.aspx">6、停车收费资质信息 </a>
                                    <br />
                                    <a id="Rp_07" data-url="../InformationManage/EnergyConsumptionApportionmentList.aspx">7、公共能耗分摊信息 </a>
                                    <br />
                                    <a id="Rp_08" data-url="../InformationManage/VacantDiscountInfo.aspx">8、地产空置优惠信息 </a>
                                    <br />
                                    <a id="Rp_09" data-url="../InformationManage/OwnerVacantDiscountInfo.aspx">9、业主空置优惠信息 </a>
                                    <br />
                                    <a id="Rp_10" data-url="../InformationManage/ProjectComplianceManagement.aspx">10、合法合规信息 </a>
                                    <br />

                                </div>
                                <div class="col-sm-4" style="font-size: 15px; font-family: 微软雅黑; line-height: 30px;">
                                    <a id="Rp_11" data-url="../InformationManage/LettersInfo.aspx">11、业主发函信息 </a>
                                    <br />
                                    <a id="Rp_12" data-url="../InformationManage/CommunityLitigationInfo.aspx">12、业主诉讼信息 </a>
                                    <br />
                                    <a id="Rp_13" data-url="../InformationManage/AttendInformation.aspx">13、参加协会信息 </a>
                                    <br />
                                    <a id="Rp_14" data-url="../InformationManage/AwardInformation.aspx">14、项目获奖信息 </a>
                                    <br />
                                    <a id="Rp_15" data-url="../InformationManage/StaffCanteenInfo.aspx">15、员工食堂信息 </a>
                                    <br />
                                    <a id="Rp_16" data-url="../InformationManage/AreaAvatarInfo.aspx">16、项目团队信息 </a>
                                    <br />
                                    <a id="Rp_17" data-url="../InformationManage/ContactInformation.aspx">17、项目联系信息 </a>
                                    <br />
                                </div>

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

            function InitTableHeight() {
                if ($("#CommId").val() != '' && $("#CommId").val() != '0') {
                    $("#Rp_01_01").hide();
                    $("#Rp_01").show();
                } else
                {
                    $("#Rp_01").hide();
                    $("#Rp_01_01").show();
                }
              
                if ($("#CommId").val() != '') {
                    $("#BasicInfo").attr("src", "BasicInfo.aspx?CommId=" + $("#CommId").val());
                 
                }

                if (getUrlParam("type") == null) {
                    $("#types").val(parent.document.getElementById("types").value);
                    h = h - 34;
                    $(".Frm").css({ "height": h + "px" });
                }
                else {
                    $("#types").val(getUrlParam("type"));
                }

            }

            InitTableHeight();
            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                //if (refsel == 0) {
                $("#" + refpage).attr("src", refpage + ".aspx?CommId=" + $("#CommId").val());
                $(this).attr("refsel", "1");
                //}
            });
            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            $("a").click(function () {
                var dataurl =$(this).attr("data-url")+"?types="+ $("#types").val();
                if ($(this).attr("data-url").indexOf("BasicInfo.aspx") > 0) {
                    if ($("#CommId").val() != '') {
                        dataurl+= "&CommId=" + $("#CommId").val();
                    }
                }
                else {
                    dataurl+= "&CommId=" + $("#CommId").val();
                }
                if ($(this).attr("data-url") == "") {
                    dataurl = "";
                }
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
