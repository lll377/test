<%@ Page Language="c#" CodeBehind="PreCostsOffsetSearch.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.PreCostsOffsetSearch" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>PreCostsOffsetSearch</title>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script language="javascript">
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="PreCostsOffsetSearch" method="post" runat="server">
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server">
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />

        <input class="button" id="btnPrint" type="button" value="打印" style="display: none;" name="btnPrint" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 950px; height: 300px; padding: 10px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">费用时间</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" style="width: 140px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditBeginDate" runat="server" />
                        到
                        <input id="EditEndDate" style="width: 140px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditEndDate" runat="server" />
                    </td>
                    <td class="TdTitle">冲抵时间</td>
                    <td class="TdContentSearch">
                        <input id="ChongdiBeginDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="ChongdiBeginDate" runat="server" />
                        到
                        <input id="ChongdiEndDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="ChongdiEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="CustName" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="RoomSign" data-options="editable:false,panelHeight: 'auto'" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">冲抵范围</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="DrPreRange" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="单户预交冲抵">单户预交冲抵</asp:ListItem>
                            <asp:ListItem Value="批量预交冲抵">批量预交冲抵</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" style="width: 83%;" name="CostName" searcher="SelCost" data-options="editable:false" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" />
                    </td>
                    <td class="TdTitle"><%--预交类别--%></td>
                    <td class="TdContentSearch">
                        <select id="SelType" style="display:none" name="SelType" runat="server">
                            <option>全部</option>
                            <option value="2">预存</option>
  <%--                          <option value="1">预收</option>--%>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否垫付</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">是否撤销</td>
                    <td class="TdContentSearch">
                        <select id="IsDel" name="IsDel" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <input type="text" id="ParkName" style="width: 83%;" runat="server" />
                    </td>
                    <td class="TdTitle">冲销时间</td>
                    <td class="TdContentSearch">
                        <input id="WriteOffBeginDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="WriteOffBeginDate" runat="server" />
                        到
                        <input id="WriteOffEndDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="WriteOffEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">确定筛选</a>&nbsp;&nbsp;
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>--%>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>

