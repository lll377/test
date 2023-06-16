<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewWaiversFeeModifyAuditBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewWaiversFeeModifyAuditBrowse" %>



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
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">

        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <input id="IsAudit" name="IsAudit" type="hidden" runat="server" />
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">
             <TR>
					<TD class="TdTitle">减免登记时间从</TD>
					<TD class="TdContent" ><INPUT class="Wdate" id="EditBeginDate" 
									onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" type="text"  name="EditBeginDate"
									runat="server"></TD>
					<TD class="TdTitle" >到</TD>
					<TD class="TdContent" ><INPUT class="Wdate" id="EditEndDate" 
									onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" type="text" name="EditEndDate"
									runat="server"></TD>
				</TR>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox"   style="width: 82%" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent">
                      </td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="审核确认" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width:300px; height: 100px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">原因</td>

                    <td class="TdContentSearch" colspan="3">
                        <input class="Control_ItemInput" id="AuditReason" name="AuditReason" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search2" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="WaivAudit();">确定</a>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

            function InitFrom() {
                var ly = getQueryVariable("FromIndex");
                if (ly == "t") {
                    $("#FromIndex").val("t");
                }
            }
            InitFrom();


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


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
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

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
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);




                    }

                });

            }


            var frozenColumns = [[
           {
               field: 'CustName', title: '客户名称', width: 130, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var param = "WaivID=" + row.WaivID + "&WaivRoleCodes=" + row.WaivRoleCodes;
                   var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改减免费用','Edit','" + param+ "');\">" + row.CustName + "</a>";
                   return str;
               }
           },
           { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
            ]];
            var column = [[
                  { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                  { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
                  { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                  { field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true },
                  { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'left', sortable: true },
                  { field: 'WaivAmount', title: '减免总金额', width: 100, align: 'left', sortable: true },
                  { field: 'WaivedAmount', title: '已减免金额', width: 100, align: 'left', sortable: true },
                  { field: 'WaivModifyAmount', title: '取消减免金额', width: 100, align: 'left', sortable: true },
                  { field: 'WaivMonthAmount', title: '每月减免金额', width: 100, align: 'left', sortable: true },
                  { field: 'WaivRates', title: '减免比例', width: 80, align: 'left', sortable: true },
                  { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
                  {
                      field: 'WaivStateDuring', title: '开始时间', width: 120, align: 'left', sortable: true,
                      formatter: function (value, row, index) {
                          var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                          return str;
                      }
                  },
                  {
                      field: 'WaivEndDuring', title: '结束时间', width: 120, align: 'left', sortable: true,
                      formatter: function (value, row, index) {
                          var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                          return str;
                      }
                  },
                  { field: 'UserName', title: '减免登记人', width: 100, align: 'left', sortable: true },
                  { field: 'WaivCreDate', title: '减免登记时间', width: 180, align: 'left', sortable: true },
                  { field: 'WaivReason', title: '减免原因', width: 130, align: 'left', sortable: true },
                  { field: 'WaivMemo', title: '备注', width: 120, align: 'left', sortable: true },
                  { field: 'ModifyAuditDate', title: '取消减免审核日期', width: 120, align: 'left', sortable: true },
                  { field: 'ModifyAuditUserName', title: '取消减免审核人', width: 120, align: 'left', sortable: true },
                  { field: 'ModifyAuditAmount', title: '取消减免的金额', width: 120, align: 'left', sortable: true },
                { field: 'IsModifyAuditName', title: '取消减免的状态', width: 120, align: 'left', sortable: true },

               

                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
                {
                    field: 'IsAudit', title: '审核状态', width: 130, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var values = "";
                        var IsAudit = row.IsAudit;

                        if (IsAudit == 1) {
                            values = "<font color='Green'>已通过</font>";
                        }
                        else if (IsAudit == 2) {
                            values = "<font color='red'>未通过</font>";
                        }
                        else {
                            values = "<font color='Blue'>未审核</font>";
                        }
                        return values;
                    }
                }
            ]];

            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');

                     }
                 }
            ];
            function ViewDetail(title, OpType, param) {

                
                HDialog.Open($(window).width(), $(window).height(), '../ChargesNew/WaiversFeeModifyAuditManage.aspx?' + param + '&OpType=' + OpType, title, true, function callback(_Data) {
                    if (_Data !='') {
                        LoadList();
                    }
                });
            }

          

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
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "WaiversFeeList", "TableContainer", param);


                    },
                    onLoadSuccess: function (data) {



                    },

                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
