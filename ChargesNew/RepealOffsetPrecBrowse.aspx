<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepealOffsetPrecBrowse.aspx.cs" Inherits="M_Main.ChargesNew.RepealOffsetPrecBrowse" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RepealOffsetPrecBrowse</title>
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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript">
        //查询对话框
        function btnFilterMore_OnClick() {
            var TableSign = getObject("TableSign").value;
            if (TableSign != "" && TableSign != null) {
                var strTemplateCode = TableSign;
                var strSearchData = escape(getObject("hiSearchData").value);
                varReturn = showModalDlg("../dialog/SearchDlg.aspx?TemplateCode=" + strTemplateCode + "&SearchData=" + strSearchData, "", 420, 400);

                //alert(varReturn);

                if (varReturn != "") {
                    var Search = eval('(' + varReturn + ')');
                    getObject("hiSearchSql").value = Search.SqlData.Sql;

                    //**重构数据(数据结构为JSON)					
                    var SearchData = Search.SqlData.Data;
                    //alert(Search.SqlData.Sql);
                    var val = "";
                    for (var i = 0; i < SearchData.length; i++) {
                        if (val != "") {
                            val = val + ",{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                        else {
                            val = "{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                    }
                    getObject("hiSearchData").value = "{Data:[" + val + "]}";
                }

                //alert(getObject("hiSearchData").value);
            }
        }
    </script>

    <script type="text/javascript">

        function btnClear_OnClick() {
            RepealOffsetPrecBrowse.CustID.value = "";
            RepealOffsetPrecBrowse.CustName.value = "";
            RepealOffsetPrecBrowse.hiCustName.value = "";
            RepealOffsetPrecBrowse.RoomID.value = "";
            RepealOffsetPrecBrowse.RoomSign.value = "";
            RepealOffsetPrecBrowse.hiRoomSign.value = "";
        }

        function CheckData() {
            if (RepealOffsetPrecBrowse.CustID.value == "0") {
                RepealOffsetPrecBrowse.CustID.value = "";
            }
            if (RepealOffsetPrecBrowse.CostID.value == "0") {
                RepealOffsetPrecBrowse.CostID.value = "";
            }
            if (RepealOffsetPrecBrowse.CustID.value == "") {
                alert("请选择客户,此项不能为空!");
                RepealOffsetPrecBrowse.btnSelCust.focus();
                return false;
            }
            if (RepealOffsetPrecBrowse.CostID.value == "") {
                alert("请选择费用项目,此项不能为空!");
                RepealOffsetPrecBrowse.btnSelCost.focus();
                return false;
            }
            return true;
        }

        function IsDel_OnClick() {
            if (confirm('请确认是否撤销该记录') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <script language="javascript">
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="RepealOffsetPrecBrowse" runat="server">
        <input id="CheckDates" type="hidden" name="CheckDates" runat="server" value="" />
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">

        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 670px; height: 200px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
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
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" data-options="editable:true" id="ParkName" name="ParkName" runat="server" style="width: 133px" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">冲抵日期从</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" style="width: 164px;" id="EditBeginDate" data-options="editable:false" name="EditBeginDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" style="width: 164px;" id="EditEndDate" data-options="editable:false" name="EditEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="5">
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
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var frozenColumns = [[
        { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true }

    ]];
    var column = [[
        { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
        {
            field: 'PreDate', title: '预交冲抵日期', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PreDate, "yyyy-MM-dd HH:mm:ss");
                return str;
            }
        },
        { field: 'CostName', title: '费用名称', width: 170, align: 'left', sortable: true },
        {
            field: 'FeesDueDate', title: '应收日期', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'FeesID', title: '费用ID', width: 130, align: 'left', sortable: true, hidden: true },
        { field: 'DebtsAmount', title: '应冲抵金额', width: 130, align: 'left', sortable: true },
        { field: 'CostNames', title: '冲抵费用项目', width: 170, align: 'left', sortable: true },
        { field: 'OldPrecAmount', title: '原预交余额', width: 100, align: 'left', sortable: true },
        { field: 'OffsetAmount', title: '冲抵金额', width: 100, align: 'left', sortable: true },
        { field: 'OffsetLateFeeAmount', title: '冲抵合同违约金', width: 100, align: 'left', sortable: true },
        { field: 'NewPrecAmount', title: '预交余额', width: 100, align: 'left', sortable: true },
        { field: 'TakeWiseName', title: '处理方式', width: 100, align: 'left', sortable: true },
        { field: 'BillsSign', title: '收据号', width: 100, align: 'left', sortable: true },
        {
            field: 'IsWriteOff', title: '是否冲销', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var strIsWriteOff = "";
                if (value == "True") {
                    strIsWriteOff = "是";
                } else {
                    strIsWriteOff = "否";
                }
                return strIsWriteOff;
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

            }
        }, '-',
        {
            text: '撤销',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择撤销项！');
                    return;
                }


                CheckIsOverAcount();
            }
        }, '-',
        {
            text: '冲销',
            iconCls: 'icon-undo',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择冲销项！');
                    return;
                }
                if (row.IsWriteOff == "True") {

                    HDialog.Info("已冲销！不能重复提交");
                    return;
                }
                IsWriteOff(row);
            }
        }
        //, '-',
        //{
        //    text: '打印',
        //    iconCls: 'icon-print',
        //    handler: function () {
        //        document.getElementById('btnPrint').click();
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
            frozenColumns: frozenColumns,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            freezeRow: 1,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchprecoffsetpredetail", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }


    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#RepealOffsetPrecBrowse').serialize(),
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

    //清空查询条件
    function CancelParm() {
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $("#RoomSign").searchbox("setValue", '');
        $("#ParkName").textbox("setValue", '');
    }

    //撤销
    function CheckIsOverAcount() {
        var row = $("#TableContainer").datagrid("getSelected");
        $('#CheckDates').val(row["PreDate"]);
        //判断是否已结账 2017-11-8 14:59:30
        $.tool.DataPostChk('RepealOffsetPrecBrowse', 'WriteOff', 'CheckIsWriteOff', $('#RepealOffsetPrecBrowse').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "True") {
                    HDialog.MessageBox("已结账的数据，不能撤销", "去冲销", "返回",
                        function () {
                            IsWriteOff(row);
                        }, function () {
                            HDialog.Close();
                        }
                    );
                    return;
                } else {
                    GetState(row);
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    //冲销
    function IsWriteOff(row) {
        if (row.WriteOffIsAudit) {
            if (row.WriteOffIsAudit == 1) {
                HDialog.Info("已冲销");
                return;
            }
            if (row.WriteOffIsAudit == 0) {
                HDialog.Info("已提交冲销");
                return;
            }
        }
        $('#CheckDates').val(row["PreDate"]);
        //判断是否已结账 2017-11-8 14:59:30
        $.tool.DataPostChk('RepealOffsetPrecBrowse', 'WriteOff', 'CheckIsWriteOff', $('#RepealOffsetPrecBrowse').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "True") {
                    WriteOff(row);
                } else {
                    HDialog.MessageBox("未结账的数据，不能冲销", "去撤销", "返回",
                        function () {
                            GetState(row);
                        }, function () {
                            HDialog.Close();
                        }
                    );
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    function WriteOff(row) {
        var res_WriteOff = false;
        var feeids = "&FeesID=" + row.FeesID;
        //冲销退款判断
        $.tool.DataGet('WriteOff', 'IsRefundOffset', feeids,
            function Init() {
            },
            function callback(data) {
                if (data == "True") {
                    //$.tool.DataGet('PrecReceFee', 'CheckRepealOffsetPrec', feeids,
                    //    function Init() {
                    //    },
                    //    function callback(_checkdata) {
                    //        if (_checkdata.length > 0) {
                    //            HDialog.Info(_checkdata);
                    //            res_WriteOff = true;
                    //        }

                    if (res_WriteOff == false) {
                        HDialog.Open('600', '270', '../WriteOffManage/WriteoffPreCostsOffset.aspx?OffsetPreDetailIIDs=' + row.IID, "冲销预交冲抵", false, function callback(_Data) {
                            if (_Data == "True") {
                                LoadList();
                            }
                        });
                    }

                    //});
                }
                else {
                    HDialog.Info("已有退款不能冲销");
                }

            });


    }

    //获取撤销状态并删除费用
    function GetState(row) {
        var param = "&OffsetIID=" + row.IID;
        var feeids = "&FeesID=" + row.FeesID;
        var res = false;
        $.tool.DataGet('PrecReceFee', 'searchrefundfees', param,
            function Init() {
            },
            function callback(_Data) {
                if (_Data != null && _Data != "") {
                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        if (varObjects[0].IsRefund == 1) {
                            HDialog.Info("已退款,不能撤销！");
                            res = true;
                        }
                    }


                    //$.tool.DataGet('PrecReceFee', 'CheckRepealOffsetPrec', feeids,
                    //    function Init() {
                    //    },
                    //    function callback(_checkdata) {
                    //        if (_checkdata.length > 0) {
                    //            HDialog.Info(_checkdata);
                    //            res = true;
                    //        }

                    if (res == false) {
                        $.messager.confirm('确定', '是否撤销该项', function (r) {
                            if (r) {
                                var params = "{'strDate':'" + row.PreDate + "'}";
                                $.ajax({
                                    type: "POST",
                                    url: "RepealOffsetPrecBrowse.aspx/RecknoFees",
                                    data: params,
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        if (data.d == "true") {

                                            sessionStorage.clear();
                                            sessionStorage.setItem("OffsetPreDetail_IID", row.IID);

                                            var conent = "../DialogNew/OffsetPreDetailDelDlg.aspx?IID=" + row.IID;
                                            HDialog.Open('450', '230', conent, '费用删除原因', false, function callback(_Data) {
                                                if (_Data == "true") {
                                                    HDialog.Info("撤销成功");
                                                    LoadList();
                                                }

                                            });
                                        }
                                    },
                                    error: function (err) {
                                        alert(err);
                                    }
                                });

                            }
                        });
                    }

                    //});


                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });

    }

    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", document.body.clientWidth * 0.15 * 0.67);
        }
    });

</script>
