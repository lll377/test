<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.BaseSet.ContractFieldSet.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-合同字段设置编辑页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
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
    <style type="text/css">
        .control-label {
            text-align: center;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" id="ID" name="ID" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden;">
            <form id="mainForm" class="form-horizontal" role="form">
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">基础信息</legend>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">合同类别</label>
                        <div class="col-sm-10 col-xs-10">
                            <input id="ContractTypeNames" name="ContractTypeNames" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'93%',height:'60px',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractTypes();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#ContractTypeIDs').val('');
                                            }}] " />
                            <input type="hidden" id="ContractTypeIDs" name="ContractTypeIDs" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">字段数量</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="FieldCount" name="FieldCount" runat="server" disabled="disabled" class="easyui-numberbox"
                                data-options="precision:0,tipPosition:'bottom',width:'80%'" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">备注</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="Remark" name="Remark" runat="server" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'80%'" />
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <div id="layout_center" data-options="region:'center',border:false" style="overflow: hidden;">
            <div id="TableContainer" style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: #cccccc;"></div>
        </div>
        <div data-options="region:'south',border:false" style="overflow: hidden; height: 60px;">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
                </div>
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
            let param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractTypeIDs").val(data.id);
                    $("#ContractTypeNames").textbox("setValue", data.text);
                }
            });
        }

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                LoadBaseData();
            } else if (OpType == "copy" || OpType == "add") {
                InitDataGrid();
            }
        }

        function LoadBaseData() {
            var param = {
                "ID": $('#ID').val(),
                "IsDelete": "0"
            };
            $.dataPostJson('Renting_ContractFieldSet', 'GetModel', param, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#ContractTypeNames').textbox("setValue", data.ContractTypeName);
                        $('#ContractTypeIDs').val(data.ContractTypeID);
                        $('#FieldCount').numberbox("setValue", data.FieldCount);
                        $('#Remark').textbox("setValue", data.Remark);
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
                        var guid = new GUID();
                        //添加一行数据
                        $('#TableContainer').datagrid('appendRow', {
                            ID: guid.newGUID(),
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
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
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
                    param.FieldSetID = $('#ID').val();
                    param = $.getDataGridParam("Renting_ContractFieldSet", "GetDetailList", param);
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
                var param = $.getParam();
                param.DetailResult = JSON.stringify(Rows);
                $.dataPostJson('Renting_ContractFieldSet', 'Save', param, true, false,
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
