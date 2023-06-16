<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KmDeskFees.aspx.cs" Inherits="M_Main.frame.KmDeskFees" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>财务主题</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../css/NewDesktop.css?v=1.0" rel="stylesheet" />

    <script type="text/javascript" src="../../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../Jscript-Ui/echarts-3.7.2/echarts.min.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>

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
            border-radius: 0 0 0px 0;
            border-top: none;
            background: #27272F;
            color: #ffffff;
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
    </style>
    <script type="text/javascript">

        function Getfwzt(id, lb, ind) {
            for (var i = 1; i <= ind; i++) {
                document.getElementById(lb + i).className = "index_fwzt_off";
            }
            document.getElementById(lb + id).className = "index_fwzt_on";
        }


    </script>
    <script type="text/javascript">
</script>

</head>
<body class="gray-bg" style="background-color: #18191E">
    <form id="MyDesk" runat="server">
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox1">
                        <div class="ibox-content">
                            <table style="width: 100%;" class="symapt1">
                                <tr>
                                    <td style="padding-left: 30px;" class="symapt1">
                                        <h5>累计欠费</h5>
                                        <h1>1003 <span style="font-size: 12px">万元</span></h1>
                                    </td>
                                    <td style="padding-left: 30px;" class="symapt2">
                                        <h5>累计欠费较去年增长</h5>
                                        <h1>103 <span style="font-size: 12px">万元</span></h1>
                                    </td>
                                    <td style="padding-left: 30px;" class="symapt1">
                                        <h5>增长率</h5>
                                        <h1>20.11 <span style="font-size: 12px">%</span></h1>
                                    </td>
                                    <td style="padding-left: 30px;" class="symapt2">
                                        <h5>本年累计申请减免</h5>
                                        <h1>100.33 <span style="font-size: 12px">万元</span></h1>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox1">
                        <div class="ibox-content">
                            <div>
                                <table style="width: 100%;" class="symapt1">
                                    <tr>
                                        <td class="symapt1">
                                            <h5>历史欠费年初余额</h5>
                                            <h1>9700 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt2">
                                            <h5>本年实收往年欠费</h5>
                                            <h1>6990 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt1">
                                            <h5>历史欠费本期余额</h5>
                                            <h1>1000 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- 综合追缴率 -->
                            <div style="height: 200px; padding: 5px;" id="zhzjl"></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="ibox1">
                        <div class="ibox-content">
                            <div>
                                <table style="width: 100%;" class="symapt1">
                                    <tr>
                                        <td class="symapt1">
                                            <h5>应收本年</h5>
                                            <h1>9700 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt2">
                                            <h5>实收本年</h5>
                                            <h1>6990 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt1">
                                            <h5>本年新增欠费</h5>
                                            <h1>1000 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div style="height: 200px; padding: 5px;" id="bnzhsjl"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div style="height: 200px; padding: 5px;" id="bnzhsjlyrz"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="ibox1">
                        <div class="ibox-content">
                            <div>
                                <table style="width: 100%;" class="symapt1">
                                    <tr>
                                        <td class="symapt1">
                                            <h5>应收本期</h5>
                                            <h1>9700 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt2">
                                            <h5>实收本期</h5>
                                            <h1>6990 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                        <td class="symapt1">
                                            <h5>本期新增欠费</h5>
                                            <h1>1000 <span style="font-size: 12px">万元</span></h1>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div style="height: 200px; padding: 5px;" id="bqzhsjl"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div style="height: 200px; padding: 5px;" id="bqzhsjlyrz"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>综合收缴率、综合收缴率曲线  
                                <span id="sjl2" class="index_fwzt_off" onclick="Getfwzt(2,'sjl',2)">追缴率</span>
                                <span id="sjl1" class="index_fwzt_on" onclick="Getfwzt(1,'sjl',2)">收缴率</span></h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 260px; padding: 5px;" id="zhsjlqx"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>能源费柱状图
                                <span id="nyf2" class="index_fwzt_off" onclick="Getfwzt(2,'nyf',2)">自用能耗</span>
                                <span id="nyf1" class="index_fwzt_on" onclick="Getfwzt(1,'nyf',2)">总能耗</span></h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 260px; padding: 5px;" id="nyfzht"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        //综合追缴率
        function InitRowzhzjl() {
            option = {
                title: {
                    text: '64%',
                    x: 'center',
                    bottom: '10%',
                    itemGap: 12,
                    textStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 26,
                        fontWeight: 'bolder'
                    },
                    subtext: '综合追缴率',
                    subtextStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 14,
                        fontWeight: 'bolder'
                    }
                },
                series: [
                    {
                        name: '综合收缴率',
                        type: 'pie',
                        radius: ['140%', '100%'],
                        startAngle: 180,
                        center: ["50%", "80%"],
                        hoverAnimation: false,
                        legendHoverLink: false,
                        avoidLabelOverlap: false,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        //markPoint: {
                        //    itemStyle: {
                        //        normal: {
                        //            color: 'none'
                        //        }
                        //    },
                        //    data: [
                        //        {
                        //            value: '0',
                        //            x: '10%',
                        //            y: '100%'
                        //        },
                        //        {
                        //            value: '100',
                        //            x: '90%',
                        //            y: '100%'
                        //        }
                        //    ]
                        //},
                        data: [
                            {
                                value: 64, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#0B4D72'
                                    }
                                }
                            },
                            {
                                value: 36, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#4F484F'
                                    }
                                }
                            },
                            {
                                value: 100,
                                name: '',
                                itemStyle: {
                                    normal: {
                                        color: 'rgba(0,0,0,0)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            };
            var dom = document.getElementById("zhzjl");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }

        //本年综合收缴率
        function InitRowbnzhsjl() {
            option = {
                title: {
                    text: '64%',
                    x: 'center',
                    bottom: '0%',
                    itemGap: 12,
                    textStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 26,
                        fontWeight: 'bolder'
                    },
                    subtext: '本年综合收缴率',
                    subtextStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 14,
                        fontWeight: 'bolder'
                    }
                },
                series: [
                    {
                        name: '本年综合收缴率',
                        type: 'pie',
                        radius: ['100%', '60%'],
                        startAngle: 180,
                        center: ["50%", "80%"],
                        hoverAnimation: false,
                        legendHoverLink: false,
                        avoidLabelOverlap: false,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: [
                            {
                                value: 64, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#0B4D72'
                                    }
                                }
                            },
                            {
                                value: 36, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#4F484F'
                                    }
                                }
                            },
                            {
                                value: 100,
                                name: '',
                                itemStyle: {
                                    normal: {
                                        color: 'rgba(0,0,0,0)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            };
            var dom = document.getElementById("bnzhsjl");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }
        //本年综合收缴率 已入住
        function InitRowbnzhsjlyrz() {
            option = {
                title: {
                    text: '64%',
                    x: 'center',
                    bottom: '0%',
                    itemGap: 12,
                    textStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 26,
                        fontWeight: 'bolder'
                    },
                    subtext: '其中已入住',
                    subtextStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 14,
                        fontWeight: 'bolder'
                    }
                },
                series: [
                    {
                        name: '其中已入住',
                        type: 'pie',
                        radius: ['80%', '40%'],
                        startAngle: 180,
                        center: ["50%", "80%"],
                        hoverAnimation: false,
                        legendHoverLink: false,
                        avoidLabelOverlap: false,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: [
                            {
                                value: 64, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#0B4D72'
                                    }
                                }
                            },
                            {
                                value: 36, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#4F484F'
                                    }
                                }
                            },
                            {
                                value: 100,
                                name: '',
                                itemStyle: {
                                    normal: {
                                        color: 'rgba(0,0,0,0)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            };
            var dom = document.getElementById("bnzhsjlyrz");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }

        //本期综合收缴率
        function InitRowbqzhsjl() {
            option = {
                title: {
                    text: '64%',
                    x: 'center',
                    bottom: '0%',
                    itemGap: 12,
                    textStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 26,
                        fontWeight: 'bolder'
                    },
                    subtext: '本期综合收缴率',
                    subtextStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 14,
                        fontWeight: 'bolder'
                    }
                },
                series: [
                    {
                        name: '本期综合收缴率',
                        type: 'pie',
                        radius: ['100%', '60%'],
                        startAngle: 180,
                        center: ["50%", "80%"],
                        hoverAnimation: false,
                        legendHoverLink: false,
                        avoidLabelOverlap: false,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: [
                            {
                                value: 64, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#0B4D72'
                                    }
                                }
                            },
                            {
                                value: 36, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#4F484F'
                                    }
                                }
                            },
                            {
                                value: 100,
                                name: '',
                                itemStyle: {
                                    normal: {
                                        color: 'rgba(0,0,0,0)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            };
            var dom = document.getElementById("bqzhsjl");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }
        //本期综合收缴率 已入住
        function InitRowbqzhsjlyrz() {
            option = {
                title: {
                    text: '64%',
                    x: 'center',
                    bottom: '0%',
                    itemGap: 12,
                    textStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 26,
                        fontWeight: 'bolder'
                    },
                    subtext: '其中已入住',
                    subtextStyle: {
                        color: '#cccccc',
                        fontFamily: '微软雅黑',
                        fontSize: 14,
                        fontWeight: 'bolder'
                    }
                },
                series: [
                    {
                        name: '其中已入住',
                        type: 'pie',
                        radius: ['80%', '40%'],
                        startAngle: 180,
                        center: ["50%", "80%"],
                        hoverAnimation: false,
                        legendHoverLink: false,
                        avoidLabelOverlap: false,
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: [
                            {
                                value: 64, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#0B4D72'
                                    }
                                }
                            },
                            {
                                value: 36, name: '',
                                itemStyle: {
                                    normal: {
                                        color: '#4F484F'
                                    }
                                }
                            },
                            {
                                value: 100,
                                name: '',
                                itemStyle: {
                                    normal: {
                                        color: 'rgba(0,0,0,0)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            };
            var dom = document.getElementById("bqzhsjlyrz");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }

        //综合收缴率、综合收缴率曲线 
        function InitRowzhsjlqx() {
            option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    right: 200,
                    itemWidth: 50,
                    itemHeight: 10,
                    itemGap: 30,
                    textStyle: {
                        color: '#fff'
                    },
                    data: [{
                        name: '今年',
                        icon: 'roundRect'
                    }, {
                        name: '去年',
                        icon: 'roundRect'
                    }]
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    max: 100,
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff'
                        },
                        formatter: '{value} %'
                    }
                },
                series: [
                    {
                        name: '今年',
                        type: 'line',
                        symbol: 'circle',
                        smooth: true,
                        data: [10, 32, 45, 13, 45, 25, 78, 24, 58, 39, 58, 95],
                        lineStyle: {
                            normal: {
                                color: '#E2E807'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#E2E807'
                            }
                        }
                    },
                    {
                        name: '去年',
                        type: 'line',
                        symbol: 'circle',
                        smooth: true,
                        data: [20, 52, 25, 43, 15, 63, 28, 64, 88, 93, 51, 35],
                        lineStyle: {
                            normal: {
                                color: '#1986D8'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#1986D8'
                            }
                        }
                    }
                ]
            };

            var dom = document.getElementById("zhsjlqx");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }

        //能源费柱状图
        function InitRownyfzht() {
            option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    right: 200,
                    itemWidth: 50,
                    itemHeight: 10,
                    itemGap: 30,
                    textStyle: {
                        color: '#fff'
                    },
                    data: [{
                        name: '今年',
                        icon: 'roundRect'
                    }, {
                        name: '去年',
                        icon: 'roundRect'
                    }]
                },
                grid: {
                    left: '2%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    max: function (value) {
                        return value.max + 20;
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff'
                        },
                        formatter: '{value} 万元'
                    }
                },
                series: [
                    {
                        name: '今年',
                        type: 'bar',
                        data: [10, 32, 45, 13, 45, 25, 78, 24, 58, 39, 58, 95],
                        itemStyle: {
                            normal: {
                                color: '#C49509'
                            }
                        }
                    },
                    {
                        name: '去年',
                        type: 'bar',
                        data: [20, 52, 25, 43, 15, 63, 28, 64, 88, 93, 51, 35],
                        itemStyle: {
                            normal: {
                                color: '#624577'
                            }
                        }
                    }
                ]
            };

            var dom = document.getElementById("nyfzht");
            var myChart = echarts.init(dom);
            myChart.setOption(option);
        }

        //页面初始化
        $(function () {

            InitRowzhzjl(); //综合追缴率
            InitRowbnzhsjl();//本年综合收缴率
            InitRowbnzhsjlyrz();//本年综合收缴率 已入住

            InitRowbqzhsjl();//本期综合收缴率
            InitRowbqzhsjlyrz();//本期综合收缴率 已入住

            InitRowzhsjlqx();// 综合收缴率、综合收缴率曲线 

            InitRownyfzht();//能源费柱状图
        })
    </script>
</body>
</html>
