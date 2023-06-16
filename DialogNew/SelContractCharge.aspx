<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractCharge.aspx.cs" Inherits="M_Main.DialogNew.SelContractCharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同费用信息</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <div style="width: 39.9%; float: left; height: 100%; border-right: 1px solid #e7e815;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainerContract">
            </div>
        </div>

        <div style="width: 60%; float: right; height: 100%;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
            </div>
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" name="CId" id="CId" runat="server" />
        <input type="hidden" name="ChIds" id="ChIds" />
        <input type="hidden" value=""  id="CommId" name="CommId" /> 
        <input type="hidden" value=""   id="DepCode" name="DepCode" />
        <input type="hidden" name="CheckJson" id="CheckJson" value="[]" />
        <input type="hidden" name="changBS" id="changBS" value="" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainerContract").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var columnContract = [[
                     { field: 'CId', title: 'CId', width: 25, align: 'left', sortable: true, hidden: true },
                     { field: 'ContractNo', title: '合同编号', width: 80, align: 'left', sortable: true },
                     { field: 'ContractName', title: '合同名称', width: 100, align: 'left', sortable: true },
                     { field: 'SupplierId', title: '对方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'SupplierName', title: '供方单位', width: 100, align: 'left', sortable: true },
                     { field: 'ContractMoney', title: '合同金额', width: 100, align: 'left', sortable: true },
                     { field: 'PayedMoney', title: '已付金额', width: 60, align: 'left', sortable: true },

            ]];

            //编辑的行号
            var editIndex = undefined;
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

            var toolbar = [
               {
                   text: '确定选择',
                   iconCls: 'icon-save',
                   handler: function () {
                       //HDialog.ReturnIsJson = true;
                       //HDialog.Close($("#CheckJson").val());
                       var rows = $("#TableContainer").datagrid("getChecked");
                       parent.HDialog.ReturnIsJson = true;
                       parent.HDialog.Close(rows);
                   }
               }
            ];

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            function LoadList() {
                $("#CommId").val(GetQueryString("CommId"));
                $("#DepCode").val(GetQueryString("DepCode"));
                $("#TableContainerContract").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractList&IsSettleAccounts=0&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: columnContract,
                    fitColumns: false,
                    toolbar: toolbar,
                    singleSelect: true,
                    pagination: true,
                    width: "39%",
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) { 
                            $("#TableContainerContract").datagrid('selectRow', 0); 
                            ClickRow(data.rows[0].CId);
                        }
                    },
                    onClickRow: function (rowIndex, rowData1) {
                        ClickRow(rowData1.CId);
                    }
                });
            }

            function ClickRow(CId) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractChargeList&CId=' + CId,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "60%",
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //alert(JSON.stringify(data));
                        //$(this).datagrid('loadData', state.data);
                        //if (opts.url) {
                        //    $(this).datagrid('reload');
                        //}

                        if (data.rows.length > 0) {
                            var ids = $("#ChIds").val();
                            var arr = ids.split(',');
                            if (arr.length > 0 && arr[0] != "" && arr[0] != undefined) {
                                var jsons = $("#CheckJson").val();
                                var arrjsons = jsons.split('^^');

                                for (var i = 0; i < arr.length; i++) {
                                    for (var j = 0; j < data.rows.length; j++) {
                                        if (data.rows[j].ChId == arr[i]) {
                                            var jj = arrjsons[i].split('|#');

                                            data.rows[j].DeclareMoney = jj[15];
                                            data.rows[j].PayType = jj[5];
                                            data.rows[j].Schedule = jj[6];

                                            $("#TableContainer").datagrid('checkRow', j);
                                            $("#TableContainer").datagrid('updateRow', { index: j, row: { "PayType": jj[5], "Schedule": jj[6], "DeclareMoney": jj[15] } });
                                        }
                                    }
                                }
                            }
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        //更改当前行号
                        editIndex = rowIndex;

                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        //去除编辑器
                        $("#TableContainer").datagrid('removeEditor', 'DeclareMoney');
                        $("#TableContainer").datagrid('removeEditor', 'PayType');
                        $("#TableContainer").datagrid('removeEditor', 'Schedule');

                        $("#TableContainer").datagrid('addEditor', [ //添加DeclareMoney列editor
                            {
                                field: 'DeclareMoney', editor: { type: 'text' }
                            }]);


                        $("#TableContainer").datagrid('addEditor', [ //添加DeclareMoney列editor
                            {
                                field: 'PayType', editor: { type: 'text' }
                            }]);

                        $("#TableContainer").datagrid('addEditor', [ //添加DeclareMoney列editor
                            {
                                field: 'Schedule', editor: { type: 'text' }
                            }]);

                        //开始编辑
                        $("#TableContainer").datagrid('beginEdit', rowIndex);

                        //绑定JS事件
                        var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                        for (var i = 0; i < ed.length; i++) {
                            var e = ed[i];
                            if (e.field == "DeclareMoney") {

                                $(e.target).bind("click", function () {

                                }).bind("change", function () {
                                    //文本变化事件
                                    //  alert(e.target[0].value);
                                    var val = e.target[0].value;
                                    var sl = rowData.PayMoney - rowData.PayedMoney;

                                    if (parseFloat(val) == "NaN") {
                                        HDialog.Info("请输入正确数字！");
                                        e.target[0].value = sl;
                                        return;
                                    }
                                    if (sl < val) {
                                        HDialog.Info("输入金额大于未付款金额！");
                                        e.target[0].value = sl;
                                        return;
                                    }

                                    //$('#TableContainer').datagrid('updateRow',
                                    //{
                                    //    index: rowIndex,
                                    //    row: {
                                    //        DeclareMoney: sl,
                                    //    }
                                    //});

                                });
                            }
                        }
                    },
                    onCheck: function (rowIndex, rowData) {
                        var ids = $("#ChIds").val();
                        var arr = ids.split(',');
                        if (arr.length > 0 && arr[0] != "" && arr[0] != undefined) {
                             alert(arr.length + " ids " + ids);
                            var isIn = 0;
                            for (var i = 0; i < arr.length; i++) {
                                if (arr[i] == rowData.ChId) {
                                    isIn = 1;
                                }
                            }
                            if (isIn == 0) {
                                ids += "," + rowData.ChId;
                            }
                            // alert("" + jsons);
                            $("#ChIds").val(ids);
                        }
                        else {
                            //var user = JSON.parse(string);转json  
                            //JSON.stringify(user); 转为字符串
                            //a = new Array(0, 1, 2, 3, 4);
                            //b = a.join("-");

                            ids = rowData.ChId;//
                            
                            $("#ChIds").val(ids);
                        }
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var ids = $("#ChIds").val();

                        var jsons = $("#CheckJson").val();
                        // alert("之前还没删除的：" + $("#CheckJson").val());
                        if (ids != "") {
                            var arr = ids.split(',');
                            var arrjsons = jsons.split('^^');

                            if (arr.length > 0 && arr[0] != "" && arr[0] != undefined) {
                                for (var i = 0; i < arr.length; i++) {
                                    if (arr[i] == rowData.ChId) {
                                        arr.splice(i, 1);
                                        arrjsons.splice(i, 1);
                                    }
                                }
                            }
                            $("#ChIds").val(arr.join(","));
                            $("#CheckJson").val(arrjsons.join("^^"));
                            //  alert("移出之后："+$("#CheckJson").val());
                        }
                    }
                });
            }

            LoadList();

            // var rows = $("#DivContainer").datagrid("getSelections");
            var column = [[
                    { field: 'ck', checkbox: true },
                    { field: 'ChId', title: 'ChId', width: 25, align: 'left', sortable: true, hidden: true },
                    { field: 'CostId', title: '成本单位ID', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'CsId', title: '成本科目ID', width: 50, align: 'center', sortable: true, hidden: true },
                     { field: 'CastName', title: '成本单位', width: 80, align: 'left', sortable: true },
                     { field: 'SubjectName', title: '成本科目', width: 80, align: 'left', sortable: true },
                     {
                         field: 'PayMonth', title: '应付年月', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var date = new Date(value);
                             var str = date.getFullYear() + "-" + (date.getMonth() + 1);
                             return str;
                         }
                     },
                     { field: 'PayMoney', title: '应付金额(元)', width: 80, align: 'left', sortable: true },
                     { field: 'PayedMoney', title: '已付金额(元)', width: 80, align: 'left', sortable: true },
                     {
                         field: 'PayType', title: '付款事项', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "合同付款";
                             if (value != null && value != "") {
                                 str = value;
                             }
                             return str;
                         }
                     },
                     {
                         field: 'Schedule', title: '完成工作', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "完成进度工作";
                             if (value != null && value != "") {
                                 str = value;
                             }
                             return str;
                         }
                     },
                     { field: 'DeclareMoney', title: '申报金额(元)', width: 80, align: 'left', sortable: true }
            ]];

        </script>
    </form>
</body>
</html>


