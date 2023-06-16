<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDailyReceBrowse.aspx.cs" Inherits="M_Main.NoticesNew.NewFeesDailyReceBrowse" %>

<!DOCTYPE html >
<html>
<head id="Head1">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>


    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/jquery-datagird-extended.js"></script>
    <script type="text/javascript">
    <!--
    function btnClear_OnClick() {
        document.getElementById('RegionSNum').value = "";
        document.getElementById('BuildSNum').value = "全部";
        document.getElementById('UserCode').value = "全部";
        document.getElementById('ChargeMode').value = "全部";
        document.getElementById('CustTypeID').value = "全部";
        document.getElementById('ChargeTypeID').value = "全部";
        document.getElementById('RoomState').value = "";

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
    <form id="NewFeesDueCutSearch" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server" />
        <input style="width: 8px" id="ApplicationPath" size="1" type="hidden" name="ApplicationPath" runat="server" />
        <input style="width: 8px" id="hiDailyID" size="1" type="hidden" name="hiDailyID" runat="server" />
        <input style="width: 8px" id="hiStatist" size="1" type="hidden" name="hiStatist" runat="server" />
        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">


            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">开始时间从</td>
                    <td class="DialogTdContent" colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" /></td>

                </tr>
                <tr>
                    <td colspan="4">备注:各个费项的收款金额中包括单项预存和预收后期的费用 </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">组团区域</td>
                    <td class="DialogTdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">楼宇</td>
                    <td class="DialogTdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="DialogTdTitle">客户类别</td>
                    <td class="DialogTdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">收费类型</td>
                    <td class="DialogTdContent">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">交房状态</td>
                    <td class="DialogTdContent">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">统计范围</td>
                    <td class="DialogTdContent">
                        <select id="RangeType" name="RangeType" runat="server">
                            <option value="" selected>全部</option>
                            <option value="1">收款</option>
                            <option value="2">退款</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">收款人</td>
                    <td class="DialogTdContent">
                        <select id="UserCode" name="UserCode" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">收款方式</td>
                    <td class="DialogTdContent">
                        <select class="easyui-combobox" id="SelChargeMode" name="SelChargeMode" runat="server" data-options="multiple:true,panelHeight:'auto'">
                            <option selected></option>
                        </select>
                        <input type="hidden" id="ChargeMode" name="ChargeMode" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">是否作废</td>
                    <td class="DialogTdContent">
                        <select id="IsDel" name="IsDel" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="DialogTdTitle">票据类别</td>
                    <td class="DialogTdContent">
                        <asp:DropDownList ID="BillTypeID" Width="82%" runat="server"></asp:DropDownList></td>

                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">查询</a>

                    </td>
                </tr>
            </table>

        </div>



        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height()


                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            var frozenColumns = [[
                { field: 'BuildName', title: '楼栋', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'UnitSNum', title: '单元序号', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'CustName', title: '客户名称', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ParkNames', title: '车位编号', fixed: true, align: 'left', sortable: true, width: 100 }
            ]];
            var column = [[


                { field: 'DailyTypeName', title: '收款类型', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'BillTypeName', title: '票据类别', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'BillsSign', title: '票据号', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'EInvoiceNos', title: '电子发票号', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'BillsDate', title: '收款日期', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'UserName', title: '收款人', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ChargeMode', title: '收款方式', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ChargeModes', title: '多种收款方式', align: 'left', sortable: true, width: 100 },
                { field: 'LateFeeAmount', title: '合同违约金', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'PerSurplus', title: '零头结转', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ItemPrec', title: '综合预存', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ChargeAmount', title: '总计', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ReceMemo', title: '备注', fixed: true, align: 'left', sortable: true, width: 100 }


            ]];


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
                , '-', {
                    text: '按票据明细输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        HDialog.Info('请先统计数据,再导出');
                    }
                }, '-', {
                    text: '按楼宇汇总输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        HDialog.Info('请先统计数据,再导出');
                    }
                }
            ];


            function setIsSQLData() {


                //$("#bbdy1").linkbutton('enable');
                //$("#bbdy2").linkbutton('enable');
                //$("#bbdy3").linkbutton('enable');

                document.getElementById('hiIsSQLData').value = 1;
            }



            function LoadList(loadMsg) {
                if (document.getElementById('hiIsSQLData').value != "-1") {
                    toolbar = [
                        {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                $('#SearchDlg').dialog('open');
                            }
                        }
                        , '-', {
                            text: '按票据明细输出',
                            iconCls: 'icon-print',
                            handler: function () {
                                window.location.href = "../Notices/FeesDailyReceCre.aspx";
                            }
                        }, '-', {
                            text: '按楼宇汇总输出',
                            iconCls: 'icon-print',
                            handler: function () {
                                window.location.href = "../Notices/FeesDailyReceDetailCre.aspx";
                            }
                        }, '-', {
                            text: "<span style='color:red'>时间从：" + $('#EditBeginDate').datetimebox('getValue') + "--" + $('#EditEndDate').datetimebox('getValue') + "</span>"

                        }
                    ];
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: loadMsg,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    nowrap: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    rownumbers: true,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesNotices", "DailyCommissRece", "TableContainer", param);
                    },
                    onLoadSuccess: function (_Data) {

                    }
                });




                $('#SearchDlg').dialog('close');
            }


            document.getElementById('hiIsSQLData').value = -1;


            LoadList('');



        </script>

        <script type="text/javascript">
            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = "1";

                $("#ChargeMode").val($("#SelChargeMode").combobox('getValues'));
                LoadList('数据加载中,请稍候...');
                $('#SearchDlg').dialog('close');
            }


            function ToExcel1() {

                window.location.href = "FeesDailyReceCre.aspx";
            }

            function ToExcel2() {

                window.location.href = "FeesDailyReceCreStatist.aspx";
            }

            function ToExcel3() {

                window.location.href = "FeesDailyReceDetailCre.aspx";
            }
        </script>
    </form>
</body>
</html>
