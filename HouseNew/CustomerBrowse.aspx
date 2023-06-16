<%@ Page Language="c#" CodeBehind="CustomerBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustomerBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustomerBrowse</title>
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
    <script language="javascript">
        function btnClear_OnClick() {
            CustomerBrowse.CustName.value = "";
            CustomerBrowse.RoomSign.value = "";
        }
        function IsDel_OnClick() {
            if (confirm('��ȷ���Ƿ�ɾ���ü�¼') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <script language="javascript">
        //��ѯ�Ի���
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

                    //**�ع�����(���ݽṹΪJSON)					
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
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnDel" type="button" value="ɾ��" style="display: none;" name="btnDel" runat="server">
        <input type="hidden" id="hiCustName" name="hiCustName" runat="server" />
        <input type="hidden" id="hiCustID" name="hiCustID" value="" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">ҵ������</td>
                    <td class="TdContent">
                        <input id="CustName" maxlength="50" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContent">
                        <input id="RoomSigns" maxlength="50" name="RoomSigns" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">��������</td>
                    <td class="TdContent">
                        <input id="RoomNames" maxlength="50" name="RoomNames" runat="server" />

                    </td>
                    <td class="TdTitle">�ֻ�����</td>
                    <td class="TdContent">
                        <input id="MobilePhone" maxlength="50" name="MobilePhone" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">֤������</td>
                    <td class="TdContent">
                        <input id="PaperCode" maxlength="50" name="PaperCode" runat="server" />
                    </td>
                    <td class="TdTitle">��Ӧ�����</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="SupplierType" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    });
    var w = $(window).width();
    var h = $(window).height();
    function InitTableHeight() {

        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        {
            field: 'CustName', title: 'ҵ������', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                //if (row.IsLock == 1) {
                //    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetail('�޸�ҵ��','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName  + "(" + row.RoomCount + ")(������)" + "</a>";
                //} else {
                //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸�ҵ��','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>" + "(" + row.RoomCount + ")" + "";
                //}
                str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸�ҵ��','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>" + "(" + row.RoomCount + ")" + "";
                return str;
            }
        },
        { field: 'RoomSigns', title: '���ݱ��', width: 350, align: 'left', sortable: true },
        { field: 'FixedTel', title: '�̶��绰', width: 120, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '�ƶ��绰', width: 120, align: 'left', sortable: true },
        { field: 'PaperCode', title: '֤������', width: 120, align: 'left', sortable: true },
        //{ field: 'MGradeSign', title: '���õȼ�', width: 150, align: 'left', sortable: true },
        { field: 'SupplierTypeName', title: '��Ӧ�����', width: 100, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '�Ƿ�����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "��";
                if (value == 1) {
                    str = "��";
                }
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '����',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("����ҵ��", 'Insert', '', '');
            }
        }, '-',
        {
            text: '��������',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                ViewReport("�����Ǽ�");
            }
        }, '-',
        {
            text: 'ɾ��',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ��ɾ���');
                    return;
                }
                $("#hiCustID").val(row.CustID);
                $("#hiCustName").val(row.CustName);
                document.getElementById('btnDel').click();
                //HDialog.Info('ҵ������ɾ����');
            }
        }, '-',
        {
            text: 'ɸѡ',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        {
            text: '������ʷ',
            iconCls: 'icon-search',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ��鿴�');
                    return;
                }
                ChangeName('������ʷ', row.CustID);
            }
        }, {
            text: '<font color=red>*������ҵ���������ɿ����̱��Ϊҵ��������Aҵ�����ΪBҵ������ͨ�������۹�������ת�ð���ģ�����</font>'
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchcustomer&' + $("#FrmForm").serialize(),
            //method: "get",
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Customer", "searchcustomer", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //��ղ�ѯ����
    function CancelParm() {

        $('#CustName').val("");
        $('#RoomSigns').val("");
        $('#MobilePhone').val("");
        $('#PaperCode').val("");
    }

    function SelCarparkName() {
        $('#CarparkName').searchbox("setValue", '');
        $('#CarparkID').val('');

        var conent = "../DialogNew/CarparkDlg.aspx";

        HDialog.Open('600', '400', conent, '��λ����', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CarparkName').searchbox("setValue", data.CarparkName);
            $('#CarparkID').val(data.CarparkID);

        });

    }


    function ViewDetail(title, OpType, CustID, IsLock) {

        HDialog.Open(w, h, '../HouseNew/CustomerManage.aspx?CustID=' + CustID + '&OpType=' + OpType + '&IsLock=' + IsLock, title, false, function callback(_Data) {
            if (_Data != "false" && _Data != "") {
                HDialog.Info(_Data);
                LoadList();
            }
        });
    }

    //������ʷ
    function ChangeName(title, custid) {
        HDialog.Open('820', '450', '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + custid + '&back=1', title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    //����
    function ViewReport(title) {
        HDialog.Open(w, h, '../HouseNew/InputCustManage.aspx', title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }


</script>
