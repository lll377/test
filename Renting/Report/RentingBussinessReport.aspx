<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RentingBussinessReport.aspx.cs" Inherits="M_Main.Renting.Report.RentingBussinessReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-租赁经营报表</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">Excel导出</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <div id="p" class="easyui-progressbar" style="width: 300px;"></div>
                    </td>
                    <td style="padding: 0px 5px; vertical-align: bottom;">
                        <label id="lblStatistics"></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 800px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">统计信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">项目名称</label>
                    <div class="col-sm-10 col-xs-10">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择项目!',editable:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true,required:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">统计开始时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ReportBeginTime" name="ReportBeginTime" class="easyui-datebox"
                            data-options="required:true,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">统计截止时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ReportEndTime" name="ReportEndTime" class="easyui-datebox"
                            data-options="required:true,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="StartTask();">统计</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            TakeProgress();
            InitDataGrid();
        });

        //选择项目
        function SelComm() {
            if ($('#HidCommID').val() == "" || $('#HidCommID').val() == "0") {
                LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/CommSelect.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                    if (data) {
                        data = $.parseJSON(data);
                        var id = "", text = "";
                        $.each(data, function (i, item) {
                            id += "," + item.CommID;
                            text += "," + item.CommName;
                        });
                        id = id.substr(1);
                        text = text.substr(1);
                        $("#CommID").val(id);
                        $("#CommName").textbox('setValue', text);
                    }
                });
            }
        }

        function ClearWhere() {
            $('#formSearch').form('clear');
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                $("#CommName").textbox("setValue", $('#HidCommName').val());
                $("#CommID").val($('#HidCommID').val());
            }
        }

        var model = { MessageInfo: "(0%)", Curr: 0, StartDate: new Date(), EndDate: new Date() };
        function TakeProgress() {
            $.dataPostJson('Renting_RentingBussinessReport', 'TaskProgress', $.getParam(), false, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        model = data[0];
                        $("#lblStatistics").text("温馨提示:当前数据统计日期 [ " + $.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss") + " ] ");
                        if (model.Curr > 0 && model.Curr < 100) {
                            setTimeout('TakeProgress()', 3000);
                        } else {
                            InitDataGrid();
                        }
                        UpdateProgressBar();
                    } else {
                        $("#lblStatistics").text("温馨提示:请统计数据!");
                        $('#p').progressbar({ text: "(0%)", value: 0 });
                        InitDataGrid();
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function StartTask() {
            if ($('#formSearch').form("validate")) {
                let ReportBeginTime = $('#ReportBeginTime').datebox("getValue");
                let ReportEndTime = $('#ReportEndTime').datebox("getValue");
                if (isValueNull(ReportBeginTime) && isValueNull(ReportEndTime)) {
                    let BeginYear = (new Date(ReportBeginTime)).getFullYear();
                    let EndYear = (new Date(ReportEndTime)).getFullYear();
                    if (parseInt(BeginYear) != parseInt(EndYear)) {
                        $.messager.alert('温馨提示', "统计开始、结束时间不允许跨年！");
                        return;
                    }
                }

                $("#dlg_search").dialog("close");
                if (model.Curr == 0 || model.Curr == 100) {
                    $.dataPostJson('Renting_RentingBussinessReport', 'StartTask', $.getParam(), true, false,
                        function Init() {
                            $("#TableContainer").datagrid("loadData", { total: 0, rows: [] });
                        },
                        function callback(data) {
                            if (data.result) {
                                //InitDataGrid();
                                TakeProgress();

                            } else { $.messager.alert('温馨提示', data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                } else {
                    $.messager.alert('温馨提示', "数据正在统计中...");
                }
            }
        }

        function UpdateProgressBar() {
            var curDate = new Date();
            if (model.Curr == 100) {
                curDate = model.EndDate;
            }
            $('#p').progressbar({ text: CalculationDateTime($.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss"), $.dateFormat(curDate, "yyyy-MM-dd HH:mm:ss")), value: model.Curr });
        };

        function CalculationDateTime(date1, date2) {
            var date3 = new Date(date2).getTime() - new Date(date1).getTime();   //时间差的毫秒数      
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
            //if (!isValueNull(model.MessageInfo)) {
            //    model.MessageInfo = "初始化数据中...";
            //}
            var str = model.MessageInfo + "(" + model.Curr + "%) ";
            str += "耗时:";
            if (days > 0) {
                str += days + "天";
            }
            if (hours > 0) {
                str += hours + "小时";
            }
            if (minutes > 0) {
                str += minutes + "分钟";
            }
            if (seconds > 0) {
                str += seconds + "秒";
            }
            return str;
        }

        var column = [[
            {
                field: 'CommName', title: '项目名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    //判断是否为项目
                    if (isValueNull(value)) {
                        return value;
                    } else {
                        return row.OrganName;
                    }
                }
            },
            { field: 'YearGuaranteedIncome', title: '年度保底收入(元)<br/>(1)', width: 130, align: 'center' },
            { field: 'YearTargetIncome', title: '年度目标收入(元)<br/>(2)', width: 130, align: 'center' },
            { field: 'CurrentDueAmount', title: '本期应收收入(元)<br/>(3)', width: 130, align: 'center' },
            { field: 'TotalDueAmount', title: '累计应收收入(元)<br/>(4)', width: 130, align: 'center' },
            { field: 'CurrentActureIncome', title: '本期实际收入(元)<br/>(5)', width: 130, align: 'center' },
            { field: 'TotalActureIncome', title: '累计实际收入(元)<br/>(6)', width: 130, align: 'center' },
            { field: 'DueGuaranteedIncomeCompleteRate', title: '应收口径保底收入完成率(%)<br/>(7=(4/1)*100%)', width: 160, align: 'center' },
            { field: 'DueTargeRage', title: '应收口径目标收入达成率(%)<br/>(8=(4/2)*100%)', width: 160, align: 'center' },
            { field: 'ActureGuaranteedIncomeCompleteRate', title: '实收口径保底收入完成率(%)<br/>(9=(6/1)*100%)', width: 160, align: 'center' },
            { field: 'ActureAmountTargeRage', title: '目标收入达成率(%)<br/>(10=(6/2)*100%)', width: 160, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID";
                    param.SortOrder = 0;
                    param = $.getDataGridParam("Renting_RentingBussinessReport", "GetList", param);

                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_search').dialog('close');
        }
        //导出
        function Export() {
            //判断当前页面是否存在数据
            let Rows = $("#TableContainer").datagrid("getRows");
            if (Rows.length == 0) {
                $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                return;
            }
            var dataFields = $('#TableContainer').datagrid('getColumnFields');
            var dataColumnFields = [];

            dataFields.forEach((item, index) => {
                //如果是项目列的话需要替换一下
                if (item == "CommName") {
                    dataColumnFields += ",replace((case when ISNULL(CommName,'')='' then OrganName else CommName end),'&nbsp;','') as '项目名称'";
                } else {
                    dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                }
            });
            if (dataColumnFields.startsWith(',')) {
                dataColumnFields = dataColumnFields.slice(1);
            }

            var param = $.getParam();
            param.DataColumnFields = dataColumnFields;
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TemplatePath = "/HM/M_Main/Renting/Report/ExcelTemplate/RentingBussinessReport.xlsx";
            param.StartFillLines = "1";
            param.TableName = "租赁租赁经营报表";
            param.Class = 'Renting_RentingBussinessReport';
            param.Method = "GetListSqlWhere";
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }
    </script>
</body>
</html>
