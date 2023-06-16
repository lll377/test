﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_5.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_5" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">秩序主管信息看板</title>
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
            $.dataPostJson('Tb_H5KanBan_5', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, true,
                function Init() {
                },
                function callback(data) {
                    //$("#CommName").text(data.ds2[0].项目名称);
                    $(".ToDayStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds[0].今日时间, "yyyy/MM/dd HH:mm"));
                    $(".ToMonthStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds1[0].昨日时间, "yyyy/MM/dd HH:mm"));
                    var isNotData = true;
                    if (data.ds3[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds3[0].ComletedRate });
                        $("#QBRW_1").text(data.ds4[0].YesterdayComletedNum);
                        $("#QBRW_2").text(data.ds4[0].YesterdayOverdueNum);
                        $("#QBRW_3").text(data.ds5[0].TaskNum);
                        $("#QBRW_4").text(data.ds5[0].ComletedNum);
                        $("#QBRW_5").text(data.ds5[0].OverdueNum);
                    }


                    if (data.ds6[0].IsShow == 0) {
                        $("#AQXG_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "AQXG", text: data.ds6[0].ComletedRate + "%", data: [{ value: data.ds6[0].ComletedNum, color: '#45CFAF' }, { value: data.ds6[0].NoComletedNum }] });
                        $("#AQXG_1").text(data.ds7[0].YesterdayComletedNum);
                        $("#AQXG_2").text(data.ds8[0].YesterdayComletedNum);
                        $("#AQXG_3").text(data.ds9[0].YesterdayOverdueNum);
                        $("#AQXG_4").text(data.ds10[0].TaskNum);
                        $("#AQXG_5").text(data.ds11[0].TaskNum);
                        $("#AQXG_6").text(data.ds12[0].ComletedNum);
                        $("#AQXG_7").text(data.ds13[0].ComletedNum);
                        $("#AQXG_8").text(data.ds14[0].OverdueNum);
                        if (data.ds15[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds15, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "AQXG_TOP", title: "本月巡更完成率(TOP5)", color: "#45CFAF", source: source, unit: '%'});
                        } else {
                            $(".AQXG_TOP").hide();
                        }
                    }

                    if (data.ds16[0].IsShow == 0) {
                        $("#XFXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "XFXJ", text: data.ds16[0].ComletedRate + "%", data: [{ value: data.ds16[0].ComletedNum, color: '#4668EE' }, { value: data.ds16[0].NoComletedNum }] });
                        $("#XFXJ_1").text(data.ds17[0].YesterdayComletedNum);
                        $("#XFXJ_2").text(data.ds18[0].YesterdayComletedNum);
                        $("#XFXJ_3").text(data.ds19[0].YesterdayOverdueNum);
                        $("#XFXJ_4").text(data.ds20[0].TaskNum);
                        $("#XFXJ_5").text(data.ds21[0].TaskNum);
                        $("#XFXJ_6").text(data.ds22[0].ComletedNum);
                        $("#XFXJ_7").text(data.ds23[0].ComletedNum);
                        $("#XFXJ_8").text(data.ds24[0].OverdueNum);
                        if (data.ds25[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds25, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "XFXJ_TOP", title: "本月巡检完成率(TOP5)", color: "#4668EE", source: source, unit: '%' });
                        } else {
                            $(".XFXJ_TOP").hide();
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
    <input type="hidden" id="CommID" value="601396" />
    <div id="share">
        <a id="totop" title="返回顶部">返回顶部</a>
        <a id="refresh">刷新</a>
    </div>
    <div class="container-fluid">
        <div class="row container-title">
              <div style="height: 50px"></div>
            <%--<h1 class="container-span-title">秩序主管信息看板</h1>--%>
        </div>

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
                 
                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="AQXG_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>安全巡更</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="AQXG" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡更完成率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>昨日快报</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0  lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="AQXG_1">0</b></span><span class="f14 colorgrey ">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="AQXG_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0 lh26">
                                        <span class="f14 "><b id="AQXG_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="AQXG_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="AQXG_6">0</b></span>&nbsp;<span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="AQXG_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="AQXG_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 AQXG_TOP pt20">
                                <div id="AQXG_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="XFXJ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>消防巡检</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="XFXJ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月巡检完成率</span>
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
                                        <span class="f14 "><b id="XFXJ_1">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="XFXJ_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="XFXJ_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="XFXJ_4">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="XFXJ_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="XFXJ_6">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="XFXJ_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0 ">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="XFXJ_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 XFXJ_TOP pt20">
                                <div id="XFXJ_TOP" style="width: 100%; height: 180px;"></div>
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
