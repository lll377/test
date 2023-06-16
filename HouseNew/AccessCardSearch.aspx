<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessCardSearch.aspx.cs" Inherits="M_Main.HouseNew.AccessCardSearch" %>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
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

            if (varReturn != "") {//**获得返回 刷新
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
            if (varReturn != "") {//**获得返回 刷新
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
            if (confirm('请确认是否删除该记录') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
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
    </script>

</head>
<body>
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnDel" type="button" value="删除" style="display: none;" name="btnDel" runat="server">
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="HoldID" type="hidden"  name="HoldID" runat="server">
        <input type="hidden" name="CustID" id="CustID" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 220px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">户主名称</td>
                    <td class="TdContent">                           
                        <input id="CustName" name="CustName" runat="server">
                    </td>
                    <td class="TdTitle">成员名称</td>
                    <td class="TdContent">
                        <input id="MemberName" name="MemberName" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">成员房号</td>
                    <td class="TdContent">                        
                        <input id="RoomSign" name="RoomSign" runat="server">
                    </td>
                    <td class="TdTitle">办理卡种</td>
                    <td class="TdContent">
                        <select id="CardType" name="CardType" runat="server">
                         <option value=""></option>
                        <option value="业主卡">业主卡</option>
                        <option value="住户卡">住户卡</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理卡类</td>
                    <td class="TdContent">                        
                        <select id="CardStyle" name="CardStyle" runat="server"></select>
                    </td>
                    <td class="TdTitle">当前状态</td>
                    <td class="TdContent">
                        <select id="CardState" name="CardState" runat="server">
                        <option value=""></option>
                        <option value="有效">有效</option>
                        <option value="失效">失效</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理开始时间</td>
                    <td class="TdContent">                        
                        <input type="text" 
                        id="CardStartDate" name="CardStartDate" onclick="WdatePicker()"  runat="server" />
                    </td>
                    <td class="TdTitle">办理结束时间</td>
                    <td class="TdContent">
                        <input type="text" 
                        id="CardEndDate" name="CardEndDate" onclick="WdatePicker()"  runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
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
         { field: 'CustName', title: '户主名称', width: 140, align: 'left', sortable: true },
         { field: 'YzRoomSign', title: '户主房号', width: 300, align: 'left', sortable: true },
         {
             field: 'MemberName', title: '成员名称', width: 140, align: 'left', sortable: true,
             formatter: function (value, row, index) {
                 var Params = "";
                 Params = "Id=" + row.Id + "&HoldID=" + row.HoldId + "&CustID=" + row.CustId;
                 var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('出入卡办理','Search','" + Params + "');\">" + row.MemberName + "</a>";
                 return str;
             }
         },

         { field: 'CyRoomSign', title: '成员房号', width: 300, align: 'left', sortable: true },
         { field: 'CardType', title: '办理卡种', width: 300, align: 'left', sortable: true },
         { field: 'CardStyleName', title: '办理卡类', width: 200, align: 'left', sortable: true },
         { field: 'RelationshipName', title: '与户主关系', width: 100, align: 'left', sortable: true },
         { field: 'CardDate', title: '办卡日期', width: 130, align: 'left', sortable: true },
         { field: 'EffectiveDate', title: '卡的有效日期', width: 150, align: 'left', sortable: true },
         {
             field: 'CardNum', title: '卡号', width: 140, align: 'left', sortable: true,
             formatter: function (value, row, index) {
                 var Params = "";
                 Params = "Id=" + row.Id + "&HoldID=" + row.HoldId + "&CustID=" + row.CustId;
                 var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('出入卡办理','Search','" + Params + "');\">" + row.MemberName + "</a>";
                 return str;
             }
         },

         { field: 'CardState', title: '当前状态', width: 100, align: 'left', sortable: true }
        
    ]];

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

    function LoadList() {
        $("#TableContainer").datagrid({
            //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=SearchAccessCardListAll&' + $("#FrmForm").serialize(),
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
            sortOrder: "asc",onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Customer", "SearchAccessCardListAll", "TableContainer", param);
            },
            onDblClickRow: function (rowIndex, rowData) {
                HDialog.CloseWindow(rowData.CardNum, window.name);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //清空查询条件
    function CancelParm() {

        $('#CustID').val('');
        $('#yzRoomSign').val("");
        $('#CPaperCode').val("");
        $('#MemberName').val("");

    }
    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
        });
    }
    //删除
    function DeleteCustCard(Id) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('Customer', 'DeleteCustCard', 'Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {

                            if (_Data == "true") {
                                HDialog.Info('删除成功');
                            }
                            else { HDialog.Info('删除失败'); }
                            LoadList();

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }
        });
    }


    function ViewDetail(title, OpType, Params) {
       
        HDialog.Open("1024", "578", '../HouseNew/AccessCardManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data != "false" && _Data != "") {
                LoadList();
            }
        });
    }

</script>
