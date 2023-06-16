<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialBaseList.aspx.cs" Inherits="M_Main.MaterielNew.MaterialBaseList" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="formMaterialBaseList" runat="server">
        <input type="hidden" id="InitDType" name="InitDType" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 145px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">字典类别</td>
                    <td class="TdContent">
                        <select id="DType" name="DType">
                            <option value="" selected="selected">--请选择--</option>
                            <option value="颜色" style="color: #000000;">颜色</option>
                            <option value="物资单位" style="color: #000000;">物资单位</option>
                            <option value="供方类别" style="color: #000000;">供方类别</option>
                            <option value="合作级别" style="color: #000000;">合作级别</option>
                            <option value="企业资质" style="color: #000000;">企业资质</option>
                            <option value="出库用途" style="color: #000000;">出库用途</option>
                        </select>
                    </td>
                    <td class="TdTitle">字典名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Name" value="" name="Name" /></td>
                    <td class="TdTitle">字典编码</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Code" value="" name="Code" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];              
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            var column = [[
                    { field: 'DType', title: '字典类别', width: 25, align: 'left', sortable: true },
                    { field: 'Code', title: '字典编码', width: 25, align: 'left', sortable: true },
                    {
                        field: 'Name', title: '字典名称', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                            return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.Id + "','edit');\">" + row.Name + "</a>";
                        }
                    },
                    { field: 'Sort', title: '序号', width: 45, align: 'left', sortable: true }
            ]];

            var toolbar = [
         {
             text: '新增',
             iconCls: 'icon-add',
             handler: function () {
                 Detail('', 'add');
             }
         }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainer").datagrid("getSelected");
                     if (row == null) {
                         HDialog.Info("请选择删除数据");
                         return;
                     }
                     DelRecord(row["Id"].toString());
                 }
             }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }
            ];

            function DelRecord(Id) {
                HDialog.Prompt("是否删除该项", function () {
                    $.tool.DataGet('MaterialBaseHandle', 'DelDictionary', 'Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function Detail(RowId, OpType) {//Id、操作类型
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('450', '230', '../Mt/MaterialBaseEdit.aspx?&Id=' + RowId + '&OpType=' + OpType, '物资字典', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MaterialBaseHandle&Command=GetBaseList&' + $('#formMaterialBaseList').serialize(),
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
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
                        param = $.JQForm.GetParam("MaterialBaseHandle", "GetBaseList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });


            }

            if ($("#InitDType").val() != "") {
                $("#DType").val($("#InitDType").val());
            }

            LoadList();


        </script>
    </form>
</body>
</html>
