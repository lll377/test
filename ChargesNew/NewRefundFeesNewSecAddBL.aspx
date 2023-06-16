<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRefundFeesNewSecAddBL.aspx.cs" Inherits="M_Main.ChargesNew.NewRefundFeesNewSecAddBL" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register TagPrefix="uc1" TagName="BussApproved" Src="~/UserControl/BussApproved.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
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
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../jscript/GetWorkFlowId.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .tabs-container .panel-body {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .panel-body {
            padding: 0px;
            margin: 0px;
        }


        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 30px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 1px;
            overflow: hidden;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                border-bottom: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }

        .tab-content {
            height: 100%;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        .DialogTable {
            font-size: 12px;
            font-family: 'Microsoft YaHei UI';
        }

            .DialogTable .DialogTdTitle {
                height: 25px;
                width: 10%;
                text-align: center;
            }

            .DialogTable .DialogTdContent {
                height: 25px;
                width: 15%;
                text-align: left;
            }

        .messager-body {
            padding: 15px;
        }

        .datagrid-mask-msg {
            height: auto;
        }

        .datagrid-ftable tr td {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="FileList" name="FileList" />
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="ID" type="hidden" size="1" name="ID" runat="server" />
        <input type="hidden" id="RecNum" runat="server" />
        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
        <input type="hidden" id="hiDGrid" name="hiDGrid" runat="server" maxlength="4000" />
        <input type="hidden" id="SumRefundAmount" runat="server" />
        <input type="hidden" id="SumRefundLateAmount" runat="server" />
        <input type="hidden" id="AuditingState" name="AuditingState" value="未审核" runat="server" />
        <input type="hidden" id="AllData" name="AllData" runat="server" />
        <input type="hidden" name="hiCustName" id="hiCustName" runat="server" />
        <input type="hidden" name="CustID" id="CustID" runat="server" />
        <input type="hidden" name="hiRoomSign" id="hiRoomSign" runat="server" />
        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
        
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnSave" type="submit" value="保存"  onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <table class="DialogTable">
           <tr  style="display:none">
                <td colspan="4" style="text-align: center; height: 20px; background: #e6e6e6"><span style="font-size: 16px">退费申请</span> </td>
            </tr> 
         <tr  style="display:none">
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:true" searcher="SelCust" runat="server" />
                    
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" class="easyui-combobox" style="width: 150px;" data-options="editable:true,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr style="display:none">
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" data-options="editable:true" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                    </td>
                <td class="TdTitle">车位</td>
                <td class="TdContentSearch">
                    <select id="ParkName" class="easyui-combobox" style="width: 150px;" runat="server"></select>
                </td>
            </tr> 
           <tr style="display:none">
                <td align="center" colspan="4">
                    <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SelRefundFees();">选择费用</a></td>
            </tr> 
            <tr>
                <td colspan="4" style="text-align: center; height: 20px; background: #e6e6e6"><span style="font-size: 16px">退款明细</span> </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="RefundDiv" style="height: 300px;">
                        <div class="SearchContainer" id="TableContainer">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">退款方式</td>
                <td class="TdContent" colspan="3">
                    <select id="RefundChargeMode" name="RefundChargeMode" data-options="required:true" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">退款原因</td>
                <td class="TdContent" colspan="3">
                    <input class="easyui-textbox" style="width: 80%; height: 30px" data-options="multiline:true,required:true" id="RefundReason" name="RefundReason"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">文件列表<a id="upbtn" href="javascript:void(0)">(上传)</a><input id="FileURL" name='FileURL' type="hidden" runat="server" /></td>
                <td class="TdContent" colspan="3" style="height: 22px; width: 75%; border: 1px #cccccc solid">
                    <span id="List" name='List' runat="server" />
                </td>
            </tr>
        </table>


    </form>
    <form id="uploadform" enctype='multipart/form-data' class="easyui-dialog" title="上传文件"
        data-options="closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td class="DialogTdTitle"></td>
            </tr>
            <tr>
                <td class="DialogTdContent">
                    <input id="uploadfile" type="file" name="uploadfile" style="width: 80%;" />
                    <input id="btnSelFile" name="btnSelFile" class="button" type="button" onclick="upLoadFile();"
                        style="width: 72px; height: 32px" value="选择上传 " />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();
    function InitFunction() {
        $("#TableContainer").css("height", "300px");
    }
    InitFunction();

    $(function () {
        Cache.SetData("ApplyID", $("#ID").val());
        $('#CustName').searchbox("setValue", $("#hiCustName").val());
        $('#RoomSign').searchbox("setValue", $('#hiRoomSign').val());
        if ($("#hiDGrid").val() != '') {
            var obj = JSON.parse($("#hiDGrid").val());
            $('#TableContainer').datagrid('loadData', obj);
            IsSave = true;
        }
        if ($("#hiOPType").val() == 'detail' || $("#AuditingState").val() != '未审核') {
            $("#BtnSave").hide();
            //隐藏确认按钮
            $('div.datagrid div.datagrid-toolbar a').eq(0).hide();
            //隐藏撤销按钮
            $('div.datagrid div.datagrid-toolbar a').eq(1).hide();
            //隐藏删除按钮
            $('div.datagrid div.datagrid-toolbar a').eq(2).hide();
            //$('.datagrid-btn-separator').hide();

            $("#upbtn").hide();
            $("#search").linkbutton('disable');
        }
    })

    $("#upbtn").click(function () {
        $('#uploadform').parent().appendTo($("form:first"))
        $('#uploadform').dialog('open');
    });

    $("#BtnClose").click(function () {
        HDialog.Close();
    });

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


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

        });

    }

    //费用选择
    function SelRefundFees() {
        //if ($('#CustID').val() == '') {
        //    HDialog.Info('请先选择客户');
        //    return;
        //} else {
        //    var url = "../DialogNew/RefundFeesDlg.aspx?CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').searchbox("getValue")
        //        + "&RoomID=" + $('#RoomID').val();
        //    HDialog.Open(w, h, url, '费用选择', false, function callback(_Data) {
        //        if (_Data != "" && _Data != undefined) {
        //            InitDataGrid(_Data);

        //        }
        //    })
        //}

        var url = "../DialogNew/RefundFeesDlgBL.aspx";
        HDialog.Open(w, h, url, '费用选择', false, function callback(_Data) {
            if (_Data != "" && _Data != undefined) {
                debugger;
                var data = eval('(' + _Data + ')');
                InitDataGrid(data.total);

            }
        })
    }

    function IsNull(value) {
        var res = value;
        if (value == undefined) {
            res = '';
        }
        return res;
    }

    function InitDataGrid(_Data) {
        var obj = _Data;
        var hiDGrid = '[';
        debugger;
        $.each(obj.rows, function (key, item) {
            hiDGrid += '{"BusinessType":"' + IsNull(item.BusinessType) + '","CustName":"'
                + IsNull(item.CustName) + '","RoomSign":"' + IsNull(item.RoomSign) + '","CostName":"'
                + IsNull(item.CostName) + '","FeeDueYearMonth":"' + IsNull(item.FeeDueYearMonth)
                + '","FeesStateDate":"' + IsNull(item.FeesStateDate) + '","FeesEndDate":"' + IsNull(item.FeesEndDate) + '","ChargeDate":"' + IsNull(item.ChargeDate)
                + '","UserName":"' + IsNull(item.UserName) + '","BillsSign":"' + IsNull(item.BillsSign) + '","ChargeAmount":"' + IsNull(item.ChargeAmount)
                + '","LateFeeAmount":"' + IsNull(item.LateFeeAmount) + '","CanRefundAllAmount":"' + IsNull(item.isCanRefundAmount) + '","isCanRefundAmount":"'
                + IsNull(item.isCanRefundAmount) + '","CanRefundLateFeeAmount":"0","RecdID":"'
                + IsNull(item.RecdID) + '","PrecID":"' + IsNull(item.PrecID) + '","CostType":"' + IsNull(item.CostType) + '","CostID":"'
                + IsNull(item.CostID) + '","ReceID":"' + IsNull(item.ReceID) + '","CustID":"' + IsNull(item.CustID) + '","RoomID":"'
                + IsNull(item.RoomID) + '","FeesID":"' + IsNull(item.FeesID) + '"},';


            $('#CustID').val(item.CustID);
            $('#RoomID').val(item.RoomID);
        });
        hiDGrid = hiDGrid.substr(0, hiDGrid.length - 1);
        hiDGrid += ']';
        $("#hiDGrid").val(hiDGrid);

        $.tool.DataPost('RefundFees', 'AddRefundFeesApplyDetail', $("#frmForm").serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data != null) {
                    var res = _Data.split('|')[0];
                    if (res == "true") {
                        var data = JSON.parse(_Data.split('|')[1]);
                        $('#TableContainer').datagrid('loadData', data);
                        $("#TableContainer").datagrid('beginEdit', 0);
                    } else {
                        HDialog.Info(_Data.split('|')[1]);
                    }
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            }
        );
    }

    var column = [[
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
        {
            field: 'FeeDueYearMonth', title: '费用时间', width: 100, align: 'left', sortable: true, sortable: true
        },

        {
            field: 'ChargeAmount', title: '收款/冲抵金额 ', width: 110, align: 'left', sortable: true
        },
        { field: 'LateFeeAmount', title: '违约金', width: 80, align: 'left', sortable: true },
        {
            field: 'isCanRefundAmount', title: '可申请退款总金额', width: 130, align: 'left', sortable: true
        },
        {
            field: 'CanRefundAllAmount', title: '退款金额', width: 100, align: 'left', sortable: true,
            editor: {
                type: 'validatebox',
                options: {
                    required: true,
                    validType: 'digital'
                }
            }
        },
        {
            field: 'CanRefundLateFeeAmount', title: '违约金退款金额', width: 120, align: 'left', sortable: true,
            editor: {
                type: 'validatebox',
                options: {
                    required: true,
                    validType: 'digital'
                }
            }
        },
        {
            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd ");
                return str;
            }
        },
        {
            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd ");
                return str;
            }
        },
        { field: 'ChargeDate', title: '收款时间', width: 140, align: 'left', sortable: true },
        { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
        { field: 'BillsSign', title: '票据号', width: 180, align: 'left', sortable: true }
    ]];
    //是否已提交退款申请
    var IsSave = false;
    var toolbar = [
        {
            text: '选择费用',
            iconCls: 'icon-add',
            handler: function () {
                SelRefundFees();
            }
        }   
        , {
            text: '保存修改',
            iconCls: 'icon-save',
            handler: function () {
                var refundAmount = 0;
                var RefundLateAmount = 0;
                $('#TableContainer').datagrid('acceptChanges');
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows == "") {
                    HDialog.Info("请选择退款费用！");
                    return;
                }
                var res = true;
                var mes = "";
                IsSave = false;
                $.each(rows, function (key, item) {
                    var bh = parseInt(key + 1);
                    var AllRefundAmount = parseFloat(item.CanRefundAllAmount) + parseFloat(item.CanRefundLateFeeAmount)
                    if (AllRefundAmount <= 0) {
                        mes += "第" + bh + "行退款金额或违约金不能小于0！</br>";
                        res = false;
                    }
                    else {
                        refundAmount += parseFloat(item.CanRefundAllAmount);
                        RefundLateAmount += parseFloat(item.CanRefundLateFeeAmount);
                    }
                });
                $('#SumRefundAmount').val(ToDecimal(refundAmount, 2));
                $('#SumRefundLateAmount').val(ToDecimal(RefundLateAmount, 2));
                if (res == false) {
                    HDialog.Info(mes);
                    return;
                }
                $('#AllData').val(JSON.stringify(rows));
                $.tool.DataPost('RefundFees', 'AddRefundFeesApply', $("#frmForm").serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != null) {
                            var res = _Data.split('|')[0];
                            if (res == "true") {
                                HDialog.Info("修改成功！");
                                IsSave = true;
                                var data = JSON.parse(_Data.split('|')[1])
                                $('#TableContainer').datagrid('loadData', data);
                            } else {
                                HDialog.Info(_Data.split('|')[1]);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }
                );
            }
        }, '-',
        //{
        //    text: '撤销',
        //    iconCls: 'icon-cancel',
        //    handler: function () {
        //        var rows = $('#TableContainer').datagrid('getRows');
        //        if (rows == "") {
        //            HDialog.Info('请选择要撤销的费用!');
        //        }
        //        else {
        //            $('#AllData').val(JSON.stringify(rows));
        //            $.tool.DataPost('RefundFees', 'CancelRefundFeesApply', $("#frmForm").serialize(),
        //                function Init() {
        //                },
        //                function callback(_Data) {
        //                    if (_Data != null) {
        //                        var res = _Data.split('|')[0];
        //                        if (res == "true") {
        //                            HDialog.Info("撤销成功！");
        //                            var data = JSON.parse(_Data.split('|')[1])
        //                            $('#TableContainer').datagrid('loadData', data);
        //                        } else {
        //                            HDialog.Info(_Data.split('|')[1]);
        //                        }
        //                    }
        //                },
        //                function completeCallback() {
        //                },
        //                function errorCallback() {
        //                }
        //            );
        //        }
        //    }
        //}
        //, '-',
        {
            text: '删除费用',
            iconCls: 'icon-cancel',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows == "") {
                    HDialog.Info('请选择要删除的费用!');
                }
                else {
                    $('#AllData').val(JSON.stringify(rows));
                    $.tool.DataPost('RefundFees', 'DeleteRefundFeesApply', $("#frmForm").serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != null) {
                                var res = _Data.split('|')[0];
                                if (res == "true") {
                                    HDialog.Info("删除成功！");

                                    $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                                } else {
                                    HDialog.Info(_Data.split('|')[1]);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }
                    );
                }
            }
        }
    ];
     

    $("input[type='submit']").click(function (e) {

        var ref = $('#SumRefundAmount').val();
        var refLate = $('#SumRefundLateAmount').val();
       
        if (ref == "" && refLate == "") {
            HDialog.Info('请点击“保存修改”！');
            return false;
        }
        var result = ref + refLate;
     
        if (result == 0) {
            HDialog.Info('请输入退款金额！');
            return false;
        }
         

    });
    var editIndex = undefined;
    $("#TableContainer").datagrid({
        nowrap: false,
        pageSize: top.ListPageSize,
        pageList: top.ListPageList,
        columns: column,
        fitColumns: false,
        toolbar: toolbar,
        remoteSort: false,
        singleSelect: true,
        pagination: true,
        width: "100%",
        sortOrder: "asc",
        selectOnCheck: false,
        checkOnSelect: false,
        rownumbers: true,
        border: true,
        showFooter: true,
        view: myview,
        rowStyler: function (index, row) {
            if (row.Fids == 'footer') {
                return 'background-color:#F4F4F4;border:none;';
            }
        },
        onDblClickRow: function (rowIndex, rowData) {
            //当BusinessType=2为预收时，禁止修改退款金额
            if (rowData.BusinessType == 2) {
                HDialog.Info('预收费用，不能修改金额！');
                $(this).datagrid('removeEditor', editIndex);
            } else {
                if (editIndex != undefined) {
                    $(this).datagrid('endEdit', editIndex);
                }
                $(this).datagrid('beginEdit', rowIndex);
                var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'CanRefundAllAmount' }, { index: rowIndex, field: 'CanRefundLateFeeAmount' });
                $(ed.target).focus();
                editIndex = rowIndex;
            }
        },
        onLoadSuccess: function (data) {
            //加载页脚
            $('#TableContainer').datagrid('reloadFooter', [
                {
                    Fids: 'footer',
                    RoomSign: "<span style='color:red'>合计</span>",
                    CanRefundAllAmount: "<span style='color:red'>" + Compute("CanRefundAllAmount") + "</span>",
                    CanRefundLateFeeAmount: "<span style='color:red'>" + Compute("CanRefundLateFeeAmount") + "</span>"
                }
            ]);
        }
    });

    var IsSumbitAmount = 0;
    //指定列求和
    function Compute(colName) {
        var rows = $('#TableContainer').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i][colName]);
            IsSumbitAmount += parseFloat(rows[i]['CanRefundAllAmount']) + parseFloat(rows[i]['CanRefundLateFeeAmount']);

        }
        return ToDecimal(total, 2);
    }

    //重写DataGrid,支持更改页脚样式
    var myview = $.extend({}, $.fn.datagrid.defaults.view, {
        renderFooter: function (target, container, frozen) {
            var opts = $.data(target, 'datagrid').options;
            var rows = $.data(target, 'datagrid').footer || [];
            var fields = $(target).datagrid('getColumnFields', frozen);
            var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

            for (var i = 0; i < rows.length; i++) {
                var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                var style = styleValue ? 'style="' + styleValue + '"' : '';
                table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                table.push('</tr>');
            }
            table.push('</tbody></table>');
            $(container).html(table.join(''));
        }
    });

    function upLoadFile() {
        if ($('#uploadfile').val() == "") {
            HDialog.Info("请选择要上传的本地文件!");
            return false;
        }
        var fileupload = document.getElementById("uploadfile");
        var maxsize = 10 * 1024 * 1024;
        var size = fileupload.files[0].size;
        //if (size > parseInt(maxsize)) {
        //    HDialog.Info("不能上传超过10M的附件！");
        //    return false;
        //}
        $('#uploadform').dialog('close');
        $.tool.pageLoadInfo("上传中，请等待");

        var options = {
            type: "POST",
            url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=room&FileURL=",
            success: function (data, status) {
                //alert(data);
                var stringArray = data.split("|");
                var FileName = stringArray[1];
                var FileError = stringArray[2];
                var FileURL = stringArray[3];
                var FileServerName = stringArray[4];
                if (stringArray[0] == "1") {
                    //stringArray[0]    成功状态(1为成功，0为失败)
                    //stringArray[1]    文件名
                    //stringArray[2]    消息提示
                    //stringArray[3]    文件路径
                    UploadCallBack(FileURL, FileServerName, fileupload.files[0].name);
                    HDialog.Info('上传成功');
                    $('#uploadfile').val('');
                    $('#uploadform').dialog('close');
                }
                else {
                    HDialog.Info(FileError);
                }
                $.tool.pageUnLoading();
            },
            error: function (data, status, e) {
                HDialog.Info("上传失败:" + e.toString());
                $.tool.pageUnLoading();
            }
        };
        $('#uploadform').ajaxSubmit(options);

        return false; //.NET按钮控件取消提交
    }

    function upLoadFileDelete(obj, filename, AdjunctCode) {
        var postFileName = encodeURI(filename);
        $.ajax
            ({
                type: "POST",
                url: "../AjaxUploadFile.aspx?Cmd=del&FileType=room&FileURL=" + postFileName,
                data: "",
                success: function (data, status) {
                    //alert(data);
                    var stringArray = data.split("|");
                    var FileName = stringArray[1];
                    var FileError = stringArray[2];
                    if (stringArray[0] == "1") {
                        //stringArray[0]    成功状态(1为成功，0为失败)
                        //stringArray[1]    文件名
                        //stringArray[2]    消息提示
                        //stringArray[3]    文件路径
                        HDialog.Info('删除成功');
                        $('#uploadfile').val('');

                        $(obj).prev().remove();
                        $(obj).remove();
                        GetAttach();
                        DeleteRefundFile(AdjunctCode);
                    }
                    else {
                        HDialog.Info(FileError);
                    }
                    $.tool.pageUnLoading();
                },
                error: function (data, status, e) {
                    alert("上传失败:" + e.toString());
                }
            });
        return false; //.NET按钮控件取消提交
    }

    function Getid() {
        d = new Date();
        var s = "";
        s += d.getYear();
        s += (d.getMonth() + 1);
        s += d.getDate();
        s += d.getHours();
        s += d.getMinutes();
        s += (d.getSeconds());
        return s;
    }

    //上传文件相关js
    function UploadCallBack(url, addr, Name) {
        var Id = Getid();
        var Id1 = Id + "h";
        var vFileURL = "{'FilPath':'" + url + "','AdjunctName':'" + Name + "'}";

        $("#FileURL").val($("#FileURL").val() + "," + vFileURL);

        var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + Id1 + "','" + url + "','" + Name + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + Id1 + "\" Type='hidden' value='" + url + "'>"
        $("#List").append(v);
        GetAttach();
    }

    function Delete(obj, hid, url, Name) {
        var vFileURL = "," + "{'FilPath':'" + url + "','AdjunctName':'" + Name + "'}";
        var vFileURLStr = $("#FileURL").val().replace(vFileURL, "");
        $("#FileURL").val(vFileURLStr);

        var FileName = document.getElementById(hid).value;
        var AdjunctCode = hid.replace('h', '');
        upLoadFileDelete(obj, FileName, AdjunctCode);

    }

    //删除附件
    function DeleteRefundFile(AdjunctCode) {
        $.tool.DataPost('RefundFees', 'DeleteRefundFile', "AdjunctCode=" + AdjunctCode,
            function Init() {
            },
            function callback(_Data) {
                if (_Data != null) {

                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            }
        );
    }

    function GetAttach() {
        var v = $("#List").html();
        re = /\"/g;
        var mi = v.replace(re, "'");
        $("#FileList").val(mi);
    }

    function SpecialView() {
        var v = $("#FileList").val();
        $("#List").html(v)
    }


</script>
