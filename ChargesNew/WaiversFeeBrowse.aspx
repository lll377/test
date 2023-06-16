<%@ Page Language="c#" CodeBehind="WaiversFeeBrowse.aspx.cs" AutoEventWireup="true" Inherits="M_Main.ChargesNew.WaiversFeeBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>WaiversFeeBrowse</title>
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
    <script type="text/javascript" src="../jscript/export.js"></script>

</head>
<body onload="Win_OnLoad()">
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnPrint" type="button" value="打印" style="display: none;" name="btnPrint" runat="server">
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 220px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle" style="line-height: 15px;">登记时间从</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" id="EditBeginDate" data-options="editable:false" type="text" style="width: 83%;" name="EditBeginDate" runat="server">
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" id="EditEndDate" data-options="editable:false" type="text" style="width: 83%;" name="EditEndDate" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" style="width: 83%;" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" style="width: 83%;" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">减免原因</td>
                    <td class="TdContent">
                        <input id="WaivReason" style="width: 82%;" name="WaivReason" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" id="IsAudit" name="IsAudit" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="0">未审核</option>
                            <option value="2">未通过</option>
                            <option value="1">已通过</option>
                        </select>
                    </td>
                    <td class="TdTitle">减免业务类型</td>
                    <td class="TdContent">
                        <select id="WaiversCategory" class="easyui-combobox" name="WaiversCategory" runat="server" style="width: 82%;">
                            <option value=""></option>
                            <option value="政策性减免">政策性减免</option>
                            <option value="非政策性减免">非政策性减免</option>
                        </select></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    var h = $(window).height();
    var w = $(window).width();
    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    $(function () {
        LoadList();
    });
    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    InitFunction();

    var frozenColumns = [[
        { field: 'ck', checkbox: true, width: '30' },
        {
            field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var param = "WaivID=" + row.WaivID + "";
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改减免费用','Edit','" + param + "');\">" + row.CustName + "</a>";
                return str;
            }
        },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true }
    ]];
    var column = [[
        { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
        { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
        { field: 'WaiversCategory', title: '减免业务类型', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '费用名称', width: 180, align: 'left', sortable: true },
        { field: 'WaivTypeName', title: '减免类型', width: 100, align: 'left', sortable: true },
        { field: 'WaivAmount', title: '减免总金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivedAmount', title: '已减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivModifyAmount', title: '取消减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivMonthAmount', title: '每月减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivRates', title: '减免比例', width: 80, align: 'left', sortable: true },
        { field: 'ShareWaivAmount', title: '均摊减免总金额', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivStateDuring', title: '开始时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivEndDuring', title: '结束时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'UserName', title: '减免登记人', width: 100, align: 'left', sortable: true },
        { field: 'WaivCreDate', title: '减免登记时间', width: 150, align: 'left', sortable: true },
        { field: 'WaivReason', title: '减免原因', width: 130, align: 'left', sortable: true },
        { field: 'WaivMemo', title: '备注', width: 120, align: 'left', sortable: true }
        ,
        {
            field: 'SetIsUseOffDate', title: '“是否冲抵”修改记录', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var strreturn = "未修改";
                if (value != null && value != "") {
                    var strWaivAgreementDate = formatDate(value, "yyyy-MM-dd");
                    strreturn = "由 " + row.SetIsUseOffUserName + "于" + strWaivAgreementDate + "日修改" + "，修改原因：" + row.SetIsUseOffReason;
                }
                return strreturn;
            }
        },
        {
            field: 'IsAudit', title: '审核状态', width: 80, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.IsAudit == 1) {
                    str = "<font  style='color:Red;'>已通过</font>";
                } else if (row.IsAudit == 2) {
                    str = "<font  style='color:Blue;'>未通过</font>";
                }
                else {
                    str = "<font  style='color:Green;'>未审核</font>";
                }
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '减免登记',
            iconCls: 'icon-add',
            handler: function () {
                var Params = "CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val() + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').val();
                ViewDetail("新增减免费用", 'Insert', Params);
            }
        }, '-',


        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var rows = $("#TableContainer").datagrid("getSelections");
                if (rows.length == 0) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                var msg = '';
                var waivIDs = '';
                for (i = 0; i < rows.length; i++) {
                    if (rows[i].IsAudit == 1 && rows[i].IsWaiv == 1) {
                        msg += '房屋编号[' + rows[i].RoomSign + '],'
                    } else {
                        waivIDs += rows[i].WaivID + ",";
                    }
                }
                waivIDs = waivIDs.substring(0, waivIDs.length - 1)
                if (msg) {
                    msg = msg.substring(0, msg.length - 1)
                    msg += '已经审核,不能删除,是否确定删除其他选择项？'
                } else {
                    msg = '是否确定删除所有选择项？';
                }
                DelRecord(waivIDs, msg);


                //var row = $("#TableContainer").datagrid("getSelected");
                //if (row == null) {
                //    HDialog.Info('请选择删除项！');
                //    return;
                //}
                //if (row.IsAudit == 1 && row.IsWaiv == 1) {
                //    HDialog.Info("已经审核，不能删除！");
                //    return;
                //}


                //$.tool.DataGet('WaiversFees', 'CheckReceivableDetails', 'WaivID=' + row.WaivID,
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        if (_Data == "a") {
                //            DelRecord(row.WaivID);
                //        }
                //        else { HDialog.Info("已有结算信息，不能删除！"); }

                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //    });

            }
        }, '-',
        {
            text: '取消',
            iconCls: 'icon-undo',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row.WaivType == 2) {
                    ModifyWaiversFee(row.WaivID);
                } else {
                    HDialog.Info("不能进行取消");
                }
            }
        }, '-',
        //{
        //    text: '减免原因设置',
        //    iconCls: 'icon-add',
        //    handler: function () {
        //        ViewAddReason("减免原因信息", 'Insert');
        //    }
        //}, '-',
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-',
        //{
        //    text: '导入',
        //    iconCls: 'icon-page_white_excel',
        //    handler: function () {
        //        ViewReport("费用导入");
        //    }
        //}, '-',
        {
            text: '批量导入',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                BatchImportWaiversFee();
            }
        }, '-',
        {
            text: '导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                var rowData = $('#TableContainer').datagrid('getData');
                if (rowData == '') {
                    HDialog.Info('请先生成报表');
                }
                else {
                    //导出EXCEL
                    window.open("WaiversFeeBrowsePut.aspx?random=" + Math.random() + GetParam());
                }
            }
        }
        , '-',
        {
            text: '<font color=red>*按总额减免时，对尚未减免的金额，可点击“取消”申请部分取消或全部取消尚未减免的金额.</font>'
        }
    ];

    function DelRecord(Id, msg) {
        $.messager.confirm('确定', msg, function (r) {
            if (r) {
                $.tool.DataGet('WaiversFees', 'multideletewaiversfee', 'WaivIDs=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

    //批量修改
    function BatchImportWaiversFee() {
        HDialog.Open(770, 270, '../ChargesNew/BatchImportWaiversFee.aspx', '批量导入减免信息', false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    function GetParam() {

        var str = "&EditBeginDate=" + $("#EditBeginDate").datebox('getValue') + "&EditEndDate=" + $("#EditEndDate").datebox('getValue');
        str += '&CustID=' + $("#CustID").val() + '&RoomID=' + $("#RoomID").val() + "&WaivReason=" + $("#WaivReason").val() + "&IsAudit=" + $("#IsAudit").combobox('getValue');
        return encodeURI(str);
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
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            freezeRow: 1,
            singleSelect: false,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            sortOrder: "asc",
            selectOnCheck: true,
            checkOnSelect: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("WaiversFees", "getwaiversfeelist", "TableContainer", param);
            }

        });
        $("#SearchDlg").dialog("close");
    }

    //清空查询条件
    function CancelParm() {
        $('#EditBeginDate').datebox("setValue", '');
        $('#EditEndDate').datebox("setValue", '');
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $('#RoomSign').searchbox("setValue", '');
        $('#IsAudit').combobox('clear');
        $("#WaivReason").val("");
        $("#WaiversCategory").searchbox("setValue", '');

    }
    function ViewDetail(title, OpType, param) {

        HDialog.Open(w, h + 100, '../ChargesNew/WaiversFeeManageFrame1.aspx?' + param + '&OpType=' + OpType, title, true, function callback(_Data) {
            LoadList();
        });
    }
    //减免原因设置
    function ViewAddReason(title, OpType) {
        HDialog.Open('800', '420', '../ChargesNew/WaiversFeeReasonBrowse.aspx?OpType=' + OpType, title, false, function callback(_Data) {
            LoadList();
        });
    }
    //导入
    function ViewReport(title) {
        HDialog.Open(w, h, '../ChargesNew/InputWaivFeesManage.aspx', title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    //取消
    function ModifyWaiversFee(Id) {

        //var w = $(window).width();

        HDialog.Open('1000', h, '../ChargesNew/WaiversFeeModifyManage.aspx?OPType=Edit&WaivID=' + Id, '修改减免费用', true, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    //删除
    //function DelRecord(Id) {
    //    $.messager.confirm('确定', '是否删除该项', function (r) {
    //        if (r) {
    //            $.tool.DataGet('WaiversFees', 'deletewaiversfee', 'WaivID=' + Id,
    //                function Init() {
    //                },
    //                function callback(_Data) {

    //                    if (_Data == "true") {
    //                        HDialog.Info('删除成功');
    //                    }
    //                    else { HDialog.Info('删除失败'); }
    //                    LoadList();

    //                },
    //                function completeCallback() {
    //                },
    //                function errorCallback() {
    //                });
    //        }
    //    });
    //}

    function CheckReceivableDetails(waivid) {
        $.tool.DataGet('WaiversFees', 'CheckReceivableDetails', 'WaivID=' + waivid,
            function Init() {
            },
            function callback(_Data) {
                alert(_Data);
                if (_Data == "true") {
                    return true;
                }
                else { return false; }

            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }


    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('800', '400', conent, '客户选择', false, function callback(_Data) {
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

        });

    }


    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", '83%');
        }
    });

</script>

