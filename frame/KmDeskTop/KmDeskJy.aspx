<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KmDeskJy.aspx.cs" Inherits="M_Main.frame.KmDeskJy" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>经营主题</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../css/NewDesktop.css?v=1.0" rel="stylesheet" />

    <script type="text/javascript" src="../../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../Jscript-Ui/echarts/echarts.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/echarts/china.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/echarts/world.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../NewDesktop/Highcharts-7.2.1/code/highcharts.js"></script>

    <script src="../js/Highcharts-7.2.1/code/highcharts.js"></script>
    <script src="../js/Highcharts-7.2.1/code/highcharts-3d.js"></script>
    <script src="../js/Highcharts-7.2.1/code/modules/exporting.js"></script>
    <script src="../js/Highcharts-7.2.1/code/highcharts-zh_CN.js"></script>
    <script src="../js/Highcharts-7.2.1/code/highcharts-more.js"></script>
    <script src="../js/Highcharts-7.2.1/code/modules/solid-gauge.js"></script>

    <base target="_blank" />
    <style type="text/css">
        .MariginTopClass {
            margin-top: 5.4px;
            text-align: center;
            width: 120px;
        }

        .padding_0 {
            padding: 0px;
        }

        .Colorblock {
            border-radius: 2px;
            width: 10px;
            height: 10px;
            margin-top: 5px;
        }

        .bottomDivList {
            position: absolute;
            bottom: 44px;
        }

        .db-title {
            margin-top: 40px;
            margin-left: 23%;
        }

        .marginTop_15 {
            margin-top: 15px;
        }

        .marginLeft_10 {
            margin-left: 10px;
        }

        .marginLeft_15 {
            margin-left: 15px;
        }

        .marginTop_20 {
            margin-top: 20px;
        }

        .title_2 {
            font-size: 16px;
            color: #ffffff;
        }


        .col4 {
            width: 32.7%;
        }

        .index_xxbt {
            background: #313139;
            background-position-x: 20px;
            background-position-y: 8px;
            background-size: 127px 33px;
            border-radius: 0 0 0 0;
            color: #ffffff;
        }

            .index_xxbt h5 {
                margin-left: 25px;
                font-size: 16px;
                color: #ffffff;
                font-weight: bold;
            }

        .index_xxgd {
            height: 20px;
            width: 50px;
            float: right;
            background: #313139;
            margin-top: 7px;
            background-size: 100% 100%;
            cursor: pointer;
            color: #ffffff;
        }

        .ibox1 {
            clear: both;
            margin-top: 0px;
            padding: 0px;
            margin-bottom: 10px;
        }

        .ibox1-title {
            min-height: 45px;
            margin-bottom: 0px;
            padding: 10px 15px 7px;
        }

        .ibox-content {
            height: 320px;
            border-radius: 0 0 0px 0;
            border-top: none;
            background: #27272F;
            color: #ffffff;
        }

        .btn-default {
            color: #000;
        }

        .Line_1 {
            list-style: none;
        }

        .title-blue {
            border-top: 6px solid #0f8fe6;
            border-radius: 6px 6px 0 0;
            text-align: center;
        }


        .title-yellow {
            border-top: 6px solid #ffc736;
            border-radius: 6px 6px 0 0;
            text-align: center;
        }


        .title-green {
            border-top: 6px solid #42ca84;
            border-radius: 6px 6px 0 0;
            text-align: center;
        }

        .title-red {
            border-top: 8px solid #ec7368;
            border-radius: 8px 8px 0 0;
            text-align: center;
        }

        .title_1, a {
            text-align: center;
            font-size: 15px;
            color: #ffc736;
            font-weight: bold;
        }

        .margginRS {
            margin-bottom: 15px;
            margin-top: 10px;
        }

        .width26 {
            width: 28%;
        }

        .width48 {
            width: 44%;
        }

        .title_2 {
            background-color: #ffffff;
            margin-top: -5px;
            border-radius: 0 0 10px 10px;
            padding-bottom: 10px;
        }

        h5 {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .hang1 {
            width: 100%;
            text-align: center;
            font-size: 16px;
            padding-top: 5px;
            margin-bottom: 10px;
            color: #ffc736;
        }

        .hang2 {
            width: 100%;
            padding-left: 30px;
            color: #848484;
            margin-top: 8px;
            margin-bottom: 10px;
        }

        .margginZy {
            margin-bottom: 15px;
        }

        .index_fwzt_on {
            float: right;
            padding-left: 5px;
            padding-right: 5px;
            cursor: pointer;
            font-size: 12px;
            color: #D1C70E;
            text-decoration: underline;
        }

        .index_fwzt_off {
            float: right;
            padding-left: 5px;
            padding-right: 5px;
            cursor: pointer;
            font-size: 12px;
            color: #0FA8A8;
            text-decoration: underline;
        }



        .symapt1 h1 {
            color: #00C1FF;
        }

        .symapt2 h1 {
            color: #0EE79C
        }

        .lbl_money {
            font-size: 35px;
            color: #00BCFA;
            letter-spacing: 1px;
            font-weight: 300;
        }
    </style>
    <script type="text/javascript">
        // 数字转换
        var numberFormat = function (value) {
            var param = {};
            var k = 10000,
                sizes = ['', '万', '亿', '万亿'],
                i;
            if (value < k) {
                param.value = value
                param.unit = ''
            } else {
                i = Math.floor(Math.log(value) / Math.log(k));
                param.value = ((value / Math.pow(k, i))).toFixed(2);
                param.unit = sizes[i];
            }
            return param;
        }
        $(function () {


            column();
            bar();
            pie();
        });
        function column() {

            // 公共配置
            Highcharts.setOptions({
                colors: ['#C49409', '#69487F', '#19AFE7', '#f7a35c', '#8085e9',
                    '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
                chart: {
                    type: 'column',
                    spacing: 5,
                    backgroundColor: '#27272F',
                },
                credits: { enabled: false },
                exporting: {
                    enabled: false
                },
                title: {
                    text: ''
                },
                xAxis: {
                    title: {
                        style: { "color": "#fff" }
                    },
                    labels: {
                        style: { "color": "#fff" }
                    }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: '',
                        style: { "color": "#fff" }
                    },
                    labels: {
                        style: { "color": "#fff" },
                        formatter: function () {
                            var number = numberFormat(this.value);
                            return parseInt(number.value) + number.unit;
                        }
                    }
                },
                tooltip: {
                    formatter: function () {
                        var number = numberFormat(this.y);
                        return '<b>' + this.x + '</b>' + ' : ' + number.value + number.unit + '<br/>';
                    }
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            style: {
                                color: "#fff",
                                textOutline: "none",
                            },
                            formatter: function () {
                                var number = numberFormat(this.y);
                                return number.value + number.unit;
                            }
                        },
                    }
                }
            });

            //年度停车收入
            var chart = Highcharts.chart('ndtcsr', {
                chart: {
                    spacing: 0,
                },
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5']
                },
                legend: {
                    verticalAlign: 'top',
                    itemStyle: { cursor: 'pointer', color: '#fff' },
                    title: {
                        style: { "color": "#fff" }
                    },
                },
                series: [{
                    name: '车位管理费',
                    data: [44234, 44234, 23426, 72234, 34322],
                }, {
                    name: '停车租凭费',
                    data: [34233, 44234, 32424, 22342, 53534]
                }, {
                    name: '临时停车费',
                    data: [23432, 44234, 42346, 22432, 24351]
                }]
            });

            //累计欠费金额较大的前10个项目
            var chart2 = Highcharts.chart('ljqfje', {
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10'],
                },
                legend: {
                    enabled: false
                },
                series: [{
                    data: [221823.62, 722128.8, 91218.5, 93243.4, 106434.0, 83434.54, 103435.0, 1044343.3, 434391.23, 3434.54]
                }]
            });

        }

        function bar() {
            // 公共配置
            Highcharts.setOptions({
                chart: {
                    type: 'bar',
                    backgroundColor: '#27272F',
                    spacing: 5
                },
                title: {
                    text: ''
                },
                credits: { enabled: false },
                exporting: {
                    enabled: false
                },
                xAxis: {
                    title: {
                        text: '项目',
                        style: { "color": "#02E6FB", "fontSize": "14px" }
                    },
                    labels: {
                        overflow: 'justify',
                        style: {
                            color: '#fff',
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    max: 100,
                    title: {
                        text: '追缴率',
                        align: 'middle',
                        style: { "color": "#02E6FB", "fontSize": "14px" }
                    },
                    labels: {
                        overflow: 'justify',
                        style: {
                            color: '#fff',
                        }
                    }
                },
                tooltip: {
                    formatter: function () {
                        return this.x + ' : ' + this.y + ' %';
                    }
                },
                plotOptions: {
                    bar: {
                        showInLegend: false,
                        dataLabels: {
                            enabled: true,
                            allowOverlap: true, // 允许数据标签重叠
                            style: {
                                color: "#fff",
                                fontFamily: "宋体",
                                textOutline: "none",
                                backgroundColor: '#007CFF',
                            },
                            format: '{y}%'
                        }, zones: [{
                            value: 0,
                            color: 'red'
                        }]
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -40,
                    y: 100,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
                    shadow: true
                }
            });

            //综合追缴率排名（前六名）
            var chart = Highcharts.chart('zhzjlpmq6', {
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6'],
                    title: {
                        style: { "color": "#01E6FB", "fontSize": "14px" }
                    },
                },
                yAxis: {
                    title: {
                        style: { "color": "#01E6FB", "fontSize": "14px" }
                    },
                },
                series: [{
                    data: [{ y: 70, color: "#01E6FB" }, { y: 60, color: "#01E6FB" }, { y: 50, color: "#01E6FB" }, { y: 30, color: "#01E6FB" }, { y: 20, color: "#01E6FB" }, { y: 10, color: "#01E6FB" }]
                }]
            });
            //综合追缴率排名（后六名）
            var chart2 = Highcharts.chart('zhzjlpmh6', {
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6'],
                    title: {
                        style: { "color": "#1AAFE7", "fontSize": "14px" }
                    },
                },
                yAxis: {
                    title: {
                        style: { "color": "#1AAFE7", "fontSize": "14px" }
                    },
                },
                series: [{
                    data: [{ y: 30, color: "#1AAFE7" }, { y: 40, color: "#1AAFE7" }, { y: 50, color: "#1AAFE7" }, { y: 60, color: "#1AAFE7" }, { y: 70, color: "#1AAFE7" }, { y: 80, color: "#1AAFE7" }]
                }]
            });

            //综合收缴率排名（前六名）
            var chart3 = Highcharts.chart('zhsjlpmq6', {
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6'],
                    title: {
                        style: { "color": "#68477F", "fontSize": "14px" }
                    },
                },
                yAxis: {
                    title: {
                        style: { "color": "#68477F", "fontSize": "14px" }
                    },
                },
                series: [{
                    data: [{ y: 30, color: "#68477F" }, { y: 40, color: "#68477F" }, { y: 50, color: "#68477F" }, { y: 60, color: "#68477F" }, { y: 70, color: "#68477F" }, { y: 80, color: "#68477F" }]
                }]
            });
            //综合收缴率排名（后六名）
            var chart4 = Highcharts.chart('zhsjlpmh6', {
                xAxis: {
                    categories: ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6'],
                    title: {
                        style: { "color": "#C49409", "fontSize": "14px" }
                    },
                },
                yAxis: {
                    title: {
                        style: { "color": "#C49409", "fontSize": "14px" }
                    },
                },
                series: [{
                    data: [{ y: 30, color: "#C49409" }, { y: 40, color: "#C49409" }, { y: 50, color: "#C49409" }, { y: 60, color: "#C49409" }, { y: 70, color: "#C49409" }, { y: 80, color: "#C49409" }]
                }]
            });
        }

        function pie() {

            // 公共配置
            Highcharts.setOptions({
                chart: {
                    type: 'solidgauge',
                    spacing: 0,
                    margin: 0,
                    backgroundColor: '#27272F',
                },
                credits: { enabled: false },
                exporting: {
                    enabled: false
                },
                title: null,
                pane: {
                    center: ['50%', '75%'],
                    size: '140%',
                    startAngle: -90,
                    endAngle: 90,
                    background: {
                        borderWidth: 0,
                        backgroundColor: '#4F484F',
                        innerRadius: '60%',
                        outerRadius: '100%',
                        shape: 'arc'
                    }
                },
                tooltip: {
                    enabled: false
                },
                yAxis: {
                    //stops: [
                    //    [0, '#0D4B72'], // green
                    //],
                    min: 0,
                    max: 100,
                    minorGridLineWidth: 1,
                    maxColor: '#0D4B72',
                    lineWidth: 0,
                    minorTickInterval: null,
                    tickPixelInterval: 400,
                    tickWidth: 0,
                    title: {
                        y: 70,
                        style: { "color": "#fff", "fontSize": "14px" }
                    },
                    labels: {
                        y: 20,
                        style: { "color": "#fff", "fontSize": "14px" }
                    }
                },
                plotOptions: {
                    solidgauge: {
                        dataLabels: {
                            y: 5,
                            borderWidth: 0,
                            useHTML: true
                        }
                    }
                }
            });

            //物业服务费收缴率
            var chart1 = Highcharts.chart('div_wyfwfsjl', {
                yAxis: { title: { text: '物业服务费收缴率' } },
                series: [{
                    data: [64],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:26px;color:#fff' + '">{y}%</span><br/>'
                    }
                }]
            });

            //车位管理费收缴率
            var chart2 = Highcharts.chart('div_cwglfsjl', {
                yAxis: { title: { text: '车位管理费收缴率' } },
                series: [{
                    data: [64],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:26px;color:#fff' + '">{y}%</span><br/>'
                    }
                }]
            });

            //公摊费收缴率
            var chart3 = Highcharts.chart('div_gtfsjl', {
                yAxis: { title: { text: '公摊费收缴率' } },
                series: [{
                    data: [64],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:26px;color:#fff' + '">{y}%</span><br/>'
                    }
                }]
            });

            //水电费收缴率
            var chart4 = Highcharts.chart('div_fdfsjl', {
                yAxis: { title: { text: '水电费收缴率' } },
                series: [{
                    name: '',
                    data: [64],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:26px;color:#fff' + '">{y}%</span><br/>'
                    }
                }]
            });

            //代收代缴水电费-收缴率
            var chart5 = Highcharts.chart('div_sjl', {
                yAxis: { title: { text: '收缴率' } },
                series: [{
                    name: '',
                    data: [64],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:26px;color:#fff' + '">{y}%</span><br/>'
                    }
                }]
            });

        }
        function toggleClass(obj, opt) {
            $(obj).removeClass('btn-default').addClass('btn-success');
            $(obj).siblings().removeClass('btn-success').addClass('btn-default');
        }

    </script>
    <script type="text/javascript">
