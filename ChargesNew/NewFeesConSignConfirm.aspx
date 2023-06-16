<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesConSignConfirm.aspx.cs" Inherits="M_Main.ChargesNew.NewFeesConSignConfirm" %>


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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3 style="font-family: 'Microsoft YaHei'">这里是人工托收-托收确认页面操作介绍<br />
                    点击下一步继续教程</h3>
            </div>
        </div>

        <input id="AllBills" name="AllBills" type="hidden" runat="server" />

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">票据号码</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="BillsSign" type="text" name="BillsSign" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收款人</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="Control_ItemInput" id="UserName" type="text"  name="UserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnSearch"
                            type="button" value="查询" name="btnSearch" runat="server" /></td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function GetShow() {
                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [
                        {
                            popup: {
                                content: '#walkthrough-1',
                                type: 'modal'
                            }
                        }, {
                            wrapper: '#ivrsearch',
                            popup: {
                                content: '点击“筛选”按钮，输入筛选条件后进行查询',
                                type: 'tooltip',
                                position: 'right'
                            },
                            onLeave: function () {
                                $('#TableContainer').datagrid('selectAll');
                            }
                        }, {
                            wrapper: '.datagrid-header-check',
                            popup: {
                                content: '勾选查询出需要托收的相应记录！',
                                type: 'tooltip',
                                position: 'right'
                            }
                        }, {
                            wrapper: '#ivradd',
                            popup: {
                                content: '勾选相应记录后点击“托收确认”按钮',
                                type: 'tooltip',
                                position: 'right'
                            }
                        }
                    ]
                    ,
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "结束 &#10004;",
                        },
                        jpwPrevious: {
                            i18n: "&larr; 上一步"
                        },
                        jpwClose: {
                            i18n: "关闭",
                        }
                    }
                });

                $('body').pagewalkthrough('show');
            };

            $(document).ready(function () {
                //alert(GetQueryString("ShowType"))
                if (GetQueryString("ShowType") == "1") {

                    $('body').pagewalkthrough({
                        name: 'introduction3',
                        steps: [{
                            wrapper: '.datagrid-toolbar',
                            popup: {
                                content: '<span style=\'font-size:30px\'>勾选记录后点击托收确认</span>',
                                type: 'tooltip',
                                position: 'bottom'
                            },
                            onLeave: function (e) {
                                if (e) {
                                    window.parent.Close();
                                }
                            }
                        }
                        ],
                        buttons: {
                            jpwNext: {
                                i18n: "下一步 &rarr;"
                            },
                            jpwFinish: {
                                i18n: "结束 &#10004;",
                            },
                            jpwPrevious: {
                                i18n: "&larr; 上一步"
                            },
                            jpwClose: {
                                i18n: "关闭",
                            }
                        },
                        onClose: function () {
                            window.parent.Close();
                        }
                    })

                    $('body').pagewalkthrough('show');
                }
            }

            )
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


            var column = [[

                {
                    field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','" + row.ReceID + "');\">" + row.BillsSign + "</a>";
                        return str;
                    }
                },
                { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                { field: 'BillsDate', title: '收费日期', width: 180, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '金额', width: 100, align: 'left', sortable: true },
                { field: 'PerSurplus', title: '零头结转', width: 100, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '打印次数', width: 100, align: 'left', sortable: true }



            ]];

            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
            ]];
            var toolbar = [
                {
                    text: '筛选',
                    id: 'ivrsearch',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '托收确认',
                    id: 'ivradd',
                    iconCls: 'icon-add',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择确认托收的票据!');
                        }
                        else {

                            var SelData = JSON.stringify(rows);
                            $('#AllBills').val(SelData);



                            $.tool.DataPostChk('frmForm', 'FeesConSign', 'FeesConSignConfirm', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var r = _Data.split('|');

                                    if (r[0] == "true") {
                                        LoadList();
                                    }
                                    HDialog.Info(r[1]);

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }

                    }
                }, '-',
                {
                    text: '取消托收',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要取消托收的票据!');
                        }
                        else {
                            var SelData = JSON.stringify(rows);
                            $('#AllBills').val(SelData);



                            $.tool.DataPostChk('frmForm', 'FeesConSign', 'FeesConSignDelete', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var r = _Data.split('|');

                                    if (r[0] == "true") {
                                        LoadList();
                                    }
                                    HDialog.Info(r[1]);

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    }
                }, '-', {
                     text: "金额: <span id='checkMoney' style='color:red;'>0.00</span> 元",
                }
            ];


            function ViewDetail(title, ReceID) {

                var w = $(window).width();
                var h = $(window).height();

                var conent = '../ChargesNew/FeesConSignManage.aspx?ReceID=' + ReceID + '&OpType=edit';

                HDialog.Open(w, h, conent, title, false, function callback(_Data) {
                    if (_Data == '1') {
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
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: false,
                    selectOnCheck: false,
                    checkOnSelect: true,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesConSign", "FeesConSignListCust", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    },
                    onCheck: function (rowIndex, rowData) {
                        var rowMoney = Number(rowData.PaidAmount); 
                        var checkMoney =Number($("#checkMoney").text());
                        $("#checkMoney").text(checkMoney + rowMoney);
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var rowMoney = Number(rowData.PaidAmount);
                        var checkMoney = Number($("#checkMoney").text());
                        var a = checkMoney - rowMoney;
                        $("#checkMoney").text(a.toFixed(2));
                    },
                    onCheckAll: function (rows) {
                        var allMoney = 0.00;
                        for (var i = 0; i < rows.length; i++) {
                            allMoney += Number(rows[i].PaidAmount);
                        }
                         $("#checkMoney").text(allMoney);
                    },
                    onUncheckAll: function (rows) {
                        $("#checkMoney").text(0.00);
                    }
                });

            }
            LoadList();
            $('#btnSearch').click(function () {

                LoadList();
                Clear();
                $("#SearchDlg").dialog("close");
            });





            function Clear() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');

                $('#hiCustName').val('');
                $('#hiRoomSign').val('');
                $('#BillsSign').val('');
            }
        </script>
    </form>
</body>
</html>
