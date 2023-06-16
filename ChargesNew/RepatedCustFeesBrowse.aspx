<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepatedCustFeesBrowse.aspx.cs" Inherits="M_Main.ChargesNew.RepatedCustFeesBrowse" %>

<%@ Register TagPrefix="uc1" TagName="OperatMenu" Src="../UserControl/OperatMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>HouseholdBrowseFees</title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

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
    <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>

    <script type="text/javascript">
        function btnSelCost_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                HouseholdBrowseFees.CostID.value = varObjects[0];
                HouseholdBrowseFees.CostName.value = varObjects[2];
                HouseholdBrowseFees.hiCostName.value = varObjects[2];

                return true;
            }

            return false;
        }

        function SelRoomID_OnChange() {
            HouseholdBrowseFees.RoomID.value = HouseholdBrowseFees.SelRoomID.options[ReceiveFeesHisBrowse.SelRoomID.selectedIndex].value;
            HouseholdBrowseFees.hiRoomSign.value = HouseholdBrowseFees.RoomSign.value;

        }
        function btnClear_OnClick() {

            HouseholdBrowseFees.RoomID.value = "";
            HouseholdBrowseFees.hiRoomSign.value = "";

            HouseholdBrowseFees.CostID.value = "";
            HouseholdBrowseFees.CostName.value = "";
            HouseholdBrowseFees.hiCostName.value = "";

        }
    </script>
</head>
<body>
    <form id="HouseholdBrowseFees" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="4" name="PageIndex" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <input id="CustName" type="hidden" maxlength="50" size="15" name="CustName" runat="server">
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="TableSign" type="hidden" size="1" name="TableSign" runat="server">
        <input id="hiSearchData" type="hidden" size="1" name="hiSearchData" runat="server">
        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />

        <div id="Divreport" name="Divreport" style="width: 100%; height: 100%;" class="easyui-layout" title="">
            <div data-options="region:'center',title:''" style="background: #ffffff; border: hidden">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="fees" name="fees" refpage="" refsel="1">
                            <a data-toggle="tab" href="#tab-1" aria-expanded="true">关联客户欠费</a>
                        </li>

                        <li class="" name="home" id="home" refpage="NewBatchPublicResultManage" refsel="0">
                            <a data-toggle="tab" href="#tab-2" aria-expanded="false">家庭成员欠费</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer1"></div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <iframe id="TableContainer2" src="../HouseNew/HouseholdBrowseFees.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 850px; height: 200px; padding: 10px;">
            <table class="DialogTable" id="SearchTable">
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" name="SelRoomID"
                            runat="server">
                            <option selected></option>
                        </select>
                        <input style="z-index: 0; width: 8px; height: 22px" id="RoomID" class="Control_ItemInput"
                            size="1" type="hidden" name="RoomID" runat="server"><input style="z-index: 0; width: 8px; height: 22px" id="hiRoomSign" class="Control_ItemInput"
                                size="1" type="hidden" name="hiRoomSign" runat="server"></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="CostName"
                            searcher="SelCost" name="CostName" runat="server">
                        <input style="height: 22px; display: none;" id="btnSelCost" class="button_sel" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelCost" runat="server">
                        <input id="CostID" type="hidden" name="CostID" runat="server">
                        <input id="hiCostName" type="hidden" name="hiCostName" runat="server">
                    </td>
                </tr>
                <tr>
                    <td style="height:10px;" colspan="4"></td>
                </tr>
                <tr  style="margin-top:10px;">
                    <td class="TdTitle">费用时间</td>
                    <td class="TdContentSearch">
                        <select id="nYear1" name="nYear1" style="width: 19%;" runat="server">
                            <option selected></option>
                        </select>年<select id="nMonth1" name="nMonth1" style="width: 14%;" runat="server">
                            <option selected></option>
                        </select>月<select id="nDay1" name="nDay1" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>日<select id="nHour1" name="nHour1" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>时<select id="nMinute1" name="nMinute1" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>分</td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <select id="nYear2" name="nYear2" style="width: 19%;" runat="server">
                            <option selected></option>
                        </select>年<select id="nMonth2" name="nMonth2" style="width: 14%;" runat="server">
                            <option selected></option>
                        </select>月<select id="nDay2" name="nDay2" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>日<select id="nHour2" name="nHour2" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>时<select id="nMinute2" name="nMinute2" style="width: 15%;" runat="server">
                            <option selected></option>
                        </select>分</td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="4"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input id="btnFilter" class="button" value="查询" type="button" name="btnFilter" runat="server">&nbsp;
                        <input id="btnClear" class="button" onclick="javascript: btnClear_OnClick();" value="清空"
                            type="button" name="btnClear">&nbsp;
                        <%--<input class="button" id="btnReturn" style="z-index: 0; height: 22px" type="button" value="返回"
                                name="btnPrint" runat="server">--%>
                    </td>
                </tr>
                <%--  <tr>
                    <td width="15%" colspan="4" align="center" class="SchTable">
                        <p style="z-index: 0" align="left">备注：关联客户是指曾经为当前客户名下房号的历史业主或者历史租户。</p>
                    </td>
                </tr>--%>
            </table>
        </div>

    </form>
