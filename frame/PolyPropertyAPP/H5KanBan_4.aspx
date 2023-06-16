<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_4.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_4" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">工程主管信息看板</title>
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
            InitData();
        }
        function InitData() {
            $.dataPostJson('Tb_H5KanBan_4', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, true,
                function Init() {
                },
                function callback(data) {
                    //$("#CommName").text(data.ds2[0].项目名称);
                    $(".ToDayStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds[0].今日时间, "yyyy/MM/dd HH:mm"));
                    $(".ToMonthStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds1[0].昨日时间, "yyyy/MM/dd HH:mm"));
                    $("#JB_1").text(addThousands(data.ds3[0].Num));
                    $("#JB_2").text(addThousands(data.ds4[0].EquipmentNum));
                    $("#JB_3").text(addThousands(data.ds4[0].bydqNum));
                    $("#JB_4").text(addThousands(data.ds4[0].zbqnNum));
                    $("#JB_5").text(addThousands(data.ds4[0].zxwbNum));
                    $("#JB_6").text(addThousands(data.ds4[0].wwwbNum));
                    initGauge({ id: "DQSBWHL", value: data.ds5[0].IntactRate });
                    initGauge({ id: "BYSBGZL", value: data.ds6[0].EquipmentFailureRate, color1: "#f3b726", color2: "#60c69a" });

                    var isNotData = true;
                    if (data.ds7[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds7[0].ComletedRate });
                        $("#QBRW_1").text(data.ds8[0].YesterdayComletedNum);
                        $("#QBRW_2").text(data.ds8[0].YesterdayOverdueNum);
                        $("#QBRW_3").text(data.ds9[0].TaskNum);
                        $("#QBRW_4").text(data.ds9[0].ComletedNum);
                        $("#QBRW_5").text(data.ds9[0].OverdueNum);
                    }

                    if (data.ds10[0].IsShow == 0) {
                        $("#BSGD_Div").hide();
                    } else {
                        isNotData = false;
                        if (data.ds10[0].NoComletedNum == 0 && data.ds10[0].ComletedNum == data.ds10[0].NoComletedNum) {
                            data.ds10[0].NoComletedNum = 1;
                        }
                        initGraphic({ id: "BSGD", text: data.ds10[0].ComletedRate + "%", data: [{ value: data.ds10[0].ComletedNum, color: '#FFA36F' }, { value: data.ds10[0].NoComletedNum }] });
                        $("#BSGD_1").text(data.ds11[0].YesterdayComletedNum);
                        $("#BSGD_2").text(data.ds12[0].YesterdayComletedNum);
                        $("#BSGD_3").text(data.ds13[0].YesterdayOverdueNum);
                        $("#BSGD_4").text(data.ds14[0].TaskNum);
                        $("#BSGD_5").text(data.ds15[0].TaskNum);
                        $("#BSGD_6").text(data.ds16[0].ComletedNum);
                        $("#BSGD_7").text(data.ds17[0].ComletedNum);
                        $("#BSGD_8").text(data.ds18[0].OverdueNum);
                        if (data.ds19[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds19, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "BSGD_TOP", title: "本月工单完成数(TOP5)", color: "#FFA36F", source: source, unit: '' });
                        } else {
                            $(".BSGD_TOP").hide();
                        }
                    }

                    if (data.ds20[0].IsShow == 0) {
                        $("#SBXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBXJ", text: data.ds20[0].ComletedRate + "%", data: [{ value: data.ds20[0].ComletedNum, color: '#4777E5' }, { value: data.ds20[0].NoComletedNum }] });
                        $("#SBXJ_1").text(data.ds21[0].YesterdayComletedNum);
                        $("#SBXJ_2").text(data.ds22[0].YesterdayComletedNum);
                        $("#SBXJ_3").text(data.ds23[0].YesterdayOverdueNum);
                        $("#SBXJ_4").text(data.ds24[0].TaskNum);
                        $("#SBXJ_5").text(data.ds25[0].TaskNum);
                        $("#SBXJ_6").text(data.ds26[0].ComletedNum);
                        $("#SBXJ_7").text(data.ds27[0].ComletedNum);
                        $("#SBXJ_8").text(data.ds28[0].OverdueNum);
                        if (data.ds29[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds29, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "SBXJ_TOP", title: "本月巡检完成率(TOP5)", color: "#4777E5", source: source, unit: '%' });
                        } else {
                            $(".SBXJ_TOP").hide();
                        }
                    }

                    if (data.ds30[0].IsShow == 0) {
                        $("#SBWB_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBWB", text: data.ds30[0].ComletedRate + "%", data: [{ value: data.ds30[0].ComletedNum, color: '#4668EE' }, { value: data.ds30[0].NoComletedNum }] });
                        $("#SBWB_1").text(data.ds31[0].YesterdayComletedNum);
                        $("#SBWB_2").text(data.ds32[0].YesterdayComletedNum);
                        $("#SBWB_3").text(data.ds33[0].YesterdayOverdueNum);
                        $("#SBWB_4").text(data.ds34[0].TaskNum);
                        $("#SBWB_5").text(data.ds35[0].TaskNum);
                        $("#SBWB_6").text(data.ds36[0].ComletedNum);
                        $("#SBWB_7").text(data.ds37[0].ComletedNum);
                        $("#SBWB_8").text(data.ds38[0].OverdueNum);
                        if (data.ds39[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds39, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "SBWB_TOP", title: "本月维保完成率(TOP5)", color: "#4668EE", source: source, unit: '%' });
                        } else {
                            $(".SBWB_TOP").hide();
                        }
                    }

                    if (data.ds40[0].IsShow == 0) {
                        $("#FHCY_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "FHCY", text: data.ds40[0].ComletedRate + "%", data: [{ value: data.ds40[0].ComletedNum, color: '#05C2F8' }, { value: data.ds40[0].NoComletedNum }] });
                        $("#FHCY_1").text(data.ds41[0].YesterdayComletedNum);
                        $("#FHCY_2").text(data.ds42[0].YesterdayComletedNum);
                        $("#FHCY_3").text(data.ds43[0].YesterdayOverdueNum);
                        $("#FHCY_4").text(data.ds44[0].TaskNum);
                        $("#FHCY_5").text(data.ds45[0].TaskNum);
                        $("#FHCY_6").text(data.ds46[0].ComletedNum);
                        $("#FHCY_7").text(data.ds47[0].ComletedNum);
                        $("#FHCY_8").text(data.ds48[0].OverdueNum);
                        if (data.ds49[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds49, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "FHCY_TOP", title: "本月查验完成率(TOP5)", color: "#05C2F8", source: source, unit: '' });
                        } else {
                            $(".FHCY_TOP").hide();
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
    <input type="hidden" id="UserCode" value="021486" />
    <input type="hidden" id="CommID" value="600945" />
    <div id="share">
        <a id="totop" title="返回顶部">返回顶部</a>
        <a id="refresh">刷新</a>
    </div>
    <div class="container-fluid">
        <div class="row container-title">
            <div style="height: 50px"></div>
            <%--<h1 class="container-span-title">工程主管信息看板</h1>--%>
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
                            &nbsp;
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_1">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_2">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">设备空间(个)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">设备台数(台)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_3">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_4">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">本月到期(台)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">质保期内(台)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_5">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f16 "><b id="JB_6">0</b></span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">自行维保(个)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">外委维保(台)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt20">
                                <div id="DQSBWHL" style="width: 100%; height: 100%;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                <span class="f14 colorgrey">当前设备完好率</span>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt20">
                                <div id="BYSBGZL" style="width: 100%; height: 100%;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                <span class="f14 colorgrey">本月设备故障率</span>
                            </div>
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

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="SBXJ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>设备巡检</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="SBXJ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡检完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14"><b id="SBXJ_1">0</b></span><span class="f14 colorgrey ">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="SBXJ_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0 lh26">
                                        <span class="f14 "><b id="SBXJ_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="SBXJ_4">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh26">
                                        <span class="f14 "><b id="SBXJ_6">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh26">
                                        <span class="f14 "><b id="SBXJ_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 lh26">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBXJ_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 SBXJ_TOP">
                                <div id="SBXJ_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="SBWB_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>设备维保</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="SBWB" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月维保完成率</span>
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
                                        <span class="f14 "><b id="SBWB_1">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBWB_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBWB_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="SBWB_4">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBWB_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBWB_6">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBWB_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBWB_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 SBWB_TOP">
                                <div id="SBWB_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="FHCY_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>分户查验</b></span>
                            </div>
                            <div class="col-md-4 col-xs-4 col-sm-4 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="FHCY" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月查验完成率</span>
                                </div>
                            </div>
                            <div class="col-md-8 col-xs-8 col-sm-8 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="FHCY_1">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="FHCY_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="FHCY_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="FHCY_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="FHCY_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="FHCY_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="FHCY_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="FHCY_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 FHCY_TOP">
                                <div id="FHCY_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

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
