<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CotractTypeSelect.aspx.cs" Inherits="M_Main.Renting.Dialog.CotractTypeSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同类别选择</title>
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
    <input type="hidden" id="Ismultiple" name="Ismultiple" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden; height: 45px;">
            <form class="form-horizontal dialog-fixed-tool-top" role="form">
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同类别名称</label>
                    <div class="col-sm-10 col-xs-10">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="prompt:'合同类别名称',width:220,
                            icons:[{
                                iconCls:'icon-clear',
                                handler: function(e){
                                $(e.data.target).textbox('clear');
                                }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton " data-options="iconCls:'icon-search',width:80,plain:false" onclick="LoadFilter();">筛选</a>
                    </div>
                </div>
            </form>
        </div>
        <div id="layout_center" data-options="region:'center',border:false" style="padding: 0px;">
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div data-options="region:'south',border:false" style="overflow: hidden; height: 60px;">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="ClosePage();">关闭返回</a>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            var ParamIsmultiple = $.getUrlParam("Ismultiple");
            if (!!ParamIsmultiple) {
                $('#Ismultiple').val(ParamIsmultiple);
            }
            InitDataTree();
        });
        //筛选树
        function LoadFilter() {
            $('#tree').tree("doFilter", $('#ContractTypeName').val());
        }

        function InitDataTree() {
            var IsCheckbox = false;
            if ($('#Ismultiple').val() == "1") {
                IsCheckbox = true;
            }
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                checkbox: IsCheckbox,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "RentingPublicClass";
                    param.Method = "GetContractTypeTree";
                },
                onDblClick: function (row) {
                    //单选才能双击返回
                    if (!IsCheckbox) {
                        Save();
                    }
                }
            });
        }
        function Save() {
            //单选
            if ($('#Ismultiple').val() == "0") {
                var row = $("#tree").tree("getSelected");
                if (!row) {
                    $.messager.alert("温馨提示", '请选择合同类别!');
                    return;
                }
                var isLeaf = $("#tree").tree('isLeaf', row.target);
                if (isLeaf) {
                    ClosePage(row);
                } else {
                    $.messager.alert("温馨提示", '请选择末级合同类别!');
                }
            } else {
                //多选
                var rows = $("#tree").tree("getChecked");
                if (rows.length == 0) {
                    $.messager.alert("温馨提示", '请至少勾选一个合同类别!');
                    return;
                }
                var NameList = "";
                var IdList = "";
                $.each(rows, function (i, item) {
                    if ($("#tree").tree('isLeaf', item.target)) {
                        NameList += item.text + ",";
                        IdList += item.id + ",";
                    }
                });
                if (NameList == "" || IdList == "") {
                    $.messager.alert("温馨提示", '请至少勾选一个末级合同类别!');
                    return;
                }
                NameList = NameList.substring(0, NameList.length - 1);
                IdList = IdList.substring(0, IdList.length - 1);
                var ItemRow = {
                    text: NameList,
                    id: IdList
                }
                ClosePage(ItemRow);
            }
        }

        function ClosePage(row) {
            LayerDialog.ReturnIsJson = true;
            LayerDialog.Close(row);
        }

    </script>
</body>
</html>
