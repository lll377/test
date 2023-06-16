<%@ Page Language="c#" CodeBehind="RepealPreCostsDetail.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.RepealPreCostsDetail" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>�շѹ���--�վ���ϸ</title>
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
</head>
<body>
    <form id="RepealPreCostsDetail" method="post" runat="server">
                 <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="ReceID" style="width: 32px; height: 22px" type="hidden" size="1" name="ReceID"
            runat="server"><input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
                runat="server"><input id="IsRefer" style="width: 32px; height: 22px" type="hidden" size="1" name="IsRefer"
                    runat="server"><input id="IsAudit" style="width: 32px; height: 22px" type="hidden" size="1" name="IsAudit"
                        runat="server"><input id="IsDelete" style="width: 32px; height: 22px" type="hidden" size="1" name="IsDelete"
                            runat="server"><input id="hiBillsDate" style="width: 32px; height: 22px" type="hidden" size="1" name="hiBillsDate"
                                runat="server"><input id="OldBillTypeID" style="width: 24px; height: 21px" type="hidden" size="1" name="OldBillTypeID"
                                    runat="server"><input id="hiOldBillsSign" style="width: 24px; height: 21px" type="hidden" size="1" name="hiOldBillsSign"
                                        runat="server"><input style="z-index: 0; width: 32px; height: 22px" id="AccountWay" size="1" type="hidden"
                                            name="AccountWay" runat="server">
        <input id="PreCostsDetail" name="PreCostsDetail" type="hidden" runat="server" />
        <table class="DialogTable" id="table1">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">Ʊ����Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">�ͻ�����</td>
                <td class="TdContent">
                    <asp:Label ID="CustName" runat="server"></asp:Label></td>
                <td class="TdTitle">���ݱ��</td>
                <td class="TdContent">
                    <asp:Label ID="RoomSign" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�վݺ���</td>
                <td class="TdContent">
                    <asp:Label ID="BillsSign" runat="server"></asp:Label></td>
                <td class="TdTitle">�շ�����</td>
                <td class="TdContent">
                    <asp:Label ID="BillsDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�շѺϼ�</td>
                <td class="TdContent">
                    <asp:Label ID="PrecAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">�տʽ</td>
                <td class="TdContent">
                    <asp:Label ID="ChargeMode" runat="server" Style="z-index: 0"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�տ���</td>
                <td class="TdContent">
                    <asp:Label ID="UserName" runat="server"></asp:Label></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">���ñ�ע</td>
                <td class="TdContent">
                    <asp:Label ID="ReceMemo" runat="server"></asp:Label></td>
                <td class="TdTitle">��ӡ����</td>
                <td class="TdContent">
                    <asp:Label ID="PrintTimes" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�ѻ���Ʊ</td>
                <td class="TdContent" width="85%">
                    <asp:Label ID="NewBillsSign" runat="server" Style="z-index: 0"></asp:Label></td>
            </tr>

            <tr>
                <td class="TdTitle">�Ƿ������</td>
                <td class="TdContent">
                    <asp:Label Style="z-index: 0" ID="IsAuditName" runat="server"></asp:Label></td>
                <td class="TdTitle">�Ƿ���</td>
                <td class="TdContent">
                    <asp:Label ID="IsDeleteName" runat="server" Style="z-index: 0"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">Ʊ�������Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">����ԭ��</td>
                <td class="TdContent">
                    <input class="Control_ItemInput" id="ReferReason" maxlength="100" size="13" name="ReferReason"
                        runat="server"></td>
                <td class="TdTitle">�Ƿ�ָ�Ʊ��</td>
                <td class="TdContent">
                    <select id="IsRestore" name="IsRestore" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input id="btnOk" class="button" value="���ͨ��" type="button" name="btnOk" runat="server">&nbsp;
                    <input id="btnNo" class="button" value="��˲�ͨ��" type="button" name="btnNo" runat="server">&nbsp;
                    <input id="btnSave" class="button" value="����" type="button" name="btnSave" runat="server">
                    <input class="button" id="btnReturn" type="button" value="��������"
                        name="btnReturn" runat="server"></td>
            </tr>
        </table>
        <table class="DialogTable" id="table2">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��Ԥ�շ���</span> </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="SearchContainer" id="TableContainer1">
                    </div>
                </td>
            </tr>

        </table>

        <script type="text/javascript">

            function InitTable() {
                var ah = $(window).height();
                var h = $('#table1').height();
                h = ah - h
                h = h - 64;

                $("#TableContainer1").css("height", h + "px");


            }
            InitTable();

            var column = [[
                { field: 'RoomSign', title: '���ݱ��', width: 180, align: 'left', sortable: true },
                { field: 'ParkNames', title: '��λ', width: 180, align: 'left', sortable: true },
                { field: 'PrecDate', title: 'Ԥ���Ǽ�ʱ��', width: 180, align: 'left', sortable: true },
                { field: 'BillsSign', title: '�վݺ���', width: 180, align: 'left', sortable: true },
                { field: 'RepCostNames', title: 'Ʊ�ݷ�����Ŀ', width: 180, align: 'left', sortable: true },
                { field: 'PrecAmount', title: 'Ԥ�����', width: 180, align: 'left', sortable: true },
                { field: 'UserName', title: 'Ԥ��������', width: 180, align: 'left', sortable: true },
                { field: 'AccountWayName', title: '����ʽ', width: 180, align: 'left', sortable: true },
                { field: 'PrecMemo', title: '��ע', width: 180, align: 'left', sortable: true },
                { field: 'BillsSigns', title: '��Ʊ��', width: 180, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '��ӡ����', width: 180, align: 'left', sortable: true }
            ]];


            function LoadList() {



                var data1 = $('#PreCostsDetail').val();
                var obj1 = JSON.parse(data1);
                $("#TableContainer1").datagrid({

                    data: obj1.rows,
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc"
                });

            }
            LoadList();
        </script>

    </form>
</body>
</html>
