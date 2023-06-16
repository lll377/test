<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFeesFrame.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFeesFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
</head>
<body style="padding: 0px; margin: 0px;">
    <form id="frmForm" runat="server">
        <input id="IncidentDealStateName" type="hidden" name="IncidentDealStateName" runat="server" />
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server" />
        <input type="hidden" name="FeesRow" id="FeesRow" runat="server" />
        <input type="hidden" name="OperatorType" id="OperatorType" runat="server" />
        <input type="hidden" name="FeesDueDate" id="FeesDueDate" runat="server" />
        <input type="hidden" name="CheckDates" id="CheckDates" runat="server" />
        <input type="hidden" name="IsAddMonth" id="IsAddMonth" runat="server" />

        <div id="TableContainer">
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var toolbar = [
                {
                    text: '刷新',
                    iconCls: 'icon-reload',
                    handler: function () {
                        LoadList();
                    }
                }
            ];

            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true }

            ]];
            var column = [[
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },

                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true }
            ]];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Fees&Command=IncidentFeesSearch&IncidentID=' + $('#IncidentID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    toolbar: toolbar,
                    remoteSort: false,
                    width: "100%",
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });
            }
            /*********************费用修改*********************/
            function FeesUpdate() {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {

                    if (row.FeesID != 0) {
                        var IsOperator;
                        IsOperator = FeesIsOperator(row);

                        var IsDel = IsOperator.split('|')[1];
                        if (IsDel.split(':')[0] == "true") {
                            CheckIsOverAcount(row, "update");
                        }
                        else {

                            HDialog.Info(IsDel.split(':')[1]);
                        }
                    }
                    else {
                        HDialog.Info('请选择要删除的费用');
                    }
                } else {
                    HDialog.Info('请选择要删除的费用');
                }
            }
            /*********************费用删除*********************/
            function FeesDelete() {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {

                    if (row.FeesID != 0) {
                        var IsOperator;
                        IsOperator = FeesIsOperator(row);

                        var IsDel = IsOperator.split('|')[1];
                        if (IsDel.split(':')[0] == "true") {
                            HDialog.Prompt("是否确认删除此费用", function () {
                                CheckIsOverAcount(row, "delete");
                            });

                        }
                        else {

                            HDialog.Info(IsDel.split(':')[1]);
                        }
                    }
                    else {
                        HDialog.Info('请选择要删除的费用');
                    }
                } else {
                    HDialog.Info('请选择要删除的费用');
                }
            }

            function FeesIsOperator(row) {

                var IsSplit = "false:false";
                var IsDel = "false:false";
                var IsUpdate = "false:false";

                var strSysCostSign = row.SysCostSign;
                var strDueAmount = row.DueAmount;
                var strDebtsAmount = row.DebtsAmount;
                var strAccountFlag = row.AccountFlag;
                var strCostName = row.CostName;
                var strIsBank = row.IsBank;
                var strIsFreeze = row.IsFreeze;
                var strIsProperty = row.IsProperty;
                var strIsPrec = row.IsPrec;
                var strMeterSign = row.MeterSign;

                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                ) {
                    if (strMeterSign == "") {
                        IsUpdate = "true:true"
                        IsDel = "true:true";
                        IsSplit = "true:true";
                    }
                    else {
                        IsUpdate = "false:抄表类费用不允许修改";
                        //    IsDel = "false:抄表类费用不允许删除";
                        IsDel = "true:true";
                        IsSplit = "false:抄表类费用不允许拆分";
                    }


                }
                else {
                    if ((ToDecimal(strDueAmount, 2) != ToDecimal(strDebtsAmount, 2))) {
                        IsUpdate = "false:应收金额不等于欠收金额不允许修改";
                        IsDel = "false:应收金额不等于欠收金额不允许删除";
                        IsSplit = "false:应收金额不等于欠收金额不允许拆分";
                    }
                    if ((ToDecimal(strAccountFlag, 0) == 0)) {
                        IsUpdate = "false:入账费用在应收输入模块中不允许修改";
                        IsDel = "false:入账费用在应收输入模块中不允许删除";

                    }
                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }
                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                    && (strMeterSign == "")
                ) {
                    IsSplit = "true:true";
                }
                else {


                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }

                if (strSysCostSign == "B0005" && strCostName != "补交") {

                    IsUpdate = "false:产权税费不允许修改";
                    IsDel = "false:产权税费不允许删除";
                    IsSplit = "false:产权税费不允许拆分";
                }

                //0 修改，1删除，2修改
                return IsUpdate + "|" + IsDel + "|" + IsSplit;
            }

            function FeesOperator(rowData, type) {
                var FeesRow = JSON.stringify(rowData);
                //console.log(rowData);
                var CommID = rowData.CommID;
                $('#FeesRow').val(FeesRow);
                $('#OperatorType').val(type);
                //保存到隐藏文本框;
                $.tool.DataPostNoLoading('Fees', "feescheck", $('#frmForm').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            var cotent = "";
                            var Title = "";
                            var width = 900;
                            var height = 450;
                            switch (type) {
                                case "update":
                                    Title = "修改费用";
                                    conent = "../ChargesNew/FeesSporadicManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val() + '&CommIDs=' + CommID;
                                    break;
                                case "delete":
                                    Title = "删除费用";
                                    width = 600;
                                    height = 250;
                                    conent = "../DialogNew/FeesAmendDelDlg.aspx?FeesID=" + rowData.FeesID + "&IsOverAcount=" + $("#IsOverAcount").val() + "&FeesDueDate=" + rowData.FeeDueYearMonth + '&CommIDs=' + CommID;
                                    break;
                                case "split":
                                    Title = "拆分费用";
                                    conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val() + '&CommIDs=' + CommID;
                                    break;

                            }
                            HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                                if (_Data != "") {
                                    HDialog.Info(_Data);
                                    LoadList();
                                }
                            });
                        }
                        else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {

                    },
                    function errorCallback() {

                    });
            }


            //判断是否已结账 2017-11-8 16:44:58
            function CheckIsOverAcount(rowData, type) {

                var CheckDates = rowData["FeesDueDate"];
                var CostCode = rowData["CostCode"].substring(0, 4);
                var CostName = rowData["CostName"];
                if (!CheckDates) {
                    HDialog.Info("已关账，不能删除，若需要删除，请到冲销节点操作!!!");
                    return;
                }
                $('#CheckDates').val(CheckDates);
                $('#FeesDueDate').val(CheckDates);
                if (CostName.indexOf('物业服务费') > -1) {
                    $('#IsAddMonth').val("1");
                } else {
                    $('#IsAddMonth').val("0");
                }

                $.tool.DataPostChk('frmForm', 'WriteOff', 'GetOverAccountsSetInfoByCommID', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "") {

                            $("#IsOverAcount").val("1"); //没有设置关账信息

                            $.tool.DataPostChk('frmForm', 'WriteOff', 'NoAccountsCheckDate', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "1") {

                                        HDialog.Info("不能操作往月费用！");
                                    } else {
                                        FeesOperator(rowData, type);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });


                        } else {

                            //已设置关账信息
                            $.tool.DataPostChk('frmForm', 'WriteOff', 'CheckIsWriteOff', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "True") {
                                        HDialog.Info("已关账，不能进行后续操作，若需要操作，请到冲销节点操作!!!");
                                        return;
                                    } else {
                                        FeesOperator(rowData, type);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }



            $(document).ready(function () {
                if ($("#IncidentDealStateName").val() != "已完成" && $("#IncidentDealStateName").val() != "已关闭" && $("#IncidentDealStateName").val() != "" && $("#IncidentDealStateName").val() != undefined) {
                    toolbar = [
                        {
                            text: '刷新',
                            iconCls: 'icon-reload',
                            handler: function () {
                                LoadList();
                            }
                        }, '-',
                        {
                            text: '修改',
                            iconCls: 'icon-edit',
                            handler: function () {
                                FeesUpdate();
                            }
                        }, '-',
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                FeesDelete();
                            }
                        }
                    ];
                }
                LoadList();
            });
        </script>
    </form>
</body>
</html>
