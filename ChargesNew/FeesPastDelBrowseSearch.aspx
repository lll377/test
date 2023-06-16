<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPastDelBrowseSearch.aspx.cs" Inherits="M_Main.ChargesNew.FeesPastDelBrowseSearch" %>


<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/framesearch.css" />
    <link rel="stylesheet" href="../css/button.css" />

    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../jscript/Dialog.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/format.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style>
        body {
            background-color: #F3F3F4;
            margin: 0px;
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            font-family: 微软雅黑;
            background-color: #ffffff;
        }

        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .Container {
            width: 100%;
            height: auto;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            width: 25%;
            padding-right: 5px;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 73.5%;
        }

        textarea {
            height: 22px;
            resize: none;
            border: 1px solid #cccccc;
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">

        <input type="hidden" name="CostGeneType" id="CostGeneType" runat="server" />

        <input type="hidden" name="FeesRow" id="FeesRow" runat="server" />
        <input type="hidden" name="OperatorType" id="OperatorType" runat="server" />
        <input id="CommID" style="width: 16px; height: 22px" type="hidden" size="1" name="CommID"
            runat="server" />
        <input id="hidID" type="hidden" size="2" name="hidID" runat="server" />
        <input id="OrganCode" type="hidden" size="2" name="OrganCode" runat="server" />
        <input id="OrganName" type="hidden" size="2" name="OrganName" runat="server" />
        <input id="InPopedom" type="hidden" name="InPopedom" runat="server" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 270px;">
            <table class="DialogTable" width="100%">
                <%--<tr>
                    <td class="TdTitle">管理项目
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="easyui-searchbox" searcher="SelComm" data-options="required:true"
                            id="CommName" name="CommName" runat="server" />
                    </td>
                </tr>--%>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">车位编号 </td>
                    <td class="TdContentSearch">
                        <select id="HandID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="HandID" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" data-options="editable:false" maxlength="50" name="CostName" searcher="SelCost" runat="server" dd="dd" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">应收时间从</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="EditEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">操作时间从</td>
                    <td class="TdContentSearch">
                        <input id="OptBeginDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="OptBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="OptEndDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="OptEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadFeesList();">确定筛选</a>
                        <%-- <input type="button" class="button" value="查询" id="btnSearch" name="btnSearch" />
                        &nbsp;&nbsp;
                         <input type="button" class="button" value="新增" id="btnSave" name="btnSave" runat="server" />--%>
                    </td>
                </tr>
            </table>

        </div>


        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft" style="height: 500px;">
                <div id="TableContainerTree">
                </div>
            </div>
            <div id="ContainerRight" class="ContainerRight">
                <div style="width: 100%; background-color: #cccccc" id="TableContainer">
                </div>
            </div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            var column;
            column = [[
                {
                    field: 'text', title: '项目列表', align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\">" + row.text + "</a>";
                        return str;
                    }
                },
                {
                    field: 'InPopedom', title: '小区ID', align: 'left', formatter: function (value, row, index) {
                        var str = row.attributes.InPopedom;
                        if (str == 0) str = '';
                        return str;
                    }
                }
            ]];

            var IsCollapseAll = false;
            var toolbar = [
                {
                    text: '展开/折叠',
                    iconCls: 'icon-redo',
                    handler: function () {
                        if (IsCollapseAll == true) {
                            $('#TableContainerTree').treegrid('expandAll');
                            IsCollapseAll = false;
                        }
                        else {
                            $('#TableContainerTree').treegrid('collapseAll');
                            IsCollapseAll = true;
                        }
                    }
                }
            ];

            function LoadListTree() {
                $("#TableContainerTree").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Organ&Command=GetOrganTreeGridList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: false,
                    rownumbers: true,
                    IsCustomHead: false,
                    cascadeCheck: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    cascadeCheck: true,
                    onClickRow: function (node) {
                        //$("#OrganCode").val(node.attributes.OrganCode);
                        if (parseInt(node.attributes.InPopedom) > 0) {
                            $("#CommID").val(node.attributes.InPopedom);
                            $("#OrganName").val(node.text);
                        } else {
                            $("#CommID").val('');
                            $("#OrganName").val('');
                        }
                        LoadList();
                    }
                });
            }
            LoadListTree();


            function InitFunction() {
                var h = $(window).height();
                $("#ContainerLeft").css("height", h + "px");
                $("#ContainerRight").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

            function SelComm() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelComm.aspx', '管理项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setValue", arrRet.name);
                    }
                });
            }

            function SelCost() {
                var varReturn;

                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return;
                }

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, "../dialogNew/MultiCorpCommCostDlg.aspx" + "?CommID=" + vCommID, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostID').val(varObjects[0]);
                        $('#CostName').searchbox('setValue', varObjects[1]);


                        return true;
                    }
                });

                return false;
            }

            function SelCust() {

                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx" + "?CommID=" + vCommID;

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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(buildArea);

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
                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx" + "?CommID=" + vCommID;

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });

            }


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
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var vCommID = $('#CommID').val();
                        if (vCommID == "-1" || !vCommID) {
                            HDialog.Info("请选择管理项目,此项不能为空!");
                            return;
                        }
                        window.location.href = '../ChargesNew/FeesPastDelBrowseSearchCreExcel.aspx?CommID=' + $('#CommID').val();
                    }
                }
            ];



            var frozenColumns = [[
                { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
            ]];

            var column = [[


                { field: 'CostSNum', title: '费用序号', width: 80, align: 'left', sortable: true },
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
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'ChangeTime', title: '删除日期', width: 150, align: 'left', sortable: true },
                { field: 'ChangeMemo', title: '删除原因', width: 150, align: 'left', sortable: true },
                { field: 'UserName', title: '操作人', width: 100, align: 'left', sortable: true }


            ]];

            function InitTableHeight() {
                var h = $(window).height();

                $("#TableContainer").css("height", h + 'px');

                $('#HandID').combobox({
                    width: 148
                });


                $('#SelectRoomID').combobox({
                    width: 148
                });



            }
            InitTableHeight();

            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });



            function LoadFeesList() {
                var vCommID = $('#CommID').val();
                var vCustID = $('#CustID').val();
                var vRoomID = $('#RoomID').val();
                var vCostID = $('#CostID').val();
                if (vCommID == '') {
                    vCommID = "-1";
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesPast&Command=ListDelHis' + '&CommID=' + vCommID + '&CustID=' + vCustID + '&RoomID=' + vRoomID + '&CostID=' + vCostID,
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    toolbar: toolbar,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    rownumbers: true,
                    border: false,
                    width: "100%",
                    showFooter: true,
                    view: myview,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {

                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                RoomSign: "<span style='color:red'>全部合计</span>",
                                DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                                PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                                WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                                DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>",
                                LateFeeAmount: "<span style='color:red'>" + compute("LateFeeAmount") + "</span>"

                            }
                        ]);
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            LoadFeesList();






        </script>
    </form>
</body>
</html>
