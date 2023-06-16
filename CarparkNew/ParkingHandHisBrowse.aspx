<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingHandHisBrowse.aspx.cs" Inherits="M_Main.CarparkNew.ParkingHandHisBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head clientidmode="Static">
    <title></title>
      <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ParkID" name="ParkID" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
             style="width: 400px; height: 100px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑; line-height: 25px;">    
               <%-- <tr>
                    <td class="TdTitle">车位/车牌</td>
                    <td class="TdContent">
                        <input class="easyui-searchbox" id="ParkName" style="width:120px;" name="ParkName" searcher="SelParkName" runat="server" />
                        <input type="hidden" name="CustID" id="Hidden1" runat="server" />
                    </td>
                    <td class="TdTitle">可选车位</td>
                    <td class="TdContent">
                        <select id="SelHandID" style="width:120px;" class="easyui-combobox" name="SelHandID" data-options="editable:false,panelHeight: 'auto'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>--%>         
                 <tr>
                    <td style="width: 25%;">车位编号
                    </td>
                    <td style="width: 75%">
                        <input id="ParkName" style="width: 136px" size="17" name="ParkName" maxlength="50" />
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    })
    var column = [[
            { field: 'IID', title: 'IID', width: 20, align: 'left', sortable: true, hidden: true },
            { field: 'ParkName', title: '车位编号', width: 100, align: 'center', sortable: true},
            { field: 'CustName', title: '客户名称', width: 100, align: 'center', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'center', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 100, align: 'center', sortable: true },
            { field: 'UserName', title: '变更人', width: 80, align: 'center', sortable: true },
            {
                field: 'CancelDate', title: '退租日期', width: 100, align: 'center', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.CancelDate, "yyyy-MM-dd HH:mm:ss");
                    return str;
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
                    $("#ParkName").val("");
                }
            }
    ];


    function SelParkName() {
        $('#ParkName').searchbox("setValue", '');
        $('#HandID').val('');

        var conent = "../DialogNew/ParkingHandDlg.aspx";

        HDialog.Open('600', '300', conent, '车位/车牌选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#ParkName').searchbox("setValue", data.ParkName + "(" + data.CarSign + ")");
            $('#HandID').val(data.HandID);


            $.tool.DataGet('Choose', 'ChooseParkingHand', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var ParkingData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelete = varObjects[i].IsDelete;
                            var strTmp = "";

                            if (vIsDelete == 1) {
                                strTmp = "(历史)";
                            }

                            var HandID = varObjects[i].HandID;
                            var CarSign = varObjects[i].CarSign;
                            var ParkName = varObjects[i].ParkName;

                            var ParkText = CarSign + "(" + ParkName + ")" + strTmp;
                            ParkingData.push({ "ParkText": ParkText, "HandID": HandID });

                        }
                        $('#SelHandID').combobox({
                            data: ParkingData,
                            valueField: 'HandID',
                            textField: 'ParkText',
                            onChange: function (n, o) {
                                var data = $('#SelHandID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].HandID) {

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
    
     function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Parking&Command=searchhandhis&' + $("#frmForm").serialize(),
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            width: "100%",
            sortOrder: "asc",
            border:false,
            toolbar: toolbar,
            onDblClickRow: function (rowIndex, rowData) {
                HDialog.Open('720', '610', '../CarparkNew/ParkingHandHisManage.aspx?IID=' + rowData.IID + '&ParkID=' + rowData.ParkID + '&HandID=' + rowData.HandID,
                    '退租办理', false, function callback(_Data) {
                    if (_Data == "true") {
                        LoadList();
                    }
                });
            }
        });
        $("#SearchDlg").dialog("close");
    }

</script>
