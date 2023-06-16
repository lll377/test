<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethodMulDlg.aspx.cs" Inherits="M_Main.DialogNew.PaymentMethodMulDlg" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <input type="hidden" id="ModifyType" name="ModifyType" runat="server" />
        <input id="hiNum" style="width: 24px; height: 22px" type="hidden" size="1" name="hiNum"
            runat="server" />
        <table class="DialogTable">

            <tr>
                <td class="TdTitle" nowrap align="left">总金额：(元) ：&nbsp;</td>
                <td class="TdContent">
                    <input id="TotalAmount" readonly type="text" name="TotalAmount" runat="server" />

                </td>
                <td class="TdTitle" nowrap align="left">已输入金额：&nbsp;</td>
                <td class="TdContent">
                    <input id="HaveAmount" readonly type="text" class="easyui-validatebox" name="HaveAmount" runat="server" /></td>

            </tr>
            <tr>
                <td class="TdTitle" nowrap align="left">交款方式：
                </td>
                <td class="TdContent">
                    <select id="PaymentMethod" name="PaymentMethod" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">金额
                    
                </td>
                <td class="TdContent">
                    <input id="EnAmount" class="easyui-validatebox" type="text" name="EnAmount" data-options="prompt:'请输入数字',required:true,validType:'digital'"
                        runat="server">
                    <input id="hiEnAmount" type="hidden" runat="server" name="hiEnAmount" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle" nowrap align="left">剩余输入金额：
                </td>
                <td class="TdContent">
                    <input id="SurplusAmount" class="easyui-validatebox" type="text" readonly="readonly" name="SurplusAmount">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <td style="text-align: center" colspan="4">
                <input id="SelReturn" type="hidden" size="1" name="SelReturn"
                    runat="server" /><input class="button" id="btnSave"
                        type="button" value="添加交款方式" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" id="btnClose"
                    type="button" value="关闭" name="btnClose" runat="server" />

            </td>
        </table>

        <div class="SearchContainer" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">



            function GetQueryString(name) {

                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");

                var r = window.location.search.substr(1).match(reg);

                if (r != null) return unescape(r[2]); return null;

            }

            function InitFunction() {
                var h = $(window).height() - 120;
                var w = $('#HaveAmount').width();
                $("#TableContainer").css("height", h + "px");

                $('#PaymentMethod').css("width", w + 'px');
                var iTotalAmount = GetQueryString("TotalAmount");
                $('#TotalAmount').val(iTotalAmount);

                $('#HaveAmount').val(0);
                $('#EnAmount').val($('#TotalAmount').val());
            }
            InitFunction();


            var column = [[

                { field: 'DictionaryName', title: '交款方式', width: 100, align: 'left', sortable: true },
                {
                    field: 'EnAmount', title: '金额', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var id = "C" + row.DictionaryName
                        var str = "<input id=\"" + id + "\" value=\"" + row.EnAmount + "\" type=\"text\" class=\"easyui-validatebox\" onfocus=\"SethiEnAmount(this);\" onblur=\"SumEnAmount(this);\"   data-options=\"required:true,validType:'digital'\" style=\" border:1px solid #cccccc;width:100%\"/> ";
                        return str;
                    }
                }


            ]];

            var toolbar = [
                {
                    text: '确认保存交款方式',
                    iconCls: 'icon-save',
                    handler: function () {

                        if (parseFloat($('#TotalAmount').val()) != parseFloat($('#HaveAmount').val())) {
                            HDialog.Info("输入金额不等于总金额，请重新输入");

                        }
                        else {
                            $('#TableContainer').datagrid('acceptChanges');
                            var RowsData = $("#TableContainer").datagrid('getData');

                            for (var i = 0; i < RowsData.rows.length; i++) {
                                RowsData.rows[i].EnAmount = $('#C' + RowsData.rows[i].DictionaryName).val();
                            }

                            var mValues = "";
                            var mTexts = "";
                            var iHaveAmount = 0;
                            var strRe = "";
                            for (var i = 0; i < RowsData.rows.length; i++) {
                                if (RowsData.rows[i].EnAmount != 0) {

                                    var mValue = RowsData.rows[i].DictionaryName + "|" + RowsData.rows[i].EnAmount;
                                    var mText = RowsData.rows[i].DictionaryName + "(" + RowsData.rows[i].EnAmount + ")";

                                    iHaveAmount = parseFloat(iHaveAmount) + parseFloat(RowsData.rows[i].EnAmount);

                                    if (mValues == "") {
                                        mValues = mValue;
                                        mTexts = mText;
                                    }
                                    else {
                                        mValues = mValues + "," + mValue;
                                        mTexts = mTexts + "," + mText;
                                    }
                                }
                            }

                            strRe = mTexts + "\t" + mValues + "\t" + iHaveAmount;

                            HDialog.Close(strRe);
                        }

                    }

                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != undefined) {

                            var index = $('#TableContainer').datagrid('getRowIndex', row);


                            $('#TableContainer').datagrid('deleteRow', index);

                            var RowsData = $("#TableContainer").datagrid('getData');
                            var HaveAmount = 0;

                            for (var i = 0; i < RowsData.rows.length; i++) {
                                HaveAmount = parseFloat(HaveAmount) + parseFloat(RowsData.rows[i].EnAmount);
                            }

                            $('#HaveAmount').val(parseFloat(HaveAmount));

                        }
                        else { HDialog.Info('请选择'); }

                    }

                }
            ];





            function LoadList() {


                $("#TableContainer").datagrid({


                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }

                });

            }

            LoadList();


            $('#btnClose').click(function () {

                HDialog.Close('');
            })

            function SethiEnAmount(obj) {
                $('#hiEnAmount').val(obj.value);
            }


            function SumEnAmount(obj) {

                var Sum = $('#HaveAmount').val();
                Sum = parseFloat(Sum) + parseFloat(obj.value) - parseFloat($('#hiEnAmount').val());


                if (Sum > parseFloat($('#TotalAmount').val())) {
                    HDialog.Info('输入金额不等于总金额，请重新输入');
                }
                else {
                    $('#HaveAmount').val(parseFloat(Sum));
                    $('#hiEnAmount').val(obj.value);
                }

                $('#EnAmount').val('');
                $('#SurplusAmount').val((parseFloat($('#TotalAmount').val()).toFixed(2) - parseFloat($('#HaveAmount').val())).toFixed(2));
                
                $('#TableContainer').datagrid('acceptChanges');
                var RowsData = $("#TableContainer").datagrid('getData');

                for (var i = 0; i < RowsData.rows.length; i++) {
                    RowsData.rows[i].EnAmount = $('#C' + RowsData.rows[i].DictionaryName).val();
                }
            }
            $('#btnSave').click(function () {
                var DictionaryName = $("#PaymentMethod").find("option:selected").text();
                var EnAmount = $('#EnAmount').val();
                if (DictionaryName == "") {
                    HDialog.Info('请选择交款方式');
                }
                else {


                    var Sum = $('#HaveAmount').val();
                    var d1 = parseFloat(parseFloat(Sum) + parseFloat(EnAmount)).toFixed(2);
                    var d2 = parseFloat($('#TotalAmount').val()).toFixed(2);
                    //  TotalAmount

                    //if (d1 < 0) {
                    //    d1 = Math.abs(parseFloat(d1))
                    //}
                    //if (d2 < 0) {
                    //    d2 = Math.abs(parseFloat(d2))
                    //}

                    //if (parseFloat(d1) > parseFloat(d2)) {
                    //    HDialog.Info('输入金额不等于总金额，请重新输入');
                    //}
                    //else {

                    $('#hiEnAmount').val(EnAmount);

                    $('#HaveAmount').val((parseFloat(Sum) + parseFloat(EnAmount)).toFixed(2));

                    $('#TableContainer').datagrid('appendRow',
                        {
                            DictionaryName: DictionaryName,
                            EnAmount: EnAmount
                        });

                    var RowsData = $("#TableContainer").datagrid('getData');
                    var HaveAmount = 0;

                    //for (var i = 0; i < RowsData.rows.length; i++) {
                    //    HaveAmount = parseFloat(HaveAmount) + parseFloat(RowsData.rows[i].EnAmount);
                    //}
                    //$('#HaveAmount').val(parseFloat(HaveAmount).toFixed(2));

                    $('#EnAmount').val();
                    $('#SurplusAmount').val((parseFloat($('#TotalAmount').val()).toFixed(2) - parseFloat($('#HaveAmount').val())).toFixed(2));
                    //  }
                }
            });
        </script>
    </form>
</body>
</html>


