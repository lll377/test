<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_3.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_3" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">客服主管信息看板</title>
    <!-- 引入样式 -->
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="SKT_Frame/bootstrap/css/bootstrap.min.css" />
    <link href="layer.mobile-v2.0/layer_mobile/need/layer.css" rel="stylesheet" />
    <script src="layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <script src="js/help.js"></script>
    <script src="js/share.js"></script>
    <link href="js/share.css" rel="stylesheet" />


    <script src="incubator-echarts-4.9.0/dist/echarts.min.js"></script>
    <script src="js/initEchartUtil.js"></script>
    <script type="text/javascript">  
        $(function () {
            InitPage();
        });

        ////按升序排列
        //function up(x, y) {
        //    return x[0] - y[0];
        //}

        function InitPage() {
            var UserCode = $.getUrlParam("UserCode");
            var CommID = $.getUrlParam("CommID");
            if (!!UserCode) {
                $("#UserCode").val(UserCode);
            }
            if (!!CommID) {
                $("#CommID").val(CommID);
            } else {
                $("#CommID").val(0);
            }
            //var source = [];
            //source.push([10000, '10']);
            //source.push([20000, '20']);
            //source.push([30000, '30']);
            //source.push([40000, '40']);

            //var source = [];
            //source.push([10, '50']);
            //source.push([20, '60']);
            //source.push([30, '70']);
            //source.push([40, '80']);
            //source.sort(up);
            //initHorizontal({ id: "BSGD_TOP", title: "本月巡查完成率(TOP5)", color: "#45CFAF", source: source, unit: '%', position: 'insideLeft' });

            //var source = [];
            //source.push([10, '50']);
            //source.push([20, '60']);
            //source.push([0, '70']);
            //source.push([30, '80']);
            //source.sort(up);
            //initHorizontal({ id: "KHBF_TOP", title: "本月巡查完成率(TOP5)", color: "#45CFAF", source: source, unit: '%', position: 'insideRight' });

            InitData();
        }

        function InitData() {
            $.dataPostJson('Tb_H5KanBan_3', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, true,
                function Init() {
                },
                function callback(data) {
                    //$("#CommName").text(data.ds2[0].项目名称);
                    $(".ToDayStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds[0].今日时间, "yyyy/MM/dd HH:mm"));
                    $(".ToMonthStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds1[0].昨日时间, "yyyy/MM/dd HH:mm"));
                    $("#FWKH").text(addThousands(data.ds3[0].Num));
                    $("#FWMJ").text(addThousands(data.ds4[0].Area));
                    $("#WCLBS").text(data.ds5[0].NotDoNum);
                    $("#YCLBS").text(data.ds6[0].OverNum);
                    $("#WCLTS").text(data.ds5[0].NotDoNum2);
                    $("#YCLTS").text(data.ds6[0].OverNum2);
                    $("#SQ").text(data.ds7[0].sq);
                    $("#KG").text(data.ds7[0].zx);
                    $("#TG").text(data.ds7[0].tg);



                    var isNotData = true;
                    if (data.ds8[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds8[0].ComletedRate });
                        $("#QBRW_1").text(data.ds9[0].YesterdayComletedNum);
                        $("#QBRW_2").text(data.ds9[0].YesterdayOverdueNum);
                        $("#QBRW_3").text(data.ds10[0].TaskNum);
                        $("#QBRW_4").text(data.ds10[0].ComletedNum);
                        $("#QBRW_5").text(data.ds10[0].OverdueNum);
                    }

                    if (data.ds11[0].IsShow == 0) {
                        $("#BSGD_Div").hide();
                    } else {
                        isNotData = false;
                        if (data.ds11[0].NoComletedNum == 0 && data.ds11[0].ComletedNum == data.ds11[0].NoComletedNum) {
                            data.ds11[0].NoComletedNum = 1;
                        }
                        initGraphic({ id: "BSGD", text: data.ds11[0].ComletedRate + "%", data: [{ value: data.ds11[0].ComletedNum, color: '#FFA36F' }, { value: data.ds11[0].NoComletedNum }] });
                        $("#BSGD_1").text(data.ds12[0].YesterdayComletedNum);
                        $("#BSGD_2").text(data.ds13[0].YesterdayComletedNum);
                        $("#BSGD_3").text(data.ds14[0].YesterdayOverdueNum);
                        $("#BSGD_4").text(data.ds15[0].TaskNum);
                        $("#BSGD_5").text(data.ds16[0].TaskNum);
                        $("#BSGD_6").text(data.ds17[0].ComletedNum);
                        $("#BSGD_7").text(data.ds18[0].ComletedNum);
                        $("#BSGD_8").text(data.ds19[0].OverdueNum);
                        if (data.ds20[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds20, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "BSGD_TOP", title: "本月工单完成数(TOP5)", color: "#FFA36F", source: source, unit: '' });
                        } else {
                            $(".BSGD_TOP").hide();
                        }
                    }

                    if (data.ds21[0].IsShow == 0) {
                        $("#KHBF_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KHBF", text: data.ds21[0].ComletedRate + "%", data: [{ value: data.ds21[0].ComletedNum, color: '#FC8F84' }, { value: data.ds21[0].NoComletedNum }] });
                        $("#KHBF_1").text(data.ds22[0].YesterdayComletedNum);
                        $("#KHBF_2").text(data.ds23[0].YesterdayComletedNum);
                        $("#KHBF_3").text(data.ds24[0].YesterdayOverdueNum);
                        $("#KHBF_4").text(data.ds25[0].TaskNum);
                        $("#KHBF_5").text(data.ds26[0].TaskNum);
                        $("#KHBF_6").text(data.ds27[0].ComletedNum);
                        $("#KHBF_7").text(data.ds28[0].ComletedNum);
                        $("#KHBF_8").text(data.ds29[0].OverdueNum);
                        if (data.ds30[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds30, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "KHBF_TOP", title: "本月拜访完成数(TOP5)", color: "#FC8F84", source: source, unit: '' });
                        } else {
                            $(".KHBF_TOP").hide();
                        }
                    }

                    if (data.ds31[0].IsShow == 0) {
                        $("#GQXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "GQXC", text: data.ds31[0].ComletedRate + "%", data: [{ value: data.ds31[0].ComletedNum, color: '#45CFAF' }, { value: data.ds31[0].NoComletedNum }] });
                        $("#GQXC_1").text(data.ds32[0].YesterdayComletedNum);
                        $("#GQXC_2").text(data.ds33[0].YesterdayComletedNum);
                        $("#GQXC_3").text(data.ds34[0].YesterdayOverdueNum);
                        $("#GQXC_4").text(data.ds35[0].TaskNum);
                        $("#GQXC_5").text(data.ds36[0].TaskNum);
                        $("#GQXC_6").text(data.ds37[0].ComletedNum);
                        $("#GQXC_7").text(data.ds38[0].ComletedNum);
                        $("#GQXC_8").text(data.ds39[0].OverdueNum);
                        if (data.ds40[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds40, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "GQXC_TOP", title: "本月巡查完成率(TOP5)", color: "#45CFAF", source: source, unit: '%' });
                        } else {
                            $(".GQXC_TOP").hide();
                        }
                    }


                    if (data.ds41[0].IsShow == 0) {
                        $("#ZXXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "ZXXC", text: data.ds41[0].ComletedRate + "%", data: [{ value: data.ds41[0].ComletedNum, color: '#05C2F8' }, { value: data.ds41[0].NoComletedNum }] });
                        $("#ZXXC_1").text(data.ds42[0].YesterdayComletedNum);
                        $("#ZXXC_2").text(data.ds43[0].YesterdayComletedNum);
                        $("#ZXXC_3").text(data.ds44[0].YesterdayOverdueNum);
                        $("#ZXXC_4").text(data.ds45[0].TaskNum);
                        $("#ZXXC_5").text(data.ds46[0].TaskNum);
                        $("#ZXXC_6").text(data.ds47[0].ComletedNum);
                        $("#ZXXC_7").text(data.ds48[0].ComletedNum);
                        $("#ZXXC_8").text(data.ds49[0].OverdueNum);
                        if (data.ds50[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds50, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "ZXXC_TOP", title: "本月巡查完成率(TOP5)", color: "#05C2F8", source: source, unit: '%' });
                        } else {
                            $(".ZXXC_TOP").hide();
                        }
                    }


                    if (data.ds51[0].IsShow == 0) {
                        $("#KFXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KFXC", text: data.ds51[0].ComletedRate + "%", data: [{ value: data.ds51[0].ComletedNum, color: '#FAC435' }, { value: data.ds51[0].NoComletedNum }] });
                        $("#KFXC_1").text(data.ds52[0].YesterdayComletedNum);
                        $("#KFXC_2").text(data.ds53[0].YesterdayComletedNum);
                        $("#KFXC_3").text(data.ds54[0].YesterdayOverdueNum);
                        $("#KFXC_4").text(data.ds55[0].TaskNum);
                        $("#KFXC_5").text(data.ds56[0].TaskNum);
                        $("#KFXC_6").text(data.ds57[0].ComletedNum);
                        $("#KFXC_7").text(data.ds58[0].ComletedNum);
                        $("#KFXC_8").text(data.ds59[0].OverdueNum);
                        if (data.ds60[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds60, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "KFXC_TOP", title: "本月巡查完成数(TOP5)", color: "#FAC435", source: source, unit: '' });
                        } else {
                            $(".KFXC_TOP").hide();
                        }
                    }

                    if (data.ds61[0].IsShow == 0) {
                        $("#WNQQ_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "WNQQ", value: data.ds61[0].ComletedRate });
                        $("#WNQQ_1").text(data.ds62[0].YesterdayComletedNum);
                        $("#WNQQ_2").text(addThousands(data.ds63[0].YesterdayComletedNum));
                        $("#WNQQ_3").text(data.ds64[0].ComletedNum);
                        $("#WNQQ_4").text(addThousands(data.ds65[0].ComletedNum));
                        if (data.ds66[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds66, function (i, item) {
                                source.push([item.ThisMonthCompleteRate, item.UserName]);
                            });
                            initHorizontal({ id: "WNQQ_TOP", title: "本年累计清欠率(TOP5)", color: "#FC8F84", source: source, unit: '%' });
                        } else {
                            $(".WNQQ_TOP").hide();
                        }
                    }

                    if (data.ds67[0].IsShow == 0) {
                        $("#BNSK_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "BNSK", value: data.ds67[0].ComletedRate });
                        $("#BNSK_1").text(data.ds68[0].YesterdayComletedNum);
                        $("#BNSK_2").text(addThousands(data.ds69[0].YesterdayComletedNum));
                        $("#BNSK_3").text(data.ds70[0].ComletedNum);
                        $("#BNSK_4").text(addThousands(data.ds71[0].ComletedNum));
                        if (data.ds72[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds72, function (i, item) {
                                source.push([item.ThisMonthCompleteRate, item.UserName]);
                            });
                            initHorizontal({ id: "BNSK_TOP", title: "本年累计收费率(TOP5)", color: "#FFA36F", source: source, unit: '%' });
                        } else {
                            $(".BNSK_TOP").hide();
                        }
                    }

                    if (isNotData) {
                        $("#NotData").show();
                    }


                },
                function completeCallback() {
                }, function errorCallback() {
                });

        }




    </script>
