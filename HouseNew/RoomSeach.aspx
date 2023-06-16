<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomSeach.aspx.cs" Inherits="M_Main.HouseNew.RoomSeach" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.8.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="SType" size="1" type="hidden" name="SType" runat="server" />
        <input id="hiPropertyRights" type="hidden" runat="server" />
        <input id="hiPropertyUses" type="hidden" runat="server" />
        <input id="HiddenPropertyUses" type="hidden" runat="server" />
        <input id="HiddenRoomState" type="hidden" runat="server" />
        <input id="thisCommID" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1336px; height: 370px;">
            <table class="DialogTable">
                <tbody>
                    <tr>
                        <td class="DialogTdTitle">管理项目</td>
                        <td colspan="7" class="DialogTdContent">
                            <input id="CommName" onclick="SelComm();" style="width: 96%" name="CommName" runat="server" />
                            <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
                            <input id="btnGetListOptions" type="button" value="读取业主信息" style="display: none;" onserverclick="btnGetListOptions_ServerClick" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">组团区域</td>
                        <td class="DialogTdContent">
                            <select id="RegionSNum" name="RegionSNum" runat="server">
                                <option selected=""></option>
                            </select></td>
                        <td class="DialogTdTitle">楼宇名称</td>
                        <td class="DialogTdContent"> <select id="BuildSNum" runat="server" name="BuildSNum"></select></td>
                        <td class="DialogTdTitle">单元</td>
                        <td class="DialogTdContent"> <input id="UnitSNums" typ="text" name="UnitSNums" runat="server" /></td>
                        <td class="DialogTdTitle">房屋编号</td>
                        <td class="DialogTdContent"> <input id="RoomSign" typ="text" name="RoomSign" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">产权性质</td>
                        <td class="DialogTdContent">
                            <select id="PropertyRights" name="PropertyRights" runat="server">
                                <option selected=""></option>
                            </select> </td>
                        <td class="DialogTdTitle">使用性质</td>
                        <td class="DialogTdContent">
                            <select id="PropertyUses" runat="server" clientidmode="Static" name="PropertyUses" class="easyui-combobox" data-options=" multiple: true" style="width: 144px;">
                                <option value=""></option>
                            </select> </td>
                        <td class="DialogTdTitle">使用状态</td>
                        <td class="DialogTdContent">
                            <select id="UsesState" name="UsesState" runat="server">
                                <option selected=""></option>
                            </select></td>
                        <td class="DialogTdTitle">房屋类型</td>
                        <td class="DialogTdContent">
                            <select id="RoomType" name="RoomType" runat="server">
                                <option selected=""></option>
                            </select></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">建筑面积从</td>
                        <td class="DialogTdContent"> <input id="BuildStartArea" name="BuildStartArea" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="BuildEndArea" name="BuildEndArea" runat="server" /></td>
                        <td class="DialogTdTitle">套内面积从</td>
                        <td class="DialogTdContent"> <input id="InteriorStartArea" name="InteriorStartArea" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="InteriorEndArea" name="InteriorEndArea" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">合同交房时间从</td>
                        <td class="DialogTdContent"> <input id="ContSubStartDate" class="Wdate" onclick="WdatePicker()" name="ContSubStartDate" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="ContSubEndDate" class="Wdate" onclick="WdatePicker()" name="ContSubEndDate" runat="server" /></td>
                        <td class="DialogTdTitle">物业接管时间从</td>
                        <td class="DialogTdContent"> <input id="TakeOverStartDate" class="Wdate" onclick="WdatePicker()" name="TakeOverStartDate" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="TakeOverEndDate" class="Wdate" onclick="WdatePicker()" name="TakeOverEndDate" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">集中交房时间从</td>
                        <td class="DialogTdContent"> <input id="GetHouseStartDate" class="Wdate" onclick="WdatePicker()" name="GetHouseStartDate" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="GetHouseEndDate" class="Wdate" onclick="WdatePicker()" name="GetHouseEndDate" runat="server" /></td>
                        <td class="DialogTdTitle">实际交房时间从</td>
                        <td class="DialogTdContent"> <input id="ActualSubStartDate" class="Wdate" onclick="WdatePicker()" name="ActualSubStartDate" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="ActualSubEndDate" class="Wdate" onclick="WdatePicker()" name="ActualSubEndDate" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">装修时间从</td>
                        <td class="DialogTdContent"> <input id="FittingStartTime" class="Wdate" onclick="WdatePicker()" name="FittingStartTime" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="FittingEndTime" class="Wdate" onclick="WdatePicker()" name="FittingEndTime" runat="server" /></td>
                        <td class="DialogTdTitle">入住时间从</td>
                        <td class="DialogTdContent"> <input id="StayStartTime" class="Wdate" onclick="WdatePicker()" name="StayStartTime" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="StayEndTime" class="Wdate" onclick="WdatePicker()" name="StayEndTime" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">缴费开始时间从</td>
                        <td class="DialogTdContent"> <input id="StartPayBeginDate" class="Wdate" onclick="WdatePicker()" name="StartPayBeginDate" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="EndPayBeginDate" class="Wdate" onclick="WdatePicker()" name="EndPayBeginDate" runat="server" /></td>
                        <td class="DialogTdTitle">交付状态</td>
                        <td class="DialogTdContent"> <select id="PayState" name="PayState" runat="server">
                                <option selected=""></option>
                            </select></td>
                        <td class="DialogTdTitle">交房状态</td>
                        <td class="DialogTdContent">
                            <select id="RoomState" runat="server" clientidmode="Static" name="RoomState" class="easyui-combobox" data-options=" multiple: true" style="width: 144px;">
                                <option value=""></option>
                            </select> </td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">证件号码</td>
                        <td class="DialogTdContent"> <input id="PaperCode" maxlength="50" name="PaperCode" runat="server" /></td>
                        <td class="DialogTdTitle">固定电话</td>
                        <td class="DialogTdContent"> <input id="FixedTel" maxlength="50" name="FixedTel" runat="server" /></td>
                        <td class="DialogTdTitle">移动电话</td>
                        <td class="DialogTdContent"> <input id="MobilePhone" maxlength="50" name="MobilePhone" runat="server" /></td>
                        <td class="DialogTdTitle">楼栋管家</td>
                        <td class="DialogTdContent"> <input id="UserName" maxlength="50" name="UserName" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="DialogTdTitle">业主名称</td>
                        <td class="DialogTdContent"> <input id="CustName" name="CustName" runat="server" /></td>
                        <td class="DialogTdTitle">计费面积从</td>
                        <td class="DialogTdContent"> <input id="CalcStartArea" name="CalcStartArea" runat="server" /></td>
                        <td class="DialogTdTitle">到</td>
                        <td class="DialogTdContent"> <input id="CalcEndArea" name="CalcEndArea" runat="server" /></td>
                        <td class="DialogTdTitle"></td>
                        <td class="DialogTdContent"> </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="text-align: center"> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadSearch();">确定筛选</a> </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $('#PropertyUses').combobox({
        onChange: function () {
            var value = $('#PropertyUses').combobox('getValues');
            console.log(value.join(','));

            //alert(value);
            $("#HiddenPropertyUses").val(value);
        }
    });
    $('#RoomState').combobox({
        onChange: function () {
            var values = $('#RoomState').combobox('getValues');
            console.log(values);
            $("#HiddenRoomState").val(values);
        }
    });

    var column = [[
        {
            field: 'BuildArea', title: '建筑面积', rowspan: 2, width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('房屋历史','update'," + row.RoomID + ",'areahis');\">" + row.BuildArea + "</a>";
                return str;
            }
        },
        { field: 'CalcArea', rowspan: 2, title: '计费面积', width: 100, align: 'left', sortable: true },
        { field: 'StateName', rowspan: 2, title: '房屋状态', width: 100, align: 'left', sortable: true },
        { field: 'RoomTypeName', rowspan: 2, title: '房屋类型', width: 100, align: 'left', sortable: true },
        { field: 'PropertyRights', rowspan: 2, title: '产权性质', width: 100, align: 'left', sortable: true },
        { field: 'PropertyUses', rowspan: 2, title: '使用性质', width: 100, align: 'left', sortable: true },
        {
            field: 'ContSubDate', rowspan: 2, title: '合同交房时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'TakeOverDate', rowspan: 2, title: '物业接管时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.TakeOverDate, "yyyy-MM-dd");
                return str;
            }
        },
        { colspan: 2, title: '集中交房时间', height: 20 },
        {
            field: 'ActualSubDate', rowspan: 2, title: '实际交房时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FittingTime', rowspan: 2, title: '装修时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'StayTime', rowspan: 2, title: '入住时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.StayTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'PayBeginDate', rowspan: 2, title: '缴费开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'CustName1', rowspan: 2, title: '业主名称', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('客户信息','search','" + row.CustID1 + "','customer');\">" + row.CustName1 + "</a>";
                return str;
            }
        },
        { field: 'PaperCode', rowspan: 2, title: '证件号码', width: 100, align: 'left', sortable: true },
        { field: 'FixedTel', rowspan: 2, title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone', rowspan: 2, title: '移动电话', width: 100, align: 'left', sortable: true },
        {
            field: 'CustName2', rowspan: 2, title: '租户名称', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('租户信息','search','" + row.CustID2 + "','customer');\">" + row.CustName2 + "</a>";
                return str;
            }
        },
        { field: 'PaperCode2', rowspan: 2, title: '证件号码', width: 100, align: 'left', sortable: true },
        { field: 'FixedTel2', rowspan: 2, title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone2', rowspan: 2, title: '移动电话', width: 100, align: 'left', sortable: true },
        { field: 'UserName', rowspan: 2, title: '楼栋管家', width: 100, align: 'left', sortable: true },

    ], [
        {
            field: 'getHouseStartDate', title: '从', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.getHouseStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'getHouseEndDate', title: '到', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.getHouseEndDate, "yyyy-MM-dd");
                return str;
            }
        }
    ]];

    var frozenColumns = [[

        { field: 'RoomID', rowspan: 2, height: 20, title: 'RoomID', width: 100, align: 'left', sortable: true, hidden: true },
        { field: 'OrganName', rowspan: 2, height: 20, title: '区域名称', width: 120, align: 'left', sortable: true },
        { field: 'CommName', rowspan: 2, height: 20, title: '项目名称', width: 120, align: 'left', sortable: true },
        { field: 'RegionName', rowspan: 2, height: 20, title: '组团区域', width: 100, align: 'left', sortable: true },
        { field: 'BuildName', rowspan: 2, height: 20, title: '楼宇名称', width: 100, align: 'left', sortable: true },
        { field: 'UnitSNum', rowspan: 2, height: 20, title: '单元', width: 100, align: 'left', sortable: true },
        {
            field: 'RoomSign', title: '房屋编号', rowspan: 2, width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRoomDetail('查看房屋详情','search','RoomID=" + row.RoomID + "&CustID1=" + row.CustID1 + "&CustID2=" + row.CustID2 + "');\">" + row.RoomSign + "</a>";
                return str;
            }
        },
        { field: 'RoomName', rowspan: 2, height: 20, title: '房屋名称', width: 100, align: 'left', sortable: true },

    ]]


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
                window.location.href = '../HouseNew/RoomSeachCreExcel.aspx';
            }
        }
    ];

    function LoadSearch() {
        if ($("#CommIDs").val() == "") {
            HDialog.Info("请选择项目！");
            return;
        }
        LoadList();
    }

    function LoadList() {
        $("#hiPropertyRights").val($("#PropertyRights").find("option:selected").text());
        $("#hiPropertyUses").val($("#HiddenPropertyUses").val());
        $("#HiddenRoomState").val($("#HiddenRoomState").val());
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
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
            sortOrder: "asc",
            toolbar: toolbar,
            frozenColumns: frozenColumns,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Room", "search", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                $("#SearchDlg").dialog("close");
                $("#RoomSign").val();
                $("#ChangeStartdate").datebox('setValue', '');
                $("#ChangeEndDate").datebox('setValue', '');

                //$.tool.MergeEasyUiGrid("TableContainer", "CommName");
            }
        });

    }

    function ViewRoomDetail(title, OpType, param) {

        var w = $(window).width();
        var h = $(window).height();
        var conent = '../HouseNew/RoomManage.aspx?OpType=' + OpType + '&' + param;

        HDialog.Open(w, h, conent, title, true, function callback(_Data) {


        });

    }

    function ViewDetail(title, OpType, ID, page) {

        var conent = "";
        switch (page) {
            case "statehis":
                conent = '../HouseNew/RoomStateHisBrowse.aspx?RoomID=' + ID
                break;
            case "areahis":
                conent = '../HouseNew/RoomAreaHisBrowse.aspx?RoomID=' + ID
                break;
            case "customer":
                conent = '../HouseNew/CustomerDetail.aspx?CustID=' + ID + '&SType=details';
                break;
        }
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, conent, title, true, function callback(_Data) {
            //LoadList();

        });

    }

    LoadList();

    $("select").each(function () {
        var key = $(this).attr("id");
        if (key != undefined) {
            $(this).css("width", document.body.clientWidth * 0.15 * 0.60);
        }
    });


    function SelComm() {
        var w = $(window).width() * 0.7;
        HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            $("#CommIDs").val(arrRet.id);
            $("#CommName").val(arrRet.name);

            //if ($("#thisCommID").val() == "0" && $("#CommIDs").val() != '' && arrRet.id.split(',').length == 1) {
            //    document.getElementById("btnGetListOptions").click();
            //}
        });
    }

    function showOpen() {
        window.onload = function () {
            $('#SearchDlg').dialog('open');
        }
    }

            //$(document).ready(function () {
            //    // 任何需要执行的js特效 
            //    //$('#SearchDlg').parent().appendTo($("form:first"))
            //    $('#SearchDlg').dialog('open');
            //});
         //  $(function () { $('#SearchDlg').dialog('open'); });
</script>