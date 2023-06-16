<%@ Page Language="c#" CodeBehind="HouseholdSearch.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.HouseholdSearch" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>HouseholdSearch</title>
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
		<!--
    function btnClear_OnClick() {
        HouseholdSearch.CustName.value = "";

        HouseholdSearch.RoomSign.value = "";
        HouseholdSearch.MemberName.value = "";
        HouseholdSearch.hiSearchSql.value = "";

    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            HouseholdSearch.RoomID.value = varObjects[0];
            HouseholdSearch.RoomSign.value = varObjects[2];
            HouseholdSearch.hiRoomSign.value = varObjects[2];

            HouseholdSearch.CustID.value = varObjects[1];
            HouseholdSearch.CustName.value = varObjects[3];
            HouseholdSearch.hiCustName.value = HouseholdSearch.CustName.value;
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

            HouseholdSearch.CustID.value = varObjects[0];
            HouseholdSearch.CustName.value = varObjects[1];
            HouseholdSearch.hiCustName.value = varObjects[1];

            HouseholdSearch.RoomID.value = "";
            HouseholdSearch.RoomSign.value = "";
            HouseholdSearch.hiRoomSign.value = "";

            return true;
        }

        return false;
    }
    function SelRoomID_OnChange() {
        HouseholdSearch.RoomID.value = HouseholdSearch.SelRoomID.options[HouseholdSearch.SelRoomID.selectedIndex].value;
        HouseholdSearch.RoomSign.value = HouseholdSearch.SelRoomID.options[HouseholdSearch.SelRoomID.selectedIndex].text;
        HouseholdSearch.hiRoomSign.value = HouseholdSearch.RoomSign.value;

    }
    //-->
    </script>
    <script language="javascript">
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
</head>
<body>
    <form id="FrmForm" method="post" runat="server">
        <input id="PageIndex" style="width: 56px" type="hidden" size="4" name="PageIndex" runat="server">
        <input id="hiSearchData" style="width: 16px" type="hidden" size="1" name="hiSearchData"
            runat="server">
         <input id="intrest" size="1" type="hidden" name="intrest" runat="server">
        <input id="hiSearchSql" style="width: 16px" type="hidden" size="1" name="hiSearchSql" runat="server"><input id="PrintParms" style="width: 24px; height: 21px" type="hidden" size="1" name="PrintParms"
            runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 200px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">户主名称 </td>
                    <td class="TdContent">
                        <input id="CustName" name="CustName" runat="server">
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSign" name="RoomSign" runat="server">
                    </td>
                    <td class="TdTitle">成员名称</td>
                    <td class="TdContent">
                        <input id="MemberName" name="RoomSign" runat="server">
                    </td>
                    <td class="TdTitle">证件号码</td>
                    <td class="TdContent">
                        <input id="PaperCode" name="PaperCode" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">移动电话</td>
                    <td class="TdContent">
                        <input id="MobilePhone" name="MobilePhone" runat="server">
                    </td>
                    <td class="TdTitle">职业</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="DrJob" Width="82%" runat="server"></asp:DropDownList></td>
                    <td>是否办卡</td>
                      <td><select id="IsCardIssuing" name="IsCardIssuing" runat="server">
                        <option value=""></option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select></td>
                      <td>当前卡号</td>
                      <td><input id="CardNum" name="CardNum" runat="server"></td>
                </tr>
                <tr>
                    <td>当前卡状态</td>
                      <td><select id="CardState" name="CardState" runat="server">
                        <option value=""></option>
                        <option value="有效">有效</option>
                        <option value="失效">失效</option>
                    </select></td>
                    <td class="TdTitle">兴趣爱好</td>
                    <td class="TdContentSearch" colspan="5">
                        <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                </tr>
                <tr>
                    <td align="center" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>

                        <%--<input class="button" id="btnFilter" style="height: 22px" type="button" value="查询" name="btnFilter"
                            runat="server">
                        <input class="button" id="btnClear" style="height: 22px" onclick="javascript: btnClear_OnClick();"
                            type="button" value="清空" name="btnClear">
                        <input id="TableSign" style="width: 16px" type="hidden" size="1" name="TableSign" runat="server">

                        <input class="button_four" id="BtnExcel" style="height: 22px" type="button" value="Excel输出"
                            name="btnFilter" runat="server">--%>
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
		}, {
			text: '导出Excel',
			iconCls: 'icon-page_white_excel',
			handler: function () {
				CheckAuthority('1013', function callback(_Data) { 
					if (_Data == "true") {
						window.open("HouseholdCreExcel.aspx?random=" + Math.random());
					}
					else {
						$.messager.alert('错误', '无此权限', 'error');
					}
				});
			
			}
		}
		   
    ];
    function ViewDetail(HoldID) {

        HDialog.Open(w, h, '../HouseNew/HouseholdDetails.aspx?HoldID=' + HoldID + '&OpType=edit',
            '成员信息', false, function callback(_Data) {
               
            });
    }

    var Column = [[
           {
               field: 'MemberName', title: '成员名称', width: 100, align: 'left', sortable: true
               ,
               formatter: function (value, row, index) {
                   var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.HoldID + "');\">" + row.MemberName + "</a>" ;
                   return str;
               }
           },
           { field: 'CyRoomSign', title: '成员房屋编号', width: 100, align: 'left', sortable: true },
           { field: 'CyRoomName', title: '成员房屋名称', width: 100, align: 'left', sortable: true },
           { field: 'CustName', title: '业主名称', width: 100, align: 'left', sortable: true },
           { field: 'yzRoomSign', title: '业主房屋编号', width: 100, align: 'left', sortable: true },
           { field: 'RelationshipName', title: '与户主关系', width: 100, align: 'left', sortable: true },
           { field: 'MobilePhone', title: '电话号码', width: 100, align: 'left', sortable: true },
           { field: 'PaperCode', title: '证件号码', width: 100, align: 'left', sortable: true },
            {
                field: '-', title: '是否办卡', width: 140, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = row.PassSign;
                if (str == '') str = '否'; else str = '是';
                return str;
            }
            },
            { field: 'PassSign', title: '出入卡号', width: 100, align: 'left', sortable: true },
        { field: 'CardState', title: '卡状态', width: 100, align: 'left', sortable: true },
        { field: 'Memo', title: '备注', width: 100, align: 'left', sortable: true }
    ]]

    function LoadList() {
        var intrest = "";
        $("input:checkbox:checked").each(function () {
            if ($(this).next().text() != '') {
                intrest += $(this).next().text() + ","
            }
        })
        if (intrest.indexOf(',') > 0) {
            intrest = intrest.substr(0, intrest.length - 1);
        }
        $("#intrest").val(intrest);
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
                param = $.JQForm.GetParam("Customer", "SearchHousehold", "TableContainer", param);
            },
            onDblClickRow: function (rowIndex, rowData) {
                //HDialog.Open(w, h, '../HouseNew/HouseholdDetails.aspx?HoldID=' + rowData.HoldID + '&OpType=edit',
                //    '客户信息', false, function callback(_Data) {
                //        if (_Data == "true") {
                //            HDialog.Info('保存成功');
                //            LoadList();
                //        }
                //    });
            }
        });
        $('#SearchDlg').dialog('close');
    }


    function CancelParm() {
        $("#CustName").val("");
        $('#RoomSign').val("");
        $("#MemberName").val("");

    }

</script>
