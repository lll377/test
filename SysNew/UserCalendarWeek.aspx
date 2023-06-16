<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCalendarWeek.aspx.cs" Inherits="M_Main.SysNew.UserCalendarWeek" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="shortcut icon" href="favicon.ico">
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body class="gray-bg">
    <form id="frmForm">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInDown">
            <div class="col-sm-9" style="width:100%;">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <button class="btn btn-white" type="button" onclick="window.location.href='../frame/StatDesktop.aspx';"><i class="fa fa-chevron-left"></i></button>
                                 &nbsp;&nbsp;
                        <span style="font-family:微软雅黑;font-size:14px;font-weight:bold;">日程安排</span>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="calendar.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="../OAPublicWorkNew/WorkRecord.aspx">工作日志</a>
                                </li>
                                <li><a href="../MyOa/WaitWork.aspx">待办工作</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="../Jscript-Ui/hplus/js/jquery-ui.custom.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/iCheck/icheck.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
        
            //var _EventsData = [{ 'id': '0eb5a3a6-829d-4cce-b353-0aa205ff7432', 'title': '去开会', 'start': '2016/4/11 14:05:45', 'end': '2016/4/11 18:05:47', 'allDay': true }, { 'id': 'ee84a3e5-a6ad-4f26-ae40-b7e50111eb99', 'title': '去开会', 'start': '2016/4/11 15:00:00', 'end': '2016/4/11 16:00:00', 'allDay': true }];

            var _EventsData;

            function LoadCalendar()
            {
                var b = new Date();
                var c = b.getDate();
                var a = b.getMonth();
                var e = b.getFullYear();
                $("#calendar").fullCalendar({
                    dayClick: function (dayDate, allDay, jsEvent, view) {
                        var d = formatDate(dayDate, 'yyyy-MM-dd');
                        AddEvent(d);
                    },
                    eventClick: function(calEvent, jsEvent, view) {
                        //alert('Event: ' + calEvent.title);
                        //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                        //alert('View: ' + view.name);
                        //alert(calEvent.backgroundColor);
                        //$(this).css('border-color', 'red');
                        DetailEvent(calEvent.id);
                    },
                    header: {
                        left: "prev,next",
                        center: "title",
                        right: "month,agendaWeek,agendaDay"
                    },
                    editable: true,
                    droppable: true,
                    drop: function (g, h) {
                        var f = $(this).data("eventObject");
                        var d = $.extend({},
                        f);
                        d.start = g;
                        d.allDay = h;
                        $("#calendar").fullCalendar("renderEvent", d, true);
                        if ($("#drop-remove").is(":checked")) {
                            $(this).remove()
                        }
                    },
                    eventRender: function (event, element) {
                        element.html(event.title);           
                    },
                    events: _EventsData,
                })
        }


            function Load() {
                $("#calendar").html("");
                $.tool.DataGet('OACalendar', 'Search', '',
                function Init() {
                },
                function callback(_Data) {
                    _EventsData =JSON.parse(_Data);
                    LoadCalendar();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        Load();
        function AddContent(id,title, start, end, allday) {
            var f = $(this).data("eventObject");
            var d = $.extend({},
            f);
            d.id = id;
            d.title = title;
            d.start = start;
            d.end = end;
            d.allDay = allday;
            $("#calendar").fullCalendar("renderEvent", d, true);
        }

        function AddEvent(d) {
            HDialog.Open('470', '260', '../SysNew/UserCalendarWeekDetail.aspx?d='+d+'&OPType=insert', '添加事件', false, function callback(_Data) {
                if (_Data != '') {
                    //增加事件
                    var Obj = JSON.parse(_Data);
                    var allDay = false;
                    if (Obj[0].IsRemind == '1') allDay = true;
                    AddContent(Obj[0].UserCalendarCode, Obj[0].Title, Obj[0].StartTime, Obj[0].EndTime, allDay);
                }
            });
        }

        function DetailEvent(id) {
            HDialog.Open('470', '260', '../SysNew/UserCalendarWeekDetail.aspx?OPType=edit&id=' + id, '编辑事件', false, function callback(_Data) {
                if (_Data != '') {
                    if (_Data == 'del') {
                        //删除事件
                        $("#calendar").fullCalendar("removeEvents", id);
                    }
                    else
                    {
                        $("#calendar").fullCalendar("removeEvents", id);
                        var Obj = JSON.parse(_Data);
                        var allDay = false;
                        if (Obj[0].IsRemind == '1') allDay = true;
                        AddContent(Obj[0].UserCalendarCode, Obj[0].Title, Obj[0].StartTime, Obj[0].EndTime, allDay);
                    }
                }
            });
        }
    });
    </script>
</form>
</body>
</html>