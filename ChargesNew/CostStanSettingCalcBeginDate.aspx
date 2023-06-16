<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostStanSettingCalcBeginDate.aspx.cs" Inherits="M_Main.ChargesNew.CostStanSettingCalcBeginDate" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

</head>
<body>
    <form id="FrmForm">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum"  runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">楼宇
                    </td>
                    <td class="TdContentSearch">
                        <select id="BuildSNum" name="BuildSNum"  runat="server">
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" data-options="editable:false" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号
                    </td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" maxlength="50" name="RoomSign" searcher="SelRoom" data-options="editable:false" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" maxlength="50" data-options="editable:false"  name="CostName" searcher="SelCost" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>

            </table>
        </div>
        <div id="SearchDlg2" class="easyui-dialog" title="设置计费开始时间" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent">
                        <input type="button" class="button" value="标准选择" id="BtnSelCost" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用名称</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="CostName2" maxlength="50" readonly name="CostName2" runat="server" />
                        <input type="hidden" name="CostID2" id="CostID2" runat="server" />
                        <input type="hidden" name="IID" id="IID" runat="server" />

                    </td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="StanName2" maxlength="50" readonly name="StanName2" runat="server" />
                        <input type="hidden" name="StanID2" id="StanID2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>计费开始时间</td>
                    <td colspan="3">
                        <input id="CalcBeginDate" class="easyui-datebox" data-options="prompt:'请选择日期',required:true" name="CalcBeginDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SetCalcBegindate();">确定设置</a></td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height() - 2;
                $("#TableContainer").css("height", h + "px");

                $('#SelectRoomID').css("width", document.body.clientWidth * 0.15 * 0.8);
                $('#BuildSNum').css("width", document.body.clientWidth * 0.15 * 0.8);
                $('#RoomSign').css("width", document.body.clientWidth * 0.15 * 0.8);
                $('#CustName').css("width", document.body.clientWidth * 0.15 * 0.8);
                $('#CostName').css("width", document.body.clientWidth * 0.15 * 0.8);

            }
            InitFunction();

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);

                    $('#CustID').val(data.CustID);


                    $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
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
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

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
                                                    $('#RoomID').val(data[i].RoomID);
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
            function SelCost() {
                var conent = "../DialogNew/CorpCommCostDlg.aspx";

                HDialog.Open('500', '400', conent, '费用项目选择', false, function callback(_Data) {


                    var data = JSON.parse(_Data);
                    $('#CostName').searchbox("setValue", data.CostName);
                    $('#CostID').val(data.CostID);
                });
            }


            $("#BtnSelCost").click(function () {
                var CostName = $('#CostName').val();
                var OPType = $('#hiOPType').val();

                if (OPType != "update") {
                    CostName = "";
                }
                var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName;
                HDialog.Open('1000', '600', conent, '费用标准选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    //alert(_Data)
                    $('#CostID2').val(data.attributes.CostID);
                    $('#CostName2').val(data.attributes.CostName);
                    $('#StanID2').val(data.attributes.StanID);
                    $('#StanName2').val(data.attributes.StanName);

                });
            });

            function SetCalcBegindate() {
                var CostID = $('#CostID2').val();
                var StanID = $('#StanID2').val();
                if (CostID == "" || StanID == "") {
                    HDialog.Info('请选择收费项目');
                }
                else {

                    $.tool.DataPostChk('FrmForm', 'CostStanSetting', "SetBatchBegindate", $("#FrmForm").serialize(),
                      function Init() {
                      },
                      function callback(_Data) {
                          if (_Data == "true") {
                              HDialog.Info('设置成功');
                              LoadList();
                              $("#SearchDlg2").dialog("close");
                          }
                      },
                      function completeCallback() {
                      },
                      function errorCallback() {

                      });
                }
            }

            var column = [[
                    { field: 'IID', title: 'IID', width: 10, align: 'left', sortable: true, hidden: true },
                    { field: 'CustID', title: 'CustID', width: 10, align: 'left', sortable: true, hidden: true },
                    { field: 'RoomID', title: 'RoomID', width: 10, align: 'left', sortable: true, hidden: true },
                    { field: 'CostID', title: 'CostID', width: 10, align: 'left', sortable: true, hidden: true },
                    { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
                    { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                    { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                    { field: 'StanName', title: '标准名称', width: 180, align: 'left', sortable: true },
                    { field: 'StanAmount', title: '通用收费标准', width: 100, align: 'left', sortable: true },
                    { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true },
                    {
                        field: 'CalcBeginDate', title: '计费开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = row.CalcBeginDate.ToCustomizeDate();
                            return str;
                        }
                    },
                    { field: 'StanEndHit', title: '标准状态', width: 100, align: 'left', sortable: true }

            ]];
            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 250, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 250, align: 'left', sortable: true },
                { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
            ]];

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
                        text: '批量设置',
                        iconCls: 'icon-add',
                        handler: function () {
                            $('#SearchDlg2').parent().appendTo($("form:first"))
                            $('#SearchDlg2').dialog('open');
                            $('#BtnSelCost').show();
                            $('#CostID2').val('');
                            $('#CostName2').val('');
                            $('#StanID2').val('');
                            $('#StanName2').val('');
                            $('#IID').val();
                            $('#CalcBeginDate').datebox('setValue', '');
                        }
            }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStanSetting&Command=search&' + $("#FrmForm").serialize(),
                    method: "get",
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
                    width: "100%",
                    toolbar: toolbar,
                    onDblClickRow: function (rowIndex, rowData) {

                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');

                        $('#BtnSelCost').hide();
                        $('#IID').val(rowData.IID);
                        $('#CostID2').val(rowData.CostID);
                        $('#CostName2').val(rowData.CostName);
                        $('#StanID2').val(rowData.StanID);
                        $('#StanName2').val(rowData.StanName);
                        $('#CalcBeginDate').datebox('setValue', rowData.CalcBeginDate);


                    },
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });


                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#CostName').searchbox("setValue", '');
                $('#CostID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                  $("#SearchDlg").dialog("close");




            }




            LoadList();


            function ViewDetail(title, OpType, ID) {

                var width = 800;
                var height = 400;
                var content = '../ChargesNew/CostStanSettingManage.aspx?OpType=' + OpType;
                if (OpType == "addmore") {
                    content = '../ChargesNew/CostStanSettingBatchManage.aspx';
                    width = 1000;
                    height = 800;
                }
                HDialog.Open(width, height, content, title, false, function callback(_Data) {
                    LoadList();
                });
            }



        </script>
    </form>
</body>
</html>
