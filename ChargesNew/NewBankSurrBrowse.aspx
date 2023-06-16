<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBankSurrBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewBankSurrBrowse" %>


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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3 style="font-family: 'Microsoft YaHei'">这里是银行托收-报盘回盘处理操作介绍<br />
                    点击下一步继续教程</h3>
            </div>
            <div id="walkthrough-2">
                <h3 style="font-family: 'Microsoft YaHei'">自行将代扣文件发送给代收银行，获取代收银行返回的回盘文件</h3>
            </div>

        </div>

        <input type="hidden" id="CommID" name="CommID" runat="server" />

        <input type="hidden" id="AllData" name="AllData" runat="server" />

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">开始时间从</td>
                    <td class="TdContentSearch">
                        <input onkeypress="CheckDate();" id="BeginDate1" class="Wdate"
                            onclick="WdatePicker()" name="BeginDate1" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onkeypress="CheckDate();" id="BeginDate2"
                            onclick="WdatePicker()" name="BeginDate2"
                            runat="server"></td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function GetShow() {
                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [
                        {
                            popup: {
                                content: '#walkthrough-1',
                                type: 'modal'
                            },
                            onLeave: function () {
                                //alert($("#jpwTooltip").attr("style"));
                            }
                        }, {
                            wrapper: '#ivradd',
                            popup: {
                                content: '点击“新增”按钮',
                                type: 'tooltip',
                                position: 'right'
                            },
                            onLeave: function () {
                                //alert($("#jpwTooltip").attr("style"));
                                var width = $(window).width();
                                var height = $(window).height();;
                                var conent = "../ChargesNew/BankSurrCreManage.aspx?OPType=Insert&virShowType=1";
                                HDialog.Open(width, height, conent, '新增代扣', false, function callback(_Data) {
                                    $('body').pagewalkthrough('close');
                                    if (_Data == "1") {
                                        next_step();
                                    }
                                });
                            }
                        }
                    ]
                    ,
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "下一步 &rarr;"
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

            function next_step() {
                $('body').pagewalkthrough({
                    name: 'next_step',
                    steps: [
                        {
                            popup: {
                                content: '自行将代扣文件发送给代收银行，获取代收银行返回的回盘文件',
                                type: 'modal',
                                position: 'bottom'
                            }

                        }, {
                            wrapper: '.HrefStyle',
                            popup: {
                                content: '点击进入“代收记录”页面',
                                type: 'tooltip',
                                position: 'bottom'
                            },
                            onLeave: function () {
                                //var rows = $('#TableContainer').datagrid('getRows');
                                //var firstRow;
                                //if (rows != null && rows.length > 0) {
                                //    firstRow = rows[0];
                                //}
                                var w = $(window).width();
                                var h = $(window).height();
                                HDialog.Open(w, h, '../ChargesNew/NewBankSurrManage.aspx?ivrShowType=1',
                                    '代收记录', false, function callback(_Data) {
                                        if (_Data == "1") {
                                            LoadList();
                                        }
                                    });
                            }
                        }
                    ]
                    ,
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "下一步 &rarr;"
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
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            var column = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'BankName', title: '托收类别', width: 100, align: 'left', sortable: true },
                {
                    field: 'BeginDate', title: '开始时间', width: 160, align: 'left', sortable: true, sortable: true,
                    formatter: function (value, row, index) {

                        //var strSurrState = row.SurrState;

                        //var iTrxID = row.TrxID;
                        //var iOrderNo = row.OrderNo;
                        //var iTrxState = row.TrxState;
                        //var str = '';


                        //var isDelete = true;

                        //if (strSurrState == "1") {
                        //    isDelete = false;

                        //    if (iTrxID > 0 || iOrderNo > 0) {
                        //        if (iTrxState == -2) {
                        //            isDelete = false;
                        //        }
                        //        else {
                        //            isDelete = true;
                        //        }
                        //    }
                        //}
                        //else {
                        //    isDelete = true;
                        //}
                        //if (!isDelete) {
                        //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail(" + row.SurrID + ");\">" + row.BeginDate + "</a>";
                        //}
                        //else {
                        //    str = row.BeginDate;
                        //}
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.SurrID + "','" + row.BankName + "');\">" + row.BeginDate + "</a>";
                        return str;
                    }
                },
                { field: 'ChargeDate', title: '完成时间', width: 140, align: 'left', sortable: true },
                { field: 'AllCounts1', title: '应处理数量', width: 100, align: 'left', sortable: true },
                { field: 'AllAmount1', title: '应处理金额', width: 100, align: 'left', sortable: true },
                { field: 'AllCounts2', title: '已处理数量', width: 100, align: 'left', sortable: true },
                { field: 'AllAmount2', title: '已处理金额', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '操作员', width: 100, align: 'left', sortable: true },
                //{
                //    field: 'TrxStateName', title: '审核状态', width: 100, align: 'left', sortable: true,
                //    formatter: function (value, row, index) {
                //        var str = "<font color=blue>" + row.TrxStateName + "";
                //        return str;
                //    }
                //},
                {
                    field: 'SurrStateName', title: '状态', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<font color=red>" + row.SurrStateName + "";
                        return str;
                    }
                }


            ]];


            //修改代收记录 NewBankSurrManage
            function ViewDetail(SurrID, BankName) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../ChargesNew/NewBankSurrManage.aspx?OPType=Edit&SurrID=' + SurrID + "&BankName=" + BankName,
                    '代收记录', false, function callback(_Data) {
                        if (_Data == "1") {
                            LoadList();
                        }
                    });
            }


            var toolbar = [
                {
                    text: '新增',
                    id: 'ivradd',
                    iconCls: 'icon-add',
                    handler: function () {
                        var width = $(window).width();
                        var height = $(window).height();;
                        var conent = "../ChargesNew/BankSurrCreManage.aspx?OPType=Insert";

                        HDialog.Open(width, height, conent, '新增代扣', false, function callback(_Data) {
                            LoadList();
                        });

                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $('#TableContainer').datagrid('getSelected');
                        if (row == "")
                        { HDialog.Info('请选择要删除的数据!'); }
                        else {
                            HDialog.Prompt('确认删除选择的代扣数据', function () {
                                var strSurrState = row.SurrState;
                                var iTrxID = row.TrxID;
                                var iOrderNo = row.OrderNo;
                                var iTrxState = row.TrxState;
                                var SelData = JSON.stringify(row);
                                $('#AllData').val(SelData);
                                var isDelete = true;
                                if (strSurrState == "1") {
                                    isDelete = false;
                                    if (iTrxID > 0 || iOrderNo > 0) {
                                        if (iTrxState == -2) {
                                            isDelete = false;
                                        }
                                        else {
                                            isDelete = true;
                                        }
                                    }
                                }
                                else {
                                    if (strSurrState == "-1") {
                                        isDelete = false;
                                    }
                                    else {
                                        isDelete = true;
                                    }
                                }

                                if (!isDelete) {
                                    $.tool.DataPostChk('frmForm', 'CustBank', 'BankSurrDelete', $('#frmForm').serialize() + "&SurrID=" + row.SurrID,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data.split('|');

                                            if (r[0] == "true") {

                                            }
                                            HDialog.Info(r[1]);
                                            LoadList();
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                                else {
                                    HDialog.Info('代扣已完成，禁止删除!');

                                }
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
                    }
                }
                //, '-',
                //{
                //    text: '银行代扣测试',
                //    iconCls: 'icon-search',
                //    handler: function () {
                //        $.tool.DataPostChk('frmForm', 'UnionPay', 'UnionPayDeduct', $('#frmForm').serialize(),
                //            function Init() {
                //            },
                //            function callback(_Data) {
                //                if (_Data == "True") {
                //                    HDialog.Info("审核成功!!!");
                //                    LoadList();
                //                } else {
                //                    HDialog.Info("审核失败!!!");
                //                }
                //            },
                //            function completeCallback() {
                //            },
                //            function errorCallback() {
                //            })
                //    }
                //}, '-',
                //{
                //    text: '银行代扣交易查询测试',
                //    iconCls: 'icon-search',
                //    handler: function () {
                //        $.tool.DataPostChk('frmForm', 'UnionPay', 'TransactionQuery', $('#frmForm').serialize(),
                //            function Init() {
                //            },
                //            function callback(_Data) {
                //                if (_Data == "True") {
                //                    HDialog.Info("审核成功!!!");
                //                    LoadList();
                //                } else {
                //                    HDialog.Info("审核失败!!!");
                //                }
                //            },
                //            function completeCallback() {
                //            },
                //            function errorCallback() {
                //            })
                //    }
                //}
            ];


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
                        param = $.JQForm.GetParam("CustBank", "BankSurrList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();


        </script>
    </form>
</body>
</html>

