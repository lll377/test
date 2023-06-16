<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KmDeskSource.aspx.cs" Inherits="M_Main.frame.KmDeskSource" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>桌面</title>
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
        .symapt1 h2 {
            color: #00C1FF;
        }

        .symapt2 h2 {
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

        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-sm-3" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>房屋状态分布 
                                <span id="zt3" class="index_fwzt_off" onclick="Getfwzt(3,'zt',3)">全部</span>
                                    <span id="zt2" class="index_fwzt_off" onclick="Getfwzt(2,'zt',3)">商业</span>
                                    <span id="zt1" class="index_fwzt_on" onclick="Getfwzt(1,'zt',3)">住宅</span></h5>
                            </div>
                            <div class="ibox-content">
                                <div style="height: 260px; padding: 5px;" id="fwztfb"></div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>合作方式</h5>
                            </div>
                            <div class="ibox-content">
                                <div style="height: 260px; padding: 5px;" id="hzfs"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 " style="padding-right: 5px;">

                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>项目分布 </h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 610px;" id="Map">
                                <div style="width: 100%; height: 130px;">
                                    <table style="width: 100%;" class="symapt1">
                                        <tr>
                                            <td style="padding-left: 30px;" class="symapt1">
                                                <h5>管理区域</h5>
                                                <h2>13 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt2">
                                                <h5>管理项目</h5>
                                                <h2>73 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt1">
                                                <h5>商住项目</h5>
                                                <h2>63 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt2">
                                                <h5>公建项目</h5>
                                                <h2>10 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 30px;" class="symapt1">
                                                <h5>管理面积</h5>
                                                <h2>15,642 <span style="font-size: 12px">万平</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt2">
                                                <h5>房屋数量</h5>
                                                <h2>745,234 <span style="font-size: 12px">套</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt1">
                                                <h5>车位数量</h5>
                                                <h2>110.323 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                            <td style="padding-left: 30px;" class="symapt2">
                                                <h5>空置车位</h5>
                                                <h2>1,453 <span style="font-size: 12px">个</span></h2>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                                <div style="width: 100%; height: 480px;"></div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-3" style="padding-left: 20px; padding-right: 20px;">
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>项目性质分布  
                                <span id="xz2" class="index_fwzt_off" onclick="Getfwzt(2,'xz',2)">按户数</span>
                                    <span id="xz1" class="index_fwzt_on" onclick="Getfwzt(1,'xz',2)">按面积</span></h5>
                            </div>
                            <div class="ibox-content">
                                <div style="height: 260px; padding: 5px;" id="xmxzfb"></div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="ibox1">
                            <div class="ibox1-title index_xxbt">
                                <h5>管理性质<span id="Wv"></span></h5>
                            </div>
                            <div class="ibox-content">
                                <div style="height: 260px; padding: 5px;" id="glxz"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row ">
                <div class="col-sm-3">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>本月报事类别<span id="Wv"></span></h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 250px; padding: 5px;" id="bybslb"></div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-3 ">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>设备完好率</h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 250px; padding: 5px;" id="sbwhl"></div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-3 ">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>RBA设备主题</h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 250px; padding: 5px;" id="rbasb"></div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-3">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <h5>资源主题</h5>
                        </div>
                        <div class="ibox-content">
                            <div style="height: 250px; padding: 5px;" id="zyzt">
                                <table style="width: 100%; height: 100%;">
                                    <tr style="text-align: center;">
                                        <td style="width: 20%"></td>
                                        <td style="width: 27%">住宅面积</td>
                                        <td style="width: 27%">商业面积</td>
                                        <td style="width: 26%">车位数量</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                    <tr style="text-align: center; border-top: 10px solid #27272F; border-bottom: 10px solid #27272F">
                                        <td style="width: 20%">重庆</td>
                                        <td style="width: 27%; background-color: #C49509;">222.23</td>
                                        <td style="width: 27%; background-color: #1AAADF;">444.23</td>
                                        <td style="width: 26%; background-color: #68487F;">563</td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>

        <%-- <script type="text/javascript" src="../js/newdesktop1.js"></script>--%>
    </form>
    <script type="text/javascript">


        function InitRowfwztfb() {
            option = {
                title: {
                    text: '',
                    subtext: ''
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}%"
                },

                legend: {
                    data: ['入住', '接房', '装修', '未收'],
                    textStyle: {
                        color: '#fff'
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '房屋状态',
                        type: 'funnel',
                        left: '10%',
                        top: 60,
                        bottom: 5,
                        width: '80%',
                        min: 0,
                        max: 100,
                        minSize: '0%',
                        maxSize: '100%',
                        sort: 'descending',
                        gap: 2,
                        label: {
                            show: true,
                            position: 'inside'
                        },
                        labelLine: {
                            length: 10,
                            lineStyle: {
                                width: 1,
                                type: 'solid'
                            }
                        },
                        itemStyle: {
                            borderColor: '#fff',
                            borderWidth: 1
                        },
                        emphasis: {
                            label: {
                                fontSize: 20
                            }
                        },
                        data: [
                            { value: 75, name: '入住' },
                            { value: 50, name: '接房' },
                            { value: 25, name: '装修' },
                            { value: 100, name: '未收' }
                        ]
                    }
                ]
            };



            var dom = document.getElementById("fwztfb");
            var myChart = echarts.init(dom);

            myChart.setOption(option);
        }
        InitRowfwztfb();

    </script>


    <script type="text/javascript">
        //这是Hchart控件的代码
        //合作方式
        function InitHzfs() {
            var chart = Highcharts.chart('hzfs', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    },
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],

                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: ' <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '浏览器占比',
                    data: [
                        {
                            name: '与业委会合作',
                            y: 12.8,
                            sliced: true,
                            selected: true
                        },
                        ['与开发商合作', 8.5]
                    ]
                }]
            });
        } InitHzfs();

        //项目性质分布
        function InitXmxzfb() {
            var chart = Highcharts.chart('xmxzfb', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    },
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],

                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: ' <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '浏览器占比',
                    data: [
                        {
                            name: '公建',
                            y: 12.8,
                            sliced: true,
                            selected: true
                        },
                        ['住宅', 8.5]
                    ]
                }]
            });
        } InitXmxzfb();

        //管理性质 
        function InitGlxz() {
            var chart = Highcharts.chart('glxz', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    },
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],

                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: ' <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '浏览器占比',
                    data: [
                        {
                            name: '半委',
                            y: 12.8,
                            sliced: true,
                            selected: true
                        },
                        ['全委', 8.5],
                        ['顾问', 14.5]
                    ]
                }]
            });
        } InitGlxz();


        //本月报事类别 
        function InitBybs() {
            var chart = Highcharts.chart('bybslb', {
                chart: {
                    spacing: [40, 0, 40, 0],
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],
                },
                title: {
                    floating: true,
                    text: ''
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        },
                        point: {
                            events: {
                                mouseOver: function (e) {  // 鼠标滑过时动态更新标题
                                    // 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
                                    chart.setTitle({
                                        text: e.target.name + '\t' + e.target.y + ' %'
                                    });
                                }
                                //, 
                                // click: function(e) { // 同样的可以在点击事件里处理
                                //     chart.setTitle({
                                //         text: e.point.name+ '\t'+ e.point.y + ' %'
                                //     });
                                // }
                            }
                        },
                    }
                },
                series: [{
                    type: 'pie',
                    innerSize: '80%',
                    name: '市场份额',
                    data: [
                        { name: '口派类', y: 45.0, url: 'http://bbs.hcharts.cn' },
                        ['地产投书', 26.8],
                        {
                            name: '产品缺陷类',
                            y: 12.8,
                            sliced: true,
                            selected: true,
                            url: 'http://www.hcharts.cn'
                        },
                        ['服务类', 8.5],
                        ['物业服务类', 6.2],
                        ['其他', 0.7]
                    ]
                }]
            }, function (c) { // 图表初始化完毕后的会掉函数
                // 环形图圆心
                var centerY = c.series[0].center[1],
                    titleHeight = parseInt(c.title.styles.fontSize);
                // 动态设置标题位置
                c.setTitle({
                    y: centerY + titleHeight / 2
                });
            });
        } InitBybs();


        //设备完好率 
        function Initsbwhl() {
            // 公共配置
            Highcharts.setOptions({
                chart: {
                    type: 'solidgauge',
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],
                },
                title: null,
                pane: {
                    center: ['50%', '85%'],
                    size: '100%',
                    startAngle: -90,
                    endAngle: 90,
                    background: {
                        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                        innerRadius: '60%',
                        outerRadius: '100%',
                        shape: 'arc'
                    }
                },
                tooltip: {
                    enabled: false
                },
                yAxis: {
                    stops: [
                        [0.1, '#55BF3B'], // green
                        [0.5, '#DDDF0D'], // yellow
                        [0.9, '#DF5353'] // red
                    ],
                    lineWidth: 0,
                    minorTickInterval: null,
                    tickPixelInterval: 400,
                    tickWidth: 0,
                    title: {
                        y: -70
                    },
                    labels: {
                        y: 16
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
            // 速度仪表
            var chart1 = Highcharts.chart('sbwhl', {
                yAxis: {
                    min: 0,
                    max: 100,
                    title: {
                        text: '设备完好率'
                    }
                },
                credits: {
                    enabled: false
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                series: [{
                    name: '设备完好率',
                    data: [80],
                    dataLabels: {
                        format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                            ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                            '<span style="font-size:12px;color:silver">%</span></div>'
                    },
                    tooltip: {
                        valueSuffix: ' %'
                    }
                }]
            });


        } Initsbwhl();

        //RBA 
        function InitRba() {
            var chart = Highcharts.chart('rbasb', {
                chart: {
                    spacing: [40, 0, 40, 0],
                    backgroundColor: '#27272F',
                    margin: [0, 0, 0, 0],
                },
                title: {
                    floating: true,
                    text: ''
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        },
                        point: {
                            events: {
                                mouseOver: function (e) {  // 鼠标滑过时动态更新标题
                                    // 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
                                    chart.setTitle({
                                        text: e.target.name + '\t' + e.target.y + ' %'
                                    });
                                }
                                //, 
                                // click: function(e) { // 同样的可以在点击事件里处理
                                //     chart.setTitle({
                                //         text: e.point.name+ '\t'+ e.point.y + ' %'
                                //     });
                                // }
                            }
                        },
                    }
                },
                series: [{
                    type: 'pie',
                    innerSize: '80%',
                    name: '市场份额',
                    data: [
                        { name: '口派类', y: 45.0, url: 'http://bbs.hcharts.cn' },
                        ['地产投书', 26.8],
                        {
                            name: '产品缺陷类',
                            y: 12.8,
                            sliced: true,
                            selected: true,
                            url: 'http://www.hcharts.cn'
                        },
                        ['服务类', 8.5],
                        ['物业服务类', 6.2],
                        ['其他', 0.7]
                    ]
                }]
            }, function (c) { // 图表初始化完毕后的会掉函数
                // 环形图圆心
                var centerY = c.series[0].center[1],
                    titleHeight = parseInt(c.title.styles.fontSize);
                // 动态设置标题位置
                c.setTitle({
                    y: centerY + titleHeight / 2
                });
            });
        } InitRba();
    </script>
</body>
</html>
