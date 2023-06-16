<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetTemplateDialog_Multiple.aspx.cs" Inherits="M_Main.BudgetNew.BudgetTemplateDialog_Multiple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算模板多选</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <style type="text/css">
        .ContainerLeft {
            height: 100%;
            border-right: 1px solid #cccccc;
            width: 100%;
        }

        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div>
            <input type="text" id="SearchName" name="SearchName" style="border: 1px solid #cccccc; width: 200px; margin-left: 10px;" class="easyui-validatebox" />
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="FilterTree();">筛选</a>
        </div>
        <div class="ContainerLeft" id="divTree">
            <ul id="treeDemo" class="easyui-tree" style="height: 100%; overflow: auto;">
            </ul>
        </div>
        <div style="text-align: center; margin-top: 10px;">
            <input type="button" class="button" value="确定" id="BtnSave" onclick="Btn_Ok();" />
            <input type="button" class="button" value="关闭" id="BtnClose" onclick="CloseWindow();" />
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            InitTableHeight();
            function InitTableHeight() {
                var h = $(window).height();
                $("#divTree").css({ "height": h - 80 + "px" });
            }

            function FilterTree() {
                $('#treeDemo').tree("doFilter", $('#SearchName').val());
            }

            function LoadSalaryTemplate() {
                $("#treeDemo").html("");
                var treeId = "";
                $.tool.DataGet('Budget', 'SelectBudgetTemplate', '',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var root = [];
                        var node = { "text": "所有模板", "state": "open" };
                        var Child = [];
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                if (treeId == "") {
                                    treeId = "IsLoad";
                                }
                                var nodes = {
                                    "id": varObjects[i].ID,
                                    "text": varObjects[i].TemplateName
                                };
                                Child.push(nodes);
                            }
                            node.children = Child;
                            root.push(node);
                            //2017-06-14优化
                            var LastSelectedNode = null;
                            $('#treeDemo').tree({
                                data: root,
                                checkbox: true
                                //onClick: function (node) {
                                //    if (node.id != undefined) {
                                //        LastSelectedNode = node;
                                //        var result = node.id + "," + node.text;
                                //        HDialog.Close(result);
                                //    } else {
                                //        HDialog.Info('不允许选择"所有模板"');
                                //        $('#tt').tree('select', LastSelectedNode.target);
                                //    }
                                //}
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            LoadSalaryTemplate();

            //确定
            function Btn_Ok() {
                var nodes = $('#treeDemo').tree('getChecked');
                if (nodes.length == 0) {
                    HDialog.Info("请选择预算模板");
                    return;
                }
                HDialog.Close(JSON.stringify(nodes));
            }
            //关闭
            function CloseWindow() {
                HDialog.Close("");
            }

        </script>
    </form>
</body>
</html>
