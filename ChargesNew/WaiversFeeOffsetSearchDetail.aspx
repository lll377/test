<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeOffsetSearchDetail.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeOffsetSearchDetail" %>

<!DOCTYPE html>

<html>
<head>
    <title>WaiversFeeOffsetSearch</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body onload="Win_OnLoad()">
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnPrint" type="button" value="打印" style="display: none;" name="btnPrint" runat="server">
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server" />
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <input class="button_sel" id="btnGetHandID" type="button" value=" " name="btnGetHandID" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 850px; height: 417px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">减免冲抵时间</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditBeginDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditEndDate" runat="server" />
                </tr>
                <tr id="hideDelBeginDate" style="display: none">
                    <td class="TdTitle">撤销时间</td>
                    <td class="TdContentSearch">
                        <input id="DelBeginDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="DelBeginDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="DelEndDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="DelBeginDate" runat="server" />
                </tr>
                <tr>
                    <td class="TdTitle">费用日期从</td>
                    <td class="TdContentSearch">
                        <input id="StartFeesDueDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="StartFeesDueDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EndFeesDueDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EndFeesDueDate" runat="server" />
                </tr>

                <tr>
                    <td class="TdTitle">冲销时间从</td>
                    <td class="TdContentSearch">
                        <input id="StartAuditDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="StartAuditDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EndAuditDate" style="width: 83%;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EndAuditDate" runat="server" />
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" id="CustTypeID" name="CustTypeID" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" style="width: 83%;" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" style="width: 83%;" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <%--<select id="HandID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="HandID" runat="server">
                            <option selected></option>
                        </select>--%>
                        <input id="ParkName" type="text" name="ParkName" style="width: 82%;" runat="server">
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="CostName" data-options="editable:false" name="CostName" searcher="SelCost" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">减免原因</td>
                    <td class="TdContent">
                        <input id="WaivReason" type="text" name="WaivReason" style="width: 82%;" runat="server">
                    </td>
                    <td class="TdTitle">减免备注</td>
                    <td class="TdContent">
                        <input id="WaivMemo" type="text" name="WaivMemo" style="width: 82%;" runat="server">
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">减免业务类型</td>
                    <td class="TdContent">
                        <select id="WaiversCategory" class="easyui-combobox" name="WaiversCategory" runat="server" style="width: 82%;">
                            <option value=""></option>
                            <option value="政策性减免">政策性减免</option>
                            <option value="非政策性减免">非政策性减免</option>
                        </select></td>
                    <td class="TdTitle">是否撤销</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" id="IsDel" name="IsDel" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select></td>
                </tr>


                <tr>
                    <%--            <td class="TdTitle">协议是否开始结算</td>
                    <td class="TdContentSearch"> 
						 <select class="easyui-combobox" id="isoffset" name="isoffset" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>

                    </td>--%>
                    <td class="TdTitle">是否冲销</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" id="WriteOffIsAudit" name="WriteOffIsAudit" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="1">是</option>
                            <option value="4">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
