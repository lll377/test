<%@ Page Language="c#" CodeBehind="PreCostsEdtManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.PreCostsEdtManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>PreCostsEdtManage</title>
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
		<!--
    function CheckData() {
        if(PreCostsEdtManage.CostIDs.value=="")
        {
        	alert("请选择冲抵费用项目,此项不能为空!");
        	PreCostsEdtManage.btnSelCostIDs.focus();
        	return false;
        }

        if (PreCostsEdtManage.TrPrecAmount.value != "") {
            if (parseFloat(PreCostsEdtManage.TrPrecAmount.value) <= 0) {
                HDialog.Info("转移的预交金额应大于零!");
                PreCostsEdtManage.TrPrecAmount.focus();
                return false;
            }
            var strTrRoomID = PreCostsEdtManage.SelRoomID.options[PreCostsEdtManage.SelRoomID.selectedIndex].value;
            var strRoomID = PreCostsEdtManage.RoomID.value;

            if (strTrRoomID == "") {
                strTrRoomID = "0"
            }

            if (strTrRoomID == strRoomID) {
                HDialog.Info("请选择不同的房屋!");
                PreCostsEdtManage.SelRoomID.focus();
                return false;
            }


        }
        return true;
    }

    function btnClear_OnClick() {
        PreCostsEdtManage.CostIDs.value = "";
        PreCostsEdtManage.CostNames.value = "";
        PreCostsEdtManage.hiCostNames.value = "";
    }

    function SelRoomID_OnChange() {
        PreCostsEdtManage.TrRoomID.value = PreCostsEdtManage.SelRoomID.options[PreCostsEdtManage.SelRoomID.selectedIndex].value;
        PreCostsEdtManage.TrRoomSign.value = PreCostsEdtManage.SelRoomID.options[PreCostsEdtManage.SelRoomID.selectedIndex].text;
        //PreCostsEdtManage.hiTrRoomSign.value = PreCostsEdtManage.TrRoomSign.value;
    }

    function btnSelCostIDs_OnClick() {
        var strCostIDs = PreCostsEdtManage.CostIDs.value;
        var strCostNames = escape(PreCostsEdtManage.hiCostNames.value);
        //alert(PreCostsEdtManage.hiCostNames.value);
        //alert(PreCostsEdtManage.CostIDs.value);

        varReturn = showModalDlg("../dialog/MultiCostDlg.aspx?CostIDs=" + strCostIDs + "&CostNames=" + strCostNames, "", 650, 430);

        //alert(varReturn);
        //**获得返回的参数信息
        if (varReturn != "") {
            var varObjects = varReturn.split("\t");

            PreCostsEdtManage.CostIDs.value = varObjects[0];
            PreCostsEdtManage.CostNames.value = varObjects[1];
            PreCostsEdtManage.hiCostNames.value = varObjects[1];

            return true;
        }
        else {
            PreCostsEdtManage.CostIDs.value = "";
            PreCostsEdtManage.CostNames.value = "";
            PreCostsEdtManage.hiCostNames.value = "";
        }
        return true;
    }

    function onclickIsTrans() {
        if (getObject("IsTrans").checked == true) {
            getObject("TbTrans").style.display = "block";
            getObject("HandID").disabled = true;
            getObject("btnSelCostIDs").disabled = true;
            getObject("btnClear").disabled = true;
            getObject("PrecMemo").disabled = true;
        }
        else {
            getObject("TbTrans").style.display = "none";
            getObject("HandID").disabled = false;
            getObject("btnSelCostIDs").disabled = false;
            getObject("btnClear").disabled = false;
            getObject("PrecMemo").disabled = false;
        }

    }

    //-->
    </script>
