<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_1.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_1" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">项目员工信息看板</title>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="SKT_Frame/bootstrap/css/bootstrap.min.css" />
    <link href="layer.mobile-v2.0/layer_mobile/need/layer.css" rel="stylesheet" />
    <script src="layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <script src="js/help.js"></script>
    <script src="js/share.js"></script>
    <link href="js/share.css" rel="stylesheet" />
    <link href="css/base.css" rel="stylesheet" />
    <script src="incubator-echarts-4.9.0/dist/echarts.min.js"></script>
    <script src="js/initEchartUtil.js"></script>
    <script type="text/javascript">  
 

        $(function () {
            //layer.open({
            //    type: 2
            //    , content: '加载中'
            //    , shade: 'background-color: rgba(0,0,0,.3)' //自定义遮罩的透明度  
            //    , shadeClose: false 
            //});
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
            $.dataPostJson('Tb_H5KanBan_1', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, true,
                function Init() {
                },
                function callback(data) {

                    //$("#CommName").text(data.ds2[0].项目名称);
                    $(".ToDayStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds[0].今日时间, "yyyy/MM/dd HH:mm"));
                    $(".ToMonthStaticDateTime").html("数据截止时间:" + $.dateFormat(data.ds1[0].昨日时间, "yyyy/MM/dd HH:mm"));


                    //console.log(data.ds5[0].IsShow);
                    var isNotData = true;
                    if (data.ds5[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds5[0].CompleteRate });
                        $("#QBRW_1").text(data.ds6[0].CompleteNum);
                        $("#QBRW_2").text(data.ds6[0].OverDueNum);
                        $("#QBRW_3").text(data.ds7[0].PlanNum);
                        $("#QBRW_4").text(data.ds7[0].CompleteNum);
                        $("#QBRW_5").text(data.ds7[0].OverDueNum);
                    }


                    if (data.ds8[0].IsShow == 0) {
                        $("#BSGD_Div").hide();
                    } else {
                        isNotData = false;
                        if (data.ds8[0].NotCompleteNum == 0 && data.ds8[0].CompleteNum == data.ds8[0].NotCompleteNum) {
                            data.ds8[0].NotCompleteNum = 1;
                        }
                        initGraphic({ id: "BSGD", text: data.ds8[0].CompleteRate + "%", data: [{ value: data.ds8[0].CompleteNum, color: '#FFA36F' }, { value: data.ds8[0].NotCompleteNum }] });
                        $("#BSGD_1").text(data.ds9[0].CompleteNum);
                        $("#BSGD_2").text(data.ds9[0].CompleteNum2);
                        $("#BSGD_3").text(data.ds9[0].OverDueNum);
                        $("#BSGD_4").text(data.ds10[0].PlanNum);
                        $("#BSGD_5").text(data.ds10[0].PlanNum2);
                        $("#BSGD_6").text(data.ds10[0].CompleteNum);
                        $("#BSGD_7").text(data.ds10[0].CompleteNum2);
                        $("#BSGD_8").text(data.ds10[0].OverDueNum);
                    }

                    if (data.ds11[0].IsShow == 0) {
                        $("#KHBF_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KHBF", text: data.ds11[0].CompleteRate + "%", data: [{ value: data.ds11[0].CompleteNum, color: '#FC8F84' }, { value: data.ds11[0].NotCompleteNum }] });
                        $("#KHBF_1").text(data.ds12[0].CompleteNum);
                        $("#KHBF_2").text(data.ds12[0].CompleteNum2);
                        $("#KHBF_3").text(data.ds12[0].OverDueNum);
                        $("#KHBF_4").text(data.ds13[0].PlanNum);
                        $("#KHBF_5").text(data.ds13[0].PlanNum2);
                        $("#KHBF_6").text(data.ds13[0].CompleteNum);
                        $("#KHBF_7").text(data.ds13[0].CompleteNum2);
                        $("#KHBF_8").text(data.ds13[0].OverDueNum);
                    }

                    if (data.ds14[0].IsShow == 0) {
                        $("#GQXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "GQXC", text: data.ds14[0].CompleteRate + "%", data: [{ value: data.ds14[0].CompleteNum, color: '#45CFAF' }, { value: data.ds14[0].NotCompleteNum }] });
                        $("#GQXC_1").text(data.ds15[0].CompleteNum);
                        $("#GQXC_2").text(data.ds15[0].CompleteNum2);
                        $("#GQXC_3").text(data.ds15[0].OverDueNum);
                        $("#GQXC_4").text(data.ds16[0].PlanNum);
                        $("#GQXC_5").text(data.ds16[0].PlanNum2);
                        $("#GQXC_6").text(data.ds16[0].CompleteNum);
                        $("#GQXC_7").text(data.ds16[0].CompleteNum2);
                        $("#GQXC_8").text(data.ds16[0].OverDueNum);
                    }


                    if (data.ds17[0].IsShow == 0) {
                        $("#ZXXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "ZXXC", text: data.ds17[0].CompleteRate + "%", data: [{ value: data.ds17[0].CompleteNum, color: '#05C2F8' }, { value: data.ds17[0].NotCompleteNum }] });
                        $("#ZXXC_1").text(data.ds18[0].CompleteNum);
                        $("#ZXXC_2").text(data.ds18[0].CompleteNum2);
                        $("#ZXXC_3").text(data.ds18[0].OverDueNum);
                        $("#ZXXC_4").text(data.ds19[0].PlanNum);
                        $("#ZXXC_5").text(data.ds19[0].PlanNum2);
                        $("#ZXXC_6").text(data.ds19[0].CompleteNum);
                        $("#ZXXC_7").text(data.ds19[0].CompleteNum2);
                        $("#ZXXC_8").text(data.ds19[0].OverDueNum);
                    }


                    if (data.ds20[0].IsShow == 0) {
                        $("#KFXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KFXC", text: data.ds20[0].CompleteRate + "%", data: [{ value: data.ds20[0].CompleteNum, color: '#FAC435' }, { value: data.ds20[0].NotCompleteNum }] });
                        $("#KFXC_1").text(data.ds21[0].CompleteNum);
                        $("#KFXC_2").text(data.ds21[0].CompleteNum2);
                        $("#KFXC_3").text(data.ds21[0].OverDueNum);
                        $("#KFXC_4").text(data.ds22[0].PlanNum);
                        $("#KFXC_5").text(data.ds22[0].PlanNum2);
                        $("#KFXC_6").text(data.ds22[0].CompleteNum);
                        $("#KFXC_7").text(data.ds22[0].CompleteNum2);
                        $("#KFXC_8").text(data.ds22[0].OverDueNum);
                    }

                    if (data.ds23[0].IsShow == 0) {
                        $("#SBXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBXJ", text: data.ds23[0].CompleteRate + "%", data: [{ value: data.ds23[0].CompleteNum, color: '#4977E6' }, { value: data.ds23[0].NotCompleteNum }] });
                        $("#SBXJ_1").text(data.ds24[0].CompleteNum);
                        $("#SBXJ_2").text(data.ds24[0].CompleteNum2);
                        $("#SBXJ_3").text(data.ds24[0].OverDueNum);
                        $("#SBXJ_4").text(data.ds25[0].PlanNum);
                        $("#SBXJ_5").text(data.ds25[0].PlanNum2);
                        $("#SBXJ_6").text(data.ds25[0].CompleteNum);
                        $("#SBXJ_7").text(data.ds25[0].CompleteNum2);
                        $("#SBXJ_8").text(data.ds25[0].OverDueNum);
                    }


                    if (data.ds26[0].IsShow == 0) {
                        $("#SBWB_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBWB", text: data.ds26[0].CompleteRate + "%", data: [{ value: data.ds26[0].CompleteNum, color: '#FE9E62' }, { value: data.ds26[0].NotCompleteNum }] });
                        $("#SBWB_1").text(data.ds27[0].CompleteNum);
                        $("#SBWB_2").text(data.ds27[0].CompleteNum2);
                        $("#SBWB_3").text(data.ds27[0].OverDueNum);
                        $("#SBWB_4").text(data.ds28[0].PlanNum);
                        $("#SBWB_5").text(data.ds28[0].PlanNum2);
                        $("#SBWB_6").text(data.ds28[0].CompleteNum);
                        $("#SBWB_7").text(data.ds28[0].CompleteNum2);
                        $("#SBWB_8").text(data.ds28[0].OverDueNum);
                    }

                    if (data.ds29[0].IsShow == 0) {
                        $("#FHCY_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "FHCY", text: data.ds29[0].CompleteRate + "%", data: [{ value: data.ds29[0].CompleteNum, color: '#05C2F8' }, { value: data.ds29[0].NotCompleteNum }] });
                        $("#FHCY_1").text(data.ds30[0].CompleteNum);
                        $("#FHCY_2").text(data.ds30[0].CompleteNum2);
                        $("#FHCY_3").text(data.ds30[0].OverDueNum);
                        $("#FHCY_4").text(data.ds31[0].PlanNum);
                        $("#FHCY_5").text(data.ds31[0].PlanNum2);
                        $("#FHCY_6").text(data.ds31[0].CompleteNum);
                        $("#FHCY_7").text(data.ds31[0].CompleteNum2);
                        $("#FHCY_8").text(data.ds31[0].OverDueNum);
                    }


                    if (data.ds32[0].IsShow == 0) {
                        $("#AQXG_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "AQXG", text: data.ds32[0].CompleteRate + "%", data: [{ value: data.ds32[0].CompleteNum, color: '#45CFAF' }, { value: data.ds32[0].NotCompleteNum }] });
                        $("#AQXG_1").text(data.ds33[0].CompleteNum);
                        $("#AQXG_2").text(data.ds33[0].CompleteNum2);
                        $("#AQXG_3").text(data.ds33[0].OverDueNum);
                        $("#AQXG_4").text(data.ds34[0].PlanNum);
                        $("#AQXG_5").text(data.ds34[0].PlanNum2);
                        $("#AQXG_6").text(data.ds34[0].CompleteNum);
                        $("#AQXG_7").text(data.ds34[0].CompleteNum2);
                        $("#AQXG_8").text(data.ds34[0].OverDueNum);
                    }


                    if (data.ds35[0].IsShow == 0) {
                        $("#XFXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "XFXJ", text: data.ds35[0].CompleteRate + "%", data: [{ value: data.ds35[0].CompleteNum, color: '#4483E0' }, { value: data.ds35[0].NotCompleteNum }] });
                        $("#XFXJ_1").text(data.ds36[0].CompleteNum);
                        $("#XFXJ_2").text(data.ds36[0].CompleteNum2);
                        $("#XFXJ_3").text(data.ds36[0].OverDueNum);
                        $("#XFXJ_4").text(data.ds37[0].PlanNum);
                        $("#XFXJ_5").text(data.ds37[0].PlanNum2);
                        $("#XFXJ_6").text(data.ds37[0].CompleteNum);
                        $("#XFXJ_7").text(data.ds37[0].CompleteNum2);
                        $("#XFXJ_8").text(data.ds37[0].OverDueNum);
                    }


                    if (data.ds38[0].IsShow == 0) {
                        $("#HJBJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "HJBJ", text: data.ds38[0].CompleteRate + "%", data: [{ value: data.ds38[0].CompleteNum, color: '#FC8F84' }, { value: data.ds38[0].NotCompleteNum }] });
                        $("#HJBJ_1").text(data.ds39[0].CompleteNum);
                        $("#HJBJ_2").text(data.ds39[0].CompleteNum2);
                        $("#HJBJ_3").text(data.ds39[0].OverDueNum);
                        $("#HJBJ_4").text(data.ds40[0].PlanNum);
                        $("#HJBJ_5").text(data.ds40[0].PlanNum2);
                        $("#HJBJ_6").text(data.ds40[0].CompleteNum);
                        $("#HJBJ_7").text(data.ds40[0].CompleteNum2);
                        $("#HJBJ_8").text(data.ds40[0].OverDueNum);
                    }


                    if (data.ds41[0].IsShow == 0) {
                        $("#LHYH_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "LHYH", text: data.ds41[0].CompleteRate + "%", data: [{ value: data.ds41[0].CompleteNum, color: '#FAC435' }, { value: data.ds41[0].NotCompleteNum }] });
                        $("#LHYH_1").text(data.ds42[0].CompleteNum);
                        $("#LHYH_2").text(data.ds42[0].CompleteNum2);
                        $("#LHYH_3").text(data.ds42[0].OverDueNum);
                        $("#LHYH_4").text(data.ds43[0].PlanNum);
                        $("#LHYH_5").text(data.ds43[0].PlanNum2);
                        $("#LHYH_6").text(data.ds43[0].CompleteNum);
                        $("#LHYH_7").text(data.ds43[0].CompleteNum2);
                        $("#LHYH_8").text(data.ds43[0].OverDueNum);
                    }


                    if (data.ds44[0].IsShow == 0) {
                        $("#SHXS_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SHXS", text: data.ds44[0].CompleteRate + "%", data: [{ value: data.ds44[0].CompleteNum, color: '#05C2F8' }, { value: data.ds44[0].NotCompleteNum }] });
                        $("#SHXS_1").text(data.ds45[0].CompleteNum);
                        $("#SHXS_2").text(data.ds45[0].CompleteNum2);
                        $("#SHXS_3").text(data.ds45[0].OverDueNum);
                        $("#SHXS_4").text(data.ds46[0].PlanNum);
                        $("#SHXS_5").text(data.ds46[0].PlanNum2);
                        $("#SHXS_6").text(data.ds46[0].CompleteNum);
                        $("#SHXS_7").text(data.ds46[0].CompleteNum2);
                        $("#SHXS_8").text(data.ds46[0].OverDueNum);
                    }


                    if (data.ds47[0].IsShow == 0) {
                        $("#LJQY_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "LJQY", text: data.ds47[0].CompleteRate + "%", data: [{ value: data.ds47[0].CompleteNum, color: '#4A78EA' }, { value: data.ds47[0].NotCompleteNum }] });
                        $("#LJQY_1").text(data.ds48[0].CompleteNum);
                        $("#LJQY_2").text(data.ds48[0].CompleteNum2);
                        $("#LJQY_3").text(data.ds48[0].OverDueNum);
                        $("#LJQY_4").text(data.ds49[0].PlanNum);
                        $("#LJQY_5").text(data.ds49[0].PlanNum2);
                        $("#LJQY_6").text(data.ds49[0].CompleteNum);
                        $("#LJQY_7").text(data.ds49[0].CompleteNum2);
                        $("#LJQY_8").text(data.ds49[0].OverDueNum);
                    }

                    if (data.ds50[0].IsShow == 0) {
                        $("#PZHC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "PZHC", text: data.ds50[0].CompleteRate + "%", data: [{ value: data.ds50[0].CompleteNum, color: '#FC8F84' }, { value: data.ds50[0].NotCompleteNum }] });
                        $("#PZHC_1").text(data.ds51[0].CompleteNum);
                        $("#PZHC_2").text(data.ds51[0].CompleteNum2);
                        $("#PZHC_3").text(data.ds51[0].OverDueNum);
                        $("#PZHC_4").text(data.ds52[0].PlanNum);
                        $("#PZHC_5").text(data.ds52[0].PlanNum2);
                        $("#PZHC_6").text(data.ds52[0].CompleteNum);
                        $("#PZHC_7").text(data.ds52[0].CompleteNum2);
                        $("#PZHC_8").text(data.ds52[0].OverDueNum);
                    }

                    if (data.ds53[0].IsShow == 0) {
                        $("#PZZG_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "PZZG", text: data.ds53[0].CompleteRate + "%", data: [{ value: data.ds53[0].CompleteNum, color: '#FAC435' }, { value: data.ds53[0].NotCompleteNum }] });
                        $("#PZZG_1").text(data.ds54[0].CompleteNum);
                        $("#PZZG_2").text(data.ds54[0].CompleteNum2);
                        $("#PZZG_3").text(data.ds54[0].OverDueNum);
                        $("#PZZG_4").text(data.ds55[0].PlanNum);
                        $("#PZZG_5").text(data.ds55[0].PlanNum2);
                        $("#PZZG_6").text(data.ds55[0].CompleteNum);
                        $("#PZZG_7").text(data.ds55[0].CompleteNum2);
                        $("#PZZG_8").text(data.ds55[0].OverDueNum);
                    }
                    if (isNotData) {
                        $("#NotData").show();
                    }
                    GetList("本日到期任务", curPageExpire);
                    GetList("本日完成任务", curPageExpire);
                },
                function completeCallback() {
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


            $.dataPostJson('Tb_H5KanBan_1', 'GetList', { "DataType": DataType, "UserCode": $("#UserCode").val(), "page": CurPage, "rows": rows }, true, true,
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
    <input type="hidden" id="UserCode" value="005673" />
    <input type="hidden" id="CommID" value="600805" />
    <div id="share">
        <a id="totop" title="返回顶部">返回顶部</a>
        <a id="refresh">刷新</a>
    </div>
    <div class="container-fluid">
        <div class="row container-title">
            <div style="height: 50px"></div>
            <%--   <h1 class="container-span-title">项目员工信息看板</h1>--%>
        </div>
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
                            <%-- <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0"><span class="f14"><b>报事报修</b></span></div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0 text-right pr5"><b><span class="coloryellow">剩时&nbsp;:&nbsp;19:36:00</span></b></div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="f12">2010828000012</span>
                                </div>
                            </div>--%>
                            <%--  <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <span class="title">【报事工单】</span><span class="time">剩时 : 03:04:55</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="text">201912312313123(儿童乐园)</span><br />
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <span class="title">【报事工单】</span><span class="time2">剩时 : 03:04:55</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="text">201912312313123(儿童乐园)</span><br />
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <span class="title">【报事工单】</span><span class="time3">剩时 : 03:04:55</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="text">201912312313123(儿童乐园)</span><br />
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <span class="title">【客户拜访】</span><span class="time">剩时 : 03:04:55</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="text">201912312313123(儿童乐园)</span><br />
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" id="Bottom_Expire" onclick="NextPage('本日到期任务')">
                            <span class="icon-more"><b>展开更多</b></span>
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
                            <%--  <div class="clearfix">
                                <div class="pull-left">
                                    <span class="h1">二、本日完成任务任务</span>
                                </div>
                                <div class="pull-right">
                                    <span class="h2">数据截止:</span><span class="h2" id="StatDate">2019年01月01日 23:01:05</span>
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-content" id="Content_Complete">
                            <%-- <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0"><span class="f14"><b>报事报修</b></span></div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0 text-right pr5"><b><span class="colorgreen">完成&nbsp;:&nbsp;2019/09/01 19:36</span></b></div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="f12">2010828000012</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mpUd10">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0"><span class="f14"><b>报事报修</b></span></div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0 text-right pr5"><b><span class="colorgreen">完成&nbsp;:&nbsp;2019/09/01 19:36</span></b></div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    &emsp;<span class="f12">2012338000012</span>
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" id="Bottom_Complete" onclick="NextPage('本日完成任务')">
                            <span class="icon-more"><b>展开更多</b></span>
                        </div>
                        <%-- <div class="col-md-12 col-xs-12 col-sm-12 module-bottom" style="line-height: 40px; height: 45px;" id="WorkLog_Complete">
                            <a href="javascript:void(0)" class="btn btn-info" style="text-decoration: none; border-radius: 18px; background-color: #10A6F5; font-size: 12px">生成工作日志</a>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_1">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBXJ_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="SBXJ_4">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_6">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SBXJ_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBXJ_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="FHCY_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>分户查验</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="FHCY" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月查验完成率</span>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="FHCY_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="AQXG_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="AQXG_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="AQXG_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="AQXG_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
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
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="XFXJ_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="HJBJ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>环境保洁</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="HJBJ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月任务完成率</span>
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
                                        <span class="f14 "><b id="HJBJ_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="HJBJ_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="HJBJ_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="HJBJ_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="HJBJ_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="HJBJ_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="HJBJ_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="HJBJ_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="LHYH_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>绿化养护</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="LHYH" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月任务完成率</span>
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
                                        <span class="f14 "><b id="LHYH_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LHYH_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="LHYH_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="LHYH_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LHYH_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LHYH_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LHYH_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="LHYH_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="SHXS_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>四害消杀</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0 lh24">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="SHXS" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月任务完成率</span>
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
                                        <span class="f14 "><b id="SHXS_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXS_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SHXS_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="SHXS_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXS_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXS_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXS_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SHXS_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="LJQY_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>垃圾清运</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="LJQY" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月任务完成率</span>
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
                                        <span class="f14 "><b id="LJQY_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LJQY_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="LJQY_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="LJQY_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LJQY_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LJQY_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="LJQY_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="LJQY_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="PZHC_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>品质核查</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="PZHC" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月核查完成率</span>
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
                                        <span class="f14 "><b id="PZHC_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZHC_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="PZHC_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="PZHC_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZHC_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZHC_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZHC_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="PZHC_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="PZZG_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>品质整改</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="PZZG" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt13 textcenter">
                                    <span class="f14 colorgrey">本月整改完成率</span>
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
                                        <span class="f14 "><b id="PZZG_1">0</b></span><span class="f14 colorgrey">&nbsp;整改项目</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZZG_2">0</b></span><span class="f14 colorgrey">&nbsp;整改报告</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="PZZG_3">0</b></span><span class="f14 colorgrey">&nbsp;整改报告</span>
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
                                        <span class="f14 "><b id="PZZG_4">0</b></span><span class="f14 colorgrey">&nbsp;整改项目</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZZG_5">0</b></span><span class="f14 colorgrey">&nbsp;整改报告</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZZG_6">0</b></span><span class="f14 colorgrey">&nbsp;整改项目</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="PZZG_7">0</b></span><span class="f14 colorgrey">&nbsp;整改报告</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="PZZG_8">0</b></span><span class="f14 colorgrey">&nbsp;整改报告</span>
                                    </div>
                                </div>
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
