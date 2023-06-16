<%@ Page Language="c#" CodeBehind="HouseholdBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.HouseholdBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>HouseholdBrowse</title>
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
            HouseholdBrowse.CustID.value = "";

            HouseholdBrowse.CustName.value = "";
            HouseholdBrowse.hiCustName.value = "";
            HouseholdBrowse.MemberName.value = "";

            HouseholdBrowse.yzRoomSign.value = "";
            HouseholdBrowse.CPaperCode.value = "";

        }

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**��÷��� ˢ��
                var varObjects = varReturn.split("\t");

                HouseholdBrowse.RoomID.value = varObjects[0];
                HouseholdBrowse.RoomSign.value = varObjects[2];
                HouseholdBrowse.hiRoomSign.value = varObjects[2];

                HouseholdBrowse.CustID.value = varObjects[1];
                HouseholdBrowse.CustName.value = varObjects[3];
                HouseholdBrowse.hiCustName.value = HouseholdBrowse.CustName.value;
                //alert(varReturn);

                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**��÷��� ˢ��
                var varObjects = varReturn.split("\t");

                HouseholdBrowse.CustID.value = varObjects[0];
                HouseholdBrowse.CustName.value = varObjects[1];
                HouseholdBrowse.hiCustName.value = varObjects[1];

                return true;
            }

            return false;
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
        function IsDel_OnClick() {
            if (confirm('��ȷ���Ƿ�ɾ���ü�¼') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
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
    </script>

</head>
<body>
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnDel" type="button" value="ɾ��" style="display: none;" name="btnDel" runat="server">
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="hiCustID" type="hidden" size="1" name="hiCustID" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 220px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">��������</td>
                    <td class="TdContent">
                        <input id="CustName" name="CustName" runat="server">
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">��������</td>
                    <td class="TdContent">
                        <input id="yzRoomSign" name="yzRoomSign" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">��Ա����</td>
                    <td class="TdContent">
                        <input id="MemberName" name="MemberName" runat="server">
                    </td>
                    <td class="TdTitle">��Ա֤������</td>
                    <td class="TdContent">
                        <input id="CPaperCode" name="CPaperCode" runat="server">
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">�Ƿ�쿨</td>
                    <td class="TdContent">
                        <select id="IsCardIssuing" name="IsCardIssuing" runat="server">
                            <option value=""></option>
                            <option value="��">��</option>
                            <option value="��">��</option>
                        </select>
                    </td>
                    <td class="TdTitle">��ǰ����</td>
                    <td class="TdContent">
                        <input id="CardNum" name="CardNum" runat="server">
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">��ǰ��״̬</td>
                    <td class="TdContent">
                        <select id="CardState" name="CardState" runat="server">
                            <option value=""></option>
                            <option value="��Ч">��Ч</option>
                            <option value="ʧЧ">ʧЧ</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4"></td>
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
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {

        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        { field: 'LiveTypeName', title: '��������', width: 80, align: 'left', sortable: true },
        { field: 'CustName', title: '��������', width: 80, align: 'left', sortable: true },
        { field: 'YzRoomSign', title: '�������ݱ��', width: 300, align: 'left', sortable: true },
        {
            field: 'MemberName', title: '��Ա����', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                var Params = "";
                Params = "HoldID=" + row.HoldID + "&CustID=" + row.CustID + "&IsLock=" + row.IsLock;

                //if (row.IsLock == "1") {
                //    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetail('�޸ļ�ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "(������)</a>";
                //} else {
                //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸ļ�ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                //}
                 str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸ļ�ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                return str;
            }
        },
        { field: 'CyRoomSign', title: '��Ա���ݱ��', width: 150, align: 'left', sortable: true },
        { field: 'CyRoomName', title: '��Ա��������', width: 200, align: 'left', sortable: true },
        { field: 'RelationshipName', title: '�뻧����ϵ', width: 100, align: 'left', sortable: true },
        { field: 'PaperCode', title: '��Ա֤������', width: 160, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '��Ա�ƶ��绰', width: 100, align: 'left', sortable: true },
        {
            field: '-', title: '�Ƿ�쿨', width: 70, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = row.PassSign;
                if (str == '') str = '��'; else str = '��';
                return str;
            }
        },
        { field: 'PassSign', title: '���뿨��', width: 150, align: 'left', sortable: true },
        { field: 'CardState', title: '��״̬', width: 70, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '�Ƿ�����', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "��";
                if (value == 1) {
                    str = "��";
                }
                return str;
            }
        }
    ]];
    function GetAHtml(url) {
        var html = "";
        if (url && url != "") {
            // url = "http://120.77.74.255:8001/ErpUploadFile/1853/RoomAdjunct/2018/05/18531753454642601.pdf";
            var arr = url.split('/');
            var name = arr[arr.length - 1];
            arr = name.split('.');
            var IdNew = arr[arr.length - 2];
            html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + name + "</a>";
            //html = "<a target=\"_blank\" id=\"" + IdNew + "\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + IdNew + "','" + url + "','" + name + "','" + IdNew + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='ɾ��'/>&nbsp;</span><input id=\"" + IdNew + "\" Type='hidden' value='" + url + "'>"

        }
        return html;
    }
    var toolbar = [
        {
            text: '����',
            iconCls: 'icon-add',
            handler: function () {
                var Params = "";
                Params = "CustID=" + $("#CustID").val() + "&CustName=" + $("#CustName").val();
                ViewDetail("������ͥ��Ա", 'Insert', Params);
            }
        }, '-',
        {
            text: '��������',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                ViewReport("��������");
            }
        }, '-',
        {
            text: '�쿨��Ϣ����',
            iconCls: 'icon-page_white_excel',
            handler: function () {

                //��ȡ����ҵ��ID
                //var CustID = "";
                //var arr = $('#TableContainer').datagrid('getData');
                //for (var i = 0; i < arr.rows.length; i++) {
                //    CustID = "'" + arr.rows[i].CustID + "'," + CustID;
                //}

                //if (CustID != "") {
                //    CustID = CustID.substr(0, CustID.length - 1);
                //    alert(CustID);
                //    window.open("HouseholdBrowseOutput.aspx?random=" + Math.random() + "&CustID=" + CustID);
                //}
                window.open("HouseholdBrowseOutput.aspx?random=" + Math.random() + "&CustName=" + $("#CustName").val() +
                    "&yzRoomSign=" + $("#yzRoomSign").val() + "&MemberName=" + $("#MemberName").val() + "&CPaperCode=" + $("#CPaperCode").val() +
                    "&IsCardIssuing=" + $("#IsCardIssuing").val() + "&CardNum=" + $("#CardNum").val() + "&CardState=" + $("#CardState").val());
            }
        }
        , '-',
        {
            text: 'ɾ��',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ��ɾ���');
                    return;
                }
                DeleteHouseHold(row.HoldID, row.CustID, row.MemberName);
            }
        }, '-',
        {
            text: 'ɸѡ',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchhousehold&' + $("#FrmForm").serialize(),
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
        });
        $("#SearchDlg").dialog("close");
    }

    //��ղ�ѯ����
    function CancelParm() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#yzRoomSign').val("");
        $('#CPaperCode').val("");
        $('#MemberName').val("");

    }
    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '�ͻ�ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


        });
    }
    //ɾ��
    function DeleteHouseHold(holdid, CustID, MemberName) {
        var url = '../HouseNew/HouseholdBrowseDelete.aspx?OpType=Delete&MemberName=' + MemberName + '&CustID=' + CustID + '&HoldID=' + holdid;
            HDialog.Open('680', '300', url, 'ɾ����ͥ��Ա', false, function callback(_Data) {
                if (_Data=='1') {
                    LoadList();
                }
            });
        //$.messager.confirm('ȷ��', '�Ƿ�ɾ������', function (r) {
        //    if (r) {
        //        $.tool.DataGet('Customer', 'deletehousehold', 'HoldID=' + holdid + '&CustID=' + CustID + '&MemberName=' + MemberName,
        //            function Init() {
        //            },
        //            function callback(_Data) {

        //                if (_Data == "true") {
        //                    HDialog.Info('ɾ���ɹ�');
        //                }
        //                else { HDialog.Info('ɾ��ʧ��'); }
        //                LoadList();

        //            },
        //            function completeCallback() {
        //            },
        //            function errorCallback() {
        //            });
        //    }
        //});
    }


    function ViewDetail(title, OpType, Params) {

        HDialog.Open(w, h + 20, '../HouseNew/HouseHoldFrame.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {

            //if (_Data != "false" && _Data != "") {
            LoadList();
            // }
        });
    }

    //����
    function ViewReport(title) {
        HDialog.Open(w, h, '../HouseNew/HouseholdExcelBrowse.aspx', title, false, function callback(_Data) {
            LoadList();
        });
    }

    function Detailed(title, id, type) {
        HDialog.Open('1024', '600', '../HouseNew/Detailed.aspx?ID=' + id + "&Type=" + type, title, true, function callback(_Data) {
        });
    }


</script>
