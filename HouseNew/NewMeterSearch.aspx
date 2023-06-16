<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMeterSearch.aspx.cs" Inherits="M_Main.HouseNew.NewMeterSearch" %>


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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
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
    <form id="frmForm" runat="server">
        <input id="PrintParms" style="height: 21px; width: 24px" type="hidden" size="1" name="PrintParms"
            runat="server" />
        <input id="print" type="button" name="print" runat="server" onserverclick="print_ServerClick" />
        <div class="SearchContainer" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px;">
            <table style="width: 100%;">
                <tr>
                    <td class="TdTitle">抄表时间从</td>
                    <td colspan="3">
                        <input id="StartDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
                            readonly name="StartDate" runat="server" style="width: 100px;" />到<input id="EndDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
                                readonly name="EndDate" runat="server" style="width: 100px;" />
                    </td>


                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <select id="BuildSNum" runat="server" style="width: 150px"></select></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server" style="width: 150px">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" runat="server" />

                        <input type="hidden" name="CustID" id="CustID" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" dd="dd" maxlength="50" name="RoomSign" searcher="SelRoom" runat="server" />


                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">表计类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="MeterType" runat="server" style="width: 150px"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">用量</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol1" name="CompSymbol1" runat="server">
                            <option selected></option>
                        </select>&nbsp;<input id="Comp_Dosage" onkeypress="CheckNumeric();"
                            name="Comp_Dosage" runat="server" /></td>
                    <td class="TdTitle">金额</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol2" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select>&nbsp;<input id="Comp_Amount" onkeypress="CheckNumeric();"
                            name="Comp_Amount" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">
                        <input style="width: 8px; height: 22px" id="CostIDs" class="Control_ItemInput" size="1"
                            type="hidden" name="CostIDs" runat="server">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" searcher="SelStan"
                            name="StanNames" runat="server" /><input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
                                type="hidden" name="StanIDs" runat="server" />
                        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
                            type="hidden" name="hiStanNames" runat="server" /></td>
                    <td class="TdTitle">计量表类型</td>
                    <td class="TdContentSearch">
                        <select id="MeterTabClass" name="MeterTabClass" style="width: 100px" runat="server">
                            <option selected></option>
                            <option value="商业">商业</option>
                            <option value="外协">外协</option>
                            <option value="住宅">住宅</option>
                            <option value="其他">其他</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input type="hidden" name="IsSearch" id="IsSearch" runat="server" />
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height() - 1;
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
                $('#print').hide();
            }
            InitFunction();

            function Search() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
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

                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);


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

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    alert("请选择费用项目,此项不能为空!");
                    NewFeesDueCutSearch.btnSelCost.focus();
                    return false;
                }

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=0" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);


                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";


                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);



                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }

                        }

                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                    }
                });

                return false;
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
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                });

            }

            var column = [[
                { field: 'RestID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

                { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                { field: 'MeterTabClass', title: '计量表类型', width: 200, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
                { field: 'LiveTypeName', title: '业主/租户', width: 100, align: 'left', sortable: true },

                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },

                { field: 'MeterSign', title: '表计编号', width: 80, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 80, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 80, align: 'left', sortable: true },
                {
                    field: 'ListDate', title: '抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDate, "yyyy-MM-dd");
                        return str;
                    }
                },

                { field: 'StartDegree', title: '起数', width: 80, align: 'left', sortable: true },
                { field: 'EndDegree', title: '止数', width: 80, align: 'left', sortable: true },
                { field: 'Ratio', title: '变比', width: 80, align: 'left', sortable: true },
                { field: 'Dosage', title: '用量', width: 80, align: 'left', sortable: true },
                { field: 'OldDosage', title: '旧表用量', width: 80, align: 'left', sortable: true },
                { field: 'ExtraDosage', title: '损耗', width: 80, align: 'left', sortable: true },
                { field: 'TotalDosage', title: '合计用量', width: 80, align: 'left', sortable: true },
                { field: 'Price', title: '单价', width: 80, align: 'left', sortable: true },
                { field: 'Amount', title: '金额', width: 80, align: 'left', sortable: true }




            ]];


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
                        document.getElementById('print').click();
                    }
                }, '-',
                {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        window.open('../HouseNew/MeterSearchCre.aspx');
                    }
                }
            ];
            function LoadData() {
                LoadList();
            }

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
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
                    width: "100%",
                    showFooter: true,
                    view: myview,
                    sortOrder: "asc",
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("Meter", "CustomerMeterResultSearch", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.RestID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {


                        $.tool.DataPostNoLoading('Meter', "CustomerMeterResultSum", $('#frmForm').serialize(),
                            function Init() {
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        BuildName: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>0</span>",
                                        OldDosage: "<span style='color:red'>0</span>",
                                        ExtraDosage: "<span style='color:red'>0</span>",
                                        TotalDosage: "<span style='color:red'>0</span>",
                                        Amount: "<span style='color:red'>0</span>"

                                    }
                                ]);
                            },
                            function callback(_Data) {

                                var data = _Data.split('|');
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        BuildName: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>" + data[0] + "</span>",
                                        OldDosage: "<span style='color:red'>" + data[1] + "</span>",
                                        ExtraDosage: "<span style='color:red'>" + data[2] + "</span>",
                                        TotalDosage: "<span style='color:red'>" + data[3] + "</span>",
                                        Amount: "<span style='color:red'>" + data[4] + "</span>"

                                    }
                                ]);
                            },
                            function completeCallback() {

                            },
                            function errorCallback() {
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        BuildName: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>0</span>",
                                        OldDosage: "<span style='color:red'>0</span>",
                                        ExtraDosage: "<span style='color:red'>0</span>",
                                        TotalDosage: "<span style='color:red'>0</span>",
                                        Amount: "<span style='color:red'>0</span>"

                                    }
                                ]);
                            });

                    }
                });
                $("#SearchDlg").dialog("close");
            }

            LoadData();




        </script>
    </form>
</body>
</html>

