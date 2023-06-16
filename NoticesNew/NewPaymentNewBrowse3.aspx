<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPaymentNewBrowse3.aspx.cs" Inherits="M_Main.NoticesNew.NewPaymentNewBrowse3" %>

<!DOCTYPE html>
<html>
<head>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>


</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <input id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <input type="hidden" id="SelMode" name="SelMode" runat="server" />
        <input type="hidden" id="tmpSQL1" name="tmpSQL1" runat="server" />
        <input type="hidden" id="RepID" name="RepID" runat="server" />
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input type="hidden" id="DataCount" name="DataCount" runat="server" />
        <input style="display: none;" id="btnPrint" class="button" value="报表打印" type="button"
            name="btnPrint" runat="server" onserverclick="btnPrint_ServerClick">
        <input id="StartPage" type="hidden" value="1" name="StartPage" runat="server" />
        <input id="EndPage" type="hidden" value="1" name="EndPage" runat="server" />

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:false"
            style="width: 900px; height: 300px;">
            <table class="DialogTable" id="DivOne">
                <tr>
                    <td class="TdTitle" colspan="6" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                        <span style="font-size: 16px">选择客户</span>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="CustID" type="hidden" name="CustID" runat="server" />
                        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" style="width: 70%;" data-options="editable:false,panelHeight: '200px'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom" name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
                        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" /></td>

                </tr>
                <tr>
                    <td class="TdTitle" colspan="6" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                        <span style="font-size: 16px">选择费用</span>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用开始日期</td>
                    <td class="TdContentSearch">
                        <input id="FeesStateDate" class="Wdate" onkeypress="CheckSmallDate();"
                            onclick="WdatePicker()" name="FeesStateDate" runat="server"></td>
                    <td class="TdTitle">费用结束日期</td>
                    <td class="TdContentSearch">
                        <input id="FeesEndDate" class="Wdate" onkeypress="CheckSmallDate();"
                            onclick="WdatePicker()" name="FeesEndDate" runat="server"></td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="DrFeesDateType" style="width: 43%;" name="DrFeesDateType" runat="server">
                            <option value="1" selected>费用应收时间</option>
                            <option value="2">费用通知时间</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames" data-options="editable:false" name="CostNames" runat="server" />
                        <input id="CorpCostIDs" type="hidden" name="CorpCostIDs" runat="server" />
                        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" /></td>
                    <td class="TdTitle">应缴金额</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol2" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select><input style="z-index: 0; width: 28%; height: 19px" id="Comp_Amount"
                            onkeypress="CheckNumeric();" value="0" maxlength="50" size="26" name="Comp_Amount" runat="server">元</td>
                    <td class="TdTitle">制单日期</td>
                    <td class="TdContentSearch"><input id="OrderDate" class="Wdate" onkeypress="CheckSmallDate();"
                            onclick="WdatePicker()" name="OrderDate" runat="server"></td>

                </tr>
                <tr style="display: none;">
                    <td class="TdTitle">是否垫付</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList Width="43%" ID="DrIsProperty" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="6" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                        <span style="font-size: 16px">确定样式</span>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">通知单样式</td>
                    <td class="TdContentSearch">
                        <select id="UseRepID" style="width: 42%;" name="UseRepID" runat="server"></select></td>

                    <td class="TdTitle">落款单位</td>
                    <td class="TdContentSearch">
                        <input id="InscribeName" maxlength="50" name="InscribeName"
                            runat="server"></td>
                    <td class="TdTitle">费用合并显示</td>
                    <td class="TdContentSearch">
                        <input id="CkIsCombShow" type="checkbox" name="CkIsCombShow" onclick="CkComb();" runat="server" checked />
                        <input id="hCkIsCombShow" type="hidden" name="hCkIsCombShow" runat="server" value="1" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 129px" class="TdTitle">提示内容</td>
                    <td style="height: 129px" class="TdContentSearch" colspan="5">
                        <textarea style="width: 85%" id="PrintContent" rows="4" cols="60" name="PrintContent" runat="server"></textarea>
                        <input id="btnSelContent" value="设置内容" class="button" onclick="SelContent()" type="button" name="btnSelContent" runat="server">
                        <input id="CfgID" size="1" type="hidden"
                            name="CfgID" runat="server"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="6">
                        <input class="button" id="btnSave" onclick="btnSaveConfig()"
                            type="button" value="保存设置" name="btnSave" runat="server" />
                        &nbsp;&nbsp;
                        <input class="button" id="btnSearch"
                            type="button" value="确定生成" name="btnSearch" runat="server" /></td>
                </tr>
            </table>
        </div>

    </form>
    <form id="printform" class="easyui-dialog" title="打印"
        data-options="closed: true,modal:true" style="width: 580px; height: 180px; padding: 10px;">
        <table style="line-height: 22px; width: 100%;">
            <tr>
                <td colspan="4">注：“报表打印”按照房号顺序排列。</td>
            </tr>
            <tr>
                <td colspan="4"><font color="red" face="宋体">提示：避免打印死机，建议生成后分次打印（一次≤5页），默认每页50条。</font></td>
            </tr>
            <tr>
                <td>打印页数</td>
                <td>
                    <input id="hiStartPage" value="1" name="hiStartPage" runat="server">页</td>
                <td>到</td>
                <td>
                    <input id="hiEndPage" value="1" name="hiEndPage" runat="server">页
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="4">
                    <input id="btnPrint1" class="button" value="报表打印" type="button"
                        name="btnPrint1" runat="server"></td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    function CkComb() {

        if ($("#CkIsCombShow").is(':checked') == true) {
            $('#hCkIsCombShow').val('1');
        }
        else {
            $('#hCkIsCombShow').val('0');
        }

    }

    //打印
    $("#btnPrint1").click(function () {
        $("#StartPage").val($("#hiStartPage").val());
        $("#EndPage").val($("#hiEndPage").val());
        $("#btnPrint").click();
    });

    $('#btnSearch').click(function () {


        if ($('#CustID').val() == '') {
            HDialog.Info('请选择客户');
        }
        else {
            $('#SearchDlg').dialog('close');
            $.tool.DataPost('PaymentNotice', "PaymentOne", $('#frmForm').serialize(),
                function Init() {

                },
                function callback(_Data) {
                    if (_Data != "") {
                        $body = $('body')
                        $body.queue('mx', LoadList);
                        $body.queue('mx', comLoad);

                        setInterval(function () {
                            $body.dequeue('mx') // 先弹出1,2，最后是"done"
                        }, 1000)

                    }

                },
                function completeCallback() {

                },
                function errorCallback() {

                });
        }

    });

    function comLoad() {
        if ($("#DataCount").val() > 0) {
            HDialog.Info("生成成功");
        } else {
            HDialog.Info("暂无缴费通知");
        }
    }

    function Win_OnLoad() {

        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }

    }

    var h = $(window).height();
    $(function () {
        LoadList();

    });
    function InitFunction() {
        $("#TableContainer").css("height", h + "px");
    }
    InitFunction();
    function SelCost() {
        var varReturn;

        var w = 700;
        var h = 400;


        HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("\t");

                $('#CorpCostIDs').val(varObjects[0]);
                $('#CostNames').searchbox('setValue', varObjects[1]);

            }
        });
    }

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = 800;
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
        //{ field: 'ck', checkbox: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
        {
            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        }

    ]];

    var toolbar = [
        {
            text: '新增通知单',
            iconCls: 'icon-save',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"));


                $('#DivOne').hide();

                $('#DivDD').show();


                $('#DivOne').show();
                $('#SelMode').val(3);

                $('#SearchDlg').css({ 'height': '300px' });
                $('#SearchDlg').dialog('open');

                //HDialog.MessageBoxThird("生成交费用通知单", "按房号生成", "按客户生成", "单户生成", function () {
                //    $('#DivRoom').show();
                //    $('#SelMode').val(1);

                //    $('#SearchDlg').css({ 'height': '400px' });
                //    $('#SearchDlg').dialog('open');
                //}, function () {
                //    $('#DivCust').show();
                //    $('#SelMode').val(2);

                //    $('#SearchDlg').dialog('open');

                //}, function () {
                //    $('#DivDD').hide();
                //    $('#DivOne').show();
                //    $('#SelMode').val(3);

                //    $('#SearchDlg').dialog('open');
                //});

            }
        }
        , '-',
        {
            text: '打印',
            iconCls: 'icon-print',
            handler: function () {
                //var rows = $('#TableContainer').datagrid('getChecked');
                //if (rows == "") {
                //    HDialog.Info('请选择要打印的通知单!');
                //    return;
                //}
                //else {
                //    var SelRepID = "";
                //    $.each(rows, function (key, val) {
                //        SelRepID += rows[key]["RepID"] + ",";

                //    });
                //    SelRepID = SelRepID.substr(0, SelRepID.length - 1);

                //    $("#RepID").val(SelRepID);
                //    $("#btnPrint").click();
                //}
                $('#printform').parent().appendTo($("form:first"))
                $('#printform').dialog('open');
            }
        }
    ];


    function LoadList() {

        //var Data = $('#RepDetail').val();

        //var obj = JSON.parse(Data);

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
                param = $.JQForm.GetParam("PaymentNotice", "SearchPayment", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                var count = $("#TableContainer").datagrid("getRows").length;
                $("#DataCount").val(count);
            }
        });

    }

    //保存提示
    function btnSaveConfig() {
        $.ajax({
            type: "post",
            url: "NewPaymentNewBrowse3.aspx/btnSaveConfig",
            data: "{'strCfgID':'" + $("#CfgID").val() + "','strPrintContent':'" + $("#PrintContent").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "true") {
                    HDialog.Info("已成功保存！");
                }
            },
            error: function (err) {
                HDialog.Info("保存失败！");
            }
        });


    }

    function SelContent() {

        HDialog.Open('650', '400', "../dialogNew/PaymentReportConfigDlg.aspx",
            '内容提示', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var str = _Data.replace(/\"/g, ''); //去掉返回值双引号
                    var res = str.split("|");
                    $("#PrintContent").text(res[0]);
                    $("#CfgID").val(res[1]);
                }
            });

    }


</script>


