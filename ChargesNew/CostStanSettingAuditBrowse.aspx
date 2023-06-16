<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostStanSettingAuditBrowse.aspx.cs" Inherits="M_Main.ChargesNew.CostStanSettingAuditBrowse" %>

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
    <style>
        body {
            padding: 0px;
        }
        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="hiCommNames" type="hidden" size="1" name="hiCommNames" runat="server" />
                        <input id="CommIDs" type="hidden" size="1" name="CommIDs" runat="server" />
                    </td>
                </tr>
               
                <tr>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input id="CustName" maxlength="50" name="CustName" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" maxlength="50" name="RoomSign" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                </tr>

                <tr>
                   
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" maxlength="50" name="CostName" data-options="editable:false" searcher="SelCost" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" />
                        <input type="hidden" name="CorpCostIDs" id="CorpCostIDs" runat="server" />
                    </td>
                     <td class="TdTitle">审核状态</td>
                    <td class="TdContentSearch">
                        <select id="AuditState" name="AuditState" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClickConfirm();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="Clear();">清空</a>
                    </td>
                </tr>

            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            //function SelCommInfo() {

            //    var w = $(window).width() * 0.7;
            //    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
            //        var arrRet = JSON.parse(_Data);
            //        $("#CommIDs").val(arrRet.id);
            //        $("#CommNames").text(arrRet.name);
            //    });
            //}

            function SelCommInfo() {
                $('#CommName').val('');
                $('#CommID').val('');

                var conent = "../DialogNew/CommDlg.aspx";
                var w = 800;
                var h = 600;

                HDialog.Open(w, h, conent, '项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $("#CommIDs").val(data.attributes.InPopedom);
                    $("#CommNames").text(data.text);

                });
            }


            function InitFunction() {
                var h = $(window).height() - 2;
                $("#TableContainer").css("height", h + "px");

                $('#BuildSNum').css("width", document.body.clientWidth * 0.15 * 0.7);
                $('#CustName').css("width", document.body.clientWidth * 0.15 * 0.7);

                $('#RoomSign').css("width", document.body.clientWidth * 0.15 * 0.7);
                $('#CostName').css("width", document.body.clientWidth * 0.15 * 0.7);
                $('#SelectRoomID').css("width", document.body.clientWidth * 0.15 * 0.7);

            }
            InitFunction();

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/CustDlg.aspx";
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
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
                //   $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });
                //   $('#SelectRoomID').empty();

                $('#SelectRoomID').combobox({
                    data: [],
                    valueField: 'RoomID',
                    textField: 'RoomText'
                });

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
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CorpCostIDs').val(varObjects[0]);
                        $('#CostName').searchbox('setValue', varObjects[1]);
                    }

                });

            }

            var column = [[
                { field: 'IID', title: 'IID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'CustID', title: 'CustID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'RoomID', title: 'RoomID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'CostID', title: 'CostID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 180, align: 'left', sortable: true },
                { field: 'StanAmount', title: '通用收费标准', width: 100, align: 'left', sortable: true },
                { field: 'DelinRates', title: '违约金比例', width: 100, align: 'left', sortable: true },
                { field: 'StanFormulaName', title: '计算方式', width: 150, align: 'left', sortable: true },
                { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true },
                { field: 'PayTypeName', title: '计费方式', width: 100, align: 'left', sortable: true },
                {
                    field: 'CalcBeginDate', title: '计费开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.CalcBeginDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'StanEndHit', title: '标准状态', width: 100, align: 'left', sortable: true },
                { field: 'AuditState', title: '审核状态', width: 100, align: 'left', sortable: true }

            ]];
            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'BuildName', title: '楼宇', width: 60, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'StateName', title: '交房状态', width: 80, align: 'left', sortable: true },
            ]];

            var toolbar = [
                // {
                //     text: '新增',
                //     iconCls: 'icon-add',
                //     handler: function () {
                //         ViewDetail("单户设置收费标准", 'addone', 0);
                //     }
                // }, '-',
                // {
                //     text: '修改',
                //     iconCls: 'icon-add',
                //     handler: function () {
                //     }
                //} , '-',
                {
                    text: '审核通过',
                    iconCls: 'icon-add',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要审核的标准!');
                        }
                        else {

                            $('#AllData').val(JSON.stringify(rows));
                            $.tool.DataPost('CostStanSetting', 'audit', $('#FrmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var result = _Data.split('|')[0];
                                    var memo = _Data.split('|')[1];
                                    if (result == "true") {
                                        HDialog.Info('操作成功');
                                        LoadList();
                                    }
                                    else { HDialog.Info(memo); }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });

                        }
                    }
                }, '-', {
                    text: '全部审核通过',
                    iconCls: 'icon-add',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getData');
                        if (rows.total == 0) {
                            HDialog.Info('暂无需要审核的标准!');
                        }
                        else {
                            $.tool.DataPost('CostStanSetting', 'allaudit', $('#FrmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var result = _Data.split('|')[0];
                                    var memo = _Data.split('|')[1];
                                    if (result == "true") {
                                        HDialog.Info('操作成功');
                                        LoadList();
                                    }
                                    else { HDialog.Info(memo); }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });

                        }
                    }

                }, '-', {
                    text: '取消审核',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要取消的标准!');
                        }
                        else {

                            $('#AllData').val(JSON.stringify(rows));
                            $.tool.DataPost('CostStanSetting', 'cancel', $('#FrmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var result = _Data.split('|')[0];
                                    var memo = _Data.split('|')[1];
                                    if (result == "true") {
                                        HDialog.Info('操作成功');
                                        LoadList();
                                    }
                                    else { HDialog.Info(memo); }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });

                        }
                    }

                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#RegionName").val("");
                    }
                }
            ];

            //, '-',
            //    {
            //        text: '删除',
            //        iconCls: 'icon-cancel',
            //        handler: function () {
            //            //   var row = $("#TableContainer").datagrid("getSelected");

            //            var rows = $('#TableContainer').datagrid('getChecked');
            //            if (rows == "") {
            //                HDialog.Info('请选择要删除的标准!');
            //            }
            //            else {

            //                $('#AllData').val(JSON.stringify(rows));
            //                $.tool.DataPost('CostStanSetting', 'delete', $('#FrmForm').serialize(),
            //                    function Init() {
            //                    },
            //                    function callback(_Data) {
            //                        var result = _Data.split('|')[0];
            //                        var memo = _Data.split('|')[1];
            //                        if (result == "true") {
            //                            HDialog.Info('删除成功');
            //                            LoadList();
            //                        }
            //                        else { HDialog.Info(memo); }



            //                    },
            //                    function completeCallback() {
            //                    },
            //                    function errorCallback() {
            //                    });

            //            }

            //        }
            //    },



            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CostStanSetting', 'delete', 'IID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                var result = _Data.split('|')[0];
                                var memo = _Data.split('|')[1];
                                if (result == "true") {
                                    HDialog.Info('删除成功');
                                    LoadList();
                                }
                                else { HDialog.Info(memo); }



                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function ClickConfirm() {
                document.getElementById("hiIsSQLData").value = 1;

                if ($("#CommIDs").val() == "") {
                    HDialog.Info("请选择管理项目");
                    return;
                }

                LoadList();
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
                    width: "100%",
                    toolbar: toolbar,
                    //onDblClickRow: function (rowIndex, rowData) {

                    //    if (rowData.HandID > 0) {
                    //        HDialog.Info('车位收费标准在车位资料登记中修改!');
                    //    }
                    //    else {
                    //        var content = '../ChargesNew/CostStanSettingManage.aspx?OpType=update&IID=' + rowData.IID;

                    //        HDialog.Open('800', '400', content, "修改客户标准", false, function callback(_Data) {
                    //            var dData = _Data.split('|');

                    //            if (dData[0] == '1') {

                    //                $('#CustID').val(dData[1])
                    //                $('#CustName').searchbox('setValue', dData[2]);
                    //                $('#RoomID').val(dData[3]);
                    //                $('#RoomSign').searchbox('setValue', dData[4]);

                    //                LoadList();
                    //            }
                    //        });
                    //    }

                    //},
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CostStanSetting", "corpsearch", "TableContainer", param);
                    }
                });


                $("#SearchDlg").dialog("close");
            }

            LoadList();

            function Clear() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#CostName').searchbox("setValue", '');
                $('#CostID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
            }


            function ViewDetail(title, OpType, ID) {


                var width = 800;
                var height = 400;
                var CustID = '';
                var RoomID = '';
                var CustName = '';
                var RoomSign = '';
                if ($('#CustID').val() != '') {
                    CustID = $('#CustID').val();
                }
                CustName = $('#CustName').searchbox('getValue');
                if ($('#RoomID').val() != '') {
                    RoomID = $('#RoomID').val();
                }
                RoomSign = $('#RoomSign').searchbox('getValue');

                var content = '../ChargesNew/CostStanSettingManage.aspx?OpType=' + OpType + '&IID=' + ID;


                if (CustID != '');
                {
                    content = content + '&CustID=' + CustID;
                }
                if (RoomID != '');
                {
                    content = content + '&RoomID=' + RoomID;
                }
                if (CustName != '');
                {
                    content = content + '&CustName=' + CustName;
                }
                if (RoomSign != '');
                {
                    content = content + '&RoomSign=' + RoomSign;
                }

                if (OpType == "addmore") {
                    width = $(window).width();
                    height = $(window).height();
                    content = '../ChargesNew/CostStanSettingBatchManage.aspx';




                }
                HDialog.Open(width, height, content, title, false, function callback(_Data) {
                    var dData = _Data.split('|');

                    if (dData[0] == '1') {

                        $('#CustID').val(dData[1])
                        $('#CustName').searchbox('setValue', dData[3]);
                        $('#RoomID').val(dData[2]);
                        $('#RoomSign').searchbox('setValue', dData[4]);

                        LoadList();
                    }
                });
            }



        </script>
    </form>
</body>
</html>
