<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUnitSelect.aspx.cs" Inherits="M_Main.Renting.Dialog.SignUnitSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-签约单位选择</title>
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
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <label class="control-label">签约单位名称</label>
                    <input id="UnitName" name="UnitName" class="easyui-textbox" data-options="prompt:'',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="UnitType" name="UnitType" value="出租方" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var UnitType = $.getUrlParam("UnitType");
            if (UnitType != null) {
                $("#UnitType").val(UnitType);
            }
            InitDataGrid();
        });
        var column = [[
            { field: 'UnitType', title: '单位类型', width: 80, align: 'left' },
            { field: 'UnitName', title: '单位名称', width: 200, align: 'left' },
            { field: 'UnitConnectpeople', title: '联系人', width: 80, align: 'center' },
            { field: 'UnitConnectTel', title: '联系电话', width: 100, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: '#toolbar',
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("RentingPublicClass", "GetSignUnitList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
        }
        function Save() {
            var row = $("#TableContainer").datagrid("getSelected");
            if (row) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(row);
            } else {
                $.messager.alert("温馨提示", '请选择一行需要的数据!');
            }
        }

    </script>
</body>
</html>

