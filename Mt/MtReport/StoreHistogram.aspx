<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreHistogram.aspx.cs" Inherits="M_Main.Mt.MtReport.StoreHistogram" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>库存排行榜</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../../jscript/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../jscript/myCharts/js/highcharts.js"></script>
    <script type="text/javascript" src="../../jscript/myCharts/js/exporting.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="columns" name="columns" runat="server" value="" />
        <input type="hidden" id="series" name="series" runat="server" value="" />
     <div id="container" style="min-width:700px;height:400px"></div>

        <script type="text/javascript">
            $(function () {
                var colums = '['+$("#columns").val()+']' ;
                var series ='['+$("#series").val()+']';
                $('#container').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '库存物资排行榜'
                    },
                    subtitle: {
                        text: ''
                    },
                    xAxis: {
                        categories: eval(colums)
                    },
                    yAxis: {
                        min: 1,
                        title: {
                            text: '数量'
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0
                        }
                    },
                    series: [{
                        name: '库存数量',
                        data: eval(series)

                    }]
                });
            });
        </script>
    </form>
</body>
</html>
