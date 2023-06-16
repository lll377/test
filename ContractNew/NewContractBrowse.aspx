<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewContractBrowse.aspx.cs" Inherits="M_Main.ContractNew.NewContractBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm">
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <input id="IsClose" name="IsClose" runat="server" type="hidden" value="0" />
        <input id="IsDelete" name="IsDelete" runat="server" type="hidden" value="0" />
        <input id="hiCommID" name="hiCommID" runat="server" type="hidden" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 900px; height: 270px;">
            <table style="width: 100%;" class="DialogTable">

                <tr>
                    <td class="TdTitle" style="height: 26px;">项目名称</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="CommName" class="easyui-searchbox" searcher="SelCommInfo" data-options="editable:false"
                            name="CommName" runat="server" /><input id="hiCommName" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCommName" runat="server" /><input id="CommID" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CommID" runat="server" /></td>
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
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px;">客户名称</td>
                    <td class="TdContentSearch" style="height: 26px;">
                        <input id="CustName" data-options="editable:false"
                            name="CustName" class="easyui-validatebox" runat="server" />
                        <input id="CustID" style="width: 8px; height: 19px" type="hidden"
                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                size="1" name="hiCustName" runat="server" /></td>

                    <td class="TdTitle" style="height: 26px;">对方单位</td>
                    <td class="TdContent" style="height: 26px;">
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" /><input class="easyui-validatebox" id="UnitName"
                                    name="UnitName" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">联系人</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" id="Vender" name="Vender" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">联系电话</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" id="VenderTel" name="VenderTel"
                            runat="server"></td>
                </tr>
                <tr>

                    <td class="TdTitle" style="height: 26px;">开始时间</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContStartBeginDate"
                            onclick="WdatePicker()" name="ContStartDate" runat="server"></td>


                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContStartEndDate"
                            onclick="WdatePicker()" name="ContStartEndDate" runat="server">
                    </td>

                    <td class="TdTitle" style="height: 26px;">合同期限</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" id="ContractPeriod" name="ContractPeriod" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">合同金额</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" style="width: 40%" id="ContBeginAmount" name="ContBeginAmount"
                            runat="server">到<input class="easyui-validatebox" style="width: 40%" id="ContEndAmount" name="ContEndAmount"
                                runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px;">结束时间</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContEndBeginDate"
                            onclick="WdatePicker()" name="ContEndBeginDate" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" data-options="required:true" onkeypress="CheckDate();" id="ContEndEndDate"
                            onclick="WdatePicker()" name="ContEndEndDate" runat="server">
                    </td>

                    <td class="TdTitle" style="height: 26px;">保证金</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="easyui-validatebox" style="width: 40%" id="MarginBegin" name="MarginBegin" runat="server">
                        到
                        <input class="easyui-validatebox" style="width: 40%" id="MarginEnd" name="MarginEnd" runat="server">
                    </td>
                    <td class="TdTitle" style="height: 26px;">机构部门/负责人</td>
                    <td class="TdContentSearch" style="height: 28px; vertical-align: top; padding-bottom: 3px">
                        <input class="easyui-searchbox" searcher="SelDutyDepUserName" id="DutyDepUserName" data-options="editable:false"
                            name="DutyDepUserName" runat="server"><input id="DutyUserCode" style="height: 22px; width: 16px" type="hidden" size="1" name="DutyUserCode"
                                runat="server"><input id="DutyDepCode" style="height: 22px; width: 16px" type="hidden" size="1" name="DutyDepCode"
                                    runat="server"><input id="hiDutyDepUserName" style="height: 22px; width: 16px" type="hidden" name="hiDutyDepUserName"
                                        runat="server">
                    </td>

                </tr>
                <tr>

                    <td class="TdTitle">签约时间从</td>
                    <td class="TdContent">
                        <input class="Wdate" onkeypress="CheckDate();" id="SignBeginDate" onclick="WdatePicker()"
                            name="SignBeginDate" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" onkeypress="CheckDate();" id="SignEndDate" onclick="WdatePicker()"
                            name="SignEndDate" runat="server"></td>
                    <td class="TdTitle">是否到期</td>
                    <td class="TdContent">
                        <select id="IsExpired" name="IsExpired" runat="server">
                            <option></option>
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select></td>
                    <td class="TdTitle">变更类型</td>
                    <td class="TdContent">
                        <select id="ChangeType" name="ChangeType" runat="server">
                            <option value="全部">全部</option>
                            <option value="未变更">未变更</option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                            <option value="关闭">关闭</option>
                        </select></td>
                    <%--<td class="TdTitle" style="display: none;">预警时间</td>
                    <td class="TdContent" style="display: none;">
                        <input id="AdvanceDay" style="width: 50%" value="0" name="AdvanceDay" runat="server">天到期</td>--%>
                </tr>
                <tr>
                    <td class="TdTitle">发起时间从</td>
                    <td class="TdContent">
                        <input class="Wdate" onkeypress="CheckDate();" id="RegDateBegin" onclick="WdatePicker()"
                            name="RegDateBegin" runat="server"></td>
                    <td class="TdTitle" style="height: 26px;">到</td>
                    <td class="TdContent" style="height: 26px;">
                        <input class="Wdate" onkeypress="CheckDate();" id="RegDateEnd" onclick="WdatePicker()"
                            name="RegDateEnd" runat="server"></td>
                    <td class="TdTitle">审批状态</td>
                    <td class="TdContent">
                        <select id="IsAuditing" name="IsAuditing" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="未启动">未启动</option>
                            <option value="未审核">未审核</option>
                            <option value="审核中">审核中</option>
                            <option value="已审核">已审核</option>
                        </select></td>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContent">
                        <input id="RegUserName" name="RegUserName" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>

        <script type="text/javascript" src="../jscript/CloseAjaxCache.js"></script>
        <script type="text/javascript" type="text/javascript">
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

            function SelCommInfo() {
                if ($('#hiCommID').val() != '') {
                    return;
                }
                else {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setText", arrRet.name);
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

            function ViewDetail(title, OpType, ID) {
                var conent = "";
                switch (OpType) {
                    case "Insert":
                        conent = "../ContractNew/ContractManage.aspx?OPType=Insert";
                        break;
                    case "Edit":
                        conent = '../ContractNew/ContractManage.aspx?OpType=' + OpType + '&ContID=' + ID
                        break;
                    case "Detail":
                        conent = '../ContractNew/ContractManage.aspx?OpType=' + OpType + '&ContID=' + ID
                        break;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, title, true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增合同信息", 'Insert', 0, 'manage');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelected');
                        if (rows == null) {
                            HDialog.Info('请选择要删除的合同!');
                            return;
                        }
                        else {
                            if (rows.IsAuditing == "审核中" || rows.IsAuditing == "已审核") {
                                HDialog.Info('合同已审核或者审核中不允许删除!');
                                return;
                            }
                            $('#AllData').val(JSON.stringify(rows));
                            $.tool.DataPost('Contract', 'ContractDelete', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var result = _Data.split('|')[0];
                                    var memo = _Data.split('|')[1];
                                    if (result == "true") {
                                        HDialog.Info('删除成功');
                                    }
                                    else { HDialog.Info(memo); }
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
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }
            ];
            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
                { field: 'NewContTypeName', title: '合同类别', align: 'left', sortable: true, width: 100 },
                //{
                //    field: 'ContSort', title: '合同类型', align: 'left', sortable: true, width: 100,
                //    formatter: function (value, row, index) {
                //        var str = "";
                //        switch (row.ContSort) {
                //            case "1":
                //                str = "收款合同";
                //                break;
                //            case "2":
                //                str = "付款合同";
                //                break;
                //            case "3":
                //                str = "租赁合同";
                //                break;
                //            case "4":
                //                str = "其它合同";
                //                break;
                //        }
                //        return str;
                //    }
                //},
                {
                    field: 'ContSign', title: '合同编号', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改合同','Edit'," + row.ContID + ",'manage');\">" + row.ContSign + "</a>";
                        return str;
                    }
                }
            ]];
            var Columns = [[
                { field: 'ContName', title: '合同名称', width: 240, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 240, align: 'left', sortable: true },
                //{ field: 'UnitName', title: '对方单位', width: 100, align: 'left', sortable: true },
                { field: 'Vender', title: '联系人', width: 100, align: 'left', sortable: true },
                { field: 'VenderTel', title: '联系电话', width: 100, align: 'left', sortable: true },
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
                { field: 'ContractPeriod', title: '合同期限', width: 100, align: 'left', sortable: true },
                { field: 'ContAmount', title: '合同金额', width: 100, align: 'left', sortable: true },
                //{ field: 'Margin', title: '合同保证金', width: 100, align: 'left', sortable: true },
                { field: 'DutyDepName', title: '机构部门', width: 100, align: 'left', sortable: true },
                { field: 'DutyUserName', title: '负责人', width: 100, align: 'left', sortable: true },
                {
                    field: 'SignDate', title: '签约时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.SignDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'IsExpire', title: '是否到期', width: 100, align: 'left', sortable: true },
                { field: 'RegUserName', title: '发起人', width: 100, align: 'left', sortable: true },
                { field: 'RegDate', title: '发起时间', width: 100, align: 'left', sortable: true },
                { field: 'IsAuditing', title: '审批状态', width: 100, align: 'left', sortable: true },
                { field: 'ChangeType', title: '变更类型', width: 100, align: 'left', sortable: true }
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
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    rowStyler: function (index, row) {
                        if (row.IsExpire == '是') {
                            return 'color:red'; // return inline style
                        }
                    },
                    onBeforeLoad: function (param) {
                        //debugger;
                        param = $.JQForm.GetParam("Contract", "ContractList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();
        </script>
    </form>
</body>
</html>
