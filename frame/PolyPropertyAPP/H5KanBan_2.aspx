<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_2.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_2" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">项目管家信息看板</title>
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
    
            //initGauge({ id: "CWWGFWNQQ", value: 0});
            //initGauge({ id: "CWWGFBNSK", value: 0});
            InitData();
        }
        function InitData() {
            $.dataPostJson('Tb_H5KanBan_2', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, true,
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
                        $("#BNLJQQL_Div").hide();
                    } else {
                        initGauge({ id: "BNLJQQL", value: data.ds8[0].CompleteRate });
                        $("#BNLJQQL_1").text(addThousands(data.ds9[0].CompleteNum));
                        $("#BNLJQQL_2").text(addThousands(data.ds9[0].CompleteNum2));
                        $("#BNLJQQL_3").text(addThousands(data.ds10[0].CompleteNum1));
                        $("#BNLJQQL_4").text(addThousands(data.ds10[0].CompleteNum2));
                        $("#BNLJQQL_5").text(addThousands(data.ds11[0].ThisDayWaitNum1));
                        $("#BNLJQQL_6").text(addThousands(data.ds11[0].ThisDayWaitNum2));
                    }
                    if (data.ds12[0].IsShow == 0) {
                        $("#BNLJSFL_Div").hide();
                    } else {

                        initGauge({ id: "BNLJSFL", value: data.ds12[0].CompleteRate });
                        $("#BNLJSFL_1").text(addThousands(data.ds13[0].CompleteNum));
                        $("#BNLJSFL_2").text(addThousands(data.ds13[0].CompleteNum2));
                        $("#BNLJSFL_3").text(addThousands(data.ds14[0].CompleteNum1));
                        $("#BNLJSFL_4").text(addThousands(data.ds14[0].CompleteNum2));
                        $("#BNLJSFL_5").text(addThousands(data.ds15[0].ThisDayWaitNum1));
                        $("#BNLJSFL_6").text(addThousands(data.ds15[0].ThisDayWaitNum2));
                    }
                    var isNotData = true;
                    if (data.ds18[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds18[0].CompleteRate });
                        $("#QBRW_1").text(data.ds19[0].CompleteNum);
                        $("#QBRW_2").text(data.ds19[0].OverDueNum);
                        $("#QBRW_3").text(data.ds20[0].PlanNum);
                        $("#QBRW_4").text(data.ds20[0].CompleteNum);
                        $("#QBRW_5").text(data.ds20[0].OverDueNum);
                    }

                    if (data.ds21[0].IsShow == 0) {
                        $("#BSGD_Div").hide();
                    } else {
                        isNotData = false;
                        if (data.ds21[0].NotCompleteNum == 0 && data.ds21[0].CompleteNum == data.ds21[0].NotCompleteNum) {
                            data.ds21[0].NotCompleteNum = 1;
                        }
                        initGraphic({ id: "BSGD", text: data.ds21[0].CompleteRate + "%", data: [{ value: data.ds21[0].CompleteNum, color: '#FFA36F' }, { value: data.ds21[0].NotCompleteNum }] });
                        $("#BSGD_1").text(data.ds22[0].CompleteNum);
                        $("#BSGD_2").text(data.ds22[0].CompleteNum2);
                        $("#BSGD_3").text(data.ds22[0].OverDueNum);
                        $("#BSGD_4").text(data.ds23[0].PlanNum);
                        $("#BSGD_5").text(data.ds23[0].PlanNum2);
                        $("#BSGD_6").text(data.ds23[0].CompleteNum);
                        $("#BSGD_7").text(data.ds23[0].CompleteNum2);
                        $("#BSGD_8").text(data.ds23[0].OverDueNum);
                    }

                    if (data.ds24[0].IsShow == 0) {
                        $("#KHBF_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KHBF", text: data.ds24[0].CompleteRate + "%", data: [{ value: data.ds24[0].CompleteNum, color: '#FC8F84' }, { value: data.ds24[0].NotCompleteNum }] });
                        $("#KHBF_1").text(data.ds25[0].CompleteNum);
                        $("#KHBF_2").text(data.ds25[0].CompleteNum2);
                        $("#KHBF_3").text(data.ds25[0].OverDueNum);
                        $("#KHBF_4").text(data.ds26[0].PlanNum);
                        $("#KHBF_5").text(data.ds26[0].PlanNum2);
                        $("#KHBF_6").text(data.ds26[0].CompleteNum);
                        $("#KHBF_7").text(data.ds26[0].CompleteNum2);
                        $("#KHBF_8").text(data.ds26[0].OverDueNum);
                    }

                    if (data.ds27[0].IsShow == 0) {
                        $("#GQXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "GQXC", text: data.ds27[0].CompleteRate + "%", data: [{ value: data.ds27[0].CompleteNum, color: '#45CFAF' }, { value: data.ds27[0].NotCompleteNum }] });
                        $("#GQXC_1").text(data.ds28[0].CompleteNum);
                        $("#GQXC_2").text(data.ds28[0].CompleteNum2);
                        $("#GQXC_3").text(data.ds28[0].OverDueNum);
                        $("#GQXC_4").text(data.ds29[0].PlanNum);
                        $("#GQXC_5").text(data.ds29[0].PlanNum2);
                        $("#GQXC_6").text(data.ds29[0].CompleteNum);
                        $("#GQXC_7").text(data.ds29[0].CompleteNum2);
                        $("#GQXC_8").text(data.ds29[0].OverDueNum);
                    }


                    if (data.ds30[0].IsShow == 0) {
                        $("#ZXXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "ZXXC", text: data.ds30[0].CompleteRate + "%", data: [{ value: data.ds30[0].CompleteNum, color: '#05C2F8' }, { value: data.ds30[0].NotCompleteNum }] });
                        $("#ZXXC_1").text(data.ds31[0].CompleteNum);
                        $("#ZXXC_2").text(data.ds31[0].CompleteNum2);
                        $("#ZXXC_3").text(data.ds31[0].OverDueNum);
                        $("#ZXXC_4").text(data.ds32[0].PlanNum);
                        $("#ZXXC_5").text(data.ds32[0].PlanNum2);
                        $("#ZXXC_6").text(data.ds32[0].CompleteNum);
                        $("#ZXXC_7").text(data.ds32[0].CompleteNum2);
                        $("#ZXXC_8").text(data.ds32[0].OverDueNum);
                    }


                    if (data.ds33[0].IsShow == 0) {
                        $("#KFXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KFXC", text: data.ds33[0].CompleteRate + "%", data: [{ value: data.ds33[0].CompleteNum, color: '#FAC435' }, { value: data.ds33[0].NotCompleteNum }] });
                        $("#KFXC_1").text(data.ds34[0].CompleteNum);
                        $("#KFXC_2").text(data.ds34[0].CompleteNum2);
                        $("#KFXC_3").text(data.ds34[0].OverDueNum);
                        $("#KFXC_4").text(data.ds35[0].PlanNum);
                        $("#KFXC_5").text(data.ds35[0].PlanNum2);
                        $("#KFXC_6").text(data.ds35[0].CompleteNum);
                        $("#KFXC_7").text(data.ds35[0].CompleteNum2);
                        $("#KFXC_8").text(data.ds35[0].OverDueNum);
                    }
                    if (isNotData) {
                        $("#NotData").show();
                    }
                    GetList("本日到期任务", curPageExpire);
                    GetList("本日完成任务", curPageExpire);
                },
                function completeCallback() {
                    layer.closeAll();
                }, function errorCallback() {
                });

        }


        var curPageExpire = 1, curPageComplete = 1, rows = 2;
        function GetList(DataType, CurPage) {
            var IDContent, IDBottom;
            if (DataType == "本日到期任务") {
                IDContent = "Content_Expire";
                IDBottom = "Bottom_Expire";
            } else if (DataType == "本日完成任务") {
                IDContent = "Content_Complete";
                IDBottom = "Bottom_Complete";
            }


            $.dataPostJson('Tb_H5KanBan_2', 'GetList', { "DataType": DataType, "UserCode": $("#UserCode").val(), "page": CurPage, "rows": rows }, true, true,
                function Init() {
                },
                function callback(data) {
                    var totalPage = 0;
                    totalPage = data.total % rows == 0 ? data.total / rows : Math.ceil(data.total / rows);
                    if (DataType == "本日到期任务") {
                        $("#totalExpire").html("&nbsp;共" + data.total + "条");
                        if (totalPage == curPageExpire || totalPage == 0) {
                            $("#" + IDBottom).hide();
                            if (totalPage > 1) {
                                layer.open({
                                    content: '今日到期任务已全部加载!'
                                    , skin: 'msg'
                                    , time: 3
                                });
                                //$.messager.alert('温馨提示', '今日到期任务已全部加载!');
                            }
                        }
                    } else if (DataType == "本日完成任务") {
                        $("#WorkLog_Complete").hide();
                        $("#totalComplete").html("&nbsp;共" + data.total + "条");
                        if (totalPage == curPageComplete || totalPage == 0) {
                            $("#" + IDBottom).hide();
                            //if (totalPage == 0) {
                            //    $("#WorkLog_Complete").hide();
                            //}
                            if (totalPage > 1) {
                                layer.open({
                                    content: '今日完成任务已全部加载!'
                                    , skin: 'msg'
                                    , time: 3
                                });
                                //$.messager.alert('温馨提示', '今日完成任务已全部加载!');
                            }
                        }
                    }
                    if (data.rows.length > 0) {
                        var html = "";
                        var row;
                        for (var i = 0; i < data.rows.length; i++) {
                            row = data.rows[i];
                            if (DataType == "本日到期任务") {
                                //剩余时间
                                var surplus = CalculationDateTime($.dateFormat(new Date(), "yyyy/MM/dd HH:mm:ss"), $.dateFormat(row.Timelimit, "yyyy/MM/dd HH:mm:ss"));
                                html += '<div class="col-md-12 col-xs-12 col-sm-12 mpUd10"><div class="col-md-6 col-xs-6 col-sm-6 mp0"><span class="f14"><b>' + row.ContentType + '</b></span></div><div class="col-md-6 col-xs-6 col-sm-6 mp0 text-right pr5"><span><b>' + surplus + '</b></span></div><div class="col-md-12 col-xs-12 col-sm-12 mp0"><span class="f12">' + row.Content + '</span><br/></div></div>';
                            } else if (DataType == "本日完成任务") {
                                html += '<div class="col-md-12 col-xs-12 col-sm-12 mpUd10"><div class="col-md-6 col-xs-6 col-sm-6 mp0"><span class="f14"><b>' + row.ContentType + '</b></span></div><div class="col-md-6 col-xs-6 col-sm-6 mp0 text-right pr5"><span class="colorgreen"><b>完成&nbsp;:&nbsp;' + $.dateFormat(row.Timelimit, "yyyy/MM/dd HH:mm") + '</b></span></div><div class="col-md-12 col-xs-12 col-sm-12 mp0">&emsp;<span class="f12">' + row.Content + '</span><br/></div></div>';
                            }
                        }
                        $("#" + IDContent).append(html);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function NextPage(DataType) {
            var CurPage = 0;
            if (DataType == "本日到期任务") {
                curPageExpire++;
                CurPage = curPageExpire;
            } else if (DataType == "本日完成任务") {
                curPageComplete++;
                CurPage = curPageComplete;
            }
            GetList(DataType, CurPage);
        }

        function CalculationDateTime(date1, date2) {
            var date1 = new Date(date1);  //开始时间
            var date2 = new Date(date2);    //结束时间
            //if (date1.getTime() > date2.getTime()) {
            //    return "已超时";
            //}
            var date3 = date2.getTime() - date1.getTime()  //时间差的毫秒数

            //计算出相差天数
            var days = Math.floor(date3 / (24 * 3600 * 1000))

            //计算出小时数
            var leave1 = date3 % (24 * 3600 * 1000)    //计算天数后剩余的毫秒数
            var hours = Math.floor(leave1 / (3600 * 1000))
            //计算相差分钟数
            var leave2 = leave1 % (3600 * 1000)        //计算小时数后剩余的毫秒数
            var minutes = Math.floor(leave2 / (60 * 1000))

            //计算相差秒数
            var leave3 = leave2 % (60 * 1000)      //计算分钟数后剩余的毫秒数
            var seconds = Math.round(leave3 / 1000)


            var str = '<span class="coloryellow">剩时&nbsp;:&nbsp;';
            if (date1.getTime() > date2.getTime()) {
                str = '<span class="colorred">已超时&nbsp;:&nbsp;';
            }
            if (days != 0) {
                str += Math.abs(days) + " 天 ";
            }
            str += PrefixInteger(Math.abs(hours), 2) + ":";
            str += PrefixInteger(Math.abs(minutes), 2) + ":";
            str += PrefixInteger(Math.abs(seconds), 2);
            str += "</span>";
            return str;
        }


        function PrefixInteger(num, n) {
            return (Array(n).join(0) + num).slice(-n);
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
            <%--   <h1 class="container-span-title">项目管家信息看板</h1>--%>
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
                            <span class="f14 colorgrey">服务客户(户数)</span>
                        </div>
                        <div class="col-md-6 col-xs-6 col-sm-6 ">
                            <span class="f14 colorgrey">服务面积(平米)</span>
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
                        <div id="BNLJQQL_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <hr class="kanban2" />
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                    <span class="f16"><b>往年清欠</b></span>
                                </div>
                                <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                    <span class="title-time ToMonthStaticDateTime">-</span>
                                </div>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="BNLJQQL" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计清欠率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日清欠(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月清欠(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_5">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJQQL_6">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(元)</span>
                                </div>
                            </div>
                        </div>
                        <div id="BNLJSFL_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <hr class="kanban2" />
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                    <span class="f16"><b>本年收款</b></span>
                                </div>
                                <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                    <span class="title-time ToMonthStaticDateTime">-</span>
                                </div>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="BNLJSFL" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计收费率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">昨日收款(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月收款(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_5">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="BNLJSFL_6">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(元)</span>
                                </div>
                            </div>
                        </div>

                       <%-- <div id="CWWGFWNQQ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <hr class="kanban2" />
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                    <span class="f18"><b>车位费往年清欠</b></span>
                                </div>
                                <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                    <span class="title-time ToMonthStaticDateTime">-</span>
                                </div>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="CWWGFWNQQ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计清欠率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
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
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFWNQQ_5">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFWNQQ_6">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(元)</span>
                                </div>
                            </div>
                        </div>
                        <div id="CWWGFBNSK_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <hr class="kanban2" />
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                    <span class="f18"><b>车位费本年收款</b></span>
                                </div>
                                <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                    <span class="title-time ToMonthStaticDateTime">-</span>
                                </div>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="CWWGFBNSK" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计收费率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0">
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
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="CWWGFBNSK_5">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="CWWGFBNSK_6">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(户数)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">当前欠费(元)</span>
                                </div>
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


        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <!-- 项目员工桌面开始 -->
                    <div class="row module">
                        <div class="col-md-12 col-xs-12 col-sm-12 module-title">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f18">今日到期任务<span class="total"></span></span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToDayStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-content" id="Content_Expire">
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" id="Bottom_Expire" onclick="NextPage('本日到期任务')">
                            <span>展开更多</span>
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
                    <!-- 项目员工桌面开始 -->
                    <div class="row module">
                        <div class="col-md-12 col-xs-12 col-sm-12 module-title">
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                <span class="f18">今日完成任务<span class="total"></span></span>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                <span class="title-time ToDayStaticDateTime">-</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-content" id="Content_Complete">
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" id="Bottom_Complete" onclick="NextPage('本日完成任务')">
                            <span>展开更多</span>
                        </div>
                        <%--  <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" style="line-height: 40px; height: 45px;" id="WorkLog_Complete">
                            <a href="#" class="btn btn-info" style="text-decoration: none; border-radius: 18px; background-color: #10A6F5; font-size: 12px">生成工作日志</a>
                        </div>--%>
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KHBF_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 h10 ">
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh30">
                                    <span class="f14 "><b>本月汇总</b></span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KHBF_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KHBF_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="GQXC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_1">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorblue">任务</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_4">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_6">0</b></span><span class="f14 colorgrey">&nbsp;户数</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="KFXC_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="KFXC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
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
