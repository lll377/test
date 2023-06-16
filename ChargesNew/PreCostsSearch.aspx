<%@ Page Language="c#" CodeBehind="PreCostsSearch.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.PreCostsSearch" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>PreCostsSearch</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript">
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

        function btnClear_OnClick() {
            PreCostsSearch.CustID.value = "";

            PreCostsSearch.CustName.value = "";
            PreCostsSearch.hiCustName.value = "";


            PreCostsSearch.RoomID.value = "";
            PreCostsSearch.RoomSign.value = "";
            PreCostsSearch.hiRoomSign.value = "";

            PreCostsSearch.CostName.value = "";
            PreCostsSearch.CostID.value = "";
            PreCostsSearch.hiCostName.value = "";

            PreCostsSearch.SelHint.value = "";

        }

        //function btnSelRoom_OnClick() {
        //    var varReturn;
        //    varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        //    if (varReturn != "") {//**获得返回 刷新
        //        var varObjects = varReturn.split("\t");

        //        PreCostsSearch.RoomID.value = varObjects[0];
        //        PreCostsSearch.RoomSign.value = varObjects[2];
        //        PreCostsSearch.hiRoomSign.value = varObjects[2];

        //        PreCostsSearch.CustID.value = varObjects[1];
        //        PreCostsSearch.CustName.value = varObjects[3];
        //        PreCostsSearch.hiCustName.value = PreCostsSearch.CustName.value;
        //        //alert(varReturn);

        //        return true;
        //    }

        //    return false;
        //}

        //function btnSelCust_OnClick() {
        //    var varReturn;
        //    varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //    //alert("["+varReturn+"]");
        //    if (varReturn != "") {//**获得返回 刷新
        //        var varObjects = varReturn.split("\t");

        //        PreCostsSearch.CustID.value = varObjects[0];
        //        PreCostsSearch.CustName.value = varObjects[1];
        //        PreCostsSearch.hiCustName.value = varObjects[1];

        //        PreCostsSearch.RoomID.value = "";
        //        PreCostsSearch.RoomSign.value = "";
        //        PreCostsSearch.hiRoomSign.value = "";

        //        return true;
        //    }

        //    return false;
        //}
        //function SelRoomID_OnChange() {
        //    PreCostsSearch.RoomID.value = PreCostsSearch.SelRoomID.options[PreCostsSearch.SelRoomID.selectedIndex].value;
        //    PreCostsSearch.RoomSign.value = PreCostsSearch.SelRoomID.options[PreCostsSearch.SelRoomID.selectedIndex].text;
        //    PreCostsSearch.hiRoomSign.value = PreCostsSearch.RoomSign.value;

        //}

        function btnSelCost_OnClick() {
            //var tmpCostGeneType = PreCostsSearch.CostGeneType.value;

            //var varReturn;
            //varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
            ////alert("["+varReturn+"]");
            //if (varReturn != "") {//**获得返回 刷新
            //    var varObjects = varReturn.split("\t");

            //    FrmForm.CostID.value = varObjects[0];
            //    FrmForm.CostName.value = varObjects[2];
            //    FrmForm.hiCostName.value = varObjects[2];

            //    return true;
            //}

            //return false;
        }

        function CheckData() {
            //if(PreCostsSearch.CostID.value != "")	
            //{
            //	if(PreCostsSearch.CustID.value=="")
            //	{
            //		alert("请选择客户,此项不能为空!");
            //		PreCostsSearch.btnSelCust.focus();
            //		return false;
            //	}
            //}
            return true;

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
<body onload="Win_OnLoad()">
    <form id="frmForm" method="post" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <input id="btnPrint" type="button" style="display: none;" value="打印" name="btnPrint" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 280px; padding: 10px;">
            <table style="width: 100%; line-height: 25px; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                            <option selected>全部</option>
                        </select></td>
                    <td class="TdTitle">楼  宇</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" Width="83%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList></td>               
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" data-options="editable:false" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostName" name="CostName" class="easyui-searchbox" style="width: 83%;" searcher="SelCost" data-options="editable:false" runat="server">
                        <input id="hiCostName" type="hidden" name="hiCostName" runat="server">
                        <input id="CostID" type="hidden" name="CostID" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">余额提示</td>
                    <td class="TdContentSearch">
                        <select id="SelHint" name="SelHint" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                            <option selected>全部</option>
                            <option value="1">余额正常</option>
                            <option value="2">余额不足</option>
                        </select></td>
                    <td class="TdTitle">预交余额</td>
                    <td class="TdContent">
                        <select id="CompSymbol2" style="width: 50px;border:1px double #A9C5EB;" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select>
                        <input id="Comp_Amount" style="width: 50%;" name="Comp_Amount" value="0" runat="server">元</td>
                </tr>
                <tr>
                    <td class="TdTitle">预交类别</td>
                    <td class="TdContentSearch">
                        <select id="SelType" name="SelType" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                            <option selected>全部</option>
                            <%--<option value="1">预收</option>--%>
                            <option value="2">预存</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="4"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>

                        <%-- <input class="button" id="btnFilter" style="height: 22px" onclick="javascript: if (CheckData() == false) return false;"
                                        type="button" value="查询" name="btnFilter" runat="server"><input class="button" id="btnClear" style="height: 22px" onclick="javascript: btnClear_OnClick();"
                                            type="button" value="清空" name="btnClear"><!--*********************查询设置********************--><input id="TableSign" style="width: 16px; height: 22px" type="hidden" size="1" name="TableSign"
                                                runat="server">--%>
                        <%--  <input id="hiSearchData" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSearchData"
                                        runat="server"><input id="hiSearchSql" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSearchSql"
                                            runat="server"><input class="button" id="btnFilterMore" style="height: 22px" onclick="btnFilterMore_OnClick();"
                                                type="button" value="检索" name="btnFilterMore" runat="server">--%>
                        <!--*********************查询设置********************-->

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
        $('#Comp_Amount').val('>');
        InitTableHeight();
        LoadList();
    });

    //预交信息
    var PrefrozenColumns = [[
       { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
       { field: 'RoomSign', title: '房屋编号', width: 230, align: 'left', sortable: true },
       { field: 'RoomName', title: '房屋名称', width: 230, align: 'left', sortable: true }
    ]]

    var PreInfoColumn = [[
       { field: 'PrecID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
       { field: 'ParkNames', title: '车位', width: 150, align: 'left', sortable: true },
       //{ field: 'FixedTel', title: '联系电话', width: 120, align: 'left', sortable: true },
       { field: 'MobilePhone', title: '移动电话', width: 120, align: 'left', sortable: true },
       { field: 'PrecAmount', title: '预交余额', width: 100, align: 'left', sortable: true },
       { field: 'IsPrecName', title: '是否参与冲抵', width: 100, align: 'left', sortable: true },
       { field: 'CostName', title: '冲抵费用项目', width: 120, align: 'left', sortable: true },
       { field: 'PrecMemo', title: '备注', width: 220, align: 'left', sortable: true },
       {
           field: '余额提示', title: '余额提示', width: 100, align: 'left', sortable: true,
           //formatter: function (value, row, index) {
           //    var str = "余额正常";
           //    if (row.PrecAmount < row.OffsetAmountMonth) {
           //        str = "<font color=red>余额不足</font>";
           //    }
           //    return str;
           //}
       }
    ]]

    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-',
        {
            text: '打印',
            iconCls: 'icon-print',
            handler: function () {
                document.getElementById('btnPrint').click();
            }
        }, '-',
        {
            text: 'Excel输出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = "../ChargesNew/PreCostsSearchCreExecl.aspx";
            }
        }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: PreInfoColumn,
            frozenColumns: PrefrozenColumns,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            toolbar: toolbar,
            view: myview,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            showFooter: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "SearchPreCosts", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.PrecID == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('PrecReceFee', "SearchPreCostsResultSum", $('#frmForm').serialize(),
                        function Init() {
                            //加载页脚
                            $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            PrecID: 'footer',
                                            RoomSign: "<span style='color:red'>累计合计</span>",
                                            PrecAmount: "<span style='color:red'>0</span>"
                                          
                                        }
                            ]);
                        },
                    function callback(_Data)
                    {
                            //加载页脚
                            $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            PrecID: 'footer',
                                            RoomSign: "<span style='color:red'>累计合计</span>",
                                            PrecAmount: "<span style='color:red'>" + _Data + "</span>"
                                            
                                        }
                            ]);
                        })
            }
        });
        $('#SearchDlg').dialog('close');
    }

    //重写DataGrid,支持更改页脚样式
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

    //客户选择
    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);

            $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(历史)";
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

    //房屋选择
    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });
    }

    function SelCost() {
        var varReturn;

        var w = 700;
        var h = 400;

        HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("\t");

                //$('#CostID').val(varObjects[0]);
                //$('#CostName').searchbox('setValue', varObjects[1]);


                $('#CostName').searchbox("setValue", varObjects[1]);
                $('#CostID').val(varObjects[0]);

                var CostID = varObjects[0];
                //预先更新CostID，以便查询
                $.ajax({
                    type: "Post",
                    url: "PreCostsSearch.aspx/SelCost",
                    data: "{'CostID':'" + CostID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {

                    },
                    error: function (err) {
                        HDialog.Info(err);
                    }
                });
            }
        });

        return false;
    }

    //费用项目选择
    //function SelCost() {

    //    var conent = "../dialogNew/CorpCommCostDlg.aspx" + "?Ram=" + Math.random();

    //    HDialog.Open(700, 400, conent, '收费项目选择', false, function callback(_Data) {


    //        if (_Data != "") {//**获得返回 刷新

    //            var data = JSON.parse(_Data);
    //            $('#CostName').searchbox("setValue", data.CostName);
    //            $('#CostID').val(data.CostID);
    //            $('#hiCostName').val(data.CostName);

    //            //预先更新CostID，以便查询
    //            $.ajax({
    //                type: "Post",
    //                url: "PreCostsSearch.aspx/SelCost",
    //                data: "{'CostID':" + data.CostID + "}",
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function () {

    //                },
    //                error: function (err) {
    //                    HDialog.Info(err);
    //                }
    //            });
    //        }
    //    });

    //}

    //清空查询条件

    function CancelParm() {
        $('#BuildSNum').combobox('clear');
        $('#RegionSNum').combobox('clear');
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $('#RoomSign').searchbox("setValue", '');
        $('#CostName').searchbox("setValue", '');
        $("#CostID").val("");
        $('#SelHint').combobox('clear');
        $('#CompSymbol2').val("");
        $("#Comp_Amount").val("");
        $('#SelType').combobox('clear');

    }

    function InitTableHeight() {

        $("#TableContainer").css("height", h + "px");
        $("#CompSymbol2").css("width", "50px");
    }

    $("select").each(function () {
        $(this).css("width", '83%');
    });

</script>