</head>
<body>
    <input type="hidden" id="UserCode" value="019526" />
    <input type="hidden" id="CommID" value="600945" />
    <div id="share">
        <a id="totop" title="返回顶部">返回顶部</a>
        <a id="refresh">刷新</a>
    </div>
    <div class="container-fluid">
        <div class="row container-title">
            <div style="height: 50px"></div>
            <%--<h1 class="container-span-title">客户主管信息看板</h1>--%>
        </div>
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="row module">
                        <div class="col-md-12 col-xs-12 col-sm-12 module-title">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 module-title-row1">
                                <span class="f18">基础管理信息</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f16"><b>客户信息</b></span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToDayStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="FWKH">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="FWMJ">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">客户数量(户数)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">建筑面积(平米)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="SFMJ">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="RZL">0</b></span>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            <hr class="kanban2" />
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 ">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f16"><b>报事信息</b></span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToDayStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="WCLBS">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="YCLBS">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">未处理报事</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">已逾期报事</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="WCLTS">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="YCLTS">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">未处理投诉</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">已逾期投诉</span>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            <hr class="kanban2" />
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 ">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f16"><b>装修信息</b></span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToDayStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="SQ">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="KG">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">申请(户数)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">开工(户数)</span>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 ">
                            <span class="f16 "><b id="TG">0</b></span>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 ">
                            <span class="f14 colorgrey">停工(户数)</span>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            &nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Swiper -->

        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="row module">
                        <div class="col-md-12 col-xs-12 col-sm-12 module-title">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f18">任务日清月结</span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToMonthStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="NotData" style="display: none">
                            <div class="col-md-12 col-xs-12 col-sm-12 p20" style="text-align: center">
                                <span class="f16">暂无任务日清月结数据。</span>
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0 " id="QBRW_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 col-title">
                                <span class="f16 colorblue"><b>全部任务</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt10">
                                    <div id="QBRW" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月任务完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f16 colorgreen"><b id="QBRW_1">0</b></span>
                                </div>
                                <div class="col-md-8 col-xs-8 col-sm-8 mp0">
                                    <span class="f16 coloryellow"><b id="QBRW_2">0</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f14 colorgrey">完成任务</span>
                                </div>
                                <div class="col-md-8 col-xs-8 col-sm-8 mp0">
                                    <span class="f14 colorgrey">逾期任务</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f16 colorblue"><b id="QBRW_3">0</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f16 colorgreen"><b id="QBRW_4">0</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f16 coloryellow"><b id="QBRW_5">0</b></span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f14 colorgrey">计划任务</span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f14 colorgrey">完成任务</span>
                                </div>
                                <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                    <span class="f14 colorgrey">逾期任务</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="BSGD_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>报事工单</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="BSGD" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月工单完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_1">0</b></span><span class="f14 colorgrey">&nbsp;全部工单</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_2">0</b></span><span class="f14 colorgrey">&nbsp;投诉工单</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="BSGD_3">0</b></span><span class="f14 colorgrey">&nbsp;全部工单</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_4">0</b></span><span class="f14 colorgrey">&nbsp;全部工单</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_5">0</b></span><span class="f14 colorgrey">&nbsp;投诉工单</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_6">0</b></span><span class="f14 colorgrey">&nbsp;全部工单</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                        <span class="f14 "><b id="BSGD_7">0</b></span><span class="f14 colorgrey">&nbsp;投诉工单</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="BSGD_8">0</b></span><span class="f14 colorgrey">&nbsp;全部工单</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 BSGD_TOP pt20">
                                <div id="BSGD_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="KHBF_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>客户拜访</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="KHBF" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月拜访完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14"><b id="KHBF_1">0</b></span><span class="f14 colorgrey ">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="KHBF_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0 ">
                                        <span class="f14 "><b id="KHBF_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh26">
                                        <span class="f14 "><b id="KHBF_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh26">
                                        <span class="f14 "><b id="KHBF_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh24">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KHBF_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 KHBF_TOP pt20">
                                <div id="KHBF_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="GQXC_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>公区巡查</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="GQXC" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡查完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="GQXC_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="GQXC_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="GQXC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 GQXC_TOP pt20">
                                <div id="GQXC_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="ZXXC_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>装修巡查</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="ZXXC" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡查完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_1">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="ZXXC_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="ZXXC_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="ZXXC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 ZXXC_TOP pt20">
                                <div id="ZXXC_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="KFXC_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>空房巡查</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="KFXC" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡查完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_1">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KFXC_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KFXC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 KFXC_TOP pt20">
                                <div id="KFXC_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="WNQQ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>往年清欠</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="WNQQ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计清欠率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt13">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="WNQQ_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="WNQQ_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="WNQQ_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="WNQQ_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(元)</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 WNQQ_TOP pt20">
                                <div id="WNQQ_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="BNSK_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>本年收款</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="BNSK" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计收费率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt13">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="BNSK_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="BNSK_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="BNSK_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="BNSK_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(元)</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 BNSK_TOP pt20">
                                <div id="BNSK_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <%--       <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="CWWGFWNQQ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>车位费往年清欠</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="CWWGFWNQQ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计收费率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt13">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFWNQQ_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFWNQQ_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFWNQQ_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFWNQQ_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(元)</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 CWWGFWNQQ_TOP pt20">
                                <div id="CWWGFWNQQ_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>--%>

                        <%--    <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="CWWGFBNSK_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>车位费本年收款</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="CWWGFBNSK" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计收费率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt13">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFBNSK_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFBNSK_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFBNSK_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFBNSK_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(元)</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 CWWGFBNSK_TOP pt20">
                                <div id="CWWGFBNSK_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>--%>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            &nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Swiper -->
    </div>

</body>
</html>
