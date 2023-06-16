<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="H5KanBan_7.aspx.cs" Inherits="M_Main.frame.PolyPropertyAPP.H5KanBan_7" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"> -->
    <title id="CommName">项目经理信息看板</title>
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
            $.dataPostJson('Tb_H5KanBan_7', 'InitData', { "UserCode": $("#UserCode").val(), "CommID": $("#CommID").val() }, true, false,
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


                    initGaugeCar({ id: "SBXX", data: [{ value: data.ds10[0].IntactRate, title: "当前设备完好率" }, { value: data.ds11[0].EquipmentFailureRate, title: "当前设备故障率" }] });
                    $("#SBXX_1").text(addThousands(data.ds8[0].Num));
                    $("#SBXX_2").text(addThousands(data.ds9[0].EquipmentNum));
                    $("#SBXX_3").text(addThousands(data.ds9[0].bydqNum));
                    $("#SBXX_4").text(addThousands(data.ds9[0].zbqnNum));
                    $("#SBXX_5").text(addThousands(data.ds9[0].zxwbNum));
                    $("#SBXX_6").text(addThousands(data.ds9[0].wwwbNum));



                    var isNotData = true;
                    if (data.ds12[0].IsShow == 0) {
                        $("#QBRW_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "QBRW", value: data.ds12[0].ComletedRate });
                        $("#QBRW_1").text(data.ds13[0].YesterdayComletedNum);
                        $("#QBRW_2").text(data.ds13[0].YesterdayOverdueNum);
                        $("#QBRW_3").text(data.ds14[0].TaskNum);
                        $("#QBRW_4").text(data.ds14[0].ComletedNum);
                        $("#QBRW_5").text(data.ds14[0].OverdueNum);
                    }

                    if (data.ds15[0].IsShow == 0) {
                        $("#BSGD_Div").hide();
                    } else {
                        isNotData = false;
                        if (data.ds15[0].NoComletedNum == 0 && data.ds15[0].ComletedNum == data.ds15[0].NoComletedNum) {
                            data.ds15[0].NoComletedNum = 1;
                        }
                        initGraphic({ id: "BSGD", text: data.ds15[0].ComletedRate + "%", data: [{ value: data.ds15[0].ComletedNum, color: '#FFA36F' }, { value: data.ds15[0].NoComletedNum }] });
                        $("#BSGD_1").text(data.ds16[0].YesterdayComletedNum);
                        $("#BSGD_2").text(data.ds17[0].YesterdayComletedNum);
                        $("#BSGD_3").text(data.ds18[0].YesterdayOverdueNum);
                        $("#BSGD_4").text(data.ds19[0].TaskNum);
                        $("#BSGD_5").text(data.ds20[0].TaskNum);
                        $("#BSGD_6").text(data.ds21[0].ComletedNum);
                        $("#BSGD_7").text(data.ds22[0].ComletedNum);
                        $("#BSGD_8").text(data.ds23[0].OverdueNum);
                        if (data.ds24[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds24, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "BSGD_TOP", title: "本月工单完成数(TOP5)", color: "#FFA36F", source: source, unit: '' });
                        } else {
                            $(".BSGD_TOP").hide();
                        }
                    }

                    if (data.ds25[0].IsShow == 0) {
                        $("#KHBF_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KHBF", text: data.ds25[0].ComletedRate + "%", data: [{ value: data.ds25[0].ComletedNum, color: '#FC8F84' }, { value: data.ds25[0].NoComletedNum }] });
                        $("#KHBF_1").text(data.ds26[0].YesterdayComletedNum);
                        $("#KHBF_2").text(data.ds27[0].YesterdayComletedNum);
                        $("#KHBF_3").text(data.ds28[0].YesterdayOverdueNum);
                        $("#KHBF_4").text(data.ds29[0].TaskNum);
                        $("#KHBF_5").text(data.ds30[0].TaskNum);
                        $("#KHBF_6").text(data.ds31[0].ComletedNum);
                        $("#KHBF_7").text(data.ds32[0].ComletedNum);
                        $("#KHBF_8").text(data.ds33[0].OverdueNum);
                        if (data.ds34[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds34, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "KHBF_TOP", title: "本月拜访完成数(TOP5)", color: "#FC8F84", source: source, unit: '' });
                        } else {
                            $(".KHBF_TOP").hide();
                        }
                    }

                    if (data.ds35[0].IsShow == 0) {
                        $("#GQXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "GQXC", text: data.ds35[0].ComletedRate + "%", data: [{ value: data.ds35[0].ComletedNum, color: '#45CFAF' }, { value: data.ds35[0].NoComletedNum }] });
                        $("#GQXC_1").text(data.ds36[0].YesterdayComletedNum);
                        $("#GQXC_2").text(data.ds37[0].YesterdayComletedNum);
                        $("#GQXC_3").text(data.ds38[0].YesterdayOverdueNum);
                        $("#GQXC_4").text(data.ds39[0].TaskNum);
                        $("#GQXC_5").text(data.ds40[0].TaskNum);
                        $("#GQXC_6").text(data.ds41[0].ComletedNum);
                        $("#GQXC_7").text(data.ds42[0].ComletedNum);
                        $("#GQXC_8").text(data.ds43[0].OverdueNum);
                        if (data.ds44[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds44, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "GQXC_TOP", title: "本月巡查完成率(TOP5)", color: "#45CFAF", source: source, unit: '%' });
                        } else {
                            $(".GQXC_TOP").hide();
                        }
                    }


                    if (data.ds45[0].IsShow == 0) {
                        $("#ZXXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "ZXXC", text: data.ds45[0].ComletedRate + "%", data: [{ value: data.ds45[0].ComletedNum, color: '#05C2F8' }, { value: data.ds45[0].NoComletedNum }] });
                        $("#ZXXC_1").text(data.ds46[0].YesterdayComletedNum);
                        $("#ZXXC_2").text(data.ds47[0].YesterdayComletedNum);
                        $("#ZXXC_3").text(data.ds48[0].YesterdayOverdueNum);
                        $("#ZXXC_4").text(data.ds49[0].TaskNum);
                        $("#ZXXC_5").text(data.ds50[0].TaskNum);
                        $("#ZXXC_6").text(data.ds51[0].ComletedNum);
                        $("#ZXXC_7").text(data.ds52[0].ComletedNum);
                        $("#ZXXC_8").text(data.ds53[0].OverdueNum);
                        if (data.ds54[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds54, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "ZXXC_TOP", title: "本月巡查完成率(TOP5)", color: "#05C2F8", source: source, unit: '%'});
                        } else {
                            $(".ZXXC_TOP").hide();
                        }
                    }


                    if (data.ds55[0].IsShow == 0) {
                        $("#KFXC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "KFXC", text: data.ds55[0].ComletedRate + "%", data: [{ value: data.ds55[0].ComletedNum, color: '#FAC435' }, { value: data.ds55[0].NoComletedNum }] });
                        $("#KFXC_1").text(data.ds56[0].YesterdayComletedNum);
                        $("#KFXC_2").text(data.ds57[0].YesterdayComletedNum);
                        $("#KFXC_3").text(data.ds58[0].YesterdayOverdueNum);
                        $("#KFXC_4").text(data.ds59[0].TaskNum);
                        $("#KFXC_5").text(data.ds60[0].TaskNum);
                        $("#KFXC_6").text(data.ds61[0].ComletedNum);
                        $("#KFXC_7").text(data.ds62[0].ComletedNum);
                        $("#KFXC_8").text(data.ds63[0].OverdueNum);
                        if (data.ds64[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds64, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "KFXC_TOP", title: "本月巡查完成数(TOP5)", color: "#FAC435", source: source, unit: '' });
                        } else {
                            $(".KFXC_TOP").hide();
                        }
                    }


                    if (data.ds65[0].IsShow == 0) {
                        $("#SBXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBXJ", text: data.ds65[0].ComletedRate + "%", data: [{ value: data.ds65[0].ComletedNum, color: '#4777E5' }, { value: data.ds65[0].NoComletedNum }] });
                        $("#SBXJ_1").text(data.ds66[0].YesterdayComletedNum);
                        $("#SBXJ_2").text(data.ds67[0].YesterdayComletedNum);
                        $("#SBXJ_3").text(data.ds68[0].YesterdayOverdueNum);
                        $("#SBXJ_4").text(data.ds69[0].TaskNum);
                        $("#SBXJ_5").text(data.ds70[0].TaskNum);
                        $("#SBXJ_6").text(data.ds71[0].ComletedNum);
                        $("#SBXJ_7").text(data.ds72[0].ComletedNum);
                        $("#SBXJ_8").text(data.ds73[0].OverdueNum);
                        if (data.ds74[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds74, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "SBXJ_TOP", title: "本月巡检完成率(TOP5)", color: "#4777E5", source: source, unit: '%' });
                        } else {
                            $(".SBXJ_TOP").hide();
                        }
                    }

                    if (data.ds75[0].IsShow == 0) {
                        $("#SBWB_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SBWB", text: data.ds75[0].ComletedRate + "%", data: [{ value: data.ds75[0].ComletedNum, color: '#4668EE' }, { value: data.ds75[0].NoComletedNum }] });
                        $("#SBWB_1").text(data.ds76[0].YesterdayComletedNum);
                        $("#SBWB_2").text(data.ds77[0].YesterdayComletedNum);
                        $("#SBWB_3").text(data.ds78[0].YesterdayOverdueNum);
                        $("#SBWB_4").text(data.ds79[0].TaskNum);
                        $("#SBWB_5").text(data.ds80[0].TaskNum);
                        $("#SBWB_6").text(data.ds81[0].ComletedNum);
                        $("#SBWB_7").text(data.ds82[0].ComletedNum);
                        $("#SBWB_8").text(data.ds83[0].OverdueNum);
                        if (data.ds84[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds84, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "SBWB_TOP", title: "本月维保完成率(TOP5)", color: "#4668EE", source: source, unit: '%'});
                        } else {
                            $(".SBWB_TOP").hide();
                        }
                    }

                    if (data.ds85[0].IsShow == 0) {
                        $("#FHCY_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "FHCY", text: data.ds85[0].ComletedRate + "%", data: [{ value: data.ds85[0].ComletedNum, color: '#05C2F8' }, { value: data.ds85[0].NoComletedNum }] });
                        $("#FHCY_1").text(data.ds86[0].YesterdayComletedNum);
                        $("#FHCY_2").text(data.ds87[0].YesterdayComletedNum);
                        $("#FHCY_3").text(data.ds88[0].YesterdayOverdueNum);
                        $("#FHCY_4").text(data.ds89[0].TaskNum);
                        $("#FHCY_5").text(data.ds90[0].TaskNum);
                        $("#FHCY_6").text(data.ds91[0].ComletedNum);
                        $("#FHCY_7").text(data.ds92[0].ComletedNum);
                        $("#FHCY_8").text(data.ds93[0].OverdueNum);
                        if (data.ds94[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds94, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "FHCY_TOP", title: "本月查验完成数(TOP5)", color: "#05C2F8", source: source, unit: '' });
                        } else {
                            $(".FHCY_TOP").hide();
                        }
                    }

                    if (data.ds95[0].IsShow == 0) {
                        $("#AQXG_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "AQXG", text: data.ds95[0].ComletedRate + "%", data: [{ value: data.ds95[0].ComletedNum, color: '#45CFAF' }, { value: data.ds95[0].NoComletedNum }] });
                        $("#AQXG_1").text(data.ds96[0].YesterdayComletedNum);
                        $("#AQXG_2").text(data.ds97[0].YesterdayComletedNum);
                        $("#AQXG_3").text(data.ds98[0].YesterdayOverdueNum);
                        $("#AQXG_4").text(data.ds99[0].TaskNum);
                        $("#AQXG_5").text(data.ds100[0].TaskNum);
                        $("#AQXG_6").text(data.ds101[0].ComletedNum);
                        $("#AQXG_7").text(data.ds102[0].ComletedNum);
                        $("#AQXG_8").text(data.ds103[0].OverdueNum);
                        if (data.ds104[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds104, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "AQXG_TOP", title: "本月巡更完成率(TOP5)", color: "#45CFAF", source: source, unit: '%' });
                        } else {
                            $(".AQXG_TOP").hide();
                        }
                    }

                    if (data.ds105[0].IsShow == 0) {
                        $("#XFXJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "XFXJ", text: data.ds105[0].ComletedRate + "%", data: [{ value: data.ds105[0].ComletedNum, color: '#4668EE' }, { value: data.ds105[0].NoComletedNum }] });
                        $("#XFXJ_1").text(data.ds106[0].YesterdayComletedNum);
                        $("#XFXJ_2").text(data.ds107[0].YesterdayComletedNum);
                        $("#XFXJ_3").text(data.ds108[0].YesterdayOverdueNum);
                        $("#XFXJ_4").text(data.ds109[0].TaskNum);
                        $("#XFXJ_5").text(data.ds110[0].TaskNum);
                        $("#XFXJ_6").text(data.ds111[0].ComletedNum);
                        $("#XFXJ_7").text(data.ds112[0].ComletedNum);
                        $("#XFXJ_8").text(data.ds113[0].OverdueNum);
                        if (data.ds114[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds114, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "XFXJ_TOP", title: "本月巡检完成率(TOP5)", color: "#4668EE", source: source, unit: '%' });
                        } else {
                            $(".XFXJ_TOP").hide();
                        }
                    }

                    if (data.ds115[0].IsShow == 0) {
                        $("#HJBJ_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "HJBJ", text: data.ds115[0].ComletedRate + "%", data: [{ value: data.ds115[0].ComletedNum, color: '#FFA36F' }, { value: data.ds115[0].NoComletedNum }] });
                        $("#HJBJ_1").text(data.ds116[0].YesterdayComletedNum);
                        $("#HJBJ_2").text(data.ds117[0].YesterdayComletedNum);
                        $("#HJBJ_3").text(data.ds118[0].YesterdayOverdueNum);
                        $("#HJBJ_4").text(data.ds119[0].TaskNum);
                        $("#HJBJ_5").text(data.ds120[0].TaskNum);
                        $("#HJBJ_6").text(data.ds121[0].ComletedNum);
                        $("#HJBJ_7").text(data.ds122[0].ComletedNum);
                        $("#HJBJ_8").text(data.ds123[0].OverdueNum);
                        if (data.ds124[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds124, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "HJBJ_TOP", title: "本月任务完成数率(TOP5)", color: "#FFA36F", source: source, unit: '%'});
                        } else {
                            $(".HJBJ_TOP").hide();
                        }
                    }

                    if (data.ds125[0].IsShow == 0) {
                        $("#LHYH_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "LHYH", text: data.ds125[0].ComletedRate + "%", data: [{ value: data.ds125[0].ComletedNum, color: '#4777E5' }, { value: data.ds125[0].NoComletedNum }] });
                        $("#LHYH_1").text(data.ds126[0].YesterdayComletedNum);
                        $("#LHYH_2").text(data.ds127[0].YesterdayComletedNum);
                        $("#LHYH_3").text(data.ds128[0].YesterdayOverdueNum);
                        $("#LHYH_4").text(data.ds129[0].TaskNum);
                        $("#LHYH_5").text(data.ds130[0].TaskNum);
                        $("#LHYH_6").text(data.ds131[0].ComletedNum);
                        $("#LHYH_7").text(data.ds132[0].ComletedNum);
                        $("#LHYH_8").text(data.ds133[0].OverdueNum);
                        if (data.ds134[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds134, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "LHYH_TOP", title: "本月任务完成率(TOP5)", color: "#4777E5", source: source, unit: '%'});
                        } else {
                            $(".LHYH_TOP").hide();
                        }
                    }

                    if (data.ds135[0].IsShow == 0) {
                        $("#SHXX_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "SHXX", text: data.ds135[0].ComletedRate + "%", data: [{ value: data.ds135[0].ComletedNum, color: '#4668EE' }, { value: data.ds135[0].NoComletedNum }] });
                        $("#SHXX_1").text(data.ds136[0].YesterdayComletedNum);
                        $("#SHXX_2").text(data.ds137[0].YesterdayComletedNum);
                        $("#SHXX_3").text(data.ds138[0].YesterdayOverdueNum);
                        $("#SHXX_4").text(data.ds139[0].TaskNum);
                        $("#SHXX_5").text(data.ds140[0].TaskNum);
                        $("#SHXX_6").text(data.ds141[0].ComletedNum);
                        $("#SHXX_7").text(data.ds142[0].ComletedNum);
                        $("#SHXX_8").text(data.ds143[0].OverdueNum);
                        if (data.ds144[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds144, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "SHXX_TOP", title: "本月任务完成率(TOP5)", color: "#4668EE", source: source, unit: '%' });
                        } else {
                            $(".SHXX_TOP").hide();
                        }
                    }

                    if (data.ds145[0].IsShow == 0) {
                        $("#LJQY_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "LJQY", text: data.ds145[0].ComletedRate + "%", data: [{ value: data.ds145[0].ComletedNum, color: '#05C2F8' }, { value: data.ds145[0].NoComletedNum }] });
                        $("#LJQY_1").text(data.ds146[0].YesterdayComletedNum);
                        $("#LJQY_2").text(data.ds147[0].YesterdayComletedNum);
                        $("#LJQY_3").text(data.ds148[0].YesterdayOverdueNum);
                        $("#LJQY_4").text(data.ds149[0].TaskNum);
                        $("#LJQY_5").text(data.ds150[0].TaskNum);
                        $("#LJQY_6").text(data.ds151[0].ComletedNum);
                        $("#LJQY_7").text(data.ds152[0].ComletedNum);
                        $("#LJQY_8").text(data.ds153[0].OverdueNum);
                        if (data.ds154[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds154, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "LJQY_TOP", title: "本月任务完成率(TOP5)", color: "#05C2F8", source: source, unit: '%' });
                        } else {
                            $(".LJQY_TOP").hide();
                        }
                    }

                    if (data.ds155[0].IsShow == 0) {
                        $("#PZHC_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "PZHC", text: data.ds155[0].ComletedRate + "%", data: [{ value: data.ds155[0].ComletedNum, color: '#FC8F84' }, { value: data.ds155[0].NoComletedNum }] });
                        $("#PZHC_1").text(data.ds156[0].YesterdayComletedNum)
                        $("#PZHC_2").text(data.ds157[0].YesterdayComletedNum)
                        $("#PZHC_3").text(data.ds158[0].YesterdayOverdueNum);
                        $("#PZHC_4").text(data.ds159[0].TaskNum);
                        $("#PZHC_5").text(data.ds160[0].TaskNum);
                        $("#PZHC_6").text(data.ds161[0].ComletedNum);
                        $("#PZHC_7").text(data.ds162[0].ComletedNum);
                        $("#PZHC_8").text(data.ds163[0].OverdueNum);
                        if (data.ds164[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds164, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "PZHC_TOP", title: "本月核查完成率(TOP5)", color: "#FC8F84", source: source, unit: '%'});
                        } else {
                            $(".PZHC_TOP").hide();
                        }
                    }

                    if (data.ds165[0].IsShow == 0) {
                        $("#PZZG_Div").hide();
                    } else {
                        isNotData = false;
                        initGraphic({ id: "PZZG", text: data.ds165[0].ComletedRate + "%", data: [{ value: data.ds165[0].ComletedNum, color: '#FAC435' }, { value: data.ds165[0].NoComletedNum }] });
                        $("#PZZG_1").text(data.ds166[0].YesterdayComletedNum)
                        $("#PZZG_2").text(data.ds167[0].YesterdayComletedNum)
                        $("#PZZG_3").text(data.ds168[0].YesterdayOverdueNum);
                        $("#PZZG_4").text(data.ds169[0].TaskNum);
                        $("#PZZG_5").text(data.ds170[0].TaskNum);
                        $("#PZZG_6").text(data.ds171[0].ComletedNum);
                        $("#PZZG_7").text(data.ds172[0].ComletedNum);
                        $("#PZZG_8").text(data.ds173[0].OverdueNum);
                        if (data.ds174[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds174, function (i, item) {
                                source.push([item.ThisMonthCompleteNum2, item.UserName]);
                            });
                            initHorizontal({ id: "PZZG_TOP", title: "本月整改完成率(TOP5)", color: "#FAC435", source: source, unit: '%' });
                        } else {
                            $(".PZZG_TOP").hide();
                        }
                    }

                    if (data.ds175[0].IsShow == 0) {
                        $("#WNQQ_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "WNQQ", value: data.ds175[0].ComletedRate });
                        $("#WNQQ_1").text(data.ds176[0].YesterdayComletedNum);
                        $("#WNQQ_2").text(addThousands(data.ds177[0].YesterdayComletedNum));
                        $("#WNQQ_3").text(data.ds178[0].ComletedNum);
                        $("#WNQQ_4").text(addThousands(data.ds179[0].ComletedNum));
                        if (data.ds180[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds180, function (i, item) {
                                source.push([item.ThisMonthCompleteRate, item.UserName]);
                            });
                            initHorizontal({ id: "WNQQ_TOP", title: "本年累计清欠率(TOP5)", color: "#FFA36F", source: source, unit: '%'});
                        } else {
                            $(".WNQQ_TOP").hide();
                        }
                    }

                    if (data.ds181[0].IsShow == 0) {
                        $("#BNSK_Div").hide();
                    } else {
                        isNotData = false;
                        initGauge({ id: "BNSK", value: data.ds181[0].ComletedRate });
                        $("#BNSK_1").text(data.ds182[0].YesterdayComletedNum);
                        $("#BNSK_2").text(addThousands(data.ds183[0].YesterdayComletedNum));
                        $("#BNSK_3").text(data.ds184[0].ComletedNum);
                        $("#BNSK_4").text(addThousands(data.ds185[0].ComletedNum));
                        if (data.ds186[0].IsShow == 1) {
                            var source = [];
                            $.each(data.ds186, function (i, item) {
                                source.push([item.ThisMonthCompleteRate, item.UserName]);
                            });
                            initHorizontal({ id: "BNSK_TOP", title: "本年累计收费率(TOP5)", color: "#FAC435", source: source, unit: '%' });
                        } else {
                            $(".BNSK_TOP").hide();
                        }
                    }


                    //if (data.ds181[0].IsShow == 0) {
                    //    $("#DZJY_Div").hide();
                    //} else {
                    //    isNotData = false;
                    //    initGauge({ id: "DZJY", value: data.ds181[0].ComletedRate });
                    //    $("#DZJY_1").text(data.ds182[0].YesterdayComletedNum);
                    //    $("#DZJY_2").text(data.ds183[0].YesterdayComletedNum);
                    //    if (data.ds186[0].IsShow == 1) {
                    //        var source = [];
                    //        $.each(data.ds186, function (i, item) {
                    //            source.push([item.ThisMonthCompleteRate, item.UserName]);
                    //        });
                    //        initHorizontal({ id: "BNSK_TOP", title: "本年累计收费率(TOP5)", color: "#FFA36F", source: source, unit:'%' });
                    //    } else {
                    //        $(".DZJY_TOP").hide();
                    //    }
                    //}

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
            <%--<h1 class="container-span-title">项目经理信息看板</h1>--%>
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
                        <div id="SBXX_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <hr class="kanban2" />
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="col-md-5 col-xs-5 col-sm-5 mp0 module-title-row1">
                                    <span class="f16"><b>设备信息</b></span>
                                </div>
                                <div class="col-md-7 col-xs-7 col-sm-7 mp0 module-title-row2">
                                    <span class="title-time ToMonthStaticDateTime">-</span>
                                </div>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">当前设备完好率</span>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0" style="border: 0px dashed #000000">
                                    <div id="SBXX" style="width: 100%; height: 100px;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0  textcenter">
                                    <span class="f14 colorgrey">当前设备故障率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt5">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">设备空间(个)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">设备数量(台)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_3">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_4">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本月到期(台)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">质保期内(台)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_5">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 "><b id="SBXX_6">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">自行维保(个)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">外委维保(台)</span>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24 ">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14 "><b id="KHBF_1">0</b></span><span class="f14 colorgrey ">&nbsp;户数</span>
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
                                        <span class="f14 "><b id="KHBF_6">0</b></span>&nbsp;<span class="f14 colorgrey">&nbsp;户数</span>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
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
                            <div class="col-md-12 col-xs-12 col-sm-12 KFXC_TOP pt20">
                                <div id="KFXC_TOP" style="width: 100%; height: 180px;"></div>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0  lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14"><b id="SBXJ_1">0</b></span><span class="f14 colorgrey ">&nbsp;设备</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
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
                                        <span class="f14 "><b id="SBXJ_6">0</b></span>&nbsp;<span class="f14 colorgrey">&nbsp;设备</span>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 SBXJ_TOP pt20">
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SBWB_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 SBWB_TOP pt20">
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
                            <div class="col-md-12 col-xs-12 col-sm-12 FHCY_TOP pt20">
                                <div id="FHCY_TOP" style="width: 100%; height: 180px;"></div>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24 ">
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
                                        <span class="f14 "><b id="XFXJ_3">0</b></span><span class="f14 colorgrey">&nbsp;设备</span>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 XFXJ_TOP pt20">
                                <div id="XFXJ_TOP" style="width: 100%; height: 180px;"></div>
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
                                        <span class="f14 "><b id="HJBJ_6" id="SHXX_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="HJBJ_7" id="SHXX_1">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 HJBJ_TOP pt20">
                                <div id="HJBJ_TOP" style="width: 100%; height: 180px;"></div>
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0  lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
                                        <span class="f14"><b id="LHYH_1">0</b></span><span class="f14 colorgrey ">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0 ">
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
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
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
                            <div class="col-md-12 col-xs-12 col-sm-12 LHYH_TOP pt20">
                                <div id="LHYH_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="SHXX_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>四害消杀</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 pt40">
                                    <div id="SHXX" style="width: 100%; height: 100%;"></div>
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
                                        <span class="f14 "><b id="SHXX_1">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXX_2">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SHXX_3">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
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
                                        <span class="f14 "><b id="SHXX_4">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXX_5">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 colorgreen">完成</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXX_6">0</b></span><span class="f14 colorgrey">&nbsp;点位</span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                        <span class="f14 "><b id="SHXX_7">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 lh24">
                                    <div class="col-md-2 col-xs-2 col-sm-2 mp0">
                                        <span class="f14 coloryellow">逾期</span>
                                    </div>
                                    <div class="col-md-10 col-xs-10 col-sm-10 mp0">
                                        <span class="f14 "><b id="SHXX_8">0</b></span><span class="f14 colorgrey">&nbsp;任务</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 SHXX_TOP pt20">
                                <div id="SHXX_TOP" style="width: 100%; height: 180px;"></div>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 LJQY_TOP pt20">
                                <div id="LJQY_TOP" style="width: 100%; height: 180px;"></div>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 PZHC_TOP pt20">
                                <div id="PZHC_TOP" style="width: 100%; height: 180px;"></div>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 PZZG_TOP pt20">
                                <div id="PZZG_TOP" style="width: 100%; height: 180px;"></div>
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

<%--                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="CWWGFWNQQ_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>车位费往年清欠</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="CWWGFWNQQ" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">本年累计清欠率</span>
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
                            <div class="col-md-12 col-xs-12 col-sm-12 WNQQ_TOP pt20">
                                <div id="CWWGFWNQQ_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>

                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="CWWGFBNSK_Div">
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
                            <div class="col-md-12 col-xs-12 col-sm-12 BNSK_TOP pt20">
                                <div id="CWWGFBNSK_TOP" style="width: 100%; height: 180px;"></div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0">
                                <hr style="width: 92%" />
                            </div>
                        </div>


                        <div class="col-md-12 col-xs-12 col-sm-12 mp0" id="DZJY_Div">
                            <div class="col-md-12 col-xs-12 col-sm-12 mp0 pl16">
                                <span class="f16 "><b>多种经营收款</b></span>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5 mp0">
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 ">
                                    <div id="DZJY" style="width: 100%; height: 100%;"></div>
                                </div>
                                <div class="col-md-12 col-xs-12 col-sm-12 mp0 textcenter">
                                    <span class="f14 colorgrey">多种经营收款率</span>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-7 col-sm-7 mp0 pt13">
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 colorblue"><b id="DZJY_1">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f16 coloryellow"><b id="DZJY_2">0</b></span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本年收款(元)</span>
                                </div>
                                <div class="col-md-6 col-xs-6 col-sm-6 mp0">
                                    <span class="f14 colorgrey">本年收款(元)</span>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12 col-sm-12 BNSK_TOP pt20">
                                <div id="DZJY_TOP" style="width: 100%; height: 180px;"></div>
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
