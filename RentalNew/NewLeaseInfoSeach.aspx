<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewLeaseInfoSeach.aspx.cs" Inherits="M_Main.RentalNew.NewLeaseInfoSeach" %>


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
        <input id="CommID" name="CommID" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">
            <table style="width: 100%;" class="DialogTable">

                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="width: 90%;" data-options="editable:false"
                            name="CommNames" runat="server" /><input class="Control_ItemInput" id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiCommNames" runat="server"><input class="Control_ItemInput" id="CommIDs" style="width: 8px; height: 22px" type="hidden"
                                        size="1" name="CommIDs" runat="server"></td>
                </tr>

                <tr>
                    <td class="TdTitle">租户名称</td>
                    <td class="TdContent">
                        <input id="CustName"  
                            name="CustName" runat="server" style="width:90%" ></td>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="MasterName"  style="width:90%"
                            name="MasterName" runat="server" ></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="RoomSign"  style="width:90%"
                            size="26" name="RoomSign" runat="server"></td>
                    <td class="TdTitle">租赁开始时间从</td>
                    <td class="TdContent"><INPUT id="StartBeginDate" class="Wdate"
														onclick="WdatePicker()"  name="StartBeginDate" style="width:45%" runat="server">到<INPUT id="StartEndDate" class="Wdate"
														onclick="WdatePicker()"  name="StartEndDate" style="width:45%" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">租赁结束时间从</td>
                    <td class="TdContent"><INPUT id="EndBeginDate" class="Wdate" style="width:45%" 
														onclick="WdatePicker()"  name="EndBeginDate" runat="server">到<INPUT id="EndEndDate" class="Wdate"
														onclick="WdatePicker()"  name="EndEndDate" style="width:45%" runat="server"></td>
                    <td class="TdTitle">续约时间从</td>
                    <td class="TdContent"><INPUT id="ReletDate1" class="Wdate"
														onclick="WdatePicker()"  name="ReletDate1" style="width:45%" runat="server">到<INPUT id="ReletDate2" class="Wdate"
														onclick="WdatePicker()"  name="ReletDate2" style="width:45%" runat="server"></td>
                </tr>
                <tr>
                       <td class="TdTitle">是否退租</td>
                      <td class="TdContent"><select id="IsEnd" name="IsEnd"><option ></option><option selected value="0">否</option><option  value="1">是</option></select></td>
                      <td class="TdTitle">退租时间从</td>
                      <td class="TdContent"><INPUT id="StartChargeTime" class="Wdate"
														onclick="WdatePicker()"  name="StartChargeTime" style="width:45%" runat="server">到<INPUT id="EndChargeTime" class="Wdate"
														onclick="WdatePicker()"  name="EndChargeTime" style="width:45%" runat="server"></td>
                </tr>
              
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>


        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">



            function SelCommInfo() {
             
                if ($('#CommID').val() != '' && $('#CommID').val() != '0') {
                    return;
                }
                else {
                     var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").searchbox("setText", arrRet.name);
                    });
                }
            }



            var frozenColumns = [[
            { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
                    {
                        field: 'CustName', title: '租户名称', width: 200, align: 'left', sortable: true,
                        formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.CustID + "','" + row.LiveID + "','" + row.RoomID + "');\">" + row.CustName + "</a>";
                            return str;
                        }
                    },
            { field: 'BuildName', title: '楼宇', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 160, align: 'left', sortable: true }
            ]]


            var column = [[

                   
                  

                    { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
                    { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
                    {
                        field: 'StartDate', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.StartDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'EndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.EndDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'ReletDate', title: '续约时间至', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    { field: 'ContSign', title: '合同编号', width: 100, align: 'left', sortable: true },
                    {
                        field: 'ChargeTime', title: '退租时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = '';
                            if (row.IsActive == '0') {
                                str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                            }
                            return str;
                        }
                    },
                    {
                        field: 'ChargeCause', title: '退租原因', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = '';
                            if (row.IsActive == '0') {
                                str = row.ChargeCause;
                            }
                            return str;
                        }
                    }





            ]];

            var w = $(window).width();
            var h = $(window).height();

          
            function ViewDetail(strCustID, strLiveID, strRoomID) {
            

                HDialog.Open(w, h, '../RentalNew/LeaseRoomNewManage.aspx?OPType=Detail&CustID=' + strCustID + '&LiveID=' + strLiveID + '&RoomID=' + strRoomID, '租赁详情', false, function (_Data) {

                    if (_Data == '1') {
                        LoadList();
                    }

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
                    }, '-', {
                        text: '更名历史',
                        iconCls: 'icon-mini-edit',
                        handler: function () {

                            var row = $("#TableContainer").datagrid("getSelected");
                            if (row != null) {
                                if (row.CustID != 0) {

                                    HDialog.Open(w, h, '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + row.CustID, '更名历史', false,
                                        function callback(_Data) {

                                        });

                                }
                                else {
                                    HDialog.Info('请选择要查看的租赁信息');
                                }
                            } else {
                                HDialog.Info('请选择要查看的租赁信息');

                            }
                        }
                    }, '-',
                     {
                         text: 'Excel导出',
                         iconCls: 'icon-page_white_excel',
                         handler: function () {
                             window.location.href = '../RentalNew/LeaseInfoSeachCreExcel.aspx';
                         }
                     }
            ];


            function getQueryStr(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    frozenColumns:frozenColumns,
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
                        param = $.JQForm.GetParam("RoomRental", "LeaseInfoSeachList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
            }




            $(function () {
                var sy = getQueryStr("sy");
                if (sy == '1') {
                    var now = new Date();
                    var mon = now.getMonth() + 1;
                    var sdate = now.getFullYear() + '-' + mon + '-01 00:00:00';
                      mon = now.getMonth() + 2;
                    var edate = now.getFullYear() + '-' + mon + '-01 00:00:00';

                    $("#StartChargeTime").val(sdate);
                    $("#EndChargeTime").val(edate);
                }
                LoadList();
            })





        </script>
    </form>
</body>
</html>
