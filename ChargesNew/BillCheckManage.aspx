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
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">Ʊ�ݷ�����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">Ʊ�����</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillTypeName" runat="server"></asp:Label></td>
                <td class="TdTitle">�� ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ShareCount" runat="server"></asp:Label></td>
                <td class="TdTitle">�� ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BeginNum" runat="server"></asp:Label></td>
                <td class="TdTitle">ֹ ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="EndNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�����Ʊ</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BeginSign" runat="server"></asp:Label></td>
                <td class="TdTitle">ֹ����Ʊ</td>
                <td class="TdContentSearch">
                    <asp:Label ID="EndSign" runat="server"></asp:Label></td>
                <td class="TdTitle">����Ʊ�����</td>
                <td class="TdContentSearch">
                    <asp:Label ID="TypeFixedAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">�� �� ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="IssueUserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">����ʱ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="IssueDate" runat="server"></asp:Label></td>
                <td class="TdTitle">�� �� ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ReceiveUserName" runat="server"></asp:Label></td>
                <td class="TdTitle">�� ע</td>
                <td class="TdContentSearch" colspan="3">
                    <asp:Label ID="tBillMemo" runat="server"></asp:Label>
                    <asp:Label Style="z-index: 0" ID="AmountAllPaid" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">Ʊ��ʹ����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">Ʊ������</td>
                <td class="TdContentSearch">
                    <asp:Label Style="z-index: 0" ID="BillCount" runat="server"></asp:Label></td>
                <td class="TdTitle">��������</td>
                <td class="TdContentSearch">
                    <asp:Label Style="z-index: 0" ID="HasUsedCount" runat="server"></asp:Label></td>
                <td class="TdTitle">ʹ��Ʊ�ݽ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillPaidAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">����Ʊ�ݽ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="BillPaidRepAmount" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�� �� ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="CheckUserName" runat="server"></asp:Label></td>
                <td class="TdTitle">����ʱ��</td>
                <td class="TdContentSearch">
                    <asp:Label ID="CheckDate" runat="server"></asp:Label></td>
                <td class="TdTitle">�� ��</td>
                <td class="TdContentSearch">
                    <input id="BillsSign1" name="BillsSign1"
                        runat="server"></td>
                <td class="TdTitle">ֹ ��</td>
                <td class="TdContentSearch">
                    <input id="BillsSign2" name="BillsSign2"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">�Ƿ�ʹ��</td>
                <td class="TdContentSearch">
                    <select id="IsUsed" name="IsUsed" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">�Ƿ����</td>
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
                    <input class="button" id="btnFilter" type="button" value="��ѯ"
                        name="btnFilter" runat="server">&nbsp;
                    <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                        type="button" value="���" name="btnClear">&nbsp;
                    <input class="button" id="btnCheck" type="button" value="����ȷ��"
                        name="btnCheck" runat="server">&nbsp;
                    <input class="button" id="btnCancel" type="button" value="��������"
                        name="btnCancel" runat="server">&nbsp;
                    <input id="btnExcel" class="button" value="Excel���" type="button" name="btnExcel"
                        runat="server">
                    <input class="button" id="btnReturn" type="button" value="�� ��"
                        name="btnReturn" runat="server">
                    <input class="button" id="btnPrint" type="button" value="��ӡ" name="btnPrint"
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
           { field: 'BillsSign', title: 'Ʊ�ݺ�', width: 100, align: 'left', sortable: true },
           { field: 'PaidAmount', title: 'Ʊ�ݽ��', width: 100, align: 'left', sortable: true },
           { field: 'OldBillsSigns', title: '�վݺ�', width: 100, align: 'left', sortable: true },
           { field: 'BillAmount', title: '�վݽ��', width: 100, align: 'left', sortable: true },
           {
               field: 'BillUseDate', title: 'ʹ��ʱ��', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = formatDate(row.BillUseDate, "yyyy-MM-dd");
                   return str;
               }
           },
           { field: 'BillMemo', title: '��ע', width: 100, align: 'left', sortable: true },
           { field: 'BillUseCaseName', title: 'ʹ��˵��', width: 100, align: 'left', sortable: true },
           { field: 'SourceTypeName', title: '��Դ', width: 100, align: 'left', sortable: true },
           { field: 'IsUsedName', title: '�Ƿ�ʹ��', width: 100, align: 'left', sortable: true },
           { field: 'GatherUserName', title: '�����տ���', width: 100, align: 'left', sortable: true },
           { field: 'AccountUserName', title: '���������', width: 100, align: 'left', sortable: true },
           { field: 'IsCheckName', title: '�Ƿ����', width: 100, align: 'left', sortable: true },
           { field: 'CheckUserName', title: '������', width: 100, align: 'left', sortable: true },
           {
               field: '��ϸ', title: '��ϸ', width: 80, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var res = "";
                   if (row.SourceType == "") {

                   } else {
                       res = "<a href=\"javascript:void(0);\" onclick=\"ViewDetail('" + row.IID + "','" + row.SourceType + "','" + row.SourceID + "');\">��ϸ</a>";
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
                url = "../ChargesNew/BillDataDetailBrowse.aspx";//�շ�
                title = "�շ���ϸ";
                break;
            case "2":
                url = "../ChargesNew/BillDataDetailPrecBrowse.aspx";//Ԥ��
                title = "Ԥ����ϸ";
                break;
            case "3":
                url = "../ChargesNew/BillDataDetailAdvanceBrowse.aspx";//�渶
                title = "�渶��ϸ";
                break;
            case "4":
                url = "../ChargesNew/BillDataDetailFeesConSignBrowse.aspx";//����
                title = "������ϸ";
                break;
            case "5":
                url = "../ChargesNew/BillDataDetailRefundBrowse.aspx";//�˿�
                title = "�˿���ϸ";
                break;
            case "6":
                url = "../ChargesNew/BillDataDetailRefundPrecBrowse.aspx";//Ԥ���˿�
                title = "Ԥ���˿�";
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

