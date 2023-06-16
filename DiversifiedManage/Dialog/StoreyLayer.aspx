<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreyLayer.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.StoreyLayer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>楼层选择</title>
    <link href="../../Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/compatible.css" rel="stylesheet" />
    <%--<script src="../../Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }

            .form-horizontal .form-group {
                margin: 0;
                margin-top: 5px;
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }

        .control-label {
            padding-right: 0px;
            padding-left: 0px;
            padding-top: 7px;
            margin-bottom: 0;
            text-align: right;
            font-size: 12px;
            color: #7f7f7f;
        }
    </style>
</head>
<body>
    <input type="hidden" id="IsMultiple" name="IsMultiple" value="0" />
    <div class="fixed-tool-top">
        <div class="col-sm-12 col-xs-12" style="padding: 0">
            <a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击树节点也可以选择楼宇!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a>
            <label class="control-label">楼宇:</label>
            <input id="TreeBuildName" name="TreeBuildName" class="easyui-textbox" data-options="prompt:'楼宇名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:70" onclick="InitDataTree();">筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:70" onclick="Save();">确定</a>
        </div>
    </div>
    <form id="frm" class="form-horizontal" role="form">
        <div class="form-group">
            <div class="col-sm-12 col-xs-12" style="padding: 0">
                <div style="height: 40px"></div>
                <ul id="tree" class="easyui-tree"></ul>
            </div>
        </div>
    </form>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            var IsMultiple = $.getUrlParam("IsMultiple");
            if (IsMultiple) {
                $('#IsMultiple').val(IsMultiple);
            }
            InitDataTree();
        });
        function InitDataTree() {
            var IsCheckbox = false;
            //if ($('#IsMultiple').val() == "1") {
            //    IsCheckbox = true;
            //}
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: true,
                checkbox: IsCheckbox,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    $("#tree").tree('collapseAll');
                    $.messager.progress('close');

                },
                onBeforeSelect: function (node) {
                    //if (!$(this).tree('isLeaf', node.target)) {
                    //    return false;
                    //}
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "DivfManage_Dialog";
                    param.Method = "GetListTreeBuild";
                    param.BuildNum = "";
                    param.TreeBuildName = $("#TreeBuildName").textbox('getValue');
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在加载数据,请稍候...',
                        interval: 3000
                    });

                },
                onDblClick: function (row) {
                    //if (!$(this).tree('isLeaf', node.target)) {
                    //    return false;
                    //}
                    Save();
                    //单选才能双击返回
                    //if (!IsCheckbox) {
                    //    Save();
                    //}
                },
                onLoadError: function (arguments) {
                    $.messager.progress('close');
                    $.messager.alert("温馨提示", '系统错误!');
                }
            });
        }
        function Save() {
            var row = $("#tree").tree("getSelected");
            if (!row) {
                $.messager.alert("温馨提示", '请选择节点!');
                return;
            }
            Close(row);

            //if ($('#IsMultiple').val() == "0") {
            //    var row = $("#tree").tree("getSelected");
            //    if (!row) {
            //        $.messager.alert("温馨提示", '请选择节点!');
            //        return;
            //    }
            //    var isLeaf = $("#tree").tree('isLeaf', row.target);
            //    if (isLeaf) {
            //        var ItemRow = {
            //            text: rows.Text,
            //            id: rows.ID
            //        }
            //        Close(ItemRow);
            //    } else {
            //        $.messager.alert("温馨提示", '请选择末级节点!');
            //    }
            //} else {
            //    var rows = $("#tree").tree("getChecked");
            //    if (rows.length == 0) {
            //        $.messager.alert("温馨提示", '请至少勾选一个节点!');
            //        return;
            //    }
            //    var NameList = "";
            //    var IdList = "";
            //    $.each(rows, function (i, item) {
            //        if ($("#tree").tree('isLeaf', item.target)) {
            //            NameList += item.text + ",";
            //            IdList += item.id + ",";
            //        }
            //    });
            //    if (NameList == "" || IdList == "") {
            //        $.messager.alert("温馨提示", '请至少勾选一个末级节点!');
            //        return;
            //    }
            //    NameList = NameList.substring(0, NameList.length - 1);
            //    IdList = IdList.substring(0, IdList.length - 1);
            //    var ItemRow = {
            //        text: NameList,
            //        id: IdList
            //    }
            //    Close(ItemRow);
            //}
        }
        function Close(row) {
            LayerDialog.ReturnIsJson = true;
            LayerDialog.Close(row);
        }


    </script>
</body>
</html>
