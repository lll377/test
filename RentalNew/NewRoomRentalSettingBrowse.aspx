<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRoomRentalSettingBrowse.aspx.cs" Inherits="M_Main.RentalNew.NewRoomRentalSettingBrowse" %>


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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 900px; height: 240px;">
            <table style="width: 100%;" class="DialogTable">

                <tr>
                    <td class="TdTitle">楼宇类型</td>
                    <td class="TdContent">
                        <select id="BuildType" name="BuildType" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">产权性质</td>
                    <td class="TdContent">
                        <select id="PropertyRights" name="PropertyRights" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">使用性质</td>
                    <td class="TdContent">
                        <select id="PropertyUses" name="PropertyUses" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">使用状态</td>
                    <td class="TdContent">
                        <select id="UsesState" name="UsesState" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContent">
                        <select id="RoomState" runat="server" name="RoomState"></select></td>
                    <td class="TdTitle">楼宇名称</td>
                    <td class="TdContent">
                        <select id="BuildSNum" runat="server" name="BuildSNum"></select></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSign" typ="text" name="RoomSign" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">产权面积从</td>
                    <td class="TdContent">
                        <input id="PropertyStartArea" name="PropertyStartArea" runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="PropertyEndArea" name="PropertyEndArea" runat="server" /></td>
                    <td class="TdTitle">建筑面积从</td>
                    <td class="TdContent">
                        <input id="BuildStartArea" name="BuildStartArea" runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="BuildEndArea" name="BuildEndArea" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">套内面积从</td>
                    <td class="TdContent">
                        <input id="InteriorStartArea" name="InteriorStartArea" runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="InteriorEndArea" name="InteriorEndArea" runat="server" /></td>
                    <td class="TdTitle">公摊面积从</td>
                    <td class="TdContent">
                        <input id="CommonStartArea" name="CommonStartArea" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="CommonEndArea" name="CommonEndArea" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">是否租售</td>
                    <td class="TdContent">
                        <select id="SIsRental" runat="server">
                            <option></option>
                            <option value="1">租赁</option>
                            <option value="2">销售</option>
                            <option value="3">租售</option>
                            <option value="0">否</option>
                        </select></td>
                    <td class="TdTitle">业务规划</td>
                    <td class="TdContent">
                        <select id="sPlanFormat" name="sPlanFormat" runat="server">
                            <option selected></option>
                        </select><input id="hsPlanFormat" name="hsPlanFormat" type="hidden" runat="server" />
                    </td>
                    <td class="TdTitle">当前租赁状态</td>
                    <td class="TdContent">
                        <select id="RoomCurrentStatusName" runat="server">
                            <option></option>
                            <option value="不租">不租</option>
                            <option value="待租">待租</option>
                            <option value="预定">预定</option>
                            <option value="已租">已租</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>

                <tr>
                    <td colspan="8" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="租售设置" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 640px; height: 150px;">
            <table style="width: 100%;" class="DialogTable">
                <tr>
                    <td class="TdTitle">是否租售</td>
                    <td class="TdContent">
                        <select id="IsRental" runat="server">
                            <option></option>
                            <option value="1">租赁</option>
                            <option value="2">销售</option>
                            <option value="3">租售</option>
                            <option value="0">否</option>
                        </select></td>
                    <td class="TdTitle">业态规划</td>
                    <td class="TdContent">
                        <select id="PlanFormat" name="PlanFormat" runat="server">
                            <option selected></option>
                        </select><input id="hPlanFormat" name="hPlanFormat" type="hidden" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">标准租金</td>
                    <td class="TdContent">
                        <input id="StandardPrice" style="width: 50%" name="StandardPrice" runat="server">(元/平米.月)</td>
                    <td class="TdTitle">特殊说明</td>
                    <td class="TdContent">
                        <input id="Memo" name="Memo" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SetRoomRental();">确定设置</a>
                    </td>

                </tr>
            </table>
        </div>


        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">



            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'RoomID', title: 'RoomID', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'RegionName', title: '组团区域', width: 100, align: 'left', sortable: true },
                { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true
                    //, formatter: function (value, row, index) {
                    //    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房屋租赁设置','search'," + row.RoomID + ",'manage');\">" + row.RoomSign + "</a>";
                    //    return str;
                    //}
                },
                { field: 'RoomModel', title: '房屋户型', width: 100, align: 'left', sortable: true },
                { field: 'PropertyRights', title: '产权性质', width: 100, align: 'left', sortable: true },
                { field: 'PropertyUses', title: '使用性质', width: 100, align: 'left', sortable: true },
                { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
                { field: 'IsRentalName', title: '是否租售', width: 100, align: 'left', sortable: true },
                { field: 'PlanFormat', title: '业态规划', width: 100, align: 'left', sortable: true },
                { field: 'StandardPrice', title: '标准租金(元/平米.月)', width: 100, align: 'left', sortable: true },
                { field: 'RoomCurrentStatusName', title: '当前租赁状态', width: 100, align: 'left', sortable: true },


            ]];


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


                $("select").each(function () {

                    $(this).css("width", document.body.clientWidth * 0.15 * 0.57);
                });
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
                    text: '租售设置',
                    iconCls: 'icon-save',
                    handler: function () {

                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要设置的房号!');
                        }
                        else {
                            $('#SearchDlg2').parent().appendTo($("form:first"))
                            $('#SearchDlg2').dialog('open');

                            $('#AllData').val(JSON.stringify(rows));
                        }


                    }
                }
            ];
            function SetRoomRental() {
                $('#hPlanFormat').val($("#PlanFormat").find("option:selected").text());
                $.tool.DataPostChk('frmForm', 'RoomRental', 'RoomRentalSettingIns', $('#frmForm').serialize(),
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

            function LoadList() {

                $('#hsPlanFormat').val($("#sPlanFormat").find("option:selected").text());

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
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "RoomRentalSettingList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
                $('#SearchDlg2').dialog('close');
            }



            LoadList();





        </script>
    </form>
</body>
</html>
