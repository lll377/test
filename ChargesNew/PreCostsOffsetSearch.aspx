<%@ Page Language="c#" CodeBehind="PreCostsOffsetSearch.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.PreCostsOffsetSearch" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>PreCostsOffsetSearch</title>
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
    <form id="PreCostsOffsetSearch" method="post" runat="server">
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server">
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />

        <input class="button" id="btnPrint" type="button" value="��ӡ" style="display: none;" name="btnPrint" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 950px; height: 300px; padding: 10px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">����ʱ��</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" style="width: 140px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditBeginDate" runat="server" />
                        ��
                        <input id="EditEndDate" style="width: 140px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="EditEndDate" runat="server" />
                    </td>
                    <td class="TdTitle">���ʱ��</td>
                    <td class="TdContentSearch">
                        <input id="ChongdiBeginDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="ChongdiBeginDate" runat="server" />
                        ��
                        <input id="ChongdiEndDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="ChongdiEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">¥��</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">��������</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">�ͻ�����</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="CustName" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">��ѡ����</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="RoomSign" data-options="editable:false,panelHeight: 'auto'" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">��ַ�Χ</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="DrPreRange" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="����Ԥ�����">����Ԥ�����</asp:ListItem>
                            <asp:ListItem Value="����Ԥ�����">����Ԥ�����</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle">��������</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" style="width: 83%;" name="CostName" searcher="SelCost" data-options="editable:false" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" />
                    </td>
                    <td class="TdTitle"><%--Ԥ�����--%></td>
                    <td class="TdContentSearch">
                        <select id="SelType" style="display:none" name="SelType" runat="server">
                            <option>ȫ��</option>
                            <option value="2">Ԥ��</option>
  <%--                          <option value="1">Ԥ��</option>--%>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">�Ƿ�渶</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">�Ƿ���</td>
                    <td class="TdContentSearch">
                        <select id="IsDel" name="IsDel" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">��λ���</td>
                    <td class="TdContent">
                        <input type="text" id="ParkName" style="width: 83%;" runat="server" />
                    </td>
                    <td class="TdTitle">����ʱ��</td>
                    <td class="TdContentSearch">
                        <input id="WriteOffBeginDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="WriteOffBeginDate" runat="server" />
                        ��
                        <input id="WriteOffEndDate" style="width: 135px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" name="WriteOffEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">ȷ��ɸѡ</a>&nbsp;&nbsp;
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>--%>
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
        $('#hiIsSQLData').val('-1');
        LoadList();
    });

    function SelCost() {
        var varReturn;

        var w = 700;
        var h = 400;


        HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '�շ���Ŀѡ��', false, function callback(_Data) {
            if (_Data != "") {//**��÷��� ˢ��
                var varObjects = _Data.split("\t");

                $('#CostID').val(varObjects[0]);
                $('#CostName').searchbox('setValue', varObjects[1]);

            }
        });

        return false;
    }

    function LoadData() {
        $('#hiIsSQLData').val('1');
        LoadList();
    }
    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var frozenColumns = [[
        { field: 'CustName', title: '�ͻ�����', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 180, align: 'left', sortable: true },
    ]];

    var cmenuList = ['�ͻ���Ϣ', '������Ϣ', '��λ��Ϣ', '�շѱ�׼', '������Ϣ'];

    var cmenuColumnList = [
        ['a1', '�ͻ����', '��ϵ�绰'],
        ['a2', '�ܼ�', '��������', '¥������', '���ݽ������', '�����������', '���ݹ�̯���', '���ݻ�԰���', '���ݵ��������', '���ݼƷ����', '���ݲ�Ȩ����', '¥������',
            '����ʹ������', 'ʹ��״̬', '����״̬', '����ʵ�ʽ���ʱ��', '���ݿ�������'],
        ['a3', '��λ����', '��λ·ַ', '��λ���', '��λ���', '��λ�Ʒ����', '��λ���', '��λ����', '��λ��Ȩ����', '��λʹ��״̬', '��λʵ�ʽ���ʱ��', '��λ��������'],
        ['a4', '�Ʒѷ�ʽ', '���㷽ʽ', '�շѱ�׼', '��������'],
        ['a5', '���', 'ֹ��', 'ʹ����']
    ]

    var cmenu;
    function createColumnMenu() {
        cmenu = $('<div/>').appendTo('body');
        cmenu.menu({
            onClick: function (item) {
                var j = 0
                for (var i = 0; i < cmenuList.length; i++) {
                    if (item.name == cmenuList[i]) {
                        j = i;
                        break;
                    }
                }
                var cmd = 'hideColumn';
                if (item.iconCls == 'icon-ok') {
                    cmd = 'hideColumn';
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-empty'
                    });
                } else {
                    cmd = 'showColumn';
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-ok'
                    });
                }
                for (var k = 0; k < cmenuColumnList[j].length; k++) {
                    $('#TableContainer').datagrid(cmd, cmenuColumnList[j][k]);
                }
            }
        });

        for (var i = 0; i < cmenuList.length; i++) {
            var field = cmenuList[i];
            cmenu.menu('appendItem', {
                text: field,
                name: field,
                iconCls: 'icon-empty'
            });
        }
    }

    var column = [
        [
            { title: '�ͻ���Ϣ', field: 'a1', colspan: 2, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { title: '������Ϣ', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { title: '��λ��Ϣ', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { field: 'CostName', rowspan: 2, title: '��������', width: 170, align: 'center', sortable: true },
            { title: '�շѱ�׼', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
            { field: '����1', rowspan: 2, title: '����1', align: 'center', sortable: true, fixed: true, width: 100 },
            { field: '����2', rowspan: 2, title: '����2', align: 'center', sortable: true, fixed: true, width: 100 },
            { title: '������Ϣ', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

            { field: '��ֵ˰��', rowspan: 2, title: '˰��', width: 100, align: 'left', sortable: true },
            { field: '��������', rowspan: 2, title: '��������', align: 'center', sortable: true, fixed: true, width: 150 },
            {
                field: 'FeesDueDate', rowspan: 2, title: 'Ӧ������', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FeesStateDate', rowspan: 2, title: '���ÿ�ʼʱ��', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FeesEndDate', rowspan: 2, title: '���ý���ʱ��', width: 120, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PreDate', rowspan: 2, title: 'Ԥ���������', width: 160, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PreDate, "yyyy-MM-dd HH:mm:ss");
                    return str;
                }
            },
            { field: 'PreUsername', rowspan: 2, title: '�����', width: 100, align: 'left', sortable: true },
            { field: 'StanName', rowspan: 2, title: '��׼����', width: 170, align: 'left', sortable: true },
            { colspan: 3, title: 'Ӧ��ֽ��', width: 100, align: 'left', sortable: true },
            { field: 'OldPrecAmount', rowspan: 2, title: 'ԭԤ�����', width: 100, align: 'left', sortable: true },
            { field: 'OffsetAmount', rowspan: 2, title: '����ܽ��', width: 100, align: 'left', sortable: true },
            { field: 'NewPrecAmount', rowspan: 2, title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
            { field: 'CostName', rowspan: 2, title: '�����Ŀ', width: 170, align: 'left', sortable: true },
            { colspan: 3, title: '��ֽ��', width: 100, align: 'left', sortable: true },
            { field: 'CommisionCostName', rowspan: 2, title: '���Ӷ����Ŀ', width: 100, align: 'left', sortable: true },
            { field: 'CommissOffsetAmount', rowspan: 2, title: '���Ӷ����', width: 100, align: 'left', sortable: true },
            { field: 'TakeWiseName', rowspan: 2, title: '����ʽ', width: 100, align: 'left', sortable: true },
            { field: 'IsPropertyName', rowspan: 2, title: '�Ƿ�渶', width: 100, align: 'left', sortable: true },
            { field: 'PreRange', rowspan: 2, title: '��ַ�Χ', width: 100, align: 'left', sortable: true },
            { field: 'DelUserName', rowspan: 2, title: '������', width: 100, align: 'left', sortable: true },
            {
                field: 'DelDate', rowspan: 2, title: '����ʱ��', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.DelDate, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'ChangeMemo', rowspan: 2, title: '����ԭ��', width: 100, align: 'left', sortable: true },
            {
                field: 'IsWriteOff', rowspan: 2, title: '�Ƿ����', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var strIsWriteOff = "";
                    if (row.IsWriteOff == 'True') {
                        strIsWriteOff = "��";
                    } else if (row.IsWriteOff == 'False') {
                        strIsWriteOff = "��";
                    }
                    return strIsWriteOff;
                }
            },
            {
                field: 'WriteOffAuditDate', rowspan: 2, title: '����ʱ��', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.WriteOffAuditDate, "yyyy-MM-dd");
                    return str;
                }
            }

        ], [

            //�ͻ���Ϣ
            { field: '�ͻ����', title: '�ͻ����', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��ϵ�绰', title: '��ϵ�绰', width: 100, align: 'center', sortable: true, hidden: true },

            //������Ϣ
            { field: '�ܼ�', title: '�ܼ�', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��������', title: '��������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '¥������', title: '¥������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݽ������', title: '�������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '�����������', title: '�������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݹ�̯���', title: '��̯���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݻ�԰���', title: '��԰���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݵ��������', title: '���������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݼƷ����', title: '�������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���ݲ�Ȩ����', title: '��Ȩ����', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '¥������', title: '¥������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '����ʹ������', title: 'ʹ������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: 'ʹ��״̬', title: 'ʹ��״̬', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '����״̬', title: '����״̬', width: 100, align: 'center', sortable: true, hidden: true },
            {
                field: '����ʵ�ʽ���ʱ��', title: 'ʵ�ʽ���ʱ��', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                    var str = formatDate(row.����ʵ�ʽ���ʱ��, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: '���ݿ�������', title: '��������', width: 100, align: 'center', sortable: true, hidden: true },

            //��λ��Ϣ
            { field: '��λ����', title: '��λ����', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ·ַ', title: '��λ·ַ', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ���', title: '��λ���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ���', title: '��λ���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ�Ʒ����', title: '�������', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ���', title: '��λ���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ����', title: '��λ����', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λ��Ȩ����', title: '��Ȩ����', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��λʹ��״̬', title: 'ʹ��״̬', width: 100, align: 'center', sortable: true, hidden: true },
            {
                field: '��λʵ�ʽ���ʱ��', title: 'ʵ�ʽ���ʱ��', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                    var str = formatDate(row.��λʵ�ʽ���ʱ��, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: '��λ��������', title: '��������', width: 100, align: 'center', sortable: true, hidden: true },

            //�շѱ�׼
            { field: '�Ʒѷ�ʽ', title: '�Ʒѷ�ʽ', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '���㷽ʽ', title: '���㷽ʽ', width: 150, align: 'center', sortable: true, hidden: true },
            { field: '�շѱ�׼', title: '�շѱ�׼', width: 100, align: 'center', sortable: true, hidden: true },
            { field: '��������', title: '��������', width: 100, align: 'center', sortable: true, hidden: true },

            //������Ϣ
            { field: '���', title: '���', width: 100, align: 'center', sortable: true, hidden: true },
            { field: 'ֹ��', title: 'ֹ��', width: 100, align: 'center', sortable: true, hidden: true },
            { field: 'ʹ����', title: 'ʹ����', width: 100, align: 'center', sortable: true, hidden: true },

            //Ӧ��ֽ��
            { field: 'DebtsAmount', title: '��˰���', align: 'left', sortable: true, width: 100 },
            { field: 'DebtsAmountTax', title: '˰��', align: 'left', sortable: true, width: 100 },
            { field: 'DebtsAmountTaxAmount', title: '����˰���', align: 'left', sortable: true, width: 100 },

            //��ֽ��
            { field: 'PaidOffsetAmount', title: '��˰���', align: 'left', sortable: true, width: 100 },
            { field: 'PaidOffsetAmountTax', title: '˰��', align: 'left', sortable: true, width: 100 },
            { field: 'PaidOffsetAmountTaxAmount', title: '����˰���', align: 'left', sortable: true, width: 100 }
        ]
    ];

    var toolbar = [
        {
            text: 'ɸѡ',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        //{
        //    text: '��ӡ',
        //    iconCls: 'icon-print',
        //    handler: function () {
        //        document.getElementById('btnPrint').click();
        //    }
        //}, '-',
        {
            text: 'Excel���',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = "../ChargesNew/PreCostsOffsetSearchCre.aspx";
            }
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            view: myview,
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
            showFooter: true,
            sortOrder: "asc",
            onHeaderContextMenu: function (e, field) {
                e.preventDefault();
                if (!cmenu) {
                    createColumnMenu();
                }
                cmenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchprecostsoffset", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.IID == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('PrecReceFee', "searchprecostsoffsetSum", $('#PreCostsOffsetSearch').serialize(),
                    function Init() {
                        //����ҳ��
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>�ۼƺϼ�</span>",
                                PaidOffsetAmount: "<span style='color:red'>0</span>",
                                PaidOffsetAmountTax: "<span style='color:red'>0</span>",
                                PaidOffsetAmountTaxAmount: "<span style='color:red'>0</span>"

                            }
                        ]);
                    },
                    function callback(_Data) {
                        var Data = _Data.split('|');

                        //����ҳ��
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>�ۼƺϼ�</span>",
                                PaidOffsetAmount: "<span style='color:red'>" + Data[0] + "</span>",
                                PaidOffsetAmountTax: "<span style='color:red'>" + Data[1] + "</span>",
                                PaidOffsetAmountTaxAmount: "<span style='color:red'>" + Data[2] + "</span>"
                            }
                        ]);

                        $('#CustName').searchbox("setValue", '');
                        $('#CustID').val('');
                        $('#RoomSign').searchbox("setValue", '');
                        $('#RoomID').val('');
                        $('#CostName').searchbox("setValue", '');
                        $('#CostID').val('');
                    })
            }
        });
        $("#SearchDlg").dialog("close");


    }


    //��дDataGrid,֧�ָ���ҳ����ʽ
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

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '�ͻ�ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#PreCostsOffsetSearch').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //ת��Ϊjson����
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(��ʷ)";
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

        HDialog.Open(w, h, conent, '����ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }
    //������Ŀ
    $("#BtnSelCost").click(function () {
        var CostName = $('#CostName').val();
        var OPType = $('#hiOPType').val();

        if (OPType != "update") {
            CostName = "";
        }
        var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName;
        HDialog.Open(800, 600, conent, '���ñ�׼ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostID').val(data.attributes.CostID);
            $('#CostName').val(data.attributes.CostName);
            $('#StanID').val(data.attributes.StanID);
            $('#StanName').val(data.attributes.StanName);
        });
    });
    //��ղ�ѯ����
    function CancelParm() {
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $("#RoomSign").searchbox("setValue", '');
        $("#EditBeginDate").datebox("setValue", '');
        $("#EditEndDate").datebox("setValue", '');
        $("#ChexiaoBeginDate").datebox("setValue", '');
        $("#ChexiaoEndDate").datebox("setValue", '');
    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", '83%');
    });

</script>
