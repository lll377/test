<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMeterPreStatistics.aspx.cs" Inherits="M_Main.HouseNew.NewMeterPreStatistics" %>



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
    function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
    }
        </script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
         <INPUT id="PrintParms" style="HEIGHT: 21px; WIDTH: 24px" type="hidden" size="1" name="PrintParms"
							runat="server"/>
        <input id="print" type="button" name="print" runat="server" onserverclick="print_ServerClick" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        
           <div id="StaticDlg" class="easyui-dialog" title="统计条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px;">
            <table style="width: 100%;">
               

                <TR>
					<TD class="TdTitle">楼宇</TD>
					<TD class="TdContentSearch"><SELECT id="BuildSNum" runat="server"  width="60"></SELECT></TD>
					<TD class="TdTitle">收费类型</TD>
					<TD class="TdContentSearch"><SELECT id="ChargeType" name="ChargeType" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
				</TR>
				<TR>
					<TD class="TdTitle">统计时间类别</TD>
					<TD class="TdContentSearch"><SELECT id="DateType" name="DateType" runat="server">
							<OPTION value="0" selected>抄表日期</OPTION>
							<OPTION value="1">费用日期</OPTION>
						</SELECT></TD>
					<TD class="TdTitle"></TD>
					<TD class="TdContentSearch"</TD>
				</TR>
              <tr>
                  <td  class="TdTitle">统计时间</td>
                  <td colspan="3">从
                        <input  id="StartDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
								readOnly  name="StartDate" runat="server" style="WIDTH: 100px; "/>到<input  id="EndDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
								readOnly  name="EndDate" runat="server" style="WIDTH: 100px; "/>
                <%--      
                      <SELECT id="Year1" name="Year1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>年<SELECT id="Month1" name="Month1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>月<SELECT id="Day1" style="Z-INDEX: 0" name="Day1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>日到<SELECT id="Year2" name="Year2" runat="server">
														<OPTION selected></OPTION>
													</SELECT>年<SELECT id="Month2" name="Month2" runat="server">
														<OPTION selected></OPTION>
													</SELECT>月<SELECT id="Day2" style="Z-INDEX: 0" name="Day2" runat="server">
														<OPTION selected></OPTION>
													</SELECT>日--%>



                  </td>
              </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="CustomerMeterStatistics();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px;">
            <table style="width: 100%;">
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
                    <td class="TdTitle">
                    </td>
                    <td class="TdContentSearch">
                    </td>
                </tr>
              
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
                $('#print').hide();
              
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

                });

            }

            var column = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'LiveTypeName', title: '业主/租户', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用项目', width: 100, align: 'left', sortable: true },
                { field: 'BeginPrecPayAmount', title: '前期预交余额', width: 100, align: 'left', sortable: true },
                { field: 'CurTotalAmount', title: '本期收款', width: 100, align: 'left', sortable: true },
                { field: 'StartDegree', title: '期初起数', width: 100, align: 'left', sortable: true },
                { field: 'EndDegree', title: '期末止数', width: 100, align: 'left', sortable: true },
                { field: 'Dosage', title: '本期用量', width: 100, align: 'left', sortable: true },
                { field: 'Amount', title: '本期金额', width: 100, align: 'left', sortable: true },
                { field: 'EndPrecPayAmount', title: '期末预交余额', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [

                 {
                     text: '统计',
                     iconCls: 'icon-large-smartart',
                     handler: function () {
                         $('#StaticDlg').parent().appendTo($("form:first"))
                         $('#StaticDlg').dialog('open');

                     }
                 }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                           
                        }
                    }, '-',
                        {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                window.open('../House/MeterPreStatisticsCre.aspx?RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val() + '&BuildSNum=' + $('#BuildSNum').val() + '&ChargeTypeID=' + $('#ChargeTypeID').val());
                            }
                        }
            ];
          
            function LoadList() {
            
                //var Year1 = $('#Year1').val();
                //var Year2 = $('#Year2').val();
                //var Month1 = $('#Month1').val();
                //var Month2 = $('#Month2').val();
                //var Day1 = $('#Day1').val();
                //var Day2 = $('#Day2').val();
                var iDateType = $('#DateType').val();
                var bz = '';
                if (iDateType == "0") {
                    bz = '抄表日期';

                }
                else {
                    bz = '费用日期';
                }

                var strStartDate = $("#StartDate").val();
                var strEndDate = $("#EndDate").val();

                bz = bz + strStartDate + '到' + strEndDate+'的抄表统计'
              

                toolbar = [

                 {
                     text: '统计',
                     iconCls: 'icon-large-smartart',
                     handler: function () {
                         $('#StaticDlg').parent().appendTo($("form:first"))
                         $('#StaticDlg').dialog('open');

                     }
                 }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');

                        }
                    }, '-',
                        {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                window.open('../House/MeterPreStatisticsCre.aspx?RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val() + '&BuildSNum=' + $('#BuildSNum').val() + '&ChargeTypeID=' + $('#ChargeTypeID').val());
                          
                            }
                        }, '-',
                       {
                           text: bz
                       }

                ];


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
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("Meter", "CustomerMeterPreStateList", "TableContainer", param);
                    },
                    onLoadSuccess: function () {

                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function CustomerMeterStatistics() {
                $.tool.DataPost('Meter', 'CustomerMeterPreState', $('#frmForm').serialize(),
                    function Init() {
                        $('#StaticDlg').dialog('close');
                    },
                    function callback(_Data) {
                        var Data = _Data
                        if (Data == "true") {
                            HDialog.Info('统计成功');

                        }
                        else {
                            HDialog.Info('统计失败');
                        }
                       
                        LoadList();



                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }


        </script>
    </form>
</body>
</html>


