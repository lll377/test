<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesFreezeBrowse.aspx.cs" Inherits="M_Main.ChargesNew.FeesFreezeBrowse" %>


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
</head>
<body>
    <form id="frmForm" runat="server">


        <input type="hidden" id="unFreeze" name="unFreeze" runat="server" />
        <input type="hidden" id="AllFees" name="AllFees" runat="server" />

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">费用日期从</td>
                    <td class="TdContent">
                        <select id="CreYear1" name="CreYear1" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth1" name="CreMonth1" runat="server">
                            <option selected></option>
                        </select>月</td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <select id="CreYear2" name="CreYear2" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth2" name="CreMonth2" runat="server">
                            <option selected></option>
                        </select>月</td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">冻结情况</td>
                    <td class="TdContent">
                        <select id="SelFreeze" name="SelFreeze" runat="server">
                            <option value="" selected>全部</option>
                            <option value="0">未冻结</option>
                            <option value="1">已冻结</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="CostNames" style="width: 90%; height: 22px" class="easyui-searchbox" searcher="SelCost" data-options="editable:false"
                            name="CostNames" runat="server" /><input id="CostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="CostIDs"
                                runat="server" /><input id="hiCostNames" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostNames"
                                    runat="server" /><%--<input class="button_sel" id="btnSelCostIDs" style="height: 22px" onclick="javascript:if(btnSelCostIDs_OnClick()==false) return false;"
                                        type="button" name="btnSelCostIDs" runat="server">--%><input id="CostID" style="width: 16px; height: 22px" type="hidden" size="1" name="CostID"
                                            runat="server" /><input id="hiCostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostIDs"
                                                runat="server" /></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                       <%-- <input class="button" id="btnSearch"
                            type="button" value="查询" name="btnSearch" runat="server" />--%>

                          <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">确定筛选</a>
                          <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="Clear();">清空</a>

                    </td>
                </tr>
            </table>
        </div>
        <div id="FreezeDlg" class="easyui-dialog" title="冻结费用" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">冻结原因
                    </td>
                    <td class="TdContent">
                        <input id="FrzReason" type="text" class="easyui-validatebox" data-options="required:true" name="FrzReason" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input class="button" id="btnSave"
                            type="button" value="冻结确认" name="btnSave" runat="server" /></td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });
            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);


                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                }
                                $('#SelectRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelectRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    $('#RoomID').val(data[i].RoomID.split('|')[0]);

                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }
            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);


                    $('#SelectRoomID').combobox({
                        data: '',
                        valueField: 'RoomID',
                        textField: 'RoomText'
                    });

                });
            }


            var column = [[

                    { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'FreezeID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                    { field: 'ParkName', title: '车位编号', width: 130, align: 'left', sortable: true },
                    { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                    {
                        field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                    },
                    {
                        field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },

                    { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },

                    { field: 'FrzUserName', title: '冻结人', width: 100, align: 'left', sortable: true },
                    {
                        field: 'FrzDate', title: '冻结日期', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.FrzDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'FrzReason', title: '冻结原因', width: 150, align: 'left', sortable: true },

                    { field: 'IsFreezeName', title: '冻结状态', width: '50', align: 'center', sortable: true },
                    { field: 'IsPrecName', title: '预交状态', width: '80', align: 'center', sortable: true }

            ]];

            var frozenColumns = [[
                 { field: 'ck', checkbox: true },
              { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
              { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
              { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
            ]];
            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');

                     }
                 }, '-',
                    {
                        text: '冻结',
                        iconCls: 'icon-add',
                        handler: function () {
                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "") {
                                HDialog.Info('请选择费用!');
                            }
                            else {
                                $('#unFreeze').val('0');
                                $('#FreezeDlg').parent().appendTo($("form:first"))
                                $('#FreezeDlg').dialog('open');


                                var SelData = JSON.stringify(rows);
                                $('#AllFees').val(SelData);



                            }

                        }
                    }, '-',
                    {
                        text: '解除冻结',
                        iconCls: 'icon-remove',
                        handler: function () {

                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "")
                            { HDialog.Info('请选择费用!'); }
                            else
                            {
                                $('#unFreeze').val('1');

                                var SelData = JSON.stringify(rows);
                                $('#AllFees').val(SelData);


                                $.tool.DataPostChk('frmForm', 'Fees', 'FeesFreeze', $('#frmForm').serialize(),
                                 function Init() {
                                 },
                                 function callback(_Data) {
                                     var r = _Data.split('|');

                                     if (r[0] == "true") {
                                       
                                     }
                                     HDialog.Info(r[1]);
                                     LoadList();
                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {
                                 });

                            }
                        }
                    }, '-',

                    {
                        text: 'Excel输出',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {

                            window.location.href = "../ChargesNew/FeesFreezeBrowseCre.aspx";

                        }
                    }
            ];


            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Fees", "FeesFreezeSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }
            LoadList();
            $('#btnSearch').click(function () {

                LoadList();
               //ssss Clear();
                $("#SearchDlg").dialog("close");
            });
            function LoadData()
            {
                LoadList();
                $("#SearchDlg").dialog("close");
            }


            $('#btnSave').click(function () {


                $.tool.DataPostChk('frmForm', 'Fees', 'FeesFreeze', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data.split('|');

                            if (r[0] == "true") {

                                LoadList();
                            }
                            HDialog.Info(r[1]);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });


                $("#FreezeDlg").dialog("close");
            });


            function Clear() {
                $('#CustID').val('');
                $('#RoomID').val('');

                $('#CustName').searchbox('setValue', '');
                $('#RoomSign').searchbox('setValue', '');

                $('#hiCustName').val('');
                $('#hiRoomSign').val('');

                $('#CostIDs').val('');
                $('#CostNames').searchbox('setValue', '');
                $('#hiCostNames').val('');
                $('#FrzReason').val('');
            }
        </script>
    </form>
</body>
</html>

