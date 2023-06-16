<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchantsAccountReport.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.MerchantsAccountReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商台账</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style>
        .lblText {
            padding: 0 8px;
            padding-top: 4px;
            /*color:#444444;*/
            font-weight: normal;
        }
    </style>
</head>
<body>
    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />
    <input id="search" name="search" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
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
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看客商台账费用明细详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td style="padding-left: 5px">
                        <div id="tipProgress" class="easyui-progressbar" style="width: 400px;"></div>
                    </td>
                    <td>
                        <label class="lblText" id="lblStatistics"></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 410px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="mainForm" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">基本信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">查询项目</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="hidden" id="CommID" name="CommID" />
                        <input id="CommName" name="CommName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮!',required:true,editable:false,multiline:true,height:60,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CommID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">服务类别</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="BusinessType" name="BusinessType" class="easyui-combobox" data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',
                                    data: [{id: '房屋租赁',text: '房屋租赁'},{id: '车位租赁',text: '车位租赁'},{id: '广告租赁',text: '广告租赁'},{id: '场地租赁',text: '场地租赁'},
                                    {id: '物业有偿服务',text: '物业有偿服务'},{id: '美居服务',text: '美居服务'},{id: '社区新零售',text: '社区新零售'}]" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="hidden" id="ContractTypeID" name="ContractTypeID" />
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsCategoryID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">签约类型</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="SigningType" name="SigningType" class="easyui-combobox" data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',
                                    data: [{id: '新签',text: '新签'},{id: '续签',text: '续签'}]" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客商类别</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="hidden" id="MerchantsCategoryID" name="MerchantsCategoryID" />
                        <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商类别');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsCategoryID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">统计开始时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="BeginDate" name="BeginDate" class="easyui-datebox" data-options="prompt:'>=',required:true,editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">统计结束时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="EndDate" name="EndDate" class="easyui-datebox" data-options="prompt:'<=',required:true,editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="StartTask();">统计</a>
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>--%>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#mainForm').form('clear')">清空</a>
                </div>
            </div>
        </form>
        <%-- <div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>--%>
    </div>

    <script type="text/javascript">
        var model = { MessageInfo: "(0%)", Curr: 0, StartDate: new Date(), EndDate: new Date(), TotalSeconds: 0 };
        function TakeProgress() {
            var param = $.getParam();
            param.ClientDate = $.dateFormat(new Date(), "yyyy-MM-dd HH:mm:ss");
            $.dataPostJson('MerchantsAccount', 'TaskProgress', param, false, false,
                function Init() {
                },
                function callback(data) {
                    if (!!data.Curr) {
                        model.MessageInfo = data.MessageInfo;
                        model.Curr = data.Curr;
                        model.StartDate = data.StartDate;
                        model.TotalSeconds = data.TotalSeconds;
                        $("#lblStatistics").text("温馨提示:当前数据操作时间 [ " + $.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss") + " ] ");
                        if (model.Curr > 0 && model.Curr < 100) {
                            setTimeout('TakeProgress()', 3000);
                        } else {
                            model.EndDate = data.EndDate;
                            InitDataGrid();
                            //$('#dg').datagrid('reload');
                        }
                        UpdateProgressBar();
                    } else {
                        model.Curr = -1;
                        $("#lblStatistics").text("温馨提示:请统计数据!");
                        InitDataGrid();
                    }

                },
                function completeCallback() {
                }, function errorCallback() {
                    model.Curr = -2;
                    $("#lblStatistics").text("温馨提示:登陆失效或服务器发生异常!");
                    InitDataGrid();
                });
        }

        function UpdateProgressBar() {
            var curDate = new Date();
            if (model.Curr < 100) {
                setTimeout('UpdateProgressBar()', 1000);
                curDate.setTime(new Date().getTime() + 1000 * model.TotalSeconds);
            } else {
                curDate = model.EndDate;
            }
            $('#tipProgress').progressbar({ text: GetRunTime($.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss"), $.dateFormat(curDate, "yyyy-MM-dd HH:mm:ss")), value: model.Curr });
        }
        function GetRunTime(startDate, endDate) {
            console.log("运行:" + startDate + "     " + endDate);

            var resultDate = new Date(endDate).getTime() - new Date(startDate).getTime();   //时间差的毫秒数      
            //计算出相差天数
            var days = Math.floor(resultDate / (24 * 3600 * 1000))

            //计算出小时数
            var leave1 = resultDate % (24 * 3600 * 1000)    //计算天数后剩余的毫秒数
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
            var str = model.MessageInfo + "&nbsp;(" + model.Curr + "%) ";
            if (model.Curr == 100) {
                str += "&nbsp;&nbsp;实际耗时&nbsp;:&nbsp;";
            } else {
                str += "&nbsp;&nbsp;运行耗时&nbsp;:&nbsp;";
            }
            if (days > 0) {
                str += days + "天";
            }
            if (hours > 0) {
                str += hours + "小时";
            }
            if (minutes > 0) {
                str += minutes + "分钟";
            }
            if (seconds == 0) {
                seconds = 1;
            }
            if (seconds > 0) {
                str += seconds + "秒";
            }
            return str;
        }



        //获取相差天数
        function GetDifferenceDay(startDate, endDate) {//startDate:小日期   endDate:大日期
            startDate = new Date(startDate), endDate = new Date(endDate);
            var dateTime = endDate.getTime() - startDate.getTime();
            var day = parseInt(dateTime / (1000 * 60 * 60 * 24));
            return day;
        }
        function StartTask() {
            //var BeginDate = $("#BeginDate").datebox("getValue");
            //var EndDate = $("#EndDate").datebox("getValue");
            //var day = GetDifferenceDay(BeginDate, EndDate);
            //if (day > 31) {
            //    HDialog.Info('任务时间范围跨度不能超过31天');
            //    return;
            //}
            if ($('#mainForm').form("validate")) {
                if (model.Curr == -1 || model.Curr == -2 || model.Curr == 0 || model.Curr == 100) {
                    $.dataPostJson('MerchantsAccount', 'StartTask', $.getParam(), true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $("#dlg_search").dialog("close");
                                $('#dg').datagrid("loadData", { total: 0, rows: [] });
                                TakeProgress();
                            } else { $.messager.alert('温馨提示', data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                } else {
                    $.messager.alert('温馨提示', "数据还在统计中...");
                }
            }
        }


        function InitControl() {
            TakeProgress();
            //$('#p').progressbar({ text: "(0%)", value: 0 });
            //$("#lblStatistics").text("温馨提示:当前数据统计日期 [ 2019-01-01 23:21:21 ] ");
            //$("#lblStatistics").text("温馨提示:请统计数据!");
            //设置查询跨度不能大于31天
            //var curDate = new Date();
            //$("#EndTime").datebox("setValue", $.dateFormat(curDate, "yyyy-MM-dd"));
            //curDate.setTime(curDate.getTime() - 31 * 24 * 60 * 60 * 1000);
            //$("#StartTime").datebox("setValue", $.dateFormat(curDate, "yyyy-MM-dd"));
            //var nowDate = new Date();
            //var cloneNowDate = new Date();
            //var fullYear = nowDate.getFullYear();
            //var month = nowDate.getMonth() + 1; // getMonth 方法返回 0-11，代表1-12月
            //var endOfMonth = new Date(fullYear, month, 0).getDate(); // 获取本月最后一天
            ////$("#BeginDate").datebox("setValue", $.dateFormat(cloneNowDate.setDate(1)));//当月第一天
            ////$("#EndDate").datebox("setValue", $.dateFormat(cloneNowDate.setDate(endOfMonth)));//当月最后一天
            //$('#CommID').val('186202,186278,186253,186272');
            //$("#CommName").textbox("setValue", '186202,186278')
            //$("#BeginDate").datebox("setValue", '2019-01-01');//当月第一天
            //$("#EndDate").datebox("setValue", '2022-11-01');//当月最后一天
        }
        $(function () {
            InitControl();
        });


        var column = [[
            { field: '管理单位', title: '管理单位', rowspan: 2, align: 'center', width: 200 },
            { field: '客商名称', title: '客商名称', rowspan: 2, align: 'center', width: 200 },
            { field: '客商类别', title: '客商类别', rowspan: 2, align: 'center', width: 150 },
            { field: '签约信息', title: '签约信息', colspan: 6, align: 'center' },
            { field: '费用信息', title: '费用信息', colspan: 6, align: 'center' },
            { field: '保证金信息', title: '保证金信息', colspan: 4, align: 'center' },
            {
                field: 'Opt', title: '操作', width: 100, rowspan: 2, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + $.param(row) + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            }
        ], [
            { field: '本期合作项目数量', title: '本期合作项目数量', width: 150, align: 'center' },
            { field: '本期签约合同数量', title: '本期签约合同数量', width: 150, align: 'center' },
            { field: '其中新签合同数量', title: '其中新签合同数量', width: 150, align: 'center' },
            { field: '其中续签合同数量', title: '其中续签合同数量', width: 150, align: 'center' },
            { field: '本期签约合同金额', title: '本期签约合同金额(元)', width: 150, align: 'center' },
            {
                field: '本期签约金额贡献率', title: '本期签约金额贡献率(%)', width: 150, align: 'center', formatter: function (value, row, index) {
                    return value + "&nbsp;%";
                }
            },
            { field: '期初欠费金额', title: '期初欠费金额(元)', width: 150, align: 'center' },
            { field: '本期应收金额', title: '本期应收金额(元)', width: 150, align: 'center' },
            { field: '本期收到期初欠费_本期应收金额', title: '本期收到期初欠费<br>本期应收金额(元)', width: 150, align: 'center' },
            { field: '本期减免期初欠费_本期应收金额', title: '本期减免期初欠费<br>本期应收金额(元)', width: 150, align: 'center' },
            { field: '期末欠费金额', title: '期末欠费金额', width: 150, align: 'center' },
            {
                field: '期末收款达成率', title: '期末收款达成率(%)', width: 150, align: 'center', formatter: function (value, row, index) {
                    return value + "&nbsp;%";
                }
            },
            { field: '期初未退金额', title: '期初未退金额(元)', width: 150, align: 'center' },
            { field: '本期收款金额', title: '本期收款金额(元)', width: 150, align: 'center' },
            { field: '本期退款金额', title: '本期退款金额(元)', width: 150, align: 'center' },
            { field: '期末未退金额', title: '期末未退金额(元)', width: 150, align: 'center' },

        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                //queryParams: {
                //    SortField: 'ID',
                //    OrderMode: 'desc'
                //},
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: '#toolbar',
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                    Detailed($.param(row));
                },
                onBeforeLoad: function (param) {
                    param.SortField = "ID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("MerchantsAccount", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                    $('#dg').datagrid("loadData", { total: 0, rows: [] });
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }
        function Detailed(urlParam) {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Report/MerchantsAccountReportDetail.aspx?' + urlParam, "详情", true, function callback(data) {
                InitDataGrid();
            });
        }

        function SelComm() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
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
        function SelDictionary(type) {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": type, "IsMultiple": "是" }), '选择' + type, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    if (data.length > 0) {
                        $.each(data, function (i, item) {
                            id += "," + item.ID;
                            text += "," + item.Name;
                        });
                        id = id.substr(1);
                        text = text.substr(1);
                    }
                    $("#MerchantsCategoryID").val(id);
                    $("#MerchantsCategoryName").textbox('setValue', text);
                }
            });
        }
        //选择 合同类别
        function SelContractType() {
            var param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('400', '600', '/HM/M_Main/DiversifiedManage/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractTypeID").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                }
            });
        }

        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "客商签约台账报表";
            param.TemplatePath = "/HM/M_Main/DiversifiedManage/Report/ExcelTemplate/Merchants.xlsx";
            param.StartFillLines = "2";
            param.Class = "MerchantsAccount";
            param.Method = "GetListSqlWhere";
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }

    </script>
</body>
</html>
