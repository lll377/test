<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAccountReport.aspx.cs" Inherits="M_Main.Renting.Report.ContractAccountReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-合同台账报表</title>
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
                        <a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看合同台账费用明细详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
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
                    <label class="col-sm-2 col-sm-2 control-label">合同类别</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();}"
                            runat="server" />
                        <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                    </div>
                    <label class="col-sm-2 col-sm-2 control-label">签约类别</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="SigningType" name="SigningType" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '',text: ''},{id: '新签',text: '新签'},{id: '续签',text: '续签'}]"
                            runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同开始时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="StartContractBeginTime" name="StartContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">至</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="EndContractBeginTime" name="EndContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同结束时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="StartContractEndTime" name="StartContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">至</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="EndContractEndTime" name="EndContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同是否退租</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="IsRentOut" name="IsRentOut" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '',text: ''},{id: '否',text: '否'},{id: '是',text: '是'}]"
                            runat="server" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">统计截止时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input type="text" id="ReportEndTime" name="ReportEndTime" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true,width:'100%'" />
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

        //选择 合同类别
        function SelContractType() {
            var param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                }
            });
        }

        function ClearWhere() {
            $('#formSearch').form('clear');
            $('#IsRentOut').combobox("setValue", '');
            $('#SigningType').combobox("setValue", '');
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                $("#CommName").textbox("setValue", $('#HidCommName').val());
                $("#CommID").val($('#HidCommID').val());
            }
        }

        var model = { MessageInfo: "(0%)", Curr: 0, StartDate: new Date(), EndDate: new Date() };
        function TakeProgress() {
            $.dataPostJson('Renting_ContractAccountReport', 'TaskProgress', $.getParam(), false, false,
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
                $("#dlg_search").dialog("close");
                if (model.Curr == 0 || model.Curr == 100) {
                    $.dataPostJson('Renting_ContractAccountReport', 'StartTask', $.getParam(), true, false,
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
            { title: '基本信息', align: 'center', colspan: 25 },
            { title: '费用信息', align: 'center', colspan: 6 },
            { title: '保证金信息', align: 'center', colspan: 4 },
            { title: '营业信息', align: 'center', colspan: 2 }
        ], [
            { field: 'OrganName', title: '区域名称', width: 150, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 150, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            { field: 'SigningType', title: '签约类别', width: 80, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 200, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 120, align: 'center' },
            { field: 'LeaserName', title: '出租方', width: 200, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            { field: 'TenantryConnectpeople', title: '联系人', width: 180, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系人电话', width: 100, align: 'center' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractPeriod', title: '合同期限(月)', width: 80, align: 'center' },
            { field: 'RoomBuildArea', title: '建筑面积(平米)', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计费面积(平米)', width: 100, align: 'center' },
            { field: 'ChargeCalculationName', title: '计费方式', width: 100, align: 'center' },
            { field: 'CalculationMethodName', title: '计算方式', width: 100, align: 'center' },
            { field: 'ContPeriod', title: '计费周期(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ChargeUnit', title: '计费单位', width: 100, align: 'center' },
            { field: 'GuaranteeAmount', title: '合同保底金额(元)', width: 110, align: 'center' },
            { field: 'BusinessRoyaltyRatio', title: '营业提成比例(%)', width: 110, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' },

            { field: 'ContractTotalPrice', title: '合同总额(元)<br/>(1)', width: 100, align: 'center' },
            { field: 'DueAmount', title: '应收金额(元)<br/>(2)', width: 100, align: 'center' },
            { field: 'DueAcceptedAmount', title: '应收已收金额(元)<br/>(3)', width: 120, align: 'center' },
            { field: 'DueReductionAmount', title: '应收减免金额(元)<br/>(4)', width: 120, align: 'center' },
            { field: 'DueUncollectedAmount', title: '应收未收金额(元)<br/>(5=2-3-4)', width: 120, align: 'center' },
            { field: 'CurrentShouldConfirmAmount', title: '本年应确认收入(元)<br/>(6)', width: 120, align: 'center' },

            { field: 'ContractDepositPrice', title: '应收保证金金额(元)<br/>(7)', width: 120, align: 'center' },
            { field: 'AcceptedDepositPrice', title: '已收保证金金额(元)<br/>(8)', width: 120, align: 'center' },
            { field: 'RetiredDepositPrice', title: '已退保证金金额(元)<br/>(9)', width: 120, align: 'center' },
            { field: 'UnreturnedDepositPrice', title: '未退保证金金额(元)<br/>(10=8-9)', width: 120, align: 'center' },

            { field: 'BusinessRoyaltyRaiseAmount', title: '营业提成起提金额(元)', width: 140, align: 'center' },
            { field: 'EstimatedIncome', title: '计提营业收入金额(元)', width: 140, align: 'center' }
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
                onDblClickRow: function (index, row) {
                    LoadMiningData(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,ContractType,TenantryCustID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("Renting_ContractAccountReport", "GetList", param);

                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
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
                dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
            });
            if (dataColumnFields.startsWith(',')) {
                dataColumnFields = dataColumnFields.slice(1);
            }

            var param = $.getParam();
            param.DataColumnFields = dataColumnFields;
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TemplatePath = "/HM/M_Main/Renting/Report/ExcelTemplate/ContractAccountReport.xlsx";
            param.StartFillLines = "2";
            param.TableName = "合同台账表";
            param.Class = 'Renting_ContractAccountReport';
            param.Method = "GetListSqlWhere";
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }

        //加载数据挖掘数据
        function LoadMiningData(ID) {
            var parameter = { "DetailID": ID }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Report/ContractAccountReportDetail.aspx?' + $.param(parameter), '合同台账数据挖掘', false, function callback(data) {
            });
        }

    </script>
</body>
</html>
