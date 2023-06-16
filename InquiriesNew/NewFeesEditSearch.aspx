<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesEditSearch.aspx.cs" EnableEventValidation="false" ViewStateEncryptionMode="Never" EnableViewStateMac="false" EnableViewState="false" Inherits="M_Main.InquiriesNew.NewFeesEditSearch" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
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

    <script type="text/javascript">

    	

		<!--
    function btnClear_OnClick() {
        $('#CustID').val('');
        $('#CustName').val('');
        $('#hiCustName').val('');

        $('#RoomID').val('');
        $('#RoomSign').val('');
        $('#hiRoomSign').val('');

        $('#CostIDs').val('');
        $('#CostNames').val('');
        $('#hiCostNames').val('');


        $('#StanIDs').val('');
        $('#StanNames').val('');
        $('#hiStanNames').val('');



        $('#CustTypeID').val('');
        $('#ChargeTypeID').val('');

        $('#BuildSNums').val('');
        $('#BuildNames').val('');
        $('#hiBuildNames').val('');


        $('#RoomState').val('');

        document.getElementById('SelectRoomID').options.length = 0;

        $('#RegionSNums').val('');
        $('#RegionNames').val('');
        $('#hiRegionNames').val('');
        $('#RegionNum').val('');

    }

  

    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }


    //-->
    </script>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="BuildSNums"  type="hidden"
            size="1" name="BuildSNums" runat="server"/><input id="hiBuildNames"  type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492"/>
        <input  id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input  id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input  id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
        <input  id="CustID" class="easyui-validatebox" size="1" type="hidden" name="CustID" runat="server" />
        <input style="width: 12px" id="hiCustName" class="easyui-validatebox" size="1" type="hidden" name="hiCustName" runat="server" />
        <input  id="RoomID" class="easyui-validatebox" size="1" type="hidden" name="RoomID" runat="server" />
        <input  id="hiRoomSign" class="easyui-validatebox" size="1" type="hidden" name="hiRoomSign" runat="server" />
        <input  id="CarparkIDs" class="easyui-validatebox" size="1" type="hidden" name="CarparkIDs" runat="server" />
        <input  id="hiCarparkNames" class="easyui-validatebox" size="1" type="hidden" name="hiCarparkNames" runat="server" />
        <input  id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input  id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input  id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input  id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input  id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input  id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input  id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />

        <div style="width: auto; background-color: #cccccc; height: auto;" id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
             style="width: 800px; height: 330px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">操作时间
                    </td>
                    <td class="DialogTdDateContent">  
                        <input type="text" class="easyui-datebox" style="width:40%" id="SetBeginDate" runat="server" name="SetBeginDate" />到
                        <input type="text" runat="server" class="easyui-datebox" style="width:40%" id="SetEndDate" name="SetEndDate" />
                    </td>
                    <td class="TdTitle">操作人
                    </td>
                    <td class="TdContent">
                        <input id="UserName" class="easyui-validatebox"  name="UserName" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames"  class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                             name="BuildNames" runat="server" /><%--<input class="button_sel" id="btnSelBuild" onclick="javascript: if (btnSelBuild_OnClick() == false) return false;"
                                type="button" name="btnSelBuild" runat="server" />--%>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox"  searcher="SelRegion" data-options="editable:false"
                             name="RegionNames" runat="server" />
                     <%--   <input id="btnSelRegions" class="button_sel" onclick="javascript: if (btnSelRegions_OnClick() == false) return false;"
                            type="button" name="btnSelRegions" runat="server" />--%>
                       <%-- <input style="width: 8%" id="RegionNum" class="easyui-validatebox"   name="RegionNum" runat="server" />--%>

                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContent">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server" data-options="editable:false" >
                        <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName"  class="easyui-searchbox" searcher="SelCust" data-options="editable:false"
                            name="CustName" runat="server" />
                      <%--  <input id="btnSelCust" class="button_sel" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                            type="button" name="btnSelCust" runat="server" />--%>
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'"  name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" data-options="editable:false"
                             name="RoomSign" runat="server" />
                      <%--  <input style="height: 22px" id="btnSelRoom" class="button_sel" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                            type="button" name="btnSelRoom" runat="server" />--%>
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContent">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames"  class="easyui-searchbox" searcher="SelCost" data-options="editable:false"
                             name="CostNames" runat="server" />

