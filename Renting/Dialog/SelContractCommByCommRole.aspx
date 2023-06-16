<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractCommByCommRole.aspx.cs" Inherits="M_Main.Renting.Dialog.SelContractCommByCommRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择项目</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden; height: 45px;">
            <form class="form-horizontal dialog-fixed-tool-top" role="form">
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">项目名称</label>
                    <div class="col-sm-10 col-xs-10">
                        <input id="CommName" typ="text" name="CommName" runat="server" class="easyui-textbox" />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:false,width:80" onclick="LoadFilter();">筛选</a>
                    </div>
                </div>
            </form>
        </div>
        <div id="layout_center" data-options="region:'center',border:false">
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div data-options="region:'south',border:true" style="overflow: hidden; height: 50px;">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitDataTree();
        });

        //筛选树
        function LoadFilter() {
            $('#tree').tree("doFilter", $('#CommName').val());
        }

        function InitDataTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
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
                    param = $.getDataGridParam("RentingPublicClass", "DepMenuList", param);
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
            LayerDialog.ReturnIsJson = true;
            LayerDialog.Close(row);
        }
    </script>
</body>
</html>
