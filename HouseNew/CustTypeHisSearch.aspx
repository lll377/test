<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustTypeHisSearch.aspx.cs" Inherits="M_Main.HouseNew.CustTypeHisSearch" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustomerHisBrowse</title>
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
    <script  type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		<!--
    function btnClear_OnClick() {
        CustomerHisBrowse.CustName.value = "";
    }
    //-->
    </script>
    <script type="text/javascript">
		<!--
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
    //-->
    </script>
    <script type="text/javascript">
		<!--
    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    //-->
    </script>
</head>
<body >
    <form id="CustomerHisBrowse" method="post" runat="server">
      
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 120px; ">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">修改日期从</td>
                    <td class="TdContent">
                         <input   id="BeginChangeDate"  class="Wdate"
                        onclick="WdatePicker()"   name="BeginChangeDate"
                        runat="server">
                    </td><td class="TdTitle">到</td>
                    <td class="TdContent">
                         <input   id="EndChangeDate"   class="Wdate"
                        onclick="WdatePicker()"   name="EndChangeDate"
                        runat="server">
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContent" colspan="3">
                        <input id="CustName" name="CustName" runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>

                        <%--<input class="button" id="btnFilter" type="button" value="查询" name="btnFilter"
                            runat="server">
                        <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                           type="button" value="清空" name="btnClear">--%> 

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

    var toolbar = [
           {
               text: '筛选',
               iconCls: 'icon-search',
               handler: function () {
                   $('#SearchDlg').parent().appendTo($("form:first"))
                   $('#SearchDlg').dialog('open');
               }
           }
    ];

    var Column = [[
            {
                field: 'CustName', title: '业主名称', width: 100, align: 'left', sortable: true
            },
            { field: 'RoomSigns', title: '房屋编号', width: 100, align: 'left', sortable: true },
            { field: 'OldCustTypeName', title: '修改前客户类别', width: 100, align: 'left', sortable: true },
            { field: 'NewCustTypeName', title: '修改后客户类别', width: 100, align: 'left', sortable: true },
            { field: 'UserName', title: '修改人', width: 100, align: 'left', sortable: true },
            { field: 'ChangeDate', title: '修改时间', width: 100, align: 'left', sortable: true },
    ]]

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: Column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Customer", "CustTypeHisList", "TableContainer", param);
            }
        });
        $('#SearchDlg').dialog('close');
    }


    function CancelParm() {
        $('#CustName').val("");

    }

</script>
