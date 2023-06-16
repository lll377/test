<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentParameterSettingDetail.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentParameterSettingDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script src="../jscript/Guid.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="SearchTable" style="width: 100%; line-height: 25px;">
            <tr>
                <td class="TdTitle">设备系统</td>
                <td class="TdContentSearch">
                    <input id="SystemName" name="SystemName" type="text" class="easyui-validatebox" onclick="SelSystem();" readonly="readonly" data-options="required:true" style="height: 21px;" />
                    <input type="hidden" name="SystemId" id="SystemId" value="" />
                </td>
                <td class="TdTitle">设备级别</td>
                <td class="TdContentSearch">
                    <input id="RankName" name="RankName" type="text" class="easyui-validatebox" onclick="SelRank();" readonly="readonly" data-options="required:true" style="height: 21px;" />
                    <input type="hidden" name="RankId" id="RankId" value="" />
                </td>
                <td class="TdTitle">字段数量</td>
                <td class="TdContentSearch">
                    <input id="RowNum" name="RowNum" type="text" class="easyui-validatebox" readonly="readonly" style="height: 21px;" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注:</td>
                <td class="TdContentSearch" colspan="5">
                    <input id="Remark" name="Remark" type="text" class="easyui-validatebox" style="width: 717px; height: 40px;" />
                </td>
            </tr>
        </table>
        <div style="width: 100%; height: 400px; background-color: #cccccc;" id="TableContainer"></div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnClose" onclick="Close();" />
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <script type="text/javascript">
            var editIndex = undefined;
            function Close() {
                HDialog.Close("");
            }

            //选择设备系统
            function SelSystem() {
                HDialog.Open('700', '450', '../EquipmentNew/SelSystem.aspx', '选择设备系统', true, function callback(_Data) {
                    if (_Data != "") {
                        var str = _Data.split('|');
                        $("#SystemId").val(str[0]);
                        $("#SystemName").val(str[1]);
                    }
                });
            }

            //设备级别
            function SelRank() {
                if ($("#SystemName").val() == "") {//复制时id存在但name为空  所以判断name
                    HDialog.Info("请先选择设备系统！");
                    return;
                }
                HDialog.Open('700', '450', '../EquipmentNew/SelRankSingle.aspx?SystemId=' + $("#SystemId").val(), '选择设备级别', true, function callback(_Data) {
                    var str = _Data.split('|');
                    $("#RankId").val(str[0]);
                    $("#RankName").val(str[1]);
                    $.tool.DataGet('CsEquipment', 'CheckParameterSetting', "RankId=" + str[0],
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "0") {
                                HDialog.Info("设备级别:" + str[1] + "已经存在无法新增，请对已有数据进行修改");
                                $("#RankId").val('');
                                $("#RankName").val('');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            //保存
            function Save() {
                if ($("#SystemName").val() == "") {//复制时id存在但name为空  所以判断name
                    HDialog.Info("设备系统必选！");
                    return;
                }
                if ($("#RankName").val() == "") {//复制时id存在但name为空  所以判断name
                    HDialog.Info("设备级别必选！");
                    return;
                }
                $("#TableContainer").datagrid('acceptChanges', editIndex);
                var rows = $("#TableContainer").datagrid("getRows");
                if (rows == null || rows == undefined || rows == "") {
                    HDialog.Info("请设置参数！");
                    return;
                }

                var Json = '';
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].RowName == null || rows[i].RowName == undefined || rows[i].RowName == "") {
                        HDialog.Info("字段名称存在空值，无法保存！");
                        return;
                    }
                    Json += "{\"Id\":\"" + rows[i].Id + "\",\"Sort\":\"" + rows[i].Sort + "\",\"RowName\":\"" + rows[i].RowName + "\",\"RowType\":\"" + rows[i].RowType + "\",\"IsRequired\":\"" + rows[i].IsRequired + "\",\"RowRemark\":\"" + rows[i].RowRemark + "\"},";
                }
                Json = Json.substring(0, Json.length - 1);
                Json = '[' + Json + ']';
                $.tool.DataPost('CsEquipment', 'SaveParameterSetting', 'SystemId=' + $("#SystemId").val() + "&RankId=" + $("#RankId").val() + "&Remark=" + $("#Remark").val() + '&Json=' + Json,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data > '')
                            HDialog.Info(_Data);
                        else {
                            HDialog.Info('保存成功');
                            $("#RowNum").val($("#TableContainer").datagrid("getRows").length);
                            //Close();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var column = [[
                { field: 'Id', title: 'Id', width: 1, align: 'left', hidden: true },
                { field: 'Sort', title: '字段序号', width: 10, align: 'left', sortable: true },
                { field: 'RowName', title: '字段名称', width: 25, align: 'left', sortable: true },
                {
                    field: 'RowType', title: '字段类型', width: 10, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.RowType == 'Number') {
                            str = '数值';
                        } else if (row.RowType == 'DateTime') {
                            str = '时间';
                        } else {
                            str = '文本';
                        }
                        return str;
                    }
                },
                {
                    field: 'IsRequired', title: '是否必填', width: 10, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsRequired == '1') {
                            str = '是';
                        } else {
                            str = '否';
                        }
                        return str;
                    }
                },
                { field: 'RowRemark', title: '字段说明', width: 50, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        var sort = 1;
                        var row = $("#TableContainer").datagrid("getRows");
                        if (row != null && row != undefined && row != "") {
                            for (var i = 0; i < row.length; i++) {
                                if (row[i].Sort >= sort)
                                    sort = parseInt(row[i].Sort) + 1;
                            }
                        }
                        $('#TableContainer').datagrid('appendRow', {
                            Id: new GUID().newGUID(),
                            Sort: sort,
                            RowName: '',
                            RowType: 'Number',
                            IsRequired: 1,
                            RowRemark: ''
                        });
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        var rowindex = $("#TableContainer").datagrid("getRowIndex", row);
                        $("#TableContainer").datagrid("deleteRow", rowindex);
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetParameterDetail&SystemId=' + $('#SystemId').val() + "&RankId=" + $('#RankId').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        //更改当前行号
                        editIndex = rowIndex;
                        //去除编辑器                    
                        $("#TableContainer").datagrid('removeEditor', 'Sort');
                        //序号可以编辑
                        $("#TableContainer").datagrid('addEditor', [
                            { field: 'Sort', editor: { type: 'numberbox', options: { precision: 0, min: 1 } } },
                            { field: 'RowName', editor: { type: 'text' } },
                            {
                                field: 'RowType', editor: {
                                    type: 'combobox', options: {
                                        valueField: 'value',
                                        textField: 'label',
                                        data: [{
                                            label: '数值',
                                            value: 'Number'
                                        }, {
                                            label: '时间',
                                            value: 'DateTime'
                                        }, {
                                            label: '文本',
                                            value: 'Text'
                                        }]
                                    }
                                }
                            },
                            {
                                field: 'IsRequired', editor: {
                                    type: 'combobox', options: {
                                        valueField: 'value',
                                        textField: 'label',
                                        data: [{
                                            label: '是',
                                            value: 1
                                        }, {
                                            label: '否',
                                            value: 0
                                        }]
                                    }
                                }
                            },
                            { field: 'RowRemark', editor: { type: 'text' } }
                        ]);
                        //开始编辑
                        $("#TableContainer").datagrid('beginEdit', rowIndex);
                    },
                    onLoadSuccess: function (data) {
                        if ($("#OpType").val() == 'copy') {
                            if (data != null && data != undefined && data != "") {
                                rows = $("#TableContainer").datagrid("getRows");
                                for (var i = 0; i < rows.length; i++) {
                                    var row = rows[i];
                                    var rowindex = $("#TableContainer").datagrid("getRowIndex", row);
                                    $("#TableContainer").datagrid("deleteRow", rowindex);
                                    $('#TableContainer').datagrid('insertRow', {
                                        index: rowindex,	// 索引从0开始
                                        row: {
                                            Id: new GUID().newGUID(),
                                            Sort: row.Sort,
                                            RowName: row.RowName,
                                            RowType: row.RowType,
                                            IsRequired: row.IsRequired,
                                            RowRemark: row.RowRemark
                                        }
                                    });

                                }
                            }
                        }
                    }
                });

                $("#SearchDlg").dialog("close");
            }

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });

            function LoadData() {
                $("#SystemId").val(GetQueryString("SystemId"));
                $("#RankId").val(GetQueryString("RankId"));
                if ($("#OpType").val() == 'edit') {
                    $("#SystemName").val(decodeURI(GetQueryString("SystemName")));
                    $("#RankName").val(decodeURI(GetQueryString("RankName")));
                    $("#SystemName").removeAttr("onclick");
                    $("#RankName").removeAttr("onclick");
                }
                LoadList();
            }

            $(function () {
                $("#OpType").val(GetQueryString("OpType"));
                $("#RowNum").val(GetQueryString("RowNum"));
                $("#Remark").val(GetQueryString("Remark"));
                if ($("#OpType").val() != 'add')
                    LoadData();
                else
                    LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
