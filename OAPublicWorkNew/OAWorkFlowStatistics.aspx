<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OAWorkFlowStatistics.aspx.cs" Inherits="M_Main.OAPublicWorkNew.OAWorkFlowStatistics" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px;">
            <table style="width: 100%; overflow: hidden" class="DialogTable">
                <tr>
                    <td class="TdTitle">流程类别</td>
                    <td class="TdContent">
                        <select id="InstanceTypeName" name="InstanceTypeName" runat="server">
                            <option selected value=""></option>
                            <option value="0002">公文管理</option>
                            <option value="0003">会议管理</option>
                            <option value="0004">合同评审</option>
                            <option value="0005">报账审批</option>
                            <option value="0006">借款审批</option>
                            <option value="0007">请假审批</option>
                            <option value="0008">派车审批</option>
                            <option value="0009">工作交办</option>
                            <option value="0010">工作呈报</option>
                            <option value="0011">申购审批</option>
                            <option value="0012">人事审批</option>
                        </select></td>
                    <td class="TdTitle">节点状态</td>
                    <td class="TdContent">
                        <select id="WorkFlowState" name="WorkFlowState" runat="server">
                            <option value=""></option>
                            <option value="未超时未办理">未超时未办理</option>
                            <option selected value="已超时未办理">已超时未办理</option>
                            <option value="已超时已办理">已超时已办理</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">文件名称</td>
                    <td class="TdContent">
                        <input id="FName" class="Control_ItemInput"
                            onclick="WdatePicker()" name="FName" runat="server">
                    </td>
                    <td class="TdTitle">办理人</td>
                    <td class="TdContent">
                        <input id="UserNameList" class="Control_ItemInput"
                            name="UserNameList" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">节点开始时间</td>
                    <td class="TdContent">
                        <input id="StartLogTime" class="Wdate" onclick="WdatePicker()"
                            name="StartLogTime" runat="server"></td>
                    <td class="TdTitle">至</td>
                    <td class="TdContent">
                        <input id="EndLogTime" class="Wdate" onclick="WdatePicker()"
                            name="EndLogTime" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">办理时限</td>
                    <td class="TdContent">
                        <input id="TimeOutSDay" class="Control_ItemInput"
                            name="TimeOutSDay" runat="server"></td>
                    <td class="TdTitle">至</td>
                    <td class="TdContent">
                        <input id="TimeOutEDay" class="Control_ItemInput"
                            name="TimeOutEDay" runat="server">小时</td>
                </tr>
                <tr>
                    <td class="TdTitle">节点处理</td>
                    <td class="TdContent">
                        <input id="WorkSHours" class="Control_ItemInput"
                            maxlength="50" size="2" name="WorkSHours" runat="server"></td>
                    <td class="TdTitle">至</td>
                    <td class="TdContent">
                        <input id="WorkEHours" class="Control_ItemInput"
                            maxlength="50" size="2" name="WorkEHours" runat="server">小时</td>

                </tr>


                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">统计</a>
                    </td>

                </tr>

            </table>
        </div>


        <script type="text/javascript">




            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


            }
            InitTableHeight();


            var toolbar = [

                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('报账统计', $('#TableContainer'));
                        }
                    }
                }
            ];

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }
            var Headcolumn = [[

                { field: 'InstanceTypeName', title: '文件类别', align: 'left', sortable: true, width: 100 },
                { field: 'FName', title: '文件名称', align: 'left', sortable: true, width: 150 },
                { field: 'FlowNodeName', title: '节点名称', align: 'left', sortable: true, width: 100 },
                { field: 'WorkFlowStartDate', title: '节点开始时间', align: 'left', sortable: true, width: 100 },
                { field: 'TimeOutDay', title: '办理时限', align: 'left', sortable: true, width: 50 },
                { field: 'WorkHours', title: '已办理小时数', align: 'left', sortable: true, width: 50 },
                {
                    field: 'WorkFlowState', title: '节点状态', align: 'left', sortable: true, width: 100
                },
                { field: 'UserNameList', title: '办理人员', align: 'left', sortable: true, width: 100 }
            ]];

            var ExcelCol = [[
                { field: 'InstanceTypeName', title: '文件类别', align: 'left', sortable: true, width: 100 },
                { field: 'FName', title: '文件名称', align: 'left', sortable: true, width: 150 },
                { field: 'FlowNodeName', title: '节点名称', align: 'left', sortable: true, width: 100 },
                { field: 'WorkFlowStartDate', title: '节点开始时间', align: 'left', sortable: true, width: 100 },
                { field: 'TimeOutDay', title: '办理时限', align: 'left', sortable: true, width: 50 },
                { field: 'WorkHours', title: '已办理小时数', align: 'left', sortable: true, width: 50 },
                {
                    field: 'WorkFlowState', title: '节点状态', align: 'left', sortable: true, width: 100
                },
                { field: 'UserNameList', title: '办理人员', align: 'left', sortable: true, width: 100 }

            ]];

            var column = [
                [
                    { field: 'InstanceTypeName', title: '文件类别', align: 'left', sortable: true, width: 50 },
                    { field: 'FName', title: '文件名称', align: 'left', sortable: true, width: 150 },
                    { field: 'FlowNodeName', title: '节点名称', align: 'left', sortable: true, width: 100 },
                    { field: 'WorkFlowStartDate', title: '节点开始时间', align: 'left', sortable: true, width: 100 },
                    { field: 'TimeOutDay', title: '办理时限', align: 'left', sortable: true, width: 50 },
                    { field: 'WorkHours', title: '已办理小时数', align: 'left', sortable: true, width: 50 },
                    {
                        field: 'WorkFlowState', title: '节点状态', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = "<span style='color:red'>" + value + "</span";
                            return str;
                        }
                    },
                    { field: 'UserNameList', title: '办理人员', align: 'left', sortable: true, width: 100 }

                ]];




            function LoadData() {

                $('#SearchDlg').dialog('close');

                LoadList();


            }

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("OASearch", "OAWorkFlowStatistics", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }
            LoadList();


        </script>
    </form>
</body>
</html>


