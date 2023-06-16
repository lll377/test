<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.Import" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>点位导入</title>
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
</head>
<body>
    <input type="hidden" id="FilePath" name="FilePath" />
    <input type="hidden" id="TableName" name="TableName" value="Sheet1$" />
    <input type="file" id="UpFile" name="UpFile" style="display: none" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td class="edittool">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Download();}">下载模版</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Import();}">导入模版</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true,onClick:function(){Save()}">确定导入</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看点位详情/点位使用信息!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitPage();
        });
        function InitPage() {
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            $("#UpFile").change(function (e) {
                ImportData();
            });
            var search = $.getUrlParam("search");

        }



        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'OptNumber', title: '房屋/车位编号', width: 200, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 150, align: 'center', sortable: false },
            { field: 'Name', title: '点位名称', width: 250, align: 'center', sortable: false },
            { field: 'Position', title: '点位位置', width: 250, align: 'center', sortable: false },
            { field: 'StoreyLayer', title: '所属楼宇', width: 200, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积(平方米)', width: 110, align: 'center', sortable: false },
            {
                field: 'SizeLength', title: '点位尺寸(厘米)', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "长:&nbsp;" + row.SizeLength + "&emsp;宽:&nbsp;" + row.SizeWidth + "&emsp;高:&nbsp;" + row.SizeHeight;
                    return value;
                }
            },
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },

            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!value && value.length >= 14) {
                        value = value.substring(0, 14) + "...";
                    }
                    return value;
                }
            },
            { field: 'TradePlanName', title: '招商规划', width: 100, align: 'center', sortable: false },
            { field: 'CalculateCostUnit', title: '计费单位', width: 100, align: 'center', sortable: false },
            { field: 'Price', title: '指导价格(元)', width: 100, align: 'center', sortable: false },
            {
                field: 'PriceUnit', title: '价格单位', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!row.CalculateCostUnit) {
                        value = row.PriceUnit + "&nbsp;/&nbsp;" + row.CalculateCostUnit;
                    }
                    return value;
                }
            },
            {
                field: 'Sort', title: '序号', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return parseInt(value);
                }
            },
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                autoRowHeight: true,
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
                //pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortName: "Sort",
                sortOrder: 'asc',
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("DivfManage_Point_Import", "GetListTemplateData", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function () {
                    $.messager.alert('温馨提示', '程序异常!');
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function ImportData() {
            var file = $("input[name='UpFile']")[0].files[0];
            if (!file) {
                $.messager.alert('温馨提示', '请选择文件!');
            }
            //if (!$("#fileForm").form('validate')) { return false; };
            //var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var fileType = file.type;
            var fileSize = file.size;
            var fileName = file.name;
            console.log(file);
            if (fileType != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" && fileType != "application/vnd.ms-excel") {
                $.messager.alert('温馨提示', 'Excel文件格式不正确!', 'error');
                return false;
            }
            //if (fileSize > parseInt(maxsize)) {
            //    $.messager.alert('温馨提示', "不能上传超过" + tipFileSize + "M的附件！", 'error');
            //    return false;
            //}
            var lastIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substr(lastIndex + 1);//后缀

            var formData = new FormData();
            formData.append('file', file);
            formData.append('Catalog', "Import");
            $.ajax({
                //url: "http://localhost:1241/HM/FileUpload/FileUpload.aspx",
                url: "/HM/M_Main/FileTransferred/FileTransferredIP.ashx",
                type: 'post',
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                async: false,
                data: formData,
                beforeSend: function (xhr) { $.messager.progress({ title: "温馨提示", msg: "正在上传...", interval: 3000 }); $('#dg').datagrid('loadData', { total: 0, rows: [] }); },
                success: function (data, status) {
                    $.messager.progress('close');
                    if (data.result) {
                        $("#FilePath").val(data.data);
                        InitDataGrid();
                    } else {
                        $.messager.alert('错误', "服务器发生错误!", 'error');
                    }

                },
                error: function (data) {
                    $.messager.alert('错误', "服务器发生错误!", 'error');
                    $.messager.progress('close');
                }
            });
            return false;
        }

        function Download() {
            window.open("/HM/M_Main/DiversifiedManage/PointManage/Point/ExcelTemplate/Point.xlsx");
        }
        function Import() {
            $("#UpFile").click();
        }
        function Save() {
            var param = $.getParam();
            $.dataPostJson('DivfManage_Point_Import', 'Save', param, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        Close();
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function Close() {
            LayerDialog.Close();
        }
    </script>
</body>
</html>
