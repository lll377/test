<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAuditingPreDetailBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewAuditingPreDetailBrowse" %>


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
    <script type="text/javascript"  src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
                <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
      <INPUT id="AuditID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="AuditID"
							runat="server"/><INPUT id="IsAuditing" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsAuditing"
							runat="server"/><INPUT id="CreYear" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="CreYear"
							runat="server"/><INPUT id="CreMonth" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="CreMonth"
							runat="server"/><INPUT id="FeesRoleCodes" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="FeesRoleCodes"
							runat="server"/>
        <input id="TotalDays" name="TotalDays" type="hidden" runat="server" />
        
        
       <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:ExcuteOnServer(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="AuditingFee(1);" class="l-btn l-btn-small l-btn-plain" group="" id="shtg" name="shtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" id="sshtg" name="sshtg">审核通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)"  onclick="AuditingFee(2);" class="l-btn l-btn-small l-btn-plain" group="" id="shbtg" name="shbtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核不通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                     <td><a href="javascript:void(0)"  onclick="ToExcel();" class="l-btn l-btn-small l-btn-plain" group="" id="excel" name="excel"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">Excel输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                     <td><span id="lbAudit" style="color:red"> </span></td>
            </tr>
        </table>
        </div>


        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">


            <table class="DialogTable">

             
				<TR>
							<TD class="TdTitle" >楼宇</TD>
							<TD class="TdContent" ><select id="BuildSNum" runat="server" AutoPostBack="True"></select></TD>
							<TD class="TdTitle" >组团区域</TD>
							<TD class="TdContent" ><SELECT id="RegionSNum" name="RegionSNum" runat="server">
									<OPTION selected></OPTION>
								</SELECT></TD>
						</TR>
						<TR>
							<TD class="TdTitle" >客户类别</TD>
							<TD class="TdContent"><SELECT id="CustTypeID" name="CustTypeID" runat="server">
									<OPTION selected></OPTION>
								</SELECT></TD>
							<TD class="TdTitle" >收费类型</TD>
							<TD class="TdContent" ><SELECT id="ChargeTypeID" name="ChargeTypeID" runat="server">
									<OPTION selected></OPTION>
								</SELECT></TD>
						</TR>
						<tr>
                    <td class="TdTitle" >客户名称</td>
                    <td class="TdContentSearch" ><INPUT  id="CustName"  searcher="SelCust"
														name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server"/><INPUT  id="CustID" style="WIDTH: 8px; HEIGHT: 19px" type="hidden"
														size="1" name="CustID" runat="server"/><INPUT  id="hiCustName" style="WIDTH: 12px; HEIGHT: 19px" type="hidden"
														size="1" name="hiCustName" runat="server"/>

                                            </td>
                    <td class="TdTitle" >可选房号</td>
                    <td class="TdContentSearch" ><SELECT id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" name="SelRoomID" runat="server">
														<OPTION selected></OPTION>
													</SELECT></td>
                </tr>
                <tr>
                    <td class="TdTitle" >房屋编号</td>
                    <td class="TdContentSearch" ><INPUT  id="RoomSign"  class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server"/>
                       <INPUT  id="RoomID" style="WIDTH: 8px; HEIGHT: 22px" type="hidden"
															size="1" name="RoomID" runat="server"/><INPUT  id="hiRoomSign" style="WIDTH: 8px; HEIGHT: 22px" type="hidden"
															size="1" name="hiRoomSign" runat="server"/>
                                               
                                                </td>
							<TD class="TdTitle" >费用项目</TD>
							<TD class="TdContentSearch" > <input id="CostName"
                        name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server"><input id="hiCostName" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCostName" runat="server"><input id="CostID" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CostID" runat="server"></TD>
						</TR>
               

                <tr>
                    <td align="center" colspan="4">

                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#lbAudit').html("审核状态:未审核");
              
                if ($('#TotalDays').val() != "0")
                {


                    $('#shtg').css("cursor", "default");

                    $('#shtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

                    $('#shtg').click(function (event) {
                        HDialog.Info("已超时限");

                    });

                
                    $('#sshtg').html("已超时限");
                }
                
                if ($('#IsAuditing').val() != "0" && $('#IsAuditing').val()!="")
                {
                    
                    $('#shtg').css("cursor", "default");

                    $('#shtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

                    $('#shtg').click(function (event) {
                        HDialog.Info("费用已审核");

                    });



                    $('#shbtg').css("cursor", "default");

                    $('#shbtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

                    $('#shbtg').click(function (event) {
                        HDialog.Info("费用已审核");


                    });

                    //$('#shtg').attr("disabled", "disabled");
                    //$('#shbtg').attr("disabled", "disabled");
                    if ($('#IsAuditing').val() == "1")
                    { $('#lbAudit').html("审核状态:已通过"); }
                    if ($('#IsAuditing').val() == "2")
                    { $('#lbAudit').html("审核状态:未通过"); }

                }

            }
            InitFunction();


            function SelCost() {               
                
                var  conent = "../dialogNew/CorpCommCostDlg.aspx" + "?Ram=" + Math.random();
               
                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新                      
                        var data = JSON.parse(_Data);
                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#CostID').val(data.CostID);
                        $('#hiCostName').val(data.CostName);                      
                    }
                });

            }

            

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

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
                                                    $('#BuildArea').val(buildArea);
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

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });

            }




            var column = [[

                {
                    field: 'CustName', title: '客户名称', width: 80, align: 'left', sortable: true
                },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
                 { field: 'CostSNum', title: '费用序号', width: 50, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
               
                {
                    field: 'FeesDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DebtsAmount', title: '应冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'CostNames', title: '冲抵费用项目', width: 100, align: 'left', sortable: true },
                { field: 'OldPrecAmount', title: '原预交余额', width: 100, align: 'left', sortable: true },
                { field: 'OffsetAmount', title: '冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'NewPrecAmount', title: '预交余额', width: 100, align: 'left', sortable: true },
                { field: 'TakeWiseName', title: '处理方式', width: 100, align: 'left', sortable: true }


         

            ]];

         
          
            function ExcuteOnServer()
            {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            function AuditingFee(IsAuditing)
            {

                var Title = "确认审核通过冲抵";
                if (IsAuditing == "2")
                {
                    Title = "确认审核不通过冲抵";
                }
                HDialog.Prompt(Title, function () {
                    $.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingPreAudit', $('#frmForm').serialize() + "&iIsAuditing=" + IsAuditing,
                       function Init() {
                       },
                       function callback(_Data) {
                           var r = _Data.split('|');



                           if (r[0] == "true") {
                               if (IsAuditing == "1")
                               { $('#lbAudit').html("审核状态:已通过"); }
                               if (IsAuditing == "2")
                               { $('#lbAudit').html("审核状态:未通过"); }
                           }

                           HDialog.Info(r[1]);



                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                       });

                });
               
            }
            function ToExcel()
            {
                window.location.href = '../Charges/AuditingPreDetailCreExcel.aspx?AuditID='+$('#AuditID').val()+'&FromIndex=' + $("#FromIndex").val();
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
                    pagination: true,
                    width: "100%",
                    toolbar: '#divtt',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "AuditingPreDetail", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                      
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