<script type="text/javascript">

    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    $(function () {
        LoadList();
        $("#btnGetHandID").hide();
        $('#IsDel').combobox({
            onSelect: function () {
                if ($('#IsDel').combobox('getValue') == 1) {
                    $("#hideDelBeginDate").attr("style", "");
                }
                else {
                    $("#hideDelBeginDate").attr("style", "display:none");
                }
            }
        });
    });
    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    InitFunction();

    var cmenuList = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];
    var cmenuColumnList = [
        ['a1', '客户类别', '联系电话'],
        ['a2', , '管家', '组团区域', '楼宇名称', '房屋建筑面积', '房屋套内面积', '房屋公摊面积', '房屋花园面积', '房屋地下室面积', '房屋计费面积', '房屋产权性质', '楼宇类型',
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

    var frozenColumns = [[
        { field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true, fixed: true },
        { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true, fixed: true }
    ]];

    var column = [[

        { title: '客户信息', field: 'a1', colspan: 2, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
        { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
        { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
        { field: 'WaiversCategory', rowspan: 2, title: '减免业务类型', width: 100, align: 'left', sortable: true },
        { field: 'CostName', rowspan: 2, title: '费用名称', width: 170, align: 'left', sortable: true },
        { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

        { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

        { field: '增值税率', rowspan: 2, title: '税率', align: 'left', sortable: true, width: 100 },
        { field: '费用日期', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },
        {
            field: 'FeesDueDate', rowspan: 2, title: '应收日期', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesStateDate', rowspan: 2, title: '费用开始时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesEndDate', rowspan: 2, title: '费用结束时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },

        //{ field: 'PerStanAmount', rowspan: 2, title: '费用标准', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'CreYear', rowspan: 2, title: '减免年份', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'CreMonth', rowspan: 2, title: '减免月份', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'WaivReason', rowspan: 2, title: '减免原因', width: 100, align: 'left', sortable: true, fixed: true },
        //{ field: 'WaivMemo', rowspan: 2, title: '备注', width: 100, align: 'left', sortable: true, fixed: true },
        //        { field: 'WaivAgreement', rowspan: 2, title: '协议编号', width: 100, align: 'left', sortable: true },
        { field: 'UserName', rowspan: 2, title: '减免登记人', width: 100, align: 'left', sortable: true, fixed: true },
        {
            field: 'WaivCreDate', rowspan: 2, title: '登记时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivCreDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'IsWaivName', rowspan: 2, title: '是否减免', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'OldWaivAmount', rowspan: 2, title: '未减免金额', width: 100, align: 'left', sortable: true, fixed: true },
        { colspan: 3, title: '已减免金额', width: 100, align: 'left', sortable: true, fixed: true },

        {
            field: 'WaivDate', rowspan: 2, title: '冲抵时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivDate, "yyyy-MM-dd");
                return str;
            }
        },

        {
            field: 'DelDate', rowspan: 2, title: '撤销时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.DelDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DelUserName', rowspan: 2, title: '撤销人', width: 90, align: 'left', sortable: true, fixed: true },
        {
            field: 'WriteOffIsAudit', rowspan: 2, title: '是否冲销', width: 90, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = row.WriteOffIsAudit == "1" ? "是" : "否"
                return str;
            }

        },
        {
            field: 'AuditDate', rowspan: 2, title: '冲销时间', width: 90, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.AuditDate, "yyyy-MM-dd");
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

        //已减免金额
        { field: 'OffsetAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
        { field: 'OffsetAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
        { field: 'OffsetAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 }
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
        {
            text: '打印',
            iconCls: 'icon-print',
            handler: function () {
                document.getElementById('btnPrint').click();
            }
        }, '-',
        {
            text: 'Excel输出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = "../ChargesNew/WaiversFeeOffsetSearchCre.aspx";
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
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            view: myview,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
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
                param = $.JQForm.GetParam("WaiversFees", "getwaiversfeeoffsetlist", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.test == 'footer') {
                    return 'background-color:#F4F4F4;border:none;';
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('WaiversFees', "getwaiversfeeoffsetlistSum", $('#frmForm').serialize(),
                    function Init() {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                test: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                OffsetAmount: "<span style='color:red'>0.00</span>",
                                OffsetAmountTax: "<span style='color:red'>0.00</span>",
                                OffsetAmountTaxAmount: "<span style='color:red'>0.00</span>"
                            }
                        ]);
                    },
                    function callback(_Data) {
                        var Data = _Data;
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                test: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                OffsetAmount: "<span style='color:red'>" + Data.split(',')[0] + "</span>",
                                OffsetAmountTax: "<span style='color:red'>" + Data.split(',')[1] + "</span>",
                                OffsetAmountTaxAmount: "<span style='color:red'>" + Data.split(',')[2] + "</span>"
                            }
                        ]);
                    });
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


    //清空查询条件
    function CancelParm() {
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $('#RoomSign').searchbox("setValue", '');
        $('#CostName').searchbox("setValue", '');
        $("#CostID").val("");
        $('#CustTypeID').combobox('clear');
        $('#ParkName').val("");;
        $("#WaivMemo").val("");
        $("#WaivReason").val("");
        $('#IsDel').combobox('clear');
        $('#EditBeginDate').datebox("setValue", '');
        $('#EditEndDate').datebox("setValue", '');
        $("#WaiversCategory").searchbox("setValue", '');
    }


    function SelCost() {
        var varReturn;

        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


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

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = $(window).width();
        var h = $(window).height();

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
                                            var buildArea = data[i].RoomID.split("|")[1];
                                            //$('#BuildArea').val(buildArea);
                                            //$('#CalcArea').val(buildArea);

                                            break;
                                        }
                                    }
                                }
                            }
                        });
                    }
                },
                function completeCallback() {
                    // document.getElementById('btnGetHandID').click();
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

        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            //$('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

            //$('#BuildArea').val(data.BuildArea);
            //$('#CalcArea').val(data.BuildArea);
        });

    }



    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", '83%');
        }
    });
</script>
