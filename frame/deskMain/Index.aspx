<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="M_Main.frame.deskMain.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>兴泸数据总屏</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/Jscript/jquery-1.11.3.min.js"></script>
    <script src="../../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <link href="css/Index.css" rel="stylesheet" />
    <script src="../../Jscript-Ui/echarts/echarts.js"></script>
    <script src="../../Jscript-Ui/echarts/china.js"></script>
    <script src="../../Jscript-Ui/echarts/Bmap/bmap.js"></script>
</head>
<body style="overflow: hidden;">
    <div class="body">
        <form id="form1">
            <div class="title_img">
                <span>&nbsp;</span>
            </div>
            <div>
                <%--第一行开始--%>
                <div>
                    <div class="col-sm-4 col-xs-4">
                        <div class="backgroundClass height1 background1">
                            <div class="infoDiv">
                                <div class="col-sm-5 col-xs-5">
                                    <div class="info_content">
                                        年底费用收入 
                                        <span id="feeYear">54534元</span>
                                    </div>
                                    <div class="info_content">
                                        物业费收入
                                        <span id="propertyFee">38534元</span>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="info_content">
                                        年底收缴率 
                                        <span id="takeOverRate">88.53%</span>
                                    </div>
                                    <div class="info_content">
                                        年度清欠率
                                        <span id="clearRate">98.34%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div class="col-sm-4 col-xs-4 nopadding">
                            <div class="col-sm-4 col-xs-4 nopadding">
                                <img src="Img/icon1.png" class="iconImg" />
                            </div>
                            <div class="col-sm-8 col-xs-8 nopadding">
                                <div class="center_content">
                                    <span id="commNum">29个</span><br />
                                    项目数量
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-4 nopadding">
                            <div class="col-sm-4 col-xs-4 nopadding">
                                <img src="Img/icon2.png" class="iconImg" />
                            </div>
                            <div class="col-sm-8 col-xs-8 nopadding">
                                <div class="center_content">
                                    <span id="area">744.379㎡</span><br />
                                    管理面积
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-4 nopadding">
                            <div class="col-sm-4 col-xs-4 nopadding">
                                <img src="Img/icon3.png" class="iconImg" />
                            </div>
                            <div class="col-sm-8 col-xs-8 nopadding">
                                <div class="center_content">
                                    <span id="roomNum">7645569户</span><br />
                                    管理户数
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div class="backgroundClass height1 background2">
                            <div class="infoDiv">
                                <div class="col-sm-5 col-xs-5">
                                    <div class="info_content">
                                        年度报事总数 
                                        <span id="incidentNum">87612件</span>
                                    </div>
                                    <div class="info_content">
                                        年度满意度 
                                        <span id="satisfactionRate">99.55%</span>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="info_content">
                                        年度关闭率
                                        <span id="closeRate">80.21%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--第二行开始--%>
                <div>
                    <div class="col-sm-4 col-xs-4 paddingTop">
                        <div class="backgroundClass height2 background3">
                            <div class="listDiv" id="feeList">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-4 paddingTop">
                        <img src="Img/center.png" class="centerImg" />
                    </div>
                    <div class="col-sm-4 col-xs-4 paddingTop">
                        <div class="backgroundClass height2 background4">
                            <div class="infoDiv">
                                <div class="col-sm-5 col-xs-5">
                                    <div class="info_content">
                                        年度报事总数 
                                        <span id="incidentEqNum">87612件</span>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="info_content">
                                        年度关闭率
                                        <span id="closeEqRate">80.21%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="pieDiv" id="eqPie">
                            </div>
                        </div>
                    </div>
                </div>
                <%--第三行开始--%>
                <div>
                    <div class="col-sm-3 col-xs-3 paddingTop">
                        <div class="backgroundClass height3 background5">
                            <div class="listDiv" id="taskList">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-3 paddingTop">
                        <div class="backgroundClass height3 background6">
                            <div class="listDiv" id="cpList">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-3 paddingTop">
                        <div class="backgroundClass height3 background7">
                            <div class="listDiv" id="safeList">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-3 paddingTop">
                        <div class="backgroundClass height3 background8">
                            <div class="listDiv" id="ambientList">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        $(function () {
            $('.body').height($(window).height());
            commInfo();
            IncidentYear();
            feeList();
            eqPie();
            taskList();
            cpList();
            safeList();
            ambientList();

            feeNum();
        });

        function feeNum() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_FeeNum";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {

                        $('#takeOverRate').text(obj[0]["wnRate"]);
                        $('#clearRate').text(obj[0]["bnqfRate"]);

                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }


        function commInfo() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MapInfo";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        $('#area').text(obj[0]["管理面积"] + '㎡');
                        $('#roomNum').text(obj[0]["房屋数量"] + '户');
                        $('#commNum').text(obj[0]["项目数量"] + '个');
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function IncidentYear() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_IncidentYear";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        $('#incidentNum').text(obj[0]["bsNum"] + '件');
                        $('#satisfactionRate').text(obj[0]["myRate"] + '%');
                        $('#closeRate').text(obj[0]["gbRate"] + '%');
                        $('#incidentEqNum').text(obj[0]["eqbsNum"] + '件');
                        $('#closeEqRate').text(obj[0]["eqgbRate"] + '%');
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function feeList() {
            //var option = {
            //    color: ['#C09234'],
            //    tooltip: {
            //        trigger: 'axis',
            //        axisPointer: { // 坐标轴指示器，坐标轴触发有效
            //            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            //        },
            //    },
            //    xAxis: {
            //        type: 'category',
            //        data: ['项目1', '项目2', '项目3', '项目4'],
            //        axisLabel: {
            //            textStyle: {
            //                color: '#fff'
            //            }
            //        }
            //    },
            //    yAxis: {
            //        type: 'value',
            //        axisLabel: {
            //            textStyle: {
            //                color: '#fff'
            //            }
            //        }
            //    },
            //    series: [
            //        {
            //            data: [5000, 8000, 9651, 7232],
            //            type: 'bar',
            //            barWidth: '15px'
            //        }
            //    ]
            //};

            //var dom = document.getElementById("feeList");
            //var myChart = echarts.init(dom);
            //myChart.setOption(option);
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MainFees";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var nameData = [];
                        var valueData = [];

                        for (var i = 0; i < obj.length; i++) {
                            nameData.push(obj[i].CommName);
                            valueData.push(obj[i].rate);
                        }

                        var option = {
                            color: ['#C09234'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: nameData,
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valueData,
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("feeList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: ['项目1', '项目2', '项目3', '项目4'],
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: [5000, 8000, 9651, 7232],
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("feeList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function eqPie() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_eqPie";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var option = {
                            tooltip: {
                                trigger: 'item'
                            },
                            series: [
                                {
                                    name: '设备数量',
                                    type: 'pie',
                                    radius: ['70%', '80%'],
                                    data: obj,
                                    emphasis: {
                                        itemStyle: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };

                        var dom = document.getElementById("eqPie");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            tooltip: {
                                trigger: 'item'
                            },
                            series: [
                                {
                                    name: '设备数量',
                                    type: 'pie',
                                    radius: ['70%', '80%'],
                                    data: [
                                        { value: 1048, name: '电梯系统' },
                                        { value: 735, name: '强电系统' },
                                        { value: 580, name: '弱电系统' }
                                    ],
                                    emphasis: {
                                        itemStyle: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };

                        var dom = document.getElementById("eqPie");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function taskList() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MainTask";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var nameData = [];
                        var valueData = [];

                        for (var i = 0; i < obj.length; i++) {
                            nameData.push(obj[i].CommName);
                            valueData.push(obj[i].rate);
                        }

                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: nameData,
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valueData,
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("taskList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: ['项目1', '项目2', '项目3', '项目4'],
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: [5000, 8000, 9651, 7232],
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("taskList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function cpList() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MainCpTask";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var nameData = [];
                        var valueData = [];

                        for (var i = 0; i < obj.length; i++) {
                            nameData.push(obj[i].CommName);
                            valueData.push(obj[i].rate);
                        }

                        var option = {
                            color: ['#C09234'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: nameData,
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valueData,
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("cpList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: ['项目1', '项目2', '项目3', '项目4'],
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: [5000, 8000, 9651, 7232],
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("cpList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function safeList() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MainSafeTask";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var nameData = [];
                        var valueData = [];

                        for (var i = 0; i < obj.length; i++) {
                            nameData.push(obj[i].CommName);
                            valueData.push(obj[i].rate);
                        }

                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: nameData,
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valueData,
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("safeList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: ['项目1', '项目2', '项目3', '项目4'],
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: [5000, 8000, 9651, 7232],
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("safeList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function ambientList() {
            var postStr = "Method=DataPost&Class=Desktop_new&Command=BI_MainAmbientTask";
            $.ajax({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                type: 'POST',
                data: postStr,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var obj = JSON.parse(_Data);
                    if (obj.length > 0) {
                        var nameData = [];
                        var valueData = [];

                        for (var i = 0; i < obj.length; i++) {
                            nameData.push(obj[i].CommName);
                            valueData.push(obj[i].rate);
                        }

                        var option = {
                            color: ['#C09234'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: nameData,
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valueData,
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("ambientList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    } else {
                        var option = {
                            color: ['#0080AD'],
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                                },
                            },
                            xAxis: {
                                type: 'category',
                                data: ['项目1', '项目2', '项目3', '项目4'],
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: [5000, 8000, 9651, 7232],
                                    type: 'bar',
                                    barWidth: '15px'
                                }
                            ]
                        };

                        var dom = document.getElementById("ambientList");
                        var myChart = echarts.init(dom);
                        myChart.setOption(option);
                    }

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }
    </script>
</body>
</html>