</body>
</html>

<script type="text/javascript">

    var h = $(window).height();
    function InitTableHeight() {
        $(".Frm").css({ "height": h + "px" });
        h = h - 38;
        $("#TableContainer1").css("height", h + "px");
        //$("#TableContainer2").css("height", h + "px");
    }


    $(function () {
        InitTableHeight();

        LoadFees();
    })
    $(".tabs-container li").click(function () {
        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");

        $('#fees').attr("refsel", "0");
        $('#home').attr("refsel", "0");


        $('#fees').attr("class", "");
        $('#home').attr("class", "");


        switch ($(this).attr("name")) {

            case "fees":
                $('#tab-1').attr("class", "tab-pane active");
                $('#fees').attr("refsel", "1");
                $('#fees').attr("class", "active");

                LoadFees();
                break;
            case "home":

                $('#tab-2').attr("class", "tab-pane active");
                $('#home').attr("refsel", "1");
                $('#home').attr("class", "active");
                //$("#TableContainer2").attr("src", "../HouseNew/HouseholdBrowseFees.aspx");
                break;
        }


    });

    var feesColumn = [[
               { field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true },
               { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
               { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
               { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true },
               { field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true },
               { field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true },
               { field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true },
               { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
               { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
               { field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
               { field: 'IsBankName', title: '托收', width: 100, align: 'left', sortable: true },
               { field: 'IsFreezeName', title: '冻结', width: 100, align: 'left', sortable: true },
               { field: 'IsPropertyName', title: '垫付', width: 100, align: 'left', sortable: true },
               { field: 'IsPrecName', title: '预收', width: 100, align: 'left', sortable: true }
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
        text: '<font color=red>*关联客户是指曾经为当前客户名下房号的历史业主或者历史租户。</font>'
    }
    ]

    function LoadFees() {
        var Data = $('#RepDetail').val();

        var obj = JSON.parse(Data);
        $("#TableContainer1").datagrid({
            data: obj.rows,
            nowrap: false,
            //pageSize: top.ListPageSize,
            //pageList: top.ListPageList,
            columns: feesColumn,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            //pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            toolbar: toolbar,
            border: false
        });
    }

    function SelCost() {

        $('#CostName').searchbox("setValue", '');
        $('#CostID').val('');
        $('#hiCostName').val('');

        var conent = "../DialogNew/CorpCommCostDlg.aspx";

        HDialog.Open(500, 400, conent, '费用项目选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostName').searchbox("setValue", data.CostName);
            $('#hiCostName').val(data.CostName);
            $('#CostID').val(data.CustID);
        });

    }

</script>
