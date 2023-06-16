<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendLetteSeachDetailNew.aspx.cs" Inherits="M_Main.UrgeFees.SendLetteSeachDetailNew" %>


<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
      <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
          
        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />
        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />  
        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />
                <input id="CostID" type="hidden" name="CostID" runat="server" />
        <input id="RoomStates"  type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />   
          <input id="clickFollowUpCode" type="hidden" name="clickFollowUpCode" runat="server" /> 
           <input id="RoomID" type="hidden" name="RoomID" runat="server" />
          <input id="seltype" type="hidden" name="seltype" runat="server" value="1" />  
          <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <input id="OptCode" type="hidden" name="OptCode" runat="server">
               <input id="SendLetterID" type="hidden" name="SendLetterID" runat="server">
      
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
       
        

             <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                       &nbsp;楼宇:&nbsp;<input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server"   />
                    </td>
                    <td>
                      
                          &nbsp;房号:&nbsp;  <input id="RoomSign" style="width: 80%" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" />
                    </td>
                    <td>
                          &nbsp;客户名称:&nbsp;<input id="CustName" class="easyui-searchbox" searcher="SelCust" data-options="editable:false"
                            name="CustName" runat="server"   />
                         <input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" />

                        <input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" />
                    </td>
                     

                   
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    
                </tr>
            </table>
        </div>

        <div id="TableContainer"></div>
        <div id="TableContainer2"></div>
 
    </form>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", (h-h/3-30)  + "px");
            $("#TableContainer2").css("height", h / 3 + "px");
        }
        InitTableHeight();





        function SelBuild() {
            HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {

                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("|");
                    var BuildSNums = "";
                    var BuildNames = "";
                    $('#BuildSNums').val(BuildSNums);
                    $('#BuildNames').searchbox('setValue', BuildNames);

                    for (var i = 0; i < varObjects.length; i++) {
                        if (varObjects[i].indexOf(",") > 0) {
                            var d1 = varObjects[i].split(",")[0];
                            var d2 = varObjects[i].split(",")[1];

                            BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                            BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                        }

                    }
                    $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                    $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                }
            });

        }

        function SelRegion() {

            HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {

                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("|");
                    var RegionSNums = "";
                    var RegionNames = "";

                    $('#RegionSNums').val(RegionSNums);
                    $('#RegionNames').searchbox('setValue', RegionNames);
                    $('#hiRegionNames').val(RegionNames);

                    for (var i = 0; i < varObjects.length; i++) {
                        if (varObjects[i].indexOf(",") > 0) {

                            RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                            RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                        }

                    }
                    $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                    $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                    $('#hiRegionNames').val(RegionNames);

                }
            });

        }

        function SelCost() {

            HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("\t");

                    $('#CostIDs').val(varObjects[0]);
                    $('#CostNames').searchbox('setValue', varObjects[1]);

                }
            });

            return false;
        }

        function SelRoomState() {

            var strRoomStates = "";

            HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                var varReturn = _data;

                if (varReturn != "") {//**获得返回 刷新
                    var varObjects = varReturn.split("\t");

                    $('#RoomStates').val(varObjects[0]);
                    $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                    $('#hiRoomStateNames').val(varObjects[0]);
                    //var arrRoomStateSNums = varObjects[0].split(',');
                    //$('#RoomStateNum').val(arrRoomStateSNums.length);
                }

            });
        }

        frozenColumns = [[
        { field: 'ck', checkbox: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

        ]];

        column = [[

       { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
       { field: 'IID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

       { field: 'BuildArea', title: '建筑面积', width: 150, align: 'left', sortable: true },
       { field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true },
       { field: 'Telephone', title: '联系电话', width: 150, align: 'left', sortable: true },


       //{ field: 'CostSNum', title: '费用序号', width: 80, align: 'left', sortable: true },
       { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
       {
           field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
       },
       {
           field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

               var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
               return str;
           }
       },
       {
           field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

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
       { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
        { field: 'ISUrgeFees', title: '是否催费', width: 50, align: 'center', sortable: true },
        { field: 'UrgeFeesCount', title: '催费次数', width: 50, align: 'center', sortable: true },
        { field: 'UrgeFeesDateNew', title: '最近催费时间', width: 150, align: 'center', sortable: true },
        { field: 'ArrearsTypeName', title: '欠费原因', width: 150, align: 'center', sortable: true },
        { field: 'SendLetterCount', title: '发函次数', width: 50, align: 'center', sortable: true },
        { field: 'SendLetterRGDate', title: '最近发函时间', width: 150, align: 'center', sortable: true }

        //{ field: 'PlanYear', title: '计划回收年月', width: 100, align: 'center', sortable: true },
        //{ field: 'ISSendLetter', title: '是否发函', width: 50, align: 'center', sortable: true },
        //{ field: 'SendLetterCount', title: '发函次数', width: 50, align: 'center', sortable: true },
        //{ field: 'SendLetterDate', title: '最近发函时间', width: 150, align: 'center', sortable: true },



      //{ field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
       //{ field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
       //{ field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
       //{ field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
       //{ field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
       //{ field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
       //{ field: 'ArrearsTypeName', title: '欠费原因', width: 150, align: 'left', sortable: true },
       //{ field: 'PlanYear', title: '计划回收年月', width: 150, align: 'left', sortable: true },
       //{ field: 'Measures', title: '催缴措施', width: 100, align: 'left', sortable: true },
       //{ field: 'ArrearsSubName', title: '欠费主体', width: 100, align: 'left', sortable: true },
       //{ field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true } 

        ]];

    

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                title:"欠费明细",
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                frozenColumns: frozenColumns,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%", 
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("SendLetter", "LoadCorpData", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                
                }, onClickRow: function (rowIndex, rowData) {
                
                    $("#clickFollowUpCode").val(rowData.GroupIID);
                    LoadList2();
                }
            });

        }
 
      LoadList();



      var column2 = [[
                      { field: 'username', title: '发函人员', width: 50, align: 'left', sortable: true },
                      { field: 'SendLetterRGDate', title: '发函时间', width: 60, align: 'left', sortable: true },
                     
                     { field: 'SendLetterRGContent', title: '发函内容', width: 160, align: 'left', sortable: true }
                     //{ field: 'ArrearsTypeName', title: '欠费原因', width: 50, align: 'center', sortable: true },
                     //{ field: 'Measures', title: '催缴措施', width: 100, align: 'left', sortable: true },
                     //{ field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true },
                     //{ field: 'PlanYear', title: '计划回收年月', width: 50, align: 'center', sortable: true }
                    
      ]];

        function LoadList2() {
            $("#TableContainer2").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                title: "发函记录",
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column2,
                fitColumns: true,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("SendLetter", "RegisterDetail", "TableContainer2", param);
                },
                onLoadSuccess: function (data) {
               
                }
            });
            

        }
        LoadList2();



        function SelCust() {

            $('#CustName').searchbox("setValue", '');
            $('#CustID').val('');
            $('#RoomSign').searchbox("setValue", '');
            $('#RoomID').val('');
         //   $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


            var w = 700;
            var h = 400;

            var conent = "../DialogNew/CustDlg.aspx";

            HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#CustName').searchbox("setValue", data.CustName);
                $('#CustID').val(data.CustID);


                //$.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                //    function Init() {
                //    },
                //    function callback(_Data) {

                //        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                //        if (varObjects.length > 0) {

                //            var RoomData = [];
                //            for (var i = 0; i < varObjects.length; i++) {

                //                var vIsDelLive = varObjects[i].IsDelLive;
                //                var strTmp = "";

                //                if (vIsDelLive == 1) {
                //                    strTmp = "(历史)";
                //                }
                //                var RoomID = varObjects[i].RoomID;
                //                var RoomSign = varObjects[i].RoomSign;
                //                var Buildarea = varObjects[i].BuildArea;

                //                var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                //                RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                //            }
                //            $('#SelectRoomID').combobox({
                //                data: RoomData,
                //                valueField: 'RoomID',
                //                textField: 'RoomText',
                //                onChange: function (n, o) {


                //                    var data = $('#SelectRoomID').combobox('getData');
                //                    if (data.length > 0) {
                //                        for (var i = 0; i < data.length; i++) {
                //                            if (n == data[i].RoomID) {

                //                                $('#RoomSign').searchbox('setValue', data[i].RoomText);
                //                                $('#RoomID').val(data[i].RoomID.split('|')[0]);

                //                                break;
                //                            }
                //                        }
                //                    }
                //                }
                //            });
                //        }
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //    });

            });
        }


        function SelRoom() {
            $('#CustName').searchbox("setValue", '');
            $('#CustID').val('');
            $('#RoomSign').searchbox("setValue", '');
            $('#RoomID').val('');
            //$('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

            var conent = "../DialogNew/RoomDlg.aspx";


            var w = $(window).width();
            var h = $(window).height();

            HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#RoomSign').searchbox("setValue", data.RoomSign);
               // $('#CustName').searchbox("setValue", data.CustName);
               // $('#CustID').val(data.CustID);
                $('#RoomID').val(data.RoomID);


                //$('#SelectRoomID').combobox({
                //    data: '',
                //    valueField: 'RoomID',
                //    textField: 'RoomText'
                //});

            });
        }



        function SetFollowUpCotent(IID) {
            //$.tool.DataPost('UrgeFees', 'SetFollowUpCotent', "&IID=" + IID + "&FollowUpCode=" + FollowUpCode,
            //  function Init() {
            //  },
            //  function callback(_Data) {

            //  },
            //  function completeCallback() {
            //  },
            //  function errorCallback() {
            //  });

            HDialog.Open(800, 320, '../UrgeFees/UrgeFeesFollowUpDlg.aspx?IID=' + IID, "催费登记", false, function callback(_Data) {
                LoadList();


            });
        }
    </script>
</body>
</html>
