<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetRoomIncomeEdit.aspx.cs" Inherits="M_Main.BudgetNew.BudgetRoomIncomeEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>交房收入计划</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/help.js"></script>
    <script src="../jscript/uuid.js"></script>
    <script src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .tb {
            margin: 0;
            width: 100%;
            border: 0;
        }

            .tb tr td.w50 {
                width: 50%;
                padding: 10px;
                border: 0px solid #ff6a00;
            }

            .tb tr td .label {
                text-align: center;
                width: 100px;
                display: inline-block;
            }

            .tb tr td .div {
                width: 260px;
                border: 0px solid #ff6a00;
                display: inline-block;
            }

        .cbx {
            width: 18px;
            height: 18px;
            border: 1px solid #3e73ca;
            margin-left: 20px;
            display: inline-block;
        }

        .cbx_label {
            font-size: 13px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <form id="mainForm">
        <table class="tb">
            <tr>
                <td class="w50">
                    <label class="label">项目名称:</label>
                    <div class="div">
                        <input id="CommIDName" class="easyui-textbox" data-options="required:true" />
                    </div>
                </td>
                <td class="w50">
                    <label class="label">预算年度:</label>
                    <div class="div">
                        <input id="Year" class="easyui-combobox" />
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <div id="tb">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">移除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="温馨提示:<br/>1、当前保存按钮,只是将编辑的数据暂存客户端，不会保存在数据库。<br/>2、请点击正下方蓝色(保存)按钮，保存到数据库。(请确保数据无误)" data-options="iconCls:'icon-save',plain:true,position:'right'" onclick="acceptit()">保存(临时)</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">重置</a>--%>
    </div>
    <table id="dg" class="easyui-datagrid"></table>
    <div style="text-align: center; width: 100%; height: 50px; line-height: 50px;">
        <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
        <input type="checkbox" class="cbx" id="cbxGeneratePlan" checked />
        <label class="easyui-tooltip cbx_label" title="温馨提示:<br/>1、未勾选:保存交房收入规则，不生成收入明细。<br/>2、勾&emsp;选:保存交房收入规则和生成交房收入明细并弹出生成明细窗口。" for="cbxGeneratePlan">生成交房收入明细</label>
        <input type="hidden" name="ID" id="ID" />
        <input type="hidden" name="RoomIncomeID" id="RoomIncomeID" />
        <input type="hidden" name="CommID" id="CommID" />
        <input type="hidden" name="OptType" id="OptType" />
    </div>
    <script type="text/javascript">
        //选择项目
        function SelComm() {
            LayerDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    //$("#CommID").val(varObjects.attributes.InPopedom);
                    //$("#CommIDName").textbox("setValue", varObjects.text);

                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommIDName").textbox("setValue", arrRet.name);

                }
            });
        }

        function InitControl() {
            var year = new Date().getFullYear();
            var jsonData = [];
            for (var i = 10; i >= 0; i--) {
                jsonData.push({ "id": year - i, "text": year - i });
            }
            for (var i = 1; i <= 5; i++) {
                jsonData.push({ "id": year + i, "text": year + i });
            }
            $("#Year").combobox({
                required: true, valueField: 'id', value: "", editable: false,
                textField: 'text', data: jsonData
            });
            $('#CommIDName').textbox('textbox').bind('click', function (e) {
                SelComm();
            });
        }
        $(function () {
            var OptType = $.getUrlParam("OptType");
            var ID = $.getUrlParam("ID");
            if (OptType == "Add") { ID = Math.uuid(); }
            $("#ID").val(ID);
            $("#RoomIncomeID").val(ID);
            $("#OptType").val(OptType);
            InitControl();
            InitData();
            InitDataGrid()
        });
        function InitData() {
            $.dataPostJson('Budget', 'GetModelRoomIncome', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                    $("#Year").combobox('setValue', data.Year);
                    $("#CommIDName").textbox('setValue', data.CommName);
                    $.setParam(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }


        var column = [[
            {
                field: 'CostID', title: '费用项目', width: 260, align: 'center', formatter: function (value, row) {
                    return row.CostIDText;
                },
                editor: {
                    type: 'combotree',
                    options: {
                        required: true,
                        url: '/HM/M_Main/HC/DataPost.aspx',
                        idField: 'id',
                        textField: 'text',
                        queryParams: {
                            Class: "Budget",
                            Method: "GetListRoomIncomeCostItem",
                        },
                        method: "post",
                        lines: true,
                        animate: true,
                        border: true,
                        editable: true,
                        prompt: '温馨提示:输入文字进行搜索...',
                        loadMsg: '加载中,请稍侯...',
                        onLoadSuccess: function (node, data) {
                            $(this).tree("collapseAll");
                            //console.log(data.length);
                            //if (data.length >= 1) {
                            //    //默认展开第一个节点
                            //    $(this).tree("expand", $(this).tree("getChildren")[0].target)
                            //}
                        },
                        onBeforeSelect: function (node) {
                            if (!$(this).tree('isLeaf', node.target)) {
                                e.stopPropagation();
                            }
                        },
                        keyHandler: {
                            query: function (q) {
                                var t = $(this).combotree('tree');
                                var nodes = t.tree('getChildren');
                                for (var i = 0; i < nodes.length; i++) {
                                    var node = nodes[i];
                                    if (node.text.indexOf(q) >= 0) {
                                        $(node.target).show();
                                    } else {
                                        $(node.target).hide();
                                    }
                                    var opts = $(this).combotree('options');
                                    if (!opts.hasSetEvents) {
                                        opts.hasSetEvents = true;
                                        var onShowPanel = opts.onShowPanel;
                                        opts.onShowPanel = function () {
                                            var nodes = t.tree('getChildren');
                                            for (var i = 0; i < nodes.length; i++) {
                                                $(nodes[i].target).show();
                                            }
                                            onShowPanel.call(this);
                                        };
                                        $(this).combo('options').onShowPanel = opts.onShowPanel;
                                    }
                                }
                            }
                        }
                    }
                }
            },
            { field: 'TaxRate', title: '税率(%)', width: 60, align: 'center', required: true, editor: { type: 'numberbox', options: { precision: 2, required: true } } },
            { field: 'Standard', title: '收费标准(元/月)', width: 100, align: 'center', required: true, editor: { type: 'numberbox', options: { precision: 2, required: true } } },
            { field: 'Num', title: '数量', width: 60, align: 'center', required: true, editor: { type: 'numberbox', options: { required: true } } },
            { field: 'Area', title: '计费面积(平米)', width: 100, align: 'center', required: true, editor: { type: 'numberbox', options: { precision: 2, required: true } } },
            {
                field: 'Way', title: '计算方式', width: 170, align: 'center', required: true, formatter: function (value, row) {
                    return row.WayText;
                },
                editor: {
                    type: 'combobox',
                    options: {
                        valueField: 'id',
                        textField: 'text',
                        data: [{ "id": "1", "text": "按定额每月计算" }, { "id": "2", "text": "按计费面积*单价每月计算" }],
                        editable: false, required: true
                    }
                }
            },
            {
                field: 'Period', title: '计费周期', width: 100, align: 'center', required: true, formatter: function (value, row) {
                    return row.PeriodText;
                },
                editor: {
                    type: 'combobox',
                    options: {
                        valueField: 'id',
                        textField: 'text',
                        data: [{ "id": "1", "text": "按每1月计算" }, { "id": "3", "text": "按每3月计算" }, { "id": "6", "text": "按每6月计算" }, { "id": "12", "text": "按每12月计算" }],
                        editable: false, required: true
                    }
                }
            },
            {
                field: 'Month', title: '计费开始月份', width: 90, align: 'center', required: true, formatter: function (value, row) {
                    return row.MonthText;
                },
                editor: {
                    type: 'combobox',
                    options: {
                        valueField: 'id',
                        textField: 'text',
                        data: [{ "id": "1", "text": "1月份" },
                        { "id": "2", "text": "2月份" },
                        { "id": "3", "text": "3月份" },
                        { "id": "4", "text": "4月份" },
                        { "id": "5", "text": "5月份" },
                        { "id": "6", "text": "6月份" },
                        { "id": "7", "text": "7月份" },
                        { "id": "8", "text": "8月份" },
                        { "id": "9", "text": "9月份" },
                        { "id": "10", "text": "10月份" },
                        { "id": "11", "text": "11月份" },
                        { "id": "12", "text": "12月份" }],
                        editable: false, required: true
                    }
                }
            }
        ]];

        function InitDataGrid() {
            var h = $(window).height();
            var w = $(window).width();
            $("#dg").datagrid({
                title: "编制规则",
                height: h - 100,
                width: w,
                iconCls: 'icon-edit',
                toolbar: '#tb',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit,
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                pagination: true,
                border: true,
                columns: column,
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("Budget", "GetListRoomIncomeRule", param);
                    param.RoomIncomeID = $("#ID").val();
                },
                onLoadSuccess: function (data) {

                }
            });
        }


        function Save() {
            if ($('#mainForm').form("validate") && endEditing()) {
                $('#dg').datagrid('acceptChanges');
                var data = $('#dg').datagrid("getData");
                console.log(data.rows);
                console.log(JSON.stringify(data.rows));
                var param = $.getParam();
                param.RoomIncomeList = JSON.stringify(data.rows);
                //console.log(param);
                //return;
                $.dataPostJson('Budget', 'SaveRoomIncome', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            if ($("#cbxGeneratePlan").prop("checked")) {
                                EditRoomIncomeDetailed($("#RoomIncomeID").val());
                            } else {
                                $('#mainForm').form('clear');
                                Close();
                            }
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
            //else {
            //    //HDialog.Info(jsonData.msg);
            //}
        }
        function EditRoomIncomeDetailed(ID) {
            LayerDialog.Open(1200, 600, '../BudgetNew/BudgetRoomIncomeDetailed.aspx?&ID=' + ID, "交房收入计划明细", false, function callback(_Data) {

            });
        }
        function Close() {
            LayerDialog.Close();
        }

    </script>
    <script type="text/javascript">
        var editIndex = undefined;
        function endEditing() {
            if (editIndex == undefined) { return true }
            if ($('#dg').datagrid('validateRow', editIndex)) {
                $('#dg').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                $.messager.alert({
                    title: "温馨提示",
                    msg: "红色文本框为必填值,请完善数据!",
                    icon: "info"
                });
                return false;
            }
        }
        function onClickCell(index, field) {
            if (editIndex != index) {
                if (endEditing()) {
                    $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                    var ed = $('#dg').datagrid('getEditor', { index: index, field: field });
                    if (ed) {
                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                    }
                    //ed = $('#dg').datagrid('getEditor', { index: index, field: "CostID" });
                    //if (ed) {
                    //    var row = $('#dg').datagrid('getRowIndex', index);
                    //    $(ed.target).combotree('setValue', row.CostID);
                    //}
                    editIndex = index;
                } else {
                    setTimeout(function () {
                        $('#dg').datagrid('selectRow', editIndex);
                    }, 0);
                }
            }
        }
        function onEndEdit(index, row) {
            var ed = $(this).datagrid('getEditors', index);
            $.each(ed, function (i, item) {
                switch (item.field) {
                    case "Way":
                        row.WayText = $(item.target).combobox('getText');
                        break;
                    case "Period":
                        row.PeriodText = $(item.target).combobox('getText');
                        break;
                    case "Month":
                        row.MonthText = $(item.target).combobox('getText');
                        break;
                    case "CostID":
                        var dataRow = (item.target).combotree('tree').tree('getSelected');
                        if (dataRow) {
                            row.CostIDText = dataRow.text;
                            row.CostID = dataRow.attributes.CostID;
                            row.CorpCostID = dataRow.attributes.CorpCostID;
                        }
                        break;
                }
            });
        }
        function append() {
            if (endEditing()) {
                $('#dg').datagrid('appendRow', { CostID: '' });
                editIndex = $('#dg').datagrid('getRows').length - 1;
                $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
            }
        }
        function removeit() {
            if (editIndex == undefined) { return }
            $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
            editIndex = undefined;
        }
        function acceptit() {
            if (endEditing()) {
                $('#dg').datagrid('acceptChanges');
            }
        }
        function reject() {
            $('#dg').datagrid('rejectChanges');
            editIndex = undefined;
        }
        function getChanges() {
            var rows = $('#dg').datagrid('getChanges');
        }


        /** 
        * combobox和combotree模糊查询 
        */
        (function () {
            //combobox可编辑，自定义模糊查询  
            $.fn.combobox.defaults.editable = true;
            $.fn.combobox.defaults.filter = function (q, row) {
                var opts = $(this).combobox('options');
                return row[opts.textField].indexOf(q) >= 0;
            };
            //combotree可编辑，自定义模糊查询  
            $.fn.combotree.defaults.editable = true;
            $.extend($.fn.combotree.defaults.keyHandler, {
                up: function () {
                    console.log('up');
                },
                down: function () {
                    console.log('down');
                },
                enter: function () {
                    console.log('enter');
                },
                query: function (q) {
                    var t = $(this).combotree('tree');
                    var nodes = t.tree('getChildren');
                    for (var i = 0; i < nodes.length; i++) {
                        var node = nodes[i];
                        if (node.text.indexOf(q) >= 0) {
                            $(node.target).show();
                        } else {
                            $(node.target).hide();
                        }
                    }
                    var opts = $(this).combotree('options');
                    if (!opts.hasSetEvents) {
                        opts.hasSetEvents = true;
                        var onShowPanel = opts.onShowPanel;
                        opts.onShowPanel = function () {
                            var nodes = t.tree('getChildren');
                            for (var i = 0; i < nodes.length; i++) {
                                $(nodes[i].target).show();
                            }
                            onShowPanel.call(this);
                        };
                        $(this).combo('options').onShowPanel = opts.onShowPanel;
                    }
                }
            });
        })(jQuery);
    </script>
</body>
</html>
