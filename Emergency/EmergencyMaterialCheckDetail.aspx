<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyMaterialCheckDetail.aspx.cs" Inherits="M_Main.Emergency.EmergencyMaterialCheckDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物资检查详细页面</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            width: 180px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body style="overflow: auto; margin: 0px; padding: 0px;">
    <form id="frmFrom" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CommName" name="CommName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                    <td class="TdTitle">检查人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="InspectUserName" name="InspectUserName" onclick="SelUser()" readonly runat="server" data-options="required:true" class="easyui-validatebox" />
                        <input type="hidden" id="InspectUserCode" name="InspectUserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">检查时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="InspectTime" name="InspectTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea type="text" id="Remark" name="Remark" maxlength="1400" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <table id="TableContainer" style="width: 100%; height: 270px;"></table>

    <div style="text-align: center; width: 100%; padding: 10px 0;">
        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
        <input type="button" class="button" value="保存并关闭" id="BtnSaveAndClose" onclick="SaveAndClose();" runat="server" />
        <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
    </div>
    <input type="hidden" id="ListStr" name="ListStr" runat="server" />
    <input type="hidden" id="ID" name="ID" runat="server" />
    <input type="hidden" id="OpType" name="OpType" runat="server" />
    <script language="javascript" type="text/javascript">
        function btnClose() {
            HDialog.Close("");
        }

        function SelUser() {
            HDialog.OpenWin('1024', '450', '../Emergency/Dialog/User.aspx?CommID=' + $('#CommID').val(), '选择检查人', false, function callback(data) {
                if (data != "") {
                    data = $.parseJSON(data);
                    $("#InspectUserCode").val(data.UserCode);
                    $("#InspectUserName").val(data.UserName);
                }
            });
        }
        //加载页面数据
        function LoadBaseData() {
            if ($("#OpType").val() == 'edit') {
                $.tool.DataGet('Emergency', 'GetEmergencyMaterialCheckByID', "ID=" + $('#ID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            //加载easyui控件加载不出来的值
                            $('#frmFrom').form('validate');

                            //检查时间
                            if (varObjects[0].InspectTime != "") {
                                $('#InspectTime').datetimebox("setValue", formatDate(varObjects[0].InspectTime, 'yyyy-MM-dd HH:mm:ss'));
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //加载物资列表
            LoadMaterial();
        }
        //保存
        function Save() {
            if ($('#frmFrom').form("validate")) {
                //先结束一次编辑
                endEditionForDetail();
                //获取列表中的应急物资
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length > 0) {
                    $('#ListStr').val(JSON.stringify(rows));
                }
                $.tool.DataPostJson('Emergency', 'SaveEmergencyMaterialCheck', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Info("保存成功");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }

        //保存后关闭
        function SaveAndClose() {
            if ($('#frmFrom').form("validate")) {
                //先结束一次编辑
                endEditionForDetail();
                //获取列表中的应急物资
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length > 0) {
                    $('#ListStr').val(JSON.stringify(rows));
                }
                $.tool.DataPostJson('Emergency', 'SaveEmergencyMaterialCheck', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Info("保存成功");
                            HDialog.Close("true");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }

        var column = [[
            { field: 'MaterialCategoryName', title: '物资类别', width: 120, align: 'left', sortable: true },
            { field: 'MaterialName', title: '物资名称', width: 140, align: 'left', sortable: true },
            { field: 'MaterialUnit', title: '物资单位', width: 80, align: 'left', sortable: true },
            { field: 'SpecificationType', title: '规格型号', width: 100, align: 'left', sortable: true },
            { field: 'ShouldMatchNum', title: '应配数量', width: 80, align: 'left', sortable: true },
            {
                field: 'QualityLimit', title: '质保期限', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd');
                    }
                    return "";
                }
            },
            { field: 'DepositPlace', title: '存放地点', width: 180, align: 'left', sortable: true },
            {
                field: 'InfactNumber', title: '实际数量', width: 80, align: 'left', sortable: true, editor: {
                    type: 'numberbox',
                    options: {
                        min: 0
                    }
                }
            },
            {
                field: 'IsOverdue', title: '是否过期', width: 80, align: 'left', sortable: true, editor: {
                    type: 'combobox',
                    options: {
                        panelHeight: 'auto',
                        valueField: 'value',
                        textField: 'text',
                        data: [{ value: "0", text: '否' }, { value: "1", text: '是' }]
                    }
                }, formatter: function (value, row, index) {
                    if (value == "0" || value == 0) {
                        return "否"
                    }
                    return "是"
                }
            },
            {
                field: 'IsIntact', title: '是否完好', width: 80, align: 'left', sortable: true, editor: {
                    type: 'combobox',
                    options: {
                        panelHeight: 'auto',
                        valueField: 'value',
                        textField: 'text',
                        data: [{ value: "0", text: '否' }, { value: "1", text: '是' }]
                    }
                }, formatter: function (value, row, index) {
                    if (value == "0" || value == 0) {
                        return "否"
                    }
                    return "是"
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left', sortable: true, editor: 'text' }
        ]];
        var toolbar = [
            {
                text: '新增物资',
                iconCls: 'icon-add',
                handler: function () {
                    HDialog.OpenWin('800', '500', '../Emergency/SelEmergencyMaterial.aspx?CommID=' + $("#CommID").val(), "选择应急物资", false, function callback(_Data) {
                        if (_Data) {
                            //循环添加进列表
                            _Data = $.parseJSON(_Data);
                            $.each(_Data, function (i, item) {
                                //判断数据是否是已经存在列表了，如果存在就不添加
                                var RowIndexs = $('#TableContainer').datagrid("getRowIndex", item.MaterialID);
                                if (RowIndexs == -1) {
                                    $('#TableContainer').datagrid('appendRow', item);
                                }
                            })
                        }
                    });
                }
            }, '-', {
                text: '删除物资',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (!row) {
                        HDialog.Info("请选择需要删除的数据！");
                        return;
                    }
                    var RowIndex = $("#TableContainer").datagrid("getRowIndex", row);
                    $("#TableContainer").datagrid("deleteRow", RowIndex);
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        HDialog.Info('没有需要导出的应急物资数据!');
                        return;
                    }
                    window.open("EmergencyMaterialCheckDetailExport.aspx?CommID=" + $('#CommID').val() + "&CheckID=" + $('#ID').val());
                }
            }
        ];

        //编辑的行号
        var editIndexForDetail = undefined;
        //*****编辑
        function endEditionForDetail() {
            if (editIndexForDetail == undefined) {
                return true
            }

            if ($('#TableContainer').datagrid('validateRow', editIndexForDetail)) {
                $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                editIndexForDetail = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForDetail(Rowindex, field, value) {
            $('#TableContainer').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainer').datagrid("getSelected");
            if (endEditionForDetail()) {
                if (field == "InfactNumber" || field == "IsOverdue" || field == "IsIntact" || field == "Remark") {
                    $('#TableContainer').datagrid('beginEdit', Rowindex);
                    //绑定JS事件
                }
                editIndexForDetail = Rowindex;
            }
        }
        function onAfterEditForDetail(rowIndex, row, changes) {
            var updated = $('#TableContainer').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainer').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForDetail != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndexForDetail);
                    $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                }
            }
        }

        //加载 物资列表
        function LoadMaterial() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                idField: 'MaterialID',
                columns: column,
                rownumbers: true,
                fitColumns: false,
                singleSelect: true,
                border: true,
                pagination: false,
                width: "100%",
                remoteSort: false,
                toolbar: toolbar,
                onClickCell: onClickCellForDetail,
                onAfterEdit: onAfterEditForDetail,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "Emergency";
                    param.Command = "GetEmergencyMaterialCheckGetMaterialList";
                    param.CommID = $("#CommID").val();
                    param.CheckID = $("#ID").val();
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {

                }
            });
        }

        //页面初始化
        $(function () {
            LoadBaseData();
        });
    </script>

</body>
</html>
