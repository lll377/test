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
            if (confirm('请确认是否删除该记录') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <script language="javascript">
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
        <input class="button" id="btnDel" type="button" value="删除" style="display: none;" name="btnDel" runat="server">
        <input type="hidden" id="hiCustName" name="hiCustName" runat="server" />
        <input type="hidden" id="hiCustID" name="hiCustID" value="" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContent">
                        <input id="CustName" maxlength="50" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSigns" maxlength="50" name="RoomSigns" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋名称</td>
                    <td class="TdContent">
                        <input id="RoomNames" maxlength="50" name="RoomNames" runat="server" />

                    </td>
                    <td class="TdTitle">手机号码</td>
                    <td class="TdContent">
                        <input id="MobilePhone" maxlength="50" name="MobilePhone" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">证件号码</td>
                    <td class="TdContent">
                        <input id="PaperCode" maxlength="50" name="PaperCode" runat="server" />
                    </td>
                    <td class="TdTitle">供应商类别</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="SupplierType" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
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
            field: 'CustName', title: '业主名称', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                //if (row.IsLock == 1) {
                //    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetail('修改业主','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName  + "(" + row.RoomCount + ")(已锁定)" + "</a>";
                //} else {
                //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改业主','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>" + "(" + row.RoomCount + ")" + "";
                //}
                str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改业主','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>" + "(" + row.RoomCount + ")" + "";
                return str;
            }
        },
        { field: 'RoomSigns', title: '房屋编号', width: 350, align: 'left', sortable: true },
        { field: 'FixedTel', title: '固定电话', width: 120, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 120, align: 'left', sortable: true },
        { field: 'PaperCode', title: '证件号码', width: 120, align: 'left', sortable: true },
        //{ field: 'MGradeSign', title: '信用等级', width: 150, align: 'left', sortable: true },
        { field: 'SupplierTypeName', title: '供应商类别', width: 100, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '是否锁定', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "否";
                if (value == 1) {
                    str = "是";
                }
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("新增业主", 'Insert', '', '');
            }
        }, '-',
        {
            text: '批量导入',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                ViewReport("批量登记");
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                $("#hiCustID").val(row.CustID);
                $("#hiCustName").val(row.CustName);
                document.getElementById('btnDel').click();
                //HDialog.Info('业主不能删除！');
            }
        }, '-',
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        {
            text: '更名历史',
            iconCls: 'icon-search',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择查看项！');
                    return;
                }
                ChangeName('更名历史', row.CustID);
            }
        }, {
            text: '<font color=red>*如需变更业主，比如由开发商变更为业主，或由A业主变更为B业主，请通过“租售管理—房屋转让办理”模块办理。</font>'
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

    //清空查询条件
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

        HDialog.Open('600', '400', conent, '车位区域', false, function callback(_Data) {
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

    //更名历史
    function ChangeName(title, custid) {
        HDialog.Open('820', '450', '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + custid + '&back=1', title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    //导入
    function ViewReport(title) {
        HDialog.Open(w, h, '../HouseNew/InputCustManage.aspx', title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }


</script>