<%--                        <input id="btnSelCost" class="button_sel" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            type="button" name="btnSelCost" runat="server" />--%>
                    </td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames"  class="easyui-searchbox" searcher="SelStan"
                             name="StanNames" runat="server">
                       <%-- <input id="btnSelStan" class="button_sel" onclick="javascript: if (btnSelStan_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelStan" runat="server" />--%>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContent">
                        <select id="FeesDateType" name="FeesDateType" runat="server">
                            <option value="1" selected>费用日期</option>
                            <option value="2">应收日期</option>
                        </select>


                    </td>
                    <td class="TdTitle">操作类型</td>
                    <td class="TdContent">
                        <select id="ChangeType" name="ChangeType" runat="server">
                            <option value="全部" selected>全部</option>
                            <option value="费用入账">费用入账</option>
                            <option value="费用导入新增">费用导入新增</option>
                            <option value="费用输入新增">费用输入新增</option>
                            <option value="车位费用新增">车位费用新增</option>
                            <option value="报事费用新增">报事费用新增</option>
                            <option value="租赁合同新增">租赁合同新增</option>
                            <option value="其它合同新增">其它合同新增</option>
                            <option value="修改">修改</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="DialogTdDateContent">
                        <input type="text" class="easyui-datebox" style="width:40%" id="EditBeginDate" runat="server" name="EditBeginDate" />到
                        <input type="text" class="easyui-datebox" id="EditEndDate" style="width:40%" runat="server" name="EditEndDate" />
                    </td>
                    <td></td>
                    <td>
                </tr>

                <tr>
                    <td colspan="4" align="center"><input class="button" id="btnSave" 
                        type="button" value="查询" name="btnSave" runat="server"/>
                    </td>
                </tr>
            </table>
        </div>


       <%-- <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td width="365px" align="left">操作时间</td>
                    <td></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();LoadList();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a>

                        <input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
                            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                                runat="server" /><input style="height: 22px; width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server" />
                    </td>
                </tr>
            </table>
        </div>--%>
        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />
        <script type="text/javascript" src="../jscript/CloseAjaxCache.js" ></script>
        <script type="text/javascript" type="text/javascript">


            function SelBuild() {
                var varReturn;



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
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length ));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }



            function SelRegion() {
                
                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums  = "";
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


            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
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


                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);


                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";


                        $('#StanIDs').val(RegionSNums);
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


            function InitTableHeight() {
                var h = $(window).height();

                $("#TableContainer").css("height", h + "px");
                $("select").each(function () {

                    var key = $(this).attr("id");
                    $(this).css("width", document.body.clientWidth * 0.09);
                });

            }

            InitTableHeight();
            var column = [[

                    { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                    { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },


                    {
                        field: 'ChangeDate', title: '操作日期', align: 'left', sortable: true, width: 150, formatter: function (value, row, index) {
                            var str = formatDate(row.ChangeDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'UserName', title: '操作人', align: 'left', sortable: true, width: 100 },
                    { field: 'ChangeTypeName', title: '操作类别', align: 'left', sortable: true, width: 100 },
                    {
                        field: 'OldFeeDueYearMonth', title: '原费用日期', align: 'left', sortable: true, width: 100
                    },
                    {
                        field: 'NewFeeDueYearMonth', title: '现费用日期', align: 'left', sortable: true, width: 100
                    },
                    {
                        field: 'OldAccountsDueDate', title: '原应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.OldAccountsDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'NewAccountsDueDate', title: '现应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.NewAccountsDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'OldDueAmount', title: '原应收金额', align: 'left', sortable: true, width: 100 },
                    { field: 'NewDueAmount', title: '现应收金额', align: 'left', sortable: true, width: 100 },
                    { field: 'FeesMemo', title: '备注', align: 'left', sortable: true, width: 100 }
            ]];

            var toolbar = [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }, '-'
                    , {
                        text: 'Excel输出',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            ToExcel();
                        }
                    }
            ];

            function SearchDlg() {

                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }


            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
            }
           
            var frozenColumns = [[

                 { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 80 },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 150 },
            { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 150 }

            ]];

            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns:frozenColumns,
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
                        param = $.JQForm.GetParam("FeesDueSeach", "FeesEditSeach", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });

            }

         
            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });
      
            $('#btnSave').click(function () {

                $('#hiIsSQLData').val(1);

                LoadList();
                $('#SearchDlg').dialog('close');
                //btnClear_OnClick(); 

            });


            function ToExcel() {
                window.location.href = "../Inquiries/FeesEditSearchCre.aspx";
            }

            document.getElementById('hiIsSQLData').value = -1;
            LoadList();


        </script>




    </form>
</body>
</html>
