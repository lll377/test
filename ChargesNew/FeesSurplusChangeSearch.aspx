<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesSurplusChangeSearch.aspx.cs" Inherits="M_Main.ChargesNew.FeesSurplusChangeSearch" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
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
    <form id="frmForm" >

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">


            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">操作日期从</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" class="Wdate" name="EditBeginDate"
                            runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" class="Wdate" name="EditEndDate"
                            runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">操作人</td>
                    <td class="TdContentSearch">
                        <input id="UserName" type="text"
                            maxlength="50" size="26" name="UserName" runat="server" /></td>
                    <td class="TdTitle">操作类别</td>
                    <td class="TdContentSearch">
                        <select id="ChangeType" name="ChangeType" runat="server">
                            <option selected></option>
                            <option value="0">已清除</option>
                            <option value="1">撤销清除</option>
                        </select></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnSave"
                            type="button" value="查询" name="btnSave" runat="server" />
                       
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);



                });
            }



            var column = [[
                    { field: 'ChangeID', title: 'ChangeID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'CustName', title: '客户名称', width: 50, align: 'left', sortable: true },
                    { field: 'SurplusAmount', title: '原零头结转余额', width: 50, align: 'left', sortable: true },
                    { field: 'ChangeDate', title: ' 操作日期', width: 50, align: 'left', sortable: true },
                    { field: 'UserName', title: '操作人', width: 50, align: 'left', sortable: true },
                    { field: 'DelDate', title: '撤销日期', width: 50, align: 'left', sortable: true },
                    { field: 'DelUserName', title: '撤销人', width: 50, align: 'left', sortable: true }
            ]];


            var toolbar = [
                 {
                     text: '新增',
                     iconCls: 'icon-add',
                     handler: function () {
                         ViewDetail("零头处理");
                     }
                 },  '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row.ChangeID)
                    }
                }, '-', {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                    {
                        text: 'Excel输出',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {

                            window.location.href = "../Charges/FeesSurplusChangeSearchCre.aspx";
                        }
                    }
            ];



            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('FeesSurplus', 'delete', 'ChangeID=' + Id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    var result = _Data;
                                    var r = result.split('|')[0];
                                    var Memo = result.split('|')[1];

                                    if (r == "true") {
                                        HDialog.Info(Memo);
                                        LoadList();
                                    }
                                    else {
                                        HDialog.Info('删除失败');
                                    }

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                    }
                });
            }


            function ViewDetail(title) {

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../ChargesNew/FeesSurplusChangeManage.aspx', title, false, function callback(_Data) {
                    LoadList();
                });
            }

            function LoadList() {


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
                        param = $.JQForm.GetParam("FeesSurplus", "FeesSurplusChangeSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
               

            }
            LoadList();
           

           
            
            $('#btnSave').click(function () {
                LoadList();

                $('#SearchDlg').dialog('close');
            });
        </script>
    </form>
</body>
</html>