</head>
<body>
    <form id="PreCostsEdtManage" method="post" runat="server">
        <input id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server">
        <input id="PrecID" size="1" type="hidden" name="PrecID" runat="server">
        <input id="FeesCount" size="1" type="hidden" name="FeesCount" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red;display:none;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td> 1、冻结/转移只针对预存费用，不针对预收费用。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>
                        2、冻结：将“是否参与冲抵”设置为“否”时，预存余额不参与冲抵。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、转移：如果预存登记时指定了房号、车位、费项，可以通过“预存转移”取消指定，或者转移到该客户其它房号、车位、费项下面。
                    </td>
                </tr>
            </table>
        </div>
        <table class="DialogTable" style="line-height: 25px;">

            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <asp:Label ID="lbCustName" runat="server"></asp:Label>
                    <input id="CustID" size="1" type="hidden" name="CustID"
                        runat="server"></td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <asp:Label ID="lbRoomSign" runat="server"></asp:Label>
                    <input id="RoomID" size="1" type="hidden" name="RoomID"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">是否参与冲抵</td>
                <td class="TdContentSearch">
                    <select id="IsPrec" name="IsPrec" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">预交余额</td>
                <td class="TdContentSearch">
                    <asp:Label ID="lbPrecAmount" runat="server"></asp:Label>
                    <input id="CostID" size="1" type="hidden" name="CostID"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">冲抵项目</td>
                <td class="TdContentSearch">
                    <input id="CostNames" style="width: 185px;" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" name="CostNames" runat="server">
                    <input id="CostIDs" size="1" type="hidden" name="CostIDs" runat="server">
                    <input id="hiCostNames" size="1" type="hidden" name="hiCostNames" runat="server">
                    <input id="btnSelCostIDs" style="display: none;" class="button_sel" type="button" name="btnSelCostIDs" runat="server">
                    <input style="z-index: 0; width: 16px; height: 22px" id="hiCostIDs" size="1" type="hidden"
                        name="hiCostIDs" runat="server">
                    <input style="z-index: 0; height: 22px; display: none;" id="btnClear" class="button" onclick="javascript: btnClear_OnClick();"
                        value="清空" type="button" name="btnClear"></td>
                <td class="TdTitle">车 位</td>
                <td class="TdContentSearch">
                    <asp:DropDownList Style="z-index: 0" ID="HandID" runat="server" AutoPostBack="True"></asp:DropDownList>
                    <input id="hiHandID" size="1" type="hidden" name="hiHandID" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">费用备注</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="PrecMemo" style="width: 80%; height: 22px;" name="PrecMemo" runat="server">
                    <input id="BillsSign" size="1" type="hidden" name="BillsSign" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="4" align="center">
                    <asp:CheckBox ID="IsTrans" runat="server" Text="转移费用"></asp:CheckBox></td>
            </tr>
        </table>
        <table style="display: none" id="TbTrans" class="DialogTable" cellspacing="1" cellpadding="4"
            align="center">
            <tr>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" name="SelRoomID" runat="server" >
                        <option selected></option>
                    </select><input id="TrCostID" size="1" type="hidden" name="TrCostID"
                        runat="server"></td>
                <td class="TdTitle">
                    <input id="TrRoomID" size="1" type="hidden" name="TrRoomID"
                        runat="server">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="TrRoomSign" style="width: 185px;" readonly name="TrRoomSign" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">转移金额</td>
                <td class="TdContentSearch">
                    <input id="TrPrecAmount" style="width: 185px;" onkeypress="CheckNumeric();"
                        maxlength="50" size="26" name="TrPrecAmount" runat="server"></td>
                <td class="TdTitle">转移备注</td>
                <td class="TdContentSearch">
                    <input id="TransferMemo" style="width: 185px;" maxlength="50"
                        size="26" name="TransferMemo" runat="server"></td>
            </tr>
        </table>
        <table id="Table2" class="formTable" cellspacing="1" cellpadding="4" align="center">
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <input id="btnSave" class="button" onclick="javascript: if (CheckData() == false) return false;"
                        value="保 存" type="button" name="btnFilter" runat="server">
                     <input id="BtnReturn" class="button" value="放弃返回" type="button"
                         name="btnFilter">
                     <a href="#" style="border:1px solid #95B8E7; height:32px;width:100px;padding-bottom:1px;" id="ins" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                </td>
            </tr>
<%--            <tr>
                <td class="SchTable" colspan="4" align="left">备注：1、冻结/转移只针对预存费用，不针对预收费用。2、冻结：将“是否参与冲抵”设置为“否”时，预存余额不参与冲抵。3、转移：如果预存登记时指定了房号、车位、费项，可以通过“预存转移”取消指定，或者转移到该客户其它房号、车位、费项下面。</td>
            </tr>--%>
            <tr>
                <td class="TdTitle" colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">已收取的预交费用</span>
                                            </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <div style="width: 100%; background-color: #cccccc; height: 200px;" id="TableContainer">
                    </div>
                </td>
            </tr>

        </table>

    </form>
</body>
</html>

<script>
    $(function () {
        LoadList();
        InitFunction();
    })
   
    function InitFunction() {
        var h = $(window).height();

        $("#TableContainer").css("height", h + "px");
    }


    function TiShi() {
        $('#tishi').parent().appendTo($("form:first"))
        $('#tishi').dialog('open');
        $("#tabtishi").show();
    }


    var column = [[
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200, fixed: true },
        { field: 'CostName', title: '费用项目', align: 'left', sortable: true, width: 150, fixed: true },
        {
            field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 100, fixed: true
        },
        {
            field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, width: 100, fixed: true }

    ]];

    function LoadList() {
        var Data = $('#RepDetail').val();
       
        if (Data != "") {
            var obj = JSON.parse(Data);


            $("#TableContainer").datagrid({
                data: obj.rows,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                remoteSort: false,
                pagination: true,
                width: '100%',
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                rownumbers: true,
                border: false,
                sortOrder: "asc",
                showFooter: true
            });
        }
       else {
           
            $("#TableContainer").datagrid({
               
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                remoteSort: false,
                pagination: true,
                width: '100%',
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                rownumbers: true,
                border: false,
                sortOrder: "asc",
                showFooter: true
            });
        }

    }

    function SelCost() {
        var varReturn;

        var w = 700;
        var h = 400;
        $('#CostIDs').val("");
        $('#CostNames').searchbox('setValue', "");
        $('#hiCostNames').val("");
        HDialog.Open('700', '400', "../dialogNew/CorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新
                //var varObjects = _Data.split("\t");

                //$('#CostIDs').val(varObjects[0]);
                //$('#CostNames').searchbox('setValue', varObjects[1]);
                //$('#hiCostNames').val(varObjects[1]);


                var data = JSON.parse(_Data);
                $('#CostNames').searchbox("setValue", data.CostName);
                $('#CostIDs').val(data.CostID);
                $('#hiCostNames').val(data.CostName);

            }
        });

        return false;
    }

    $("#BtnReturn").click(function () {
        close("false");
    });


    function close(callparm) {
        HDialog.Close(callparm);
    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", document.body.clientWidth * 0.27 * 0.69);
    });
</script>
