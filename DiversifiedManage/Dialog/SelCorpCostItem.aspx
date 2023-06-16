<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelCorpCostItem.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.SelCorpCostItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择总部费用项目</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden;">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>费用名称</span></td>
                    <td class="text">
                        <input id="CostName" typ="text" name="CostName" runat="server" class="easyui-textbox" />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:false,width:80" onclick="LoadFilter();">筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="layout_center" data-options="region:'center',border:false">
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div data-options="region:'south',border:true" style="overflow: hidden; height: 50px;">
            <div class="btnFixed">
                <input type="button" class="button" value="确定" id="btnSave" onclick="Save();" />
                <input type="button" class="button" value="放弃返回" id="btnClose" onclick="PageClose();" />
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitDataTree();
        });

        //筛选树
        function LoadFilter() {
            $('#tree').tree("doFilter", $('#CostName').val());
        }

        function InitDataTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetCorpCostItem";
                },
                onDblClick: function (row) {
                    Save();
                }
            });
        }
        function Save() {
            var row = $("#tree").tree("getSelected");
            if (!row) {
                $.messager.alert("温馨提示", '请选择节点!');
                return;
            }
            if (!$("#tree").tree('isLeaf', row.target)) {
                $.messager.alert("温馨提示", '请选择末级节点!');
                return;
            }
            PageClose(row);
        }

        function PageClose(row) {
            HDialog.ReturnIsJson = true;
            HDialog.Close(row);
        }

    </script>
</body>
</html>
