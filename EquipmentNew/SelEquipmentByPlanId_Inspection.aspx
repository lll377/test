<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelEquipmentByPlanId_Inspection.aspx.cs" Inherits="M_Main.EquipmentNew.SelEquipmentByPlanId_Inspection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="EqSystemChoice" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TableContainer").css("height", (h - 18) + "px");
                $("#TableContainer").css("width", (w - 20) + "px");
            }
            InitTableHeight();
            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'SpaceName', title: '设备空间', width: 25, align: 'left', sortable: true },
                { field: 'SystemName', title: '设备系统', width: 25, align: 'left', sortable: true },
                { field: 'EquipmentNO', title: '设备编号', width: 25, align: 'left', sortable: true },
                { field: 'EquipmentName', title: '设备名称', width: 25, align: 'left', sortable: true },
                { field: 'RankName', title: '设备级别', width: 25, align: 'left', sortable: true }
            ]];
            var toolbar = [
                {
                    text: '确定',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        var str = "", strName = "",strId = "";
                        if (row.length > 0) {
                            for (var i = 0; i < row.length; i++) {
                                str += "," + row[i].RankId;
                                strName += "," + row[i].EquipmentName;
                                strId += "," + row[i].EquipmentId;
                            }
                            if (str.length > 0) {
                                str = str.substr(1, str.length - 1);
                                strName = strName.substr(1, strName.length - 1);
                                strId = strId.substr(1, strId.length - 1);
                            }
                        }
                        HDialog.Close(str + "|" + strName+ "|" + strId);
                    }
                }
            ];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=SelectEquipmentByPlanId_Inspection&PlanId=' + GetQueryString('PlanId'),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.Close(rowData.RankId + "|" + rowData.EquipmentName + "|" + rowData.EquipmentId);
                    }
                });
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