</script>

</head>
<body class="gray-bg" style="background-color: #18191E">
    <form id="MyDesk" runat="server">
        <input type="hidden" id="CorpId" runat="server" />
        <input type="hidden" id="OrganCode" runat="server" />
        <input type="hidden" id="OrganName" runat="server" />
        <input type="hidden" id="ChargesSubject" runat="server" />
        <input type="hidden" id="CommIds" runat="server" />

        <input type="hidden" id="QmArry" runat="server" />
        <input type="hidden" id="QmArryCount" runat="server" />
        <input type="hidden" id="QmArry1" runat="server" />
        <input type="hidden" id="QmArry2" runat="server" />
        <input type="hidden" id="QmArry3" runat="server" />
        <input type="hidden" id="QmArry4" runat="server" />
        <input type="hidden" id="QmArry5" runat="server" />
        <input type="hidden" id="QmArry6" runat="server" />
        <input type="hidden" id="QmArry7" runat="server" />
        <input type="hidden" id="QmArry8" runat="server" />

        <input type="hidden" id="QmTotalCount" runat="server" />
        <div class="row">
            <div class="col-sm-12" style="">
                <div class="row">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt" style="text-align: center;">
                            <h5 style="font-size: 18px">经营主题</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapper wrapper-content">
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>本年核心费项收缴率</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="col-sm-6">
                                    <div id="div_wyfwfsjl" style="min-width: 100px; height: 150px"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="div_cwglfsjl" style="min-width: 100px; height: 150px"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="div_gtfsjl" style="min-width: 100px; height: 150px"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="div_fdfsjl" style="min-width: 100px; height: 150px"></div>
                                </div>
                                <%--   <div style="height: 130px;">
                                    <div style="height: 120px; width: 50%; float: left; padding: 5px; border: 1px red solid" id="wyfwfsjl"></div>
                                    <div style="height: 120px; width: 50%; float: left; padding: 5px; border: 1px red solid" id="cwglfsjl"></div>
                                </div>
                                <div style="height: 130px;">
                                    <div style="height: 120px; width: 50%; float: left; padding: 5px; border: 1px red solid" id="gtfsjl"></div>
                                    <div style="height: 120px; width: 50%; float: left; padding: 5px; border: 1px red solid" id="fdfsjl"></div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <div class="clearfix">
                                    <div class="pull-left">
                                        <h5>综合追缴率排名（前六名）</h5>
                                    </div>
                                    <div class="pull-right">
                                        <div class="btn-group btn-group-xs">
                                            <button type="button" class="btn btn-success" onclick="toggleClass(this,1)">&nbsp;片&nbsp;区&nbsp;</button>
                                            <button type="button" class="btn btn-default" onclick="toggleClass(this,2)">&nbsp;项&nbsp;目&nbsp;</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div id="zhzjlpmq6" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <div class="clearfix">
                                    <div class="pull-left">
                                        <h5>综合追缴率排名（后六名）</h5>
                                    </div>
                                    <div class="pull-right">
                                        <div class="btn-group btn-group-xs">
                                            <button type="button" class="btn btn-success" onclick="toggleClass(this,1)">&nbsp;片&nbsp;区&nbsp;</button>
                                            <button type="button" class="btn btn-default" onclick="toggleClass(this,2)">&nbsp;项&nbsp;目&nbsp;</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div id="zhzjlpmh6" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>年度停车收入</h5>
                            </div>
                            <div class="ibox-content">
                                <div id="ndtcsr" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <div class="pull-left">
                                    <h5>综合收缴率排名（前六名）</h5>
                                </div>
                                <div class="pull-right">
                                    <div class="btn-group btn-group-xs">
                                        <button type="button" class="btn btn-success" onclick="toggleClass(this,1)">&nbsp;片&nbsp;区&nbsp;</button>
                                        <button type="button" class="btn btn-default" onclick="toggleClass(this,2)">&nbsp;项&nbsp;目&nbsp;</button>
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div id="zhsjlpmq6" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <div class="pull-left">
                                    <h5>综合收缴率排名（后六名）</h5>
                                </div>
                                <div class="pull-right">
                                    <div class="btn-group btn-group-xs">
                                        <button type="button" class="btn btn-success" onclick="toggleClass(this,1)">&nbsp;片&nbsp;区&nbsp;</button>
                                        <button type="button" class="btn btn-default" onclick="toggleClass(this,2)">&nbsp;项&nbsp;目&nbsp;</button>
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div id="zhsjlpmh6" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">

                            <div class="pull-left">
                                <h5>代收代缴水电费</h5>
                            </div>
                            <div class="pull-right">
                                <div class="btn-group btn-group-xs">
                                    <button type="button" class="btn btn-success" onclick="toggleClass(this,1)">&nbsp;全&nbsp;&nbsp;部&nbsp;</button>
                                    <button type="button" class="btn btn-default" onclick="toggleClass(this,2)">&emsp;水&emsp;</button>
                                    <button type="button" class="btn btn-default" onclick="toggleClass(this,3)">&emsp;电&emsp;</button>
                                </div>
                            </div>

                        </div>
                        <div class="ibox-content">
                            <div class="col-sm-12" style="height: 50px"></div>
                            <div class="col-sm-5">
                                <div class="col-sm-12"><b>应收</b></div>
                                <div class="col-sm-12"><b class="lbl_money">1,003万元</b></div>
                                <div class="col-sm-12" style="height: 20px"></div>
                                <div class="col-sm-12"><b>实收</b></div>
                                <div class="col-sm-12"><b class="lbl_money">1,003万元</b></div>
                            </div>
                            <div class="col-sm-7">
                                <div id="div_sjl" style="min-width: 100px; height: 180px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8 ">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>累计欠费金额较大的前10个项目</h5>
                        </div>
                        <div class="ibox-content">
                            <div id="ljqfje" style="width: 100%; height: 100%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- <script type="text/javascript" src="../js/newdesktop1.js"></script>--%>
    </form>
    <script type="text/javascript">
        //本年核心费项收缴率

        //年度停车收入

        //综合追缴率排名（前六名）

        //综合收缴率排名（前六名）

        //综合追缴率排名（后六名） 

        //综合收缴率排名（后六名）

        //代收代缴水电费

        //累计欠费金额较大的前10个项目
    </script>
</body>
</html>
