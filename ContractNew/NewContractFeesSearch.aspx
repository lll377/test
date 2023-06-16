<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewContractFeesSearch.aspx.cs" Inherits="M_Main.ContractNew.NewContractFeesSearch" %>

<!DOCTYPE html>
<html>
<head>
    <title>合同查询-合同费用查询</title>
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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm">
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <input id="hiCommID" name="hiCommID" runat="server" type="hidden" />
        <input id="hiFeesCommID" name="hiFeesCommID" runat="server" type="hidden" />

        <input id="IsSelect" name="IsSelect" runat="server" type="hidden" value="0" />


        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 980px; height: 320px;">
            <table style="width: 100%;" class="DialogTable">
                <tr>
                    <td class="TdTitle" style="height: 26px; width: 140px;">项目名称(签约主体)</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="CommName" class="easyui-searchbox" searcher="SelCommInfo" data-options="editable:false" name="CommName" runat="server" />
                        <input id="CommID" type="hidden" name="CommID" runat="server" />
                    </td>
                    <td class="TdTitle" style="height: 26px; width: 140px;">项目名称(费用主体)</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="FeesCommName" class="easyui-searchbox" searcher="SelFeesCommInfo" data-options="editable:false" name="FeesCommName" runat="server" />
                        <input id="FeesCommID" type="hidden" name="FeesCommID" runat="server" />
                    </td>
                    <td class="TdTitle">费用名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames" style="width: 80%;"
                            name="CostNames" runat="server" /><input class="Control_ItemInput" id="CorpCostIDs" style="width: 8px;" type="hidden"
                                size="1" name="CorpCostIDs" runat="server" /><input class="Control_ItemInput" id="hiCostNames" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiCostNames" runat="server" />
                    </td>
                    <td class="TdTitle" style="height: 26px;">费用到期</td>
                    <td class="TdContent" style="height: 26px;">
                        <input id="AdvanceDay" style="width: 50%" value="0" name="AdvanceDay" runat="server">天到期
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px;">合同类别</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="NewContType" class="easyui-searchbox" searcher="SelNewContType" data-options="editable:false"
                            name="NewContType" runat="server" /><input id="NewContTypeCode" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="NewContTypeCode" runat="server" /></td>

                    <td class="TdTitle" style="height: 26px;">合同名称</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" id="ContName" name="ContName" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">合同编号</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" id="ContSign"
                            name="ContSign" runat="server">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px;">客户名称</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="CustName" data-options="editable:false"
                            name="CustName" class="easyui-validatebox" runat="server" />
                        <input id="CustID" style="width: 8px; height: 19px" type="hidden"
                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle" style="height: 26px;">客户地址</td>
                    <td class="TdContent" style="height: 26px;">
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" /><input class="easyui-validatebox" id="UnitName"
                                    name="UnitName" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">合同开始时间从</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContStartBeginDate"
                            onclick="WdatePicker()" name="ContStartDate" runat="server">
                    </td>
                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContStartEndDate"
                            onclick="WdatePicker()" name="ContStartEndDate" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px;">合同结束时间从</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContEndBeginDate"
                            onclick="WdatePicker()" name="ContEndBeginDate" runat="server">
                    </td>
                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContEndEndDate"
                            onclick="WdatePicker()" name="ContEndEndDate" runat="server">
                    </td>
                    <td class="TdTitle" style="height: 26px;">合同金额</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" style="width: 40%" id="ContBeginAmount" name="ContBeginAmount"
                            runat="server">到<input class="easyui-validatebox" style="width: 40%" id="ContEndAmount" name="ContEndAmount"
                                runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">合同保证金</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" style="width: 40%" id="MarginBegin" name="MarginBegin" runat="server">
                        到
                        <input class="easyui-validatebox" style="width: 40%" id="MarginEnd" name="MarginEnd" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否到期</td>
                    <td class="TdContent">
                        <select id="IsExpired" name="IsExpired" runat="server">
                            <option></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">变更类型</td>
                    <td class="TdContent">
                        <select id="ChangeType" name="ChangeType" runat="server">
                            <option value="全部">全部</option>
                            <option value="未变更">未变更</option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                            <option value="关闭">关闭</option>
                        </select></td>
                    <td class="TdTitle">应收金额</td>
                    <td class="TdContent">
                        <select id="CompSymbol" name="CompSymbol" runat="server">
                            <option selected></option>
                        </select><input id="DueAmount" style="width: 50%" value="0" name="DueAmount" runat="server">
                    </td>
                    <td class="TdTitle">是否欠费</td>
                    <td class="TdContent">
                        <select id="IsDebts" name="IsDebts" runat="server">
                            <option></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应收日期从</td>
                    <td class="TdContent">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="FeesDueBeginDate"
                            onclick="WdatePicker()" name="FeesDueBeginDate" runat="server">
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="FeesDueEndDate"
                            onclick="WdatePicker()" name="FeesDueEndDate" runat="server">
                    </td>
                    <td class="TdTitle">合同登记时间</td>
                    <td class="TdContent">
                        <input id="RegBeginDate" class="Wdate" onkeypress="CheckDate();" onclick="WdatePicker()" name="RegBeginDate" type="text" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="RegEndDate" class="Wdate" onkeypress="CheckDate();" onclick="WdatePicker()" name="RegEndDate" type="text" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadListSearch();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript" src="../jscript/CloseAjaxCache.js"></script>
        <script type="text/javascript">
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx?Ram=" + Math.random(), '费用项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CorpCostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            //加载字典设置
            function LoadDictionary() {
                $("select[isdctype='true']").each(function (i) {
                    var nId = $(this).attr("id");
                    var varObjects;
                    $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            var option = "<option value=''></option>";
                            $("#" + nId).append(option);
                            for (var i = 0; i < varObjects.length; i++) {
                                option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                                $("#" + nId).append(option);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });
            }
            LoadDictionary();

            function SelDutyDepUserName() {
                var conent = "../DialogNew/ContractUserDlg.aspx";
                var w = 600;
                var h = 450;
                HDialog.Open(w, h, conent, '用户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);

                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepUserName').searchbox("setValue", data.DepName + "-" + data.UserName);
                    $('#hiDutyDepUserName').val(data.DepName + "-" + data.UserName);
                });
            }
            function SelNewContType() {
                HDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类型', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#NewContTypeCode").val(varObjects[0]);
                        $("#NewContType").searchbox("setValue", varObjects[1]);
                    }
                });
            }

            //选择签约项目
            function SelCommInfo() {
                if ($('#hiCommID').val() != '' && $('#hiCommID').val() != '0') {
                    return;
                }
                else {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setText", arrRet.name);
                        $("#hiCommID").val(arrRet.id);
                    });
                }
            }

            //选择费用项目
            function SelFeesCommInfo() {
                if ($('#hiFeesCommID').val() != '' && $('#hiFeesCommID').val() != '0') {
                    return;
                }
                else {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#FeesCommID").val(arrRet.id);
                        $("#FeesCommName").searchbox("setText", arrRet.name);
                    });
                }
            }

            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelRoomID').combobox('clear');
                var w = 800;
                var h = 400;
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                });
            }
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

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
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var comm = $("#hiCommID").val();
                        var feesCommid = $("#FeesCommID").val();

                        if (comm == '' && feesCommid == '') {
                            HDialog.Info("请选择签约主体或者费用主体!");
                            return false;
                        }
                        //alert($("#hiCommID").val());
                        window.location.href = '../ContractNew/ContractFeesSearchCreExcel.aspx?CommID=' + $("#hiCommID").val() + '&FeesCommID=' + $("#FeesCommID").val();
                    }
                }
            ];


            var frozenColumns = [[
                { field: 'OrganName', title: '区域名称', align: 'left', sortable: true, width: 100 },
                { field: 'ContractCommName', title: '项目名称（签约主体）', align: 'left', sortable: true, width: 120 },
                { field: 'FeesCommName', title: '项目名称（费用主体）', align: 'left', sortable: true, width: 120 },
                { field: 'NewContTypeName', title: '合同类别', align: 'left', sortable: true, width: 100 },
                { field: 'ContSign', title: '合同编号', align: 'left', sortable: true, width: 120 }
            ]];

            var Columns = [[

                { field: 'ContName', title: '合同名称', width: 220, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 220, align: 'left', sortable: true },
                { field: 'UnitName', title: '客户地址', width: 100, align: 'left', sortable: true },
                {
                    field: 'ContStartDate', title: '合同开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ContStartDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ContEndDate', title: '合同结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ContEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ContAmount', title: '合同金额', width: 100, align: 'left', sortable: true },
                { field: 'Margin', title: '合同保证金', width: 100, align: 'left', sortable: true },

                { field: 'IsExpire', title: '是否到期', width: 100, align: 'left', sortable: true },
                { field: 'ChangeType', title: '变更类别', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeesStateDate', title: '费用开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '费用结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount', title: '减免冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true } // 添加退款
            ]];


            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Columns,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
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
                    //rowStyler: function (index, row) {
                    //    if (row.DebtsAmount > 0) {


                    //        return 'color:red'; // return inline style
                    //    }
                    //},
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "FeesContList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
            }

            LoadList();


            function LoadListSearch() {
                $("#IsSelect").val(1);

                var comm = $("#hiCommID").val();
                var feesCommid = $("#FeesCommID").val();
                //alert(comm);
                //alert(feesCommid);
                //if (comm == '' || comm == '0') {
                //    HDialog.Info("请选择签约主体!");
                //    return false;
                //}
                //if (feesCommid == '' || feesCommid == '0') {
                //    HDialog.Info("请选择费用主体!");
                //    return false;
                //}

                if (comm == '' && feesCommid == '') {
                    HDialog.Info("请选择签约主体或者费用主体!");
                    return false;
                }

                LoadList();
            }


        </script>
    </form>
</body>
</html>

