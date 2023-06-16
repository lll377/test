<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPastDelBrowse.aspx.cs" Inherits="M_Main.ChargesNew.FeesPastDelBrowse" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script src="../jscript/Cache.js"></script>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
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
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 75%;
            margin-right: -1px;
            margin-top: -2px;
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
                <tr>
                    <%--<td class="TdTitle" style="height: 26px">管理项目
                    </td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input type="text" class="easyui-searchbox" searcher="SelComm" data-options="required:true"
                            id="CommName" name="CommName" runat="server" />
                    </td>--%>
                    <td class="TdTitle" style="height: 26px">费用项目</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input class="easyui-searchbox" id="CostName" data-options="editable:false" maxlength="50" name="CostName" searcher="SelCost" runat="server" dd="dd" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                    <td class="TdTitle">楼   宇</td>
                    <td class="TdContentSearch">
                        <select id="SelectBuildSNum" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectBuildSNum" onchange="javascript:SelectBuildSNum_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                        <input id="BuildSNum" name="BuildSNum" runat="server" type="hidden" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px">客户名称</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle" style="height: 26px">可选房号</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px">房屋编号</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle" style="height: 26px">车位编号 </td>
                    <td class="TdContentSearch" style="height: 26px">
                        <select id="HandID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="HandID" runat="server">
                            <option selected></option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle" style="height: 26px">费用时间从</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input id="EditBeginDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle" style="height: 26px">到</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input id="EditEndDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="EditEndDate"
                            runat="server"></td>
                </tr>

                <tr>
                    <td class="TdTitle" style="height: 26px">操作时间从</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input id="OptBeginDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="OptBeginDate"
                            runat="server"></td>
                    <td class="TdTitle" style="height: 26px">到</td>
                    <td class="TdContentSearch" style="height: 26px">
                        <input id="OptEndDate" class="Wdate"
                            onclick="WdatePicker()" type="text" maxlength="50" name="OptEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <%--<input type="button" class="button" value="查询" id="btnSearch" name="btnSearch" />--%>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" LoadList();">确定筛选</a>
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
                <div class="SearchContainer" id="TableContainer1"></div>
            </div>
        </div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

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
            function compute1(colName) {
                var rows = $('#TableContainer1').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

            //指定列求和
            function compute2(colName) {
                var rows = $('#TableContainer2').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

            function SelComm() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/CommDlg.aspx', '管理项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);

                        $('#CommName').searchbox("setValue", data.text);
                        $('#CommID').val(data.attributes.InPopedom);

                        $('#BuildSNum').val('');
                        $('#SelectBuildSNum').combobox({ data: [], valueField: 'BuildSNum', textField: 'BuildName' });

                        //获取当前项目下的楼宇
                        $.tool.DataGet('Choose', 'GetBuilding', "CommID=" + data.attributes.InPopedom,
                            function Init() {
                            },
                            function callback(_Data) {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {

                                    var BuildData = [];
                                    for (var i = 0; i < varObjects.length; i++) {

                                        var BuildName = varObjects[i].BuildName;
                                        var BuildSNum = varObjects[i].BuildSNum;

                                        BuildData.push({ "BuildName": BuildName, "BuildSNum": BuildSNum });

                                    }
                                    $('#SelectBuildSNum').combobox({
                                        data: BuildData,
                                        valueField: 'BuildSNum',
                                        textField: 'BuildName',
                                        onChange: function (n, o) {
                                            var data = $('#SelectBuildSNum').combobox('getData');
                                            if (data.length > 0) {
                                                for (var i = 0; i < data.length; i++) {
                                                    if (n == data[i].BuildSNum) {
                                                        //$('#BuildName').searchbox('setValue', data[i].BuildName);
                                                        $('#BuildSNum').val(data[i].BuildSNum);

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

                    }
                });
            }



            function SelCost() {
                var varReturn;

                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return false;
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
                    return false;
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
                    return false;
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
                    text: '筛选往期应收',
                    iconCls: 'icon-search',
                    handler: function () {

                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer1').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要删除的费用!');
                        }
                        else {
                            var isDelete = true;
                            for (var i = 0; i < rows.length; i++) {
                                var IsOperator;
                                IsOperator = FeesIsOperator(rows[i]);
                                var IsDel = IsOperator.split('|')[1];
                                if (IsDel.split(':')[0] != "true") {
                                    HDialog.Info('费用选择错误' + IsDel.split(':')[1]);
                                    isDelete = false;
                                    break;
                                }

                            }
                            if (isDelete) {

                                HDialog.Prompt("是否确认删除此费用", function () {
                                    FeesOperator(rows, "delete");
                                });
                            }
                        }
                    }
                }
            ];

            function LoadList() {
                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return false;
                }
                LoadFeesList();
            }


            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
            ]];

            var column = [[

                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

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
                { field: 'IsBankName', title: '托收状态', width: '50', align: 'center', sortable: true },
                { field: 'IsFreezeName', title: '冻结状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPropertyName', title: '垫付状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '预交状态', width: '50', align: 'center', sortable: true },
                { field: 'ChangeDate', title: '操作日期', width: 150, align: 'left', sortable: true },
                { field: 'UserName', title: '操作人', width: 100, align: 'left', sortable: true }


            ]];

            function InitTableHeight() {

                var AllHeight = $(window).height();



                var h = AllHeight;

                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");


                $('#HandID').combobox({
                    width: 148
                });


                $('#SelectRoomID').combobox({
                    width: 148
                });
                $('#SelectBuildSNum').combobox({
                    width: 148
                });


            }
            InitTableHeight();


            $(".tabs-container li").click(function () {

                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");

                $('#tab1').attr("refsel", "0");
                $('#tab2').attr("refsel", "0");

                $('#tab1').attr("class", "");
                $('#tab2').attr("class", "");

                switch ($(this).attr("name")) {

                    case "tab1":

                        $('#tab-1').attr("class", "tab-pane active");
                        $('#tab1').attr("refsel", "1");
                        $('#tab1').attr("class", "active");
                        LoadFeesList();
                        break;
                    case "tab2":

                        $('#tab-2').attr("class", "tab-pane active");
                        $('#tab2').attr("refsel", "1");
                        $('#tab2').attr("class", "active");
                        LoadFeesHisList();
                        break;
                }

            });

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

                if (vCommID == 0) {
                    vCommID = "-1";
                }

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesPast&Command=ListDel&' + $('#frmForm').serialize(),
                    method: "Get",
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
                    border: true,
                    width: "100%",
                    showFooter: true,
                    border: false,
                    // view: myview,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {

                        //var IsOperator;
                        //IsOperator = FeesIsOperator(rowData);

                        //var IsUpdate = IsOperator.split('|')[0];
                        //if (IsUpdate.split(':')[0] == "true") {

                        //    FeesOperator(rowData, "update");

                        //}
                        //else {
                        //    HDialog.Info(IsUpdate.split(':')[1]);
                        //}
                    }
                    //,
                    //rowStyler: function (index, row) {
                    //    if (row.FeesID == 'footer') {
                    //        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    //    }

                    //},
                    //onLoadSuccess: function (data) {
                    //    //加载页脚
                    //    $('#TableContainer1').datagrid('reloadFooter', [
                    //                {
                    //                    FeesID: 'footer',
                    //                    RoomSign: "<span style='color:red'>合计</span>",
                    //                    DueAmount: "<span style='color:red'>" + compute1("DueAmount") + "</span>",
                    //                    PrecAmount: "<span style='color:red'>" + compute1("PrecAmount") + "</span>",
                    //                    WaivAmount: "<span style='color:red'>" + compute1("WaivAmount") + "</span>",
                    //                    DebtsAmount: "<span style='color:red'>" + compute1("DebtsAmount") + "</span>",
                    //                    LateFeeAmount: "<span style='color:red'>" + compute1("LateFeeAmount") + "</span>"

                    //                }
                    //    ]);
                    //}
                });
                $('#SearchDlg').dialog('close');
            }

            function LoadFeesHisList() {
                var vCommID = $('#CommID').val();
                var vCustID = $('#CustID').val();
                var vRoomID = $('#RoomID').val();
                var vCostID = $('#CostID').val();
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesPast&Command=ListDelHis' + '&CommID=' + vCommID + '&CustID=' + vCustID + '&RoomID=' + vRoomID + '&CostID=' + vCostID,
                    method: "Get",
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

                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    rownumbers: true,
                    border: true,
                    width: "100%",
                    showFooter: true,

                    view: myview,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {

                        var IsOperator;
                        IsOperator = FeesIsOperator(rowData);

                        var IsUpdate = IsOperator.split('|')[0];
                        if (IsUpdate.split(':')[0] == "true") {

                            FeesOperator(rowData, "update");

                        }
                        else {
                            HDialog.Info(IsUpdate.split(':')[1]);
                        }
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableContainer2').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                RoomSign: "<span style='color:red'>合计</span>",
                                DueAmount: "<span style='color:red'>" + compute2("DueAmount") + "</span>",
                                PrecAmount: "<span style='color:red'>" + compute2("PrecAmount") + "</span>",
                                WaivAmount: "<span style='color:red'>" + compute2("WaivAmount") + "</span>",
                                DebtsAmount: "<span style='color:red'>" + compute2("DebtsAmount") + "</span>",
                                LateFeeAmount: "<span style='color:red'>" + compute2("LateFeeAmount") + "</span>"

                            }
                        ]);
                    }
                });

            }

            function FeesIsOperator(row) {

                var IsSplit = "false:false";
                var IsDel = "false:false";
                var IsUpdate = "false:false";

                var iCostGeneType = parseInt($('#CostGeneType').val());
                var strSysCostSign = row.SysCostSign;
                var strDueAmount = row.DueAmount;
                var strDebtsAmount = row.DebtsAmount;
                var strAccountFlag = row.AccountFlag;
                var strCostName = row.CostName;

                var strIsBank = row.IsBank;
                var strIsFreeze = row.IsFreeze;
                var strIsProperty = row.IsProperty;
                var strIsPrec = row.IsPrec;
                var strMeterSign = row.MeterSign;



                var iIncidentID = ToDecimal(row.IncidentID, 0);
                var iLeaseContID = ToDecimal(row.LeaseContID, 0);
                var iContID = ToDecimal(row.ContID, 0);


                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && ((iCostGeneType != 0 && ToDecimal(strAccountFlag, 0) == 100)
                        || (iCostGeneType == 0)
                    )
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                ) {

                    if (strMeterSign == "") {
                        IsUpdate = "true:true"
                        IsDel = "true:true";
                        IsSplit = "true:true";
                    }
                    else {
                        IsUpdate = "false:抄表类费用不允许修改";
                        IsDel = "false:抄表类费用不允许删除";
                        IsSplit = "false:抄表类费用不允许拆分";
                    }



                }
                else {

                    IsUpdate = "true";
                    IsDel = "true";
                    IsSplit = "true";
                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }

                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                    && (strMeterSign == "")
                ) {
                    IsSplit = "true:true";
                }
                else {

                    IsUpdate = "true:true";
                    IsDel = "true:true";
                    IsSplit = "true:true";

                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }

                if (strSysCostSign == "B0005" && strCostName != "补交") {

                    IsUpdate = "false:产权税费不允许修改";
                    IsDel = "false:产权税费不允许删除";
                    IsSplit = "false:产权税费不允许拆分";
                }


                //0 修改，1删除，2修改
                return IsUpdate + "|" + IsDel + "|" + IsSplit;
            }
            function FeesOperator(rows, type) {

                //var FeesRow = JSON.stringify(rowData);

                //$('#FeesRow').val(FeesRow);
                //$('#OperatorType').val(type);

                var FeesIDs = '';
                var CommIDs = '';

                for (var i = 0; i < rows.length; i++) {
                    FeesIDs = FeesIDs + rows[i].FeesID + ",";
                    CommIDs = rows[i].CommID;

                }

                FeesIDs = FeesIDs.substr(0, FeesIDs.length - 1);
                Cache.SetData("FeesIDs", FeesIDs);
                if (rows.length > 50) {
                    FeesIDs = "";
                }

                CommIDs = CommIDs;
                var cotent = "";
                var Title = "";
                var width = 900;
                var height = 450;
                switch (type) {


                    case "delete":
                        Title = "删除费用";
                        width = 600;
                        height = 250;
                        conent = "../DialogNew/FeesAmendDelDlg.aspx?FeesIDs=" + FeesIDs + "&IsPast=1&CommIDs=" + CommIDs + "";
                        break;


                }
                HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                    if (_Data != "") {
                        HDialog.Info(_Data);
                        LoadFeesList();
                    }
                });


            }


            LoadFeesList();


            $("#btnSearch").click(function () {

                //$(".tabs-container li").each(function (index, item) {

                //    $(item).attr("refsel", "0");
                //    $(item).attr("class", "");
                //    if ($(item).attr("name") == "tab1") {
                //        $(item).attr("refsel", "1");
                //        $(item).attr("class", "active");
                //    }
                //});

                //$('#tab-1').attr("class", "tab-pane active");
                //$('#tab-2').attr("class", "tab-pane");                

                $(('#tab-1').attr("refsel") == "1")
                {
                    LoadFeesList();
                }
                $(('#tab-2').attr("refsel") == "1")
                {
                    LoadFeesHisList();
                }

            });

        </script>
    </form>
</body>
</html>
