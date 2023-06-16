<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendLetteSeachCus.aspx.cs" Inherits="M_Main.UrgeFees.SendLetteSeachCus" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>SendLetteSeachDetail</title>
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
    <script language="javascript">
	 
 

    function toolbarClick1() {


        $('#SearchDlg2').dialog('open');
    }
    
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="SendLetteSeachDetail" method="post" runat="server">
        <input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server"><input id="SelReturn" style="width: 24px; height: 22px" type="hidden" size="1" name="SelReturn"
                runat="server">
        <input id="hiIsSelectSQL" name="hiIsSelectSQL" runat="server" type="hidden" />
        <input id="AllData" name="AllData" type="hidden" />
        <input id="SendLetterID" type="hidden" name="SendLetterID" runat="server">

        <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <input id="OptCode" type="hidden" name="OptCode" runat="server">
        <input id="CostID" type="hidden" name="CostID" runat="server">
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
        <input id="seltype" type="hidden" name="seltype" runat="server" value="1"/>
        
         <input id="CustID" type="hidden" name="CustID" runat="server" />
     
          <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0" style="padding-left: 21px;">
                <tr> 
                    <td>
                          &nbsp;客户名称:&nbsp;<input id="CustName" class="easyui-searchbox" searcher="SelCust" data-options="editable:false"
                            name="CustName" runat="server"   />
                    </td>
                       <td>
                      
                          &nbsp;房号:&nbsp;<input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" data-options="editable:false"
                            name="RoomSign" runat="server"   />
                    </td>

                   
                    <td>
                          &nbsp;<a href="javascript:void(0)" onclick=" JavaScript:LoadData(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                     
                </tr>
            </table>
        </div>
     
    
          
        <div class="SearchContainer" id="TableContainer">
        </div>
         
       
        <script type="text/javascript">

        
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h-38 + "px");
          
               // $("#divtt").css("display", "none");
                
            }
            InitFunction();

         

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


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
                                                    $('#RoomID').val(data[i].RoomID.split('|')[0]);

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


                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);


                    $('#SelectRoomID').combobox({
                        data: '',
                        valueField: 'RoomID',
                        textField: 'RoomText'
                    });

                });
            }

        


            function GetParam() {
                var str = '';   
              
              
                str += '&CustName=' + $('#CustName').val().trim();
                 

                str += '&RoomSign=' + $('#RoomSign').val().trim();
                
                str += '&nYear1=' + $('#nYear1').val().trim();
                str += '&nYear2=' + $('#nYear2').val().trim();


                str += '&PageIndex=' + $('#PageIndex').val().trim();
                str += '&SelReturn=' + $('#SelReturn').val().trim();
                str += '&hiIsSelectSQL=' + $('#hiIsSelectSQL').val().trim();
                str += '&AllData=' + $('#AllData').val().trim();


                str += '&SendLetterID=' + $('#SendLetterID').val().trim();
                str += '&PrintParms=' + $('#PrintParms').val().trim();
                str += '&OptCode=' + $('#OptCode').val().trim();
                str += '&CostID=' + $('#CostID').val().trim();


                str += '&RoomID=' + $('#RoomID').val().trim();
                str += '&hiRoomSign=' + $('#hiRoomSign').val().trim(); 
                str += '&CustID=' + $('#CustID').val().trim();
                str += '&nMonth1=' + $('#nMonth1').val().trim(); 
                str += '&nMonth2=' + $('#nMonth2').val().trim();
                return encodeURI(str);
            }


            var frozenColumns ;

            var column ;
            $('#hiIsSelectSQL').val('-1');

            function LoadList() {

                frozenColumns = [[
              {
                  field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                      var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail( '" + row.SendLetterID + "','" + row.Custid + "','" + row.roomid + "');\">" + row.CustName + "</a>";
                      return str;
                  }
              },
                //{ field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                ]]

                column = [[
               //       { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
               //{ field: 'IID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

                     {
                         field: 'FeesStartDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

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
             
               { field: 'DebtsAmountCount', title: '欠费笔数', width: 150, align: 'left', sortable: true },
               { field: 'DebtsAmount', title: '欠费金额', width: 150, align: 'left', sortable: true },
               { field: 'ISSendLetter', title: '是否发函', width: 150, align: 'left', sortable: true },


               { field: 'SendLetterDate', title: '发函时间', width: 80, align: 'left', sortable: true },
               { field: 'SendLetterRGContent', title: '处理结果', width: 150, align: 'left', sortable: true }

                ]];
                 
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
                 //  toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false, 
                    sortOrder: "asc",
                 
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("SendLetter", "SendLetterDetailCus", "TableContainer", param);
                    } 
                });
               // $('#SearchDlg').dialog('close');
              //  $('#SearchDlg2').dialog('close');
            }

            LoadList();


            function ViewDetail(SendLetterID, CustID,RoomID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../UrgeFees/SendLetteSeachDetail.aspx?SendLetterID=' + SendLetterID + '&CustID=' + CustID + '&RoomID=' + RoomID, "费用明细", false, function callback(_Data) {
                    LoadList();
                });

            }
 
          
            function LoadData() {
                $('#hiIsSelectSQL').val('1');
                LoadList();
            }
  
             

        </script>

    </form>
</body>
</html>


