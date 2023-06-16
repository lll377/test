<%@ Page Language="c#" CodeBehind="NewBankSurrManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.NewBankSurrManage" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>BankSurrManage</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

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

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script type="text/javascript">
		<!--

    function CheckData() {


        return true;
    }

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    $(function () {

        if (GetQueryString("ivrShowType") == "1") {
            $('body').pagewalkthrough({
                name: 'introduction3',
                steps: [
                    {
                        wrapper: '#btnDeal',
                        popup: {
                            content: '上传回盘文件后点击“确认代扣”按钮；',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function () {
                            HDialog.Close("1");
                        }
                    }
                ]
                ,
                buttons: {
                    jpwNext: {
                        i18n: "下一步 &rarr;"
                    },
                    jpwFinish: {
                        i18n: "结束指引 &#10004;",
                    },
                    jpwPrevious: {
                        i18n: "&larr; 上一步"
                    },
                    jpwClose: {
                        i18n: "关闭",
                    }
                }
            })

            $('body').pagewalkthrough('show');
        }

    });

    //-->
    </script>
    <style>
        .tabs-container .panel-body {
            padding: 0px;
        }

        /*table tr {
            border: 1px double #F6F6F6;
        }*/
    </style>

    <script type="text/javascript">

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body style="overflow-y: auto" onload="Win_OnLoad()">
    <form id="BankSurrManage" method="post" runat="server">
        <input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server"><input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
                runat="server">
        <input id="SurrID" style="width: 24px; height: 22px" type="hidden" size="1" name="SurrID"
            runat="server">
        <input id="SurrState" style="width: 24px; height: 22px" type="hidden" size="1" name="SurrState"
            runat="server">
        <input id="BackFileName" style="width: 24px; height: 22px" type="hidden" size="1" name="BackFileName"
            runat="server">
        <input id="BankID" style="width: 24px; height: 22px" type="hidden" size="1" name="BankID"
            runat="server"><input id="WriteDir" style="width: 24px; height: 22px" type="hidden" size="1" name="WriteDir"
                runat="server"><input id="BackPerRowFormat" style="width: 24px; height: 22px" type="hidden" size="1" name="BackPerRowFormat"
                    runat="server"><input id="hiFileType" style="width: 24px; height: 22px" type="hidden" size="1" name="hiFileType"
                        runat="server"><input id="hiFirstName" style="width: 24px; height: 22px" type="hidden" size="1" name="hiFirstName"
                            runat="server">

        <input id="IsUpLoad" style="width: 24px; height: 22px" type="hidden" size="1" name="IsUpLoad"
            runat="server">

        <input id="print" type="button" name="print" runat="server" onserverclick="print_ServerClick" />

        <input id="printAll" type="button" name="printAll" runat="server" />

        <input id="printSel" type="button" name="printSel" runat="server" onserverclick="printSel_ServerClick" />
        <input id="RowData" type="hidden" name="RowData" runat="server" />
        <input id="AllReceData" name="AllReceData" type="hidden" runat="server" />
        <input style="width: 24px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms"
            runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="Divreport" name="Divreport" style="width: 100%;" class="easyui-layout" title="列表选项卡">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="custinfo" id="custpage" refpage="" refsel="1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="true" style="font: bolder 16px large">代扣信息</a>
                    </li>
                    <li class="" name="roominfo" id="roompage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false" style="font: bolder 16px large">明细信息</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane" active>
                        <div class="panel-body">
                            <div class="Frm">
                                <div class="SearchContainer" style="background-color: #FFFFFF;" id="TableContainer1">
                                    <br />
                                    <table class="DialogTable" style="line-height: 25px; background-color: #FFFFFF; text-align: left; font-family: 微软雅黑;">

                                        <tr>
                                            <td class="TdTitle">下载代扣文件</td>
                                            <td class="TdContent">
                                                <input class="button" id="btnDown" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="代扣明细文件" name="btnDown" runat="server">&nbsp;&nbsp;<input class="button" id="btnDown2" onclick="javascript: if (CheckData() == false) return false;"
                                                        type="button" value="代扣汇总文件" name="btnDown2" runat="server"></td>
                                            <td class="TdTitle">下载代扣记录</td>
                                            <td class="TdContent">
                                                <input class="button" id="BtnBankSurr"
                                                    type="button" value="代扣记录" name="BtnBankSurr" runat="server" style="display: none;">

                                                <input class="button" id="BtnBankSurr1"
                                                    type="button" value="代扣记录" name="BtnBankSurr1" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">开始时间</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BeginDate" runat="server"></asp:Label></td>
                                            <td class="TdTitle">完成时间</td>
                                            <td class="TdContent">
                                                <asp:Label ID="ChargeDate" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">应处理数量</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllCounts1" runat="server"></asp:Label></td>
                                            <td class="TdTitle">应处理金额</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllAmount1" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">已处理数量</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllCounts2" runat="server"></asp:Label></td>
                                            <td class="TdTitle">已处理金额</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllAmount2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">代收银行名称</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">手 续 费</td>
                                            <td class="TdContent">
                                                <asp:Label ID="HandlingCharge" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">收款方式</td>
                                            <td class="TdContent">
                                                <select id="ChargeMode" name="ChargeMode" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle">收据样式</td>
                                            <td class="TdContent">
                                                <select id="UseRepID" name="UseRepID" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">状态</td>
                                            <td class="TdContent">
                                                <asp:Label ID="SurrStateName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">操作员</td>
                                            <td class="TdContent">
                                                <asp:Label ID="UserName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">
                                                <asp:Label ID="LabelFile" runat="server">上传返回文件</asp:Label></td>
                                            <td class="TdContent" colspan="3">
                                                <input id="btnFile" style="width: 400px; height: 22px" type="file" size="56" name="btnFile"
                                                    runat="server"><div style="height: 8px;"></div>
                                                <input class="button" id="btnUpLoad" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="开始上传" name="btnUpLoad" runat="server">&nbsp;&nbsp;<input class="button" id="btnDeal" onclick="DealData();"
                                                        type="button" value="确认代扣" name="btnDeal" runat="server">&nbsp;&nbsp;<input class="button" id="btnContinue" onclick="javascript: if (CheckData() == false) return false;"
                                                            type="button" value="继续代扣" name="btnContinue" runat="server">&nbsp;&nbsp;<input class="button" id="btnOk" onclick="javascript: if (CheckData() == false) return false;"
                                                                type="button" value="完成代扣" name="btnOk" runat="server"><div style="height: 8px;"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">
                                                <asp:Label ID="LabelResults" runat="server">处理信息</asp:Label></td>
                                            <td class="TdContent" colspan="3">
                                                <textarea id="TextResults" style="width: 100%" name="TextResults" rows="6" runat="server"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_Footer" align="center" colspan="4">
                                                <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="保存" name="btnSave" runat="server">&nbsp;&nbsp;<input class="button" id="btnSet" type="button" value="批量设置票号"
                                                        name="btnSet" runat="server">&nbsp;&nbsp;<input id="Btn_Excel" class="button" value="代收输出(汇总)"
                                                            type="button" name="Btn_Excel" runat="server">&nbsp;&nbsp;<input id="Btn_Excel2" class="button" value="代收输出(明细)"
                                                                type="button" name="Btn_Excel2" runat="server">&nbsp;&nbsp;<input id="Btn_Excel3" class="button" value="费用输出(明细)"
                                                                    type="button" name="Btn_Excel3" runat="server">&nbsp;&nbsp;<input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn"
                                                                        runat="server"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer">
                                    1111111111
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 150px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">是否成功
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsSucc" name="IsSucc" runat="server"></select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>



        <script type="text/javascript">

            //获取url中的参数
            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
                var r = window.location.search.substr(1).match(reg); //匹配目标参数
                if (r != null) return decodeURI(r[2]); return null; //返回参数值
            }
            $(function () {
                if (getUrlParam('BankName') == "银联在线代扣" || getUrlParam('BankName') == "通联在线支付" || getUrlParam('BankName') == "银结通在线支付") {
                    $("#btnUpLoad").attr("style", "display:none");
                    $("#btnDeal").attr("style", "display:none");
                    $("#btnContinue").attr("style", "display:none");
                    $("#btnOk").attr("style", "display:none");
                    $("#BtnBankSurr").attr("style", "display:none");
                    $("#btnSave").attr("style", "display:none");
                    $("#Btn_Excel3").attr("style", "display:none");
                }
            });

            $('#BtnBankSurr1').click(function () {
                //alert();
                $('#BtnBankSurr').click();
            });

            function InitTableHeight() {
                var h = $(window).height() - 38;

                $('#tab-1').attr("class", "tab-pane active");
                $(".Frm").css({ "height": h + "px" });

                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            $(".tabs-container li").click(function () {

                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");


                $('#custinfo').attr("refsel", "0");
                $('#roominfo').attr("refsel", "0");


                $('#custinfo').attr("class", "");
                $('#roominfo').attr("class", "");



                switch ($(this).attr("name")) {
                    case "custinfo":

                        $('#tab-1').attr("class", "tab-pane active");
                        $('#custinfo').attr("refsel", "1");
                        $('#custinfo').attr("class", "active");

                        break;
                    case "roominfo":

                        $('#tab-2').attr("class", "tab-pane active");
                        $('#roominfo').attr("refsel", "1");
                        $('#roominfo').attr("class", "active");

                        LoadList();
                        break;

                }

            });



            function Init() {
                $('#btnSet').hide();
                $('#Btn_Excel2').hide();
                $('#Btn_Excel').hide();

                $('#print').hide();
                $('#printSel').hide();
                $('#printAll').hide();

            }

            Init();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'SNum', title: '序号', width: 140, align: 'left', sortable: true },
                { field: 'DealCode', title: '待处理信息', width: 100, align: 'left', sortable: true },
                {
                    field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true, sortable: true,
                    formatter: function (value, row, index) {


                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.IID + "','" + row.SurrID + "','" + row.CustID + "','" + row.RoomID + "');\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 140, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 140, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
                { field: 'BankAccount', title: '银行账号', width: 140, align: 'left', sortable: true },
                { field: 'PaymentTime', title: '年度月份', width: 100, align: 'left', sortable: true },
                { field: 'ActAllDueAmount', title: '代收金额小计', width: 100, align: 'left', sortable: true },
                { field: 'ActPaidAmount', title: '已代收金额', width: 100, align: 'left', sortable: true },
                { field: 'IsSuccName', title: '是否成功', width: 100, align: 'left', sortable: true },
                { field: 'ErrMsg', title: '银行返回信息', width: 200, align: 'left', sortable: true },
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true }



            ]];



            function ViewDetail(strIID, strSurrID, strCustID, strRoomID) {

                var conent = '../ChargesNew/BankRecordDetailBrowse.aspx?IID=' + strIID + '&SurrID=' + strSurrID + '&CustID=' + strCustID + '&RoomID=' + strRoomID;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, '设置票据号码', true, function callback(_Data) {
                    LoadList();
                });

            }

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
                    text: '批量设置票号',
                    iconCls: 'icon-save',
                    handler: function () {
                        //$('#btnSet').click();


                        var width = $(window).width();
                        var height = $(window).height();;
                        var conent = "../ChargesNew/BankSurrSetManage.aspx?OPType=Edit&SurrID=" + $('#SurrID').val();

                        HDialog.Open(width, height, conent, '批量设置票号', false, function callback(_Data) {
                            LoadList();
                        });


                    }
                }
                , '-',
                {
                    text: '打印预览',
                    iconCls: 'icon-print',
                    handler: function () {

                        var row = $('#TableContainer').datagrid('getChecked');

                        if (row == "" || row == undefined) { HDialog.Info('请选择要预览的票据!'); }
                        else {
                            if (row.ReceID == '') {
                                HDialog.Info('请选择回盘成功的数据!');
                            }
                            else {
                                $('RowData').val(JSON.stringify(row));
                                document.getElementById('RowData').value = JSON.stringify(row);
                                $('#printSel').click();
                            }
                        }
                    }
                }, '-',
                {
                    text: '打印票据',
                    iconCls: 'icon-print',
                    handler: function () {

                        var row = $('#TableContainer').datagrid('getChecked');
                        if (row == "") {
                            HDialog.Info('请选择要打印的票据!');
                        }
                        else {

                            $('RowData').val(JSON.stringify(row));
                            document.getElementById('RowData').value = JSON.stringify(row);

                            $('#print').click();

                            //if (row.ReceID == '') {
                            //    HDialog.Info('请选择回盘成功的数据!');
                            //}
                            //else {
                            //    $('RowData').val(JSON.stringify(row));
                            //    document.getElementById('RowData').value = JSON.stringify(row);

                            //    $('#btnPrint').click();
                            //}
                        }
                    }
                }, '-',
                {
                    text: '批量打印',
                    iconCls: 'icon-print',
                    handler: function () {

                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要打印的票据!');
                        }
                        else {

                            var SelData = JSON.stringify(rows);
                            $('#AllReceData').val(SelData);

                            $('#printAll').click();
                        }
                    }
                }, '-',

                {
                    text: '代收汇总输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        $('#Btn_Excel').click();

                    }
                }
                , '-',
                {
                    text: '代收明细输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        $('#Btn_Excel2').click();
                    }
                }, '-',
                {
                    text: '费用明细输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        $('#Btn_Excel3').click();
                    }
                }, '-',
                {
                    text: '<font color=red >*如不设置票号，默认系统收款流水号；</br>如需设置票号，点击记录单个设置或点击“批量设置票号”设置起始票号。</font>',
                }
            ];

            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    //title: '代扣明细',
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
                        param = $.JQForm.GetParam("CustBank", "BankRecordBatchList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            for (var i = 0; i < data.rows.length; i++) {
                                if (data.rows[i].ReceID == '' || data.rows[i].IsSucc == '' || data.rows[i].IsSucc == '0') {
                                    $("input[type='checkbox']")[i + 1].disabled = true;
                                }

                            }
                        }
                    },
                    onCheckAll: function (rows) {

                        $("input[type='checkbox']").each(function (index, el) {
                            var Data = JSON.stringify(rows[index]);
                            if (el.disabled) {
                                $(el).removeAttr("checked");
                            }
                        });

                        //var rows = $('#TableContainer').datagrid("getChecked");
                        //$.each(rows, function (index, item) {
                        //    var Data = JSON.stringify(item);
                        //    var ss = document.getElementById("AllReceData").value;
                        //    if (ss.indexOf(Data) < 0) {

                        //            if (Data.ReceID != '' &&  Data.IsSucc == '1') {
                        //            document.getElementById("AllReceData").value = document.getElementById("AllReceData").value + "," + Data;
                        //        }
                        //    }
                        //});
                        //if (document.getElementById("AllReceData").value.substr(0, 1) == ",")
                        //    document.getElementById("AllReceData").value = document.getElementById("AllReceData").value.substr(1, document.getElementById("AllReceData").value.length - 1);

                    },
                    onUncheckAll: function (rows) {
                        //var ss = document.getElementById("AllReceData").value;

                        //$.each(rows, function (index, item) {
                        //    var Data = JSON.stringify(item);

                        //    if (ss.indexOf(Data) > -1) {
                        //        ss = ss.replace(Data, "");
                        //    }
                        //    document.getElementById("AllReceData").value = ss;
                        //});
                        //if (document.getElementById("AllReceData").value.substr(0, 1) == ",")
                        //    document.getElementById("AllReceData").value = document.getElementById("AllReceData").value.substr(1, document.getElementById("AllReceData").value.length - 1);



                    }
                });
                $('#SearchDlg').dialog('close');
            }
            //LoadList();
            $('#btnReturn').click(function () {

                HDialog.Close(1);
            });

            var ProgressInterval;

            function DealData() {
                if ($("#IsUpLoad").val() == "" || $("#IsUpLoad").val() == "0") {
                    HDialog.Info("请先上传文件!");
                    return;
                }

                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }


            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('BankSurr', 'StartTask', $('#BankSurrManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //展示进度
            ShowProgress();
            //获取执行情况进度
            ProgressInterval = setInterval("TakeProgress()", 1000);


            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('BankSurr', 'TakeProgress', $('#BankSurrManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);

                        if (_Data == '[]') {
                            LoadList();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                LoadList();
                                CloseProgress();

                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
        </script>

    </form>
</body>
</html>
