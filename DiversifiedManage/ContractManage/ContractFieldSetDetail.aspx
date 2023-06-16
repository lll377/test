<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractFieldSetDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractFieldSetDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同字段设置详细页面</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/uuid.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 20%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 30%;
            text-align: left;
        }

        .dlg_table {
            table-layout: fixed;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" id="ID" name="ID" />
    <input type="hidden" id="FieldSetID" name="FieldSetID" />
    <input type="hidden" id="DetailResult" name="DetailResult" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden;">
            <div style="padding: 10px 5px;">
                <form id="mainForm">
                    <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="title">
                                <span>合同类别</span>
                            </td>
                            <td class="text" colspan="3">
                                <input id="ContractTypeNames" name="ContractTypeNames" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'540px',height:'60px',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractTypes();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#ContractTypeIDs').val('');
                                            }}] " />
                                <input type="hidden" id="ContractTypeIDs" name="ContractTypeIDs" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title"><span>字段数量</span></td>
                            <td class="text">
                                <input type="text" id="FieldCount" name="FieldCount" runat="server" disabled="disabled" class="easyui-numberbox" data-options="precision:0" />
                            </td>
                            <td class="title"><span>备注</span></td>
                            <td class="text">
                                <input type="text" id="Remark" name="Remark" runat="server" class="easyui-textbox" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div id="layout_center" data-options="region:'center',border:false" style="overflow: hidden;">
            <div id="TableContainer" style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: #cccccc;"></div>
        </div>
        <div data-options="region:'south',border:true" style="overflow: hidden; height: 50px;">
            <div class="btnFixed">
                <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
                <input type="button" class="button" value="放弃返回" id="btnClose" onclick="PageClose();" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitPage();
        });

        //选择合同类别 多选
        function SelContractTypes() {
            var param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '../DiversifiedManage/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractTypeIDs").val(data.id);
                    $("#ContractTypeNames").textbox("setText", data.text);
                }
            });
        }

        function InitPage() {
            var ID = $.getUrlParam("ID");
            var OpType = $.getUrlParam("OpType");
            $('#ID').val(ID);
            $('#OpType').val(OpType);
            if (OpType == "edit") {
                LoadBaseData();
            } else if (OpType == "copy" || OpType == "insert") {
                InitDataGrid();
            }
        }

        function LoadBaseData() {
            var param = {
                "ID": $('#ID').val()
            };
            $.tool.DataPostJson('DiversifiedManage', 'GetModelContractFieldSet', $.param(param),
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        $('#ContractTypeNames').textbox("setValue", data[0].ContractTypeName);
                        $('#ContractTypeIDs').val(data[0].ContractTypeID);
                        $('#FieldCount').numberbox("setValue", data[0].FieldCount);
                        $('#Remark').textbox("setValue", data[0].Remark);
                        $('#ContractTypeNames').textbox("disable");
                        InitDataGrid();//加载列表
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    endEditionForItem();//先结束编辑
                    if (editIndexForItem != undefined) {
                        $.messager.alert("温馨提示", '请完成当前编辑!');
                    } else {
                        //添加一行数据
                        $('#TableContainer').datagrid('appendRow', {
                            ID: Math.uuid(),
                            FieldSetID: '',
                            FieldSort: '',
                            FieldName: '',
                            FieldType: '文本',
                            FieldIsRequired: '是',
                            FieldRemark: ''
                        });
                        //获取字段数量
                        var FieldCount = $('#FieldCount').numberbox("getValue");
                        if (!FieldCount) {
                            $('#FieldCount').numberbox("setValue", 1);
                        } else {
                            $('#FieldCount').numberbox("setValue", parseInt(FieldCount) + 1);
                        }
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var SelectRow = $("#TableContainer").datagrid("getSelected");
                    if (SelectRow) {
                        var RowIndex = $("#TableContainer").datagrid("getRowIndex", SelectRow);
                        $("#TableContainer").datagrid("deleteRow", RowIndex);
                        //获取字段数量
                        var FieldCount = $('#FieldCount').numberbox("getValue");
                        if (!FieldCount) {
                            $('#FieldCount').numberbox("setValue", 0);
                        } else {
                            $('#FieldCount').numberbox("setValue", parseInt(FieldCount) - 1);
                        }

                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];
        var column = [[
            {
                field: 'FieldSort', title: '字段序号', width: 80, align: 'left', editor: {
                    type: 'numberbox',
                    options: {
                        min: 1,
                        max: 10000,
                        required: true
                    }
                }
            },
            {
                field: 'FieldName', title: '字段名称', width: 140, align: 'left', editor: {
                    type: 'textbox',
                    options: {
                        required: true,
                        validType: 'length[1,1000]'
                    }
                }
            },
            {
                field: 'FieldType', title: '字段类型', width: 80, align: 'left', editor: {
                    type: 'combobox',
                    options: {
                        valueField: 'id',
                        textField: 'text',
                        required: true,
                        panelHeight: 'auto',
                        editable: false,
                        data: [
                            { id: '文本', text: '文本' },
                            { id: '数值', text: '数值' },
                            { id: '时间', text: '时间' }]
                    }
                }
            },
            {
                field: 'FieldIsRequired', title: '是否必填', width: 80, align: 'left', editor: {
                    type: 'combobox',
                    options: {
                        valueField: 'id',
                        textField: 'text',
                        required: true,
                        panelHeight: 'auto',
                        editable: false,
                        data: [
                            { id: '是', text: '是' },
                            { id: '否', text: '否' }]
                    }
                }
            },
            {
                field: 'FieldRemark', title: '字段说明', width: 180, align: 'left', editor: {
                    type: 'textbox',
                    options: {
                        validType: 'length[0,1000]'
                    }
                }
            }
        ]];
        //加载列表
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                onClickCell: onClickCellForItem,
                onAfterEdit: onAfterEditForItem,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetListContractFieldSetDetail";
                    param.FieldSetID = $('#ID').val();
                },
                onLoadSuccess: function (data) {
                    if ($('#OpType').val() = "copy") {
                        $('#ID').val("");
                        if (data) {
                            $('#FieldCount').numberbox("setValue", data.length);
                        } else {
                            $('#FieldCount').numberbox("setValue", 0);
                        }
                    }
                }
            });
        }

        //编辑的行号
        var editIndexForItem = undefined;
        //*****编辑
        function endEditionForItem() {
            if (editIndexForItem == undefined) {
                return true
            }
            if ($('#TableContainer').datagrid('validateRow', editIndexForItem)) {
                $('#TableContainer').datagrid('endEdit', editIndexForItem);
                editIndexForItem = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForItem(Rowindex, field, value) {
            $('#TableContainer').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainer').datagrid("getSelected");
            if (endEditionForItem()) {
                $('#TableContainer').datagrid('beginEdit', Rowindex);
                editIndexForItem = Rowindex;
            }
        }
        function onAfterEditForItem(rowIndex, row, changes) {
            var updated = $('#TableContainer').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainer').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForItem != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndexForItem);
                    $('#TableContainer').datagrid('endEdit', editIndexForItem);
                }
            }
        }


        //保存
        function Save() {
            endEditionForItem();
            if ($('#mainForm').form("validate")) {
                var Rows = $("#TableContainer").datagrid("getRows");
                if (Rows.length == 0) {
                    $.messager.alert('温馨提示', "请添加合同字段详情！");
                    return;
                }
                //循环验证是否在【字段序号】【字段名称】都已经填写了值
                for (var i = 0; i < Rows.length; i++) {
                    if (Rows[i]["FieldSort"] == "" || Rows[i]["FieldName"] == "") {
                        $.messager.alert('温馨提示', "请检查第【" + (parseInt(i) + 1) + "】行合同字段详情，【字段序号】、【字段名称】不允许为空！");
                        return;
                    }
                }
                $('#DetailResult').val(JSON.stringify(Rows));
                $.tool.DataPostJson('DiversifiedManage', 'SaveContractFieldSet', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("保存");
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
