<%@ Page Language="c#" CodeBehind="BillCheckManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BillCheckManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>BillCheckManage</title>
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
<body>
    <form id="BillCheckManage" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="BillID" type="hidden" size="1" name="BillID" runat="server">
        <input id="CommID" type="hidden" size="1" name="CommID" runat="server">
        <input id="hiShareCount" type="hidden" size="1" name="hiShareCount" runat="server">
        <input id="hiHasUsedCount" type="hidden" size="1" name="hiHasUsedCount" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />

        <table id="Table1" class="DialogTable" style="height: 250px; width: 100%;">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">票据发放信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">票据类别</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillTypeName" runat="server"></asp:Label></td>
                <td class="TdTitle">份 数</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ShareCount" runat="server"></asp:Label></td>
                <td class="TdTitle">起 号</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BeginNum" runat="server"></asp:Label></td>
                <td class="TdTitle">止 号</td>
                <td class="TdContentSearch">
                    <asp:Label ID="EndNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">起号样票</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BeginSign" runat="server"></asp:Label></td>
                <td class="TdTitle">止号样票</td>
                <td class="TdContentSearch">
                    <asp:Label ID="EndSign" runat="server"></asp:Label></td>
                <td class="TdTitle">定额票据面额</td>
                <td class="TdContentSearch">
                    <asp:Label ID="TypeFixedAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">发 放 人</td>
                <td class="TdContentSearch">
                    <asp:Label ID="IssueUserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">发放时间</td>
                <td class="TdContentSearch">
                    <asp:Label ID="IssueDate" runat="server"></asp:Label></td>
                <td class="TdTitle">领 用 人</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ReceiveUserName" runat="server"></asp:Label></td>
                <td class="TdTitle">备 注</td>
                <td class="TdContentSearch" colspan="3">
                    <asp:Label ID="tBillMemo" runat="server"></asp:Label>
                    <asp:Label Style="z-index: 0" ID="AmountAllPaid" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">票据使用信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">票据总数</td>
                <td class="TdContentSearch">
                    <asp:Label Style="z-index: 0" ID="BillCount" runat="server"></asp:Label></td>
                <td class="TdTitle">已用数量</td>
                <td class="TdContentSearch">
                    <asp:Label Style="z-index: 0" ID="HasUsedCount" runat="server"></asp:Label></td>
                <td class="TdTitle">使用票据金额</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillPaidAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">作废票据金额</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillPaidRepAmount" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">核 销 人</td>
                <td class="TdContentSearch">
                    <asp:Label ID="CheckUserName" runat="server"></asp:Label></td>
                <td class="TdTitle">核销时间</td>
                <td class="TdContentSearch">
                    <asp:Label ID="CheckDate" runat="server"></asp:Label></td>
                <td class="TdTitle">起 号</td>
                <td class="TdContentSearch">
                    <input id="BillsSign1" name="BillsSign1"
                        runat="server"></td>
                <td class="TdTitle">止 号</td>
                <td class="TdContentSearch">
                    <input id="BillsSign2" name="BillsSign2"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">是否使用</td>
                <td class="TdContentSearch">
                    <select id="IsUsed" name="IsUsed" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">是否审核</td>
                <td class="TdContentSearch">
                    <select id="IsCheck" name="IsCheck" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td colspan="8" align="center">
                    <input class="button" id="btnFilter" type="button" value="查询"
                        name="btnFilter" runat="server">&nbsp;
                    <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                        type="button" value="清空" name="btnClear">&nbsp;
                    <input class="button" id="btnCheck" type="button" value="核销确定"
                        name="btnCheck" runat="server">&nbsp;
                    <input class="button" id="btnCancel" type="button" value="撤销核销"
                        name="btnCancel" runat="server">&nbsp;
                    <input id="btnExcel" class="button" value="Excel输出" type="button" name="btnExcel"
                        runat="server">
                    <input class="button" id="btnReturn" type="button" value="返 回"
                        name="btnReturn" runat="server">
                    <input class="button" id="btnPrint" type="button" value="打印" name="btnPrint"
                        runat="server">
                    <input id="PrintParms" type="hidden" size="1" name="PrintParms"
                        runat="server">
                </td>
            </tr>
        </table>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
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
        h = h - 254;
        $("#TableContainer").css("height", h + "px");
    }

    var Column = [[
           { field: 'BillsSign', title: '票据号', width: 100, align: 'left', sortable: true },
           { field: 'PaidAmount', title: '票据金额', width: 100, align: 'left', sortable: true },
           { field: 'OldBillsSigns', title: '收据号', width: 100, align: 'left', sortable: true },
           { field: 'BillAmount', title: '收据金额', width: 100, align: 'left', sortable: true },
           {
               field: 'BillUseDate', title: '使用时间', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = formatDate(row.BillUseDate, "yyyy-MM-dd");
                   return str;
               }
           },
           { field: 'BillMemo', title: '备注', width: 100, align: 'left', sortable: true },
           { field: 'BillUseCaseName', title: '使用说明', width: 100, align: 'left', sortable: true },
           { field: 'SourceTypeName', title: '来源', width: 100, align: 'left', sortable: true },
           { field: 'IsUsedName', title: '是否使用', width: 100, align: 'left', sortable: true },
           { field: 'GatherUserName', title: '财务收款人', width: 100, align: 'left', sortable: true },
           { field: 'AccountUserName', title: '财务记账人', width: 100, align: 'left', sortable: true },
           { field: 'IsCheckName', title: '是否核销', width: 100, align: 'left', sortable: true },
           { field: 'CheckUserName', title: '核销人', width: 100, align: 'left', sortable: true },
           {
               field: '明细', title: '明细', width: 80, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var res = "";
                   if (row.SourceType == "") {

                   } else {
                       res = "<a href=\"javascript:void(0);\" onclick=\"ViewDetail('" + row.IID + "','" + row.SourceType + "','" + row.SourceID + "');\">明细</a>";
                   }
                   return res;
               }
           }
    ]]

    function LoadList() {
        var Data = $('#RepDetail').val();
        var obj = JSON.parse(Data);
        $("#TableContainer").datagrid({
            data: obj.rows,
            nowrap: false,
            columns: Column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            width: '100%',
            sortOrder: "asc",
            //  toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onDblClickRow: function (rowIndex, rowData) {

            }
        });
    }


    function ViewDetail(IID, SourceType, SourceID)
    {
       
        var strIID = IID;
        var strSourceType = SourceType;
        var iSourceID = SourceID;
        var url = "";
        var title = "";
        var strCommID = $("#CommID").val();
        switch (strSourceType)
        {
           
            case "1":
                url = "../ChargesNew/BillDataDetailBrowse.aspx";//收费
                title = "收费明细";
                break;
            case "2":
                url = "../ChargesNew/BillDataDetailPrecBrowse.aspx";//预存
                title = "预存明细";
                break;
            case "3":
                url = "../ChargesNew/BillDataDetailAdvanceBrowse.aspx";//垫付
                title = "垫付明细";
                break;
            case "4":
                url = "../ChargesNew/BillDataDetailFeesConSignBrowse.aspx";//托收
                title = "托收明细";
                break;
            case "5":
                url = "../ChargesNew/BillDataDetailRefundBrowse.aspx";//退款
                title = "退款明细";
                break;
            case "6":
                url = "../ChargesNew/BillDataDetailRefundPrecBrowse.aspx";//预交退款
                title = "预交退款";
                break;
        }

        if (url != "")
        {
            HDialog.Open(1024, 650, url + "?CommID=" + strCommID + "&BillID=" + strIID + "&SourceID=" + iSourceID, title, false,
                function callback(_Data)
                {
                    if (_Data == "true")
                    {
                        LoadList();
                    }
                });
        }

    }


    $("#btnReturn").click(function () {
        close("false");
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function btnClear_OnClick() {
        BillCheckManage.BillsSign1.value = "";
        BillCheckManage.BillsSign2.value = "";
    }


    //$("select").each(function () {

    //    var key = $(this).attr("id");
    //    $(this).css("width", document.body.clientWidth * 0.23 * 0.59);
    //});
</script>