<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        $('#hiIsSQLData').val('-1');
        LoadList();
    });

    function SelCost() {
        var varReturn;

        var w = 700;
        var h = 400;


        HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("\t");

                $('#CostID').val(varObjects[0]);
                $('#CostName').searchbox('setValue', varObjects[1]);

            }
        });

        return false;
    }

    function LoadData() {
        $('#hiIsSQLData').val('1');
        LoadList();
    }
    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var frozenColumns = [[
        { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
    ]];

    var cmenuList = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];

    var cmenuColumnList = [
        ['a1', '客户类别', '联系电话'],
        ['a2', '管家', '组团区域', '楼宇名称', '房屋建筑面积', '房屋套内面积', '房屋公摊面积', '房屋花园面积', '房屋地下室面积', '房屋计费面积', '房屋产权性质', '楼宇类型',
            '房屋使用性质', '使用状态', '交房状态', '房屋实际交房时间', '房屋考核条件'],
        ['a3', '车位区域', '车位路址', '车位编号', '车位面积', '车位计费面积', '车位类别', '车位类型', '车位产权性质', '车位使用状态', '车位实际交付时间', '车位考核条件'],
        ['a4', '计费方式', '计算方式', '收费标准', '计算周期'],
        ['a5', '起度', '止度', '使用量']
    ]

    var cmenu;
    function createColumnMenu() {
        cmenu = $('<div/>').appendTo('body');
        cmenu.menu({
            onClick: function (item) {
                var j = 0
                for (var i = 0; i < cmenuList.length; i++) {
                    if (item.name == cmenuList[i]) {
                        j = i;
                        break;
                    }
                }
                var cmd = 'hideColumn';
                if (item.iconCls == 'icon-ok') {
                    cmd = 'hideColumn';
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-empty'
                    });
                } else {
                    cmd = 'showColumn';
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-ok'
                    });
                }
                for (var k = 0; k < cmenuColumnList[j].length; k++) {
                    $('#TableContainer').datagrid(cmd, cmenuColumnList[j][k]);
                }
            }
        });

        for (var i = 0; i < cmenuList.length; i++) {
            var field = cmenuList[i];
            cmenu.menu('appendItem', {
                text: field,
                name: field,
                iconCls: 'icon-empty'
            });
        }
    }

    var column = [
        [
            { title: '客户信息', field: 'a1', colspan: 2, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { field: 'CostName', rowspan: 2, title: '费用名称', width: 170, align: 'center', sortable: true },
            { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { field: '数量1', rowspan: 2, title: '数量1', align: 'center', sortable: true, fixed: true, width: 100 },
            { field: '数量2', rowspan: 2, title: '数量2', align: 'center', sortable: true, fixed: true, width: 100 },
            { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

            { field: '增值税率', rowspan: 2, title: '税率', width: 100, align: 'left', sortable: true },
            { field: '费用日期', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },
            {
                field: 'FeesDueDate', rowspan: 2, title: '应收日期', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FeesStateDate', rowspan: 2, title: '费用开始时间', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FeesEndDate', rowspan: 2, title: '费用结束时间', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PreDate', rowspan: 2, title: '预交冲抵日期', width: 160, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PreDate, "yyyy-MM-dd HH:mm:ss");
                    return str;
                }
            },
            { field: 'PreUsername', rowspan: 2, title: '冲抵人', width: 100, align: 'left', sortable: true },
            { field: 'StanName', rowspan: 2, title: '标准名称', width: 170, align: 'left', sortable: true },
            { colspan: 3, title: '应冲抵金额', width: 100, align: 'left', sortable: true },
            { field: 'OldPrecAmount', rowspan: 2, title: '原预交余额', width: 100, align: 'left', sortable: true },
            { field: 'OffsetAmount', rowspan: 2, title: '冲抵总金额', width: 100, align: 'left', sortable: true },
            { field: 'NewPrecAmount', rowspan: 2, title: '预交余额', width: 100, align: 'left', sortable: true },
            { field: 'CostName', rowspan: 2, title: '冲抵项目', width: 170, align: 'left', sortable: true },
            { colspan: 3, title: '冲抵金额', width: 100, align: 'left', sortable: true },
            { field: 'CommisionCostName', rowspan: 2, title: '冲抵佣金项目', width: 100, align: 'left', sortable: true },
            { field: 'CommissOffsetAmount', rowspan: 2, title: '冲抵佣金金额', width: 100, align: 'left', sortable: true },
            { field: 'TakeWiseName', rowspan: 2, title: '处理方式', width: 100, align: 'left', sortable: true },
            { field: 'IsPropertyName', rowspan: 2, title: '是否垫付', width: 100, align: 'left', sortable: true },
            { field: 'PreRange', rowspan: 2, title: '冲抵范围', width: 100, align: 'left', sortable: true },
            { field: 'DelUserName', rowspan: 2, title: '撤销人', width: 100, align: 'left', sortable: true },
            {
                field: 'DelDate', rowspan: 2, title: '撤销时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.DelDate, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'ChangeMemo', rowspan: 2, title: '撤销原因', width: 100, align: 'left', sortable: true },
            {
                field: 'IsWriteOff', rowspan: 2, title: '是否冲销', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var strIsWriteOff = "";
                    if (row.IsWriteOff == 'True') {
                        strIsWriteOff = "是";
                    } else if (row.IsWriteOff == 'False') {
                        strIsWriteOff = "否";
                    }
                    return strIsWriteOff;
                }
            },
            {
                field: 'WriteOffAuditDate', rowspan: 2, title: '冲销时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.WriteOffAuditDate, "yyyy-MM-dd");
                    return str;
                }
            }

        ], [

            //客户信息
            { field: '客户类别', title: '客户类别', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '联系电话', title: '联系电话', width: 100, align: 'center', sortable: true, hidden: true },

            //房屋信息
            { field: '管家', title: '管家', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '组团区域', title: '组团区域', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '楼宇名称', title: '楼宇名称', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋建筑面积', title: '建筑面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋套内面积', title: '套内面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋公摊面积', title: '公摊面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋花园面积', title: '花园面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋地下室面积', title: '地下室面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '楼宇类型', title: '楼宇类型', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '房屋使用性质', title: '使用性质', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '交房状态', title: '交房状态', width: 100, align: 'center', sortable: true, hidden: true },
            {
                field: '房屋实际交房时间', title: '实际交房时间', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                    var str = formatDate(row.房屋实际交房时间, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: '房屋考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

            //车位信息
            { field: '车位区域', title: '车位区域', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位路址', title: '车位路址', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位编号', title: '车位编号', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位面积', title: '车位面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位类别', title: '车位类别', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位类型', title: '车位类型', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '车位使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
            {
                field: '车位实际交付时间', title: '实际交付时间', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                    var str = formatDate(row.车位实际交付时间, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: '车位考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

            //收费标准
            { field: '计费方式', title: '计费方式', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '计算方式', title: '计算方式', width: 150, align: 'center', sortable: true, hidden: true },
            { field: '收费标准', title: '收费标准', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '计算周期', title: '计算周期', width: 100, align: 'center', sortable: true, hidden: true },

            //抄表信息
            { field: '起度', title: '起度', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '止度', title: '止度', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '使用量', title: '使用量', width: 100, align: 'center', sortable: true, hidden: true },

            //应冲抵金额
            { field: 'DebtsAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
            { field: 'DebtsAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
            { field: 'DebtsAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

            //冲抵金额
            { field: 'PaidOffsetAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
            { field: 'PaidOffsetAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
            { field: 'PaidOffsetAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 }
        ]
    ];

    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        //{
        //    text: '打印',
        //    iconCls: 'icon-print',
        //    handler: function () {
        //        document.getElementById('btnPrint').click();
        //    }
        //}, '-',
        {
            text: 'Excel输出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = "../ChargesNew/PreCostsOffsetSearchCre.aspx";
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
            view: myview,
            frozenColumns: frozenColumns,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            freezeRow: 1,
            toolbar: toolbar,
            showFooter: true,
            sortOrder: "asc",
            onHeaderContextMenu: function (e, field) {
                e.preventDefault();
                if (!cmenu) {
                    createColumnMenu();
                }
                cmenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchprecostsoffset", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.IID == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('PrecReceFee', "searchprecostsoffsetSum", $('#PreCostsOffsetSearch').serialize(),
                    function Init() {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                PaidOffsetAmount: "<span style='color:red'>0</span>",
                                PaidOffsetAmountTax: "<span style='color:red'>0</span>",
                                PaidOffsetAmountTaxAmount: "<span style='color:red'>0</span>"

                            }
                        ]);
                    },
                    function callback(_Data) {
                        var Data = _Data.split('|');

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                PaidOffsetAmount: "<span style='color:red'>" + Data[0] + "</span>",
                                PaidOffsetAmountTax: "<span style='color:red'>" + Data[1] + "</span>",
                                PaidOffsetAmountTaxAmount: "<span style='color:red'>" + Data[2] + "</span>"
                            }
                        ]);

                        $('#CustName').searchbox("setValue", '');
                        $('#CustID').val('');
                        $('#RoomSign').searchbox("setValue", '');
                        $('#RoomID').val('');
                        $('#CostName').searchbox("setValue", '');
                        $('#CostID').val('');
                    })
            }
        });
        $("#SearchDlg").dialog("close");


    }


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

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#PreCostsOffsetSearch').serialize(),
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

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
                                            $('#RoomID').val(data[i].RoomID);
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
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }
    //费用项目
    $("#BtnSelCost").click(function () {
        var CostName = $('#CostName').val();
        var OPType = $('#hiOPType').val();

        if (OPType != "update") {
            CostName = "";
        }
        var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName;
        HDialog.Open(800, 600, conent, '费用标准选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostID').val(data.attributes.CostID);
            $('#CostName').val(data.attributes.CostName);
            $('#StanID').val(data.attributes.StanID);
            $('#StanName').val(data.attributes.StanName);
        });
    });
    //清空查询条件
    function CancelParm() {
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $("#RoomSign").searchbox("setValue", '');
        $("#EditBeginDate").datebox("setValue", '');
        $("#EditEndDate").datebox("setValue", '');
        $("#ChexiaoBeginDate").datebox("setValue", '');
        $("#ChexiaoEndDate").datebox("setValue", '');
    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", '83%');
    });

</script>
