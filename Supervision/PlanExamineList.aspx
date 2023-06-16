<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanExamineList.aspx.cs" Inherits="M_Main.Supervision.PlanExamineList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>模板审核列表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <div style="background-color: #cccccc;" id="TableContainerExamine"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 265px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">项目名称:</td>
                    <td class="text" colspan="3">
                        <input id="CommId" name="CommId" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: false,
                            multiline: false,
                            width:'375',
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelComm(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input id="CheckTypeId" name="CheckTypeId" class="easyui-combobox" />
                    </td>
                    <td class="title">计划名称:</td>
                    <td class="text">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查频次:</td>
                    <td class="text">
                        <input id="Frequency" name="Frequency" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1次/半小时',text: '1次/半小时'},
                                {id: '1次/1小时',text: '1次/1小时'},
                                {id: '1次/2小时',text: '1次/2小时'},
                                {id: '1次/3小时',text: '1次/3小时'},
                                {id: '1次/4小时',text: '1次/4小时'},
                                {id: '1次/6小时',text: '1次/6小时'},
                                {id: '1次/8小时',text: '1次/8小时'},
                                {id: '1次/12小时',text: '1次/12小时'},
                                {id: '1次/天',text: '1次/天'},
                                {id: '1次/周',text: '1次/周'},
                                {id: '2次/周',text: '2次/周'},
                                {id: '3次/周',text: '3次/周'},
                                {id: '1次/10天',text: '1次/10天'},
                                {id: '1次/15天',text: '1次/15天'},
                                {id: '1次/月',text: '1次/月'},
                                {id: '1次/2月',text: '1次/2月'},
                                {id: '1次/季',text: '1次/季'},
                                {id: '1次/半年',text: '1次/半年'},
                                {id: '1次/年',text: '1次/年'}
                            ]" />
                    </td>
                    <td class="title">任务生成方式:</td>
                    <td class="text">
                        <input id="GenerateType" name="GenerateType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '自动生成'},
                                {id: '2',text: '手动生成'}
                            ]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计划是否启用:</td>
                    <td class="text">
                        <input id="IsEnable" name="IsEnable" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <script type="text/javascript">
            //选择项目
            function SelComm() {
                HDialog.Open('700', '500', '../Supervision/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    if (_Data > '') {
                        var arrRet = JSON.parse(_Data);
                        $("#CommId").textbox('setValue', arrRet.id);
                        $("#CommId").textbox('setText', arrRet.name);
                    }
                });
            }

            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("height", h * 0.6 + "px");
                $("#TableContainer").css("width", w + "px");
                $("#TableContainerExamine").css("height", h * 0.4 + "px");
                $("#TableContainerExamine").css("width", w + "px");
            }

            //加载检查类型
            function LoadCheckTypeId() {
                $('#CheckTypeId').combobox({
                    required: false,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckTypeId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType';
                    }
                });
            }

            var column = [[
                { field: 'OrganName', title: '所属单位', width: 200, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: true },
                { field: 'TypeName', title: '检查类型', width: 300, align: 'left', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"EditPlan('" + row.Id + "')\">" + row.PlanName + "</a>";
                        return str;
                    }
                },
                { field: 'Frequency', title: '检查频次', width: 100, align: 'left', sortable: true },
                { field: 'GenerateTypeName', title: '任务生成方式', width: 100, align: 'left', sortable: true },
                { field: 'IsEnableName', title: '计划是否启用', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '审核通过',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择审核数据");
                            return;
                        }
                        ExaminePlan(row.Id, 1);
                    }
                }
                , '-',
                {
                    text: '审核不通过',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择审核数据");
                            return;
                        }
                        ExaminePlan(row.Id, 0);
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function EditPlan(Id) {
                HDialog.Open('1000', '700', '../Supervision/PlanFrame.aspx?OpType=edit&Id=' + Id, '检查计划详情', true, function callback(_Data) {
                    LoadList();
                });
            }

            function ExaminePlan(Id, IsPass) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'Plan_Examine', 'Id=' + Id + '&IsPass=' + IsPass,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        LoadList();
                        $("#Id").val('');
                        LoadListExamine();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=Plan_GetExamineList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0,
                    onClickRow: function (rowIndex, rowData) {
                        $("#Id").val(rowData.Id);
                        LoadListExamine();
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            var columnExamine = [[
                { field: 'Sort', title: '审核序号', width: 200, align: 'left', sortable: true },
                { field: 'RoleName', title: '审核岗位', width: 300, align: 'left', sortable: true },
                { field: 'IsPassName', title: '审核情况', width: 200, align: 'left', sortable: true },
                { field: 'UserName', title: '审核人', width: 300, align: 'left', sortable: true },
                { field: 'ExamineDate', title: '审核时间', width: 300, align: 'left', sortable: true }
            ]];

            function LoadListExamine() {
                $("#TableContainerExamine").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=Plan_GetExamineInfo&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: columnExamine,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    remoteSort: false,
                    width: "100%",
                    toolbar: null,
                    sortOrder: "asc",
                    border: 0
                });
            }

            $(function () {
                InitTableHeight();
                LoadCheckTypeId();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadList();
                LoadListExamine();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
