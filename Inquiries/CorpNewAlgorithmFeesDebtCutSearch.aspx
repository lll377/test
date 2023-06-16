<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpNewAlgorithmFeesDebtCutSearch.aspx.cs" Inherits="M_Main.Inquiries.CorpNewAlgorithmFeesDebtCutSearch" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

</head>
<body style="overflow-y: hidden">
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />

        <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" type="hidden" name="RoomIDs" runat="server" />

        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />

        <input id="CustID" type="hidden" name="CustID" runat="server" />
        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />

        <input id="RoomStates" type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />
        <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

        <input id="CarparkIDs" type="hidden" name="CarparkIDs" runat="server" />
        <input id="hiCarparkNames" type="hidden" name="hiCarparkNames" runat="server" />

        <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiParkNames" type="hidden" name="hiParkNames" runat="server" />

        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />

        <input id="StanIDs" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" type="hidden" name="hiStanNames" runat="server" />

        <input id="hiCommID" type="hidden" name="hiCommID" runat="server" />
        <input id="hiLoginUserCode" type="hidden" name="hiLoginUserCode" runat="server" />
        <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="StaticType" type="hidden" name="StaticType" runat="server" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server">
        <input id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server">

        <div id="tt" class="easyui-tabs" style='overflow: hidden'>
            <div title="欠费明细" id="ysfl" style='overflow: hidden'>
                <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
                <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 400px;">

                    <table class="DialogTable">
                        <tr>
                            <td class="TdTitle">楼宇</td>
                            <td class="TdContentSearch">
                                <input id="BuildNames" style="width: 90%" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                                    name="BuildNames" runat="server" /></td>
                            <td class="TdTitle">组团区域</td>
                            <td class="TdContentSearch">
                                <input id="RegionNames" style="width: 90%" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                                    name="RegionNames" runat="server"></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">客户类别</td>
                            <td class="TdContentSearch">
                                <select id="CustTypeID" style="width: 90%" class="easyui-combobox" name="CustTypeID" runat="server">
                                    <option selected></option>
                                </select></td>
                            <td class="TdTitle">收费类型</td>
                            <td class="TdContentSearch">
                                <select id="ChargeTypeID" style="width: 90%" class="easyui-combobox" name="ChargeTypeID" runat="server">
                                    <option selected></option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">客户名称</td>
                            <td class="TdContentSearch">
                                <input id="CustName" style="width: 90%" searcher="SelCust"
                                    name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                            </td>
                            <td class="TdTitle">可选房号</td>
                            <td class="TdContentSearch">
                                <select id="SelectRoomID" style="width: 90%" class="easyui-combobox" name="SelectRoomID" runat="server">
                                    <option selected></option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">房屋编号</td>
                            <td class="TdContentSearch">
                                <input id="RoomSign" style="width: 90%" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                            </td>
                            <td class="TdTitle">交房状态</td>
                            <td class="TdContentSearch">
                                <input id="RoomStateNames" style="width: 90%" class="easyui-searchbox" searcher="SelRoomState"
                                    name="RoomStateNames" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">查询范围</td>
                            <td class="TdContentSearch">
                                <select id="SearchRange" style="width: 90%" class="easyui-combobox" name="SearchRange" runat="server">
                                    <option value="0" selected>全部客户</option>
                                    <option value="1">银行代收客户</option>
                                    <option value="2">非银行代收客户</option>
                                </select></td>
                            <td class="TdTitle">代收银行</td>
                            <td class="TdContentSearch">
                                <select id="BankName" style="width: 90%" class="easyui-combobox" name="BankName" runat="server">
                                    <option selected></option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">车位区域</td>
                            <td class="TdContentSearch">
                                <input id="CarparkNames" style="width: 90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                                    name="CarparkNames" runat="server">
                            </td>
                            <td class="TdTitle">车位</td>
                            <td class="TdContentSearch">
                                <input id="ParkNames" style="width: 90%" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                                    name="ParkNames" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">费用项目</td>
                            <td class="TdContentSearch">
                                <input id="CostNames" style="width: 90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                                    name="CostNames" runat="server"></td>
                            <td class="TdTitle">收费标准</td>
                            <td class="TdContentSearch">
                                <input id="StanNames" style="width: 90%" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                                    name="StanNames" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">欠费时间</td>
                            <td class="TdContentSearch">
                                <select id="CompSymbol1" class="easyui-combobox" name="CompSymbol1" runat="server" visible="false">
                                    <option selected></option>
                                </select>从<input style="width: 35%;" id="Comp_Month" class="easyui-textbox" onkeypress="CheckNumeric();"
                                    name="Comp_Month" runat="server">月到<input style="width: 35%;" id="Comp_Month2" class="easyui-textbox" onkeypress="CheckNumeric();"
                                        name="Comp_Month2" runat="server">月</td>
                            <td class="TdTitle">欠费金额</td>
                            <td class="TdContentSearch">
                                <select id="CompSymbol2" class="easyui-combobox" name="CompSymbol2" runat="server">
                                    <option selected></option>
                                </select><input style="width: 70%;" id="Comp_Amount" class="easyui-textbox" onkeypress="CheckNumeric();"
                                    name="Comp_Amount" runat="server">元</td>
                        </tr>
                        <tr>
                            <td class="TdTitle">合同违约金</td>
                            <td class="TdContentSearch">
                                <select id="CompSymbol3" class="easyui-combobox" name="CompSymbol3" runat="server">
                                    <option selected></option>
                                </select><input style="width: 70%;" id="Comp_Amount3" class="easyui-textbox" onkeypress="CheckNumeric();"
                                    name="Comp_Amount3" runat="server">元</td>
                            <td class="TdTitle">是否垫付</td>
                            <td class="TdContentSearch">
                                <select id="IsProperty" class="easyui-combobox" name="IsProperty" runat="server">
                                    <option selected></option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">是否预收</td>
                            <td class="TdContentSearch">
                                <select id="IsPrec" class="easyui-combobox" name="IsPrec" runat="server">
                                    <option selected></option>
                                </select>
                            </td>
                            <td class="TdTitle">是否冻结</td>
                            <td class="TdContentSearch">
                                <select id="IsFreeze" class="easyui-combobox" name="IsFreeze" runat="server">
                                    <option selected></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">是否计算违约金</td>
                            <td class="TdContentSearch">
                                <select id="IsLateFee" class="easyui-combobox" name="IsLateFee" runat="server">
                                    <option selected></option>
                                </select>
                            </td>
                            <td class="TdTitle"></td>
                            <td class="TdContentSearch"></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>

                            </td>

                        </tr>
                    </table>
                </div>
            </div>
            <%--<div title="欠费期间" style="width: 100%; overflow: hidden">
                <iframe id="pag1" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="欠费账龄一" style="width: 100%; overflow: hidden">
                <iframe id="pag2" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="欠费账龄二" style="width: 100%; overflow: hidden">
                <iframe id="pag3" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="客户汇总" style="width: 100%; overflow: hidden">
                <iframe id="pag4" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="组团汇总" style='overflow: hidden'>
                <iframe id="pag5" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="费项汇总" style='overflow: hidden'>
                <iframe id="pag6" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="欠费主体" style='overflow: hidden'>
                <iframe id="pag7" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>
            <div title="欠费原因" style='overflow: hidden'>
                <iframe id="pag8" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>--%>
        </div>


        <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left">管理项目&nbsp;
                                <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" data-options="editable:false"
                                    name="CommNames" runat="server" />收款截止时间&nbsp;<input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="CutEndDate" style="width:90px" runat="server" name="CutEndDate" />&nbsp;
             时间类型&nbsp;<select id="FeesDateType" name="FeesDateType" runat="server">
                 <option value="1" selected>费用日期</option>
                 <option value="2">应收日期</option>
             </select>&nbsp;
             费用时间从&nbsp;<input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" style="width:90px" runat="server" name="EditBeginDate" />
                        &nbsp;到&nbsp;<input type="text" style="width:90px" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" />
                        &nbsp;
                    </td>


                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Static();">生成欠费</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a>
                        <a id='scExcel' href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a>

                        <input id="PageIndex" type="hidden" name="PageIndex" runat="server" />
                        <input id="PrintParms" type="hidden" name="PrintParms" runat="server" />
                        <input id="CostGeneType" type="hidden" name="CostGeneType" runat="server" />
                        <input id="OptCode" type="hidden" name="OptCode" runat="server" />
                        <input id="Flag" type="hidden" name="Flag" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px'>
            <div id='dprocessbar' data-options="value:0" class='easyui-progressbar' style='width: 300px; margin-top: 10px;'></div>
            <div id='divtime' style='width: 300px; text-align: center'></div>
            <div id='DivProcName' style='width: 300px; text-align: center;'></div>
        </div>


        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function SelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                    var jsonObj = JSON.parse(_Data);
                    $("#CommIDs").val(jsonObj.id);
                    $("#CommNames").searchbox("setValue", jsonObj.name);
                    alert(arrRet.name);
                });
            }

            function sort_int(a, b) {
                if (parseFloat(a))
                    a = parseFloat(a);
                if (parseFloat(b))
                    b = parseFloat(b);
                return (a > b ? 1 : -1);

                //if(a.length > b.length) return 1;
                //else if(a.length < b.length) return -1;
                //else if(a > b) return 1;
                //else return -1;
            }
            function InitTableHeight() {
                var h = $(window).height() - 30;

                $("#TableContainer").css("height", h + "px");

                $('#pag1').height(h);
                $('#pag2').height(h);
                $('#pag3').height(h);
                $('#pag4').height(h);
                $('#pag5').height(h);
                $('#pag6').height(h);
                $('#pag7').height(h);
                $('#pag8').height(h);

                //var travelExpenseFrame1 = document.getElementById("pag1");
                //travelExpenseFrame1.height = h;

                //var travelExpenseFrame2 = document.getElementById("pag2");
                //travelExpenseFrame2.height = h;

                //var travelExpenseFrame3 = document.getElementById("pag3");
                //travelExpenseFrame3.height = h;

                //var travelExpenseFrame4 = document.getElementById("pag4");
                //travelExpenseFrame4.height = h;

                //var travelExpenseFrame5 = document.getElementById("pag5");
                //travelExpenseFrame5.height = h;

                //var travelExpenseFrame6 = document.getElementById("pag6");
                //travelExpenseFrame6.height = h;

                //var travelExpenseFrame7 = document.getElementById("pag7");
                //travelExpenseFrame7.height = h;

                //var travelExpenseFrame8 = document.getElementById("pag8");
                //travelExpenseFrame8.height = h;

                $("#scExcel").attr('disabled', 'disabled');

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


            InitTableHeight();
            var column = [[
                { field: 'NowStateName', title: '当前房屋状态', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'StateName', title: '当时房屋状态', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'BuildName', title: '楼宇名称', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'RegionName', title: '组团区域', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MobilePhone', title: '联系电话', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'StanName', title: '标准名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, fixed: true, width: 100 },

                {
                    field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },

                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },

                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, fixed: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'StartDegree', title: '起度', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'EndDegree', title: '止度', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'CalcAmount', title: '数量1', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'CalcAmount2', title: '数量2', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'WaivAmount', title: '减免冲抵', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'LateFeeAmount', title: '合同违约金', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'PrecBalance', title: '截止预交余额', align: 'left', sortable: true, fixed: true, width: 100, sorter: sort_int },
                { field: 'StatMemo', title: '代扣返回信息', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'IsPropertyName', title: '是否垫付', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'IsPrecName', title: '是否预收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'IsHistory', title: '是否历史', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'FeesMemo', title: '费用备注', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'ArrearsTypeName', title: '欠费原因', align: 'left', sortable: true, fixed: true, width: 100 }
            ]];

            var frozenColumns = [[
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 100 }

            ]];
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"));
                $('#SearchDlg').dialog('open');
                //btnClear_OnClick();

                setIsSQLData();
            }

            function setIsSQLData() {
                $('#hiIsSQLData').val("1");
            }

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx?StaticType=result',
                    method: "post",
                    title: '按欠费明细查询',
                    loadMsg: '加载中',
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    view: myview,
                    showFooter: true,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("NewFeesDebtSearch", "FeesDebtSearch1", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    }, onLoadSuccess: function (data) {
                        var process = 100;
                        $('#dprocessbar').progressbar('setValue', process);

                        $(".datagrid-mask").css({ display: "none" });
                        $(".datagrid-mask-msg").css({ display: "none" });
                        $('#dprocessbar').progressbar('setValue', 0);

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                DueAmount: "<span style='color:red'>0</span>",
                                PaidAmount: "<span style='color:red'>0</span>",
                                PrecAmount: "<span style='color:red'>0</span>",
                                WaivAmount: "<span style='color:red'>0</span>",
                                RefundAmount: "<span style='color:red'>0</span>",
                                DebtsAmount: "<span style='color:red'>0</span>",
                                LateFeeAmount: "<span style='color:red'>0</span>"
                            }
                        ]);
                        if ($('#hiIsSQLData').val() != "-1") {
                            $.tool.DataPostNoLoading('NewFeesDebtSearch', "DebtsCutGetSum", $('#NewFeesDueCutSearch').serialize(),
                                function Init() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                },
                                function callback(_Data) {

                                    var Data = eval("(" + _Data + ")"); //转换为json对象
                                    var obj = Data.rows[0];
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>" + obj.DueAmount + "</span>",
                                            PaidAmount: "<span style='color:red'>" + obj.PaidAmount + "</span>",
                                            PrecAmount: "<span style='color:red'>" + obj.PrecAmount + "</span>",
                                            WaivAmount: "<span style='color:red'>" + obj.WaivAmount + "</span>",
                                            RefundAmount: "<span style='color:red'>" + obj.RefundAmount + "</span>",
                                            DebtsAmount: "<span style='color:red'>" + obj.DebtsAmount + "</span>",
                                            LateFeeAmount: "<span style='color:red'>" + obj.LateFeeAmount + "</span>"

                                        }
                                    ]);
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>"

                                        }
                                    ]);
                                });
                        }
                    }
                });

            }

            function Static() {
                var FeesBeginDate = $('#EditBeginDate').val();
                var FeesEndDate = $('#EditEndDate').val();
                //默认开始时间为 1970
                if (FeesBeginDate == '') {
                    FeesBeginDate = '1970-01-01'
                }
                var d1 = new Date(FeesBeginDate.replace('-', '/').replace('-', '/'));
                var d2 = new Date(FeesEndDate.replace('-', '/').replace('-', '/'));
                var title = '确认生成' + FeesBeginDate + '至' + FeesEndDate + '的欠费';
                var DataCount = (d2.getFullYear() - d1.getFullYear() + 1) + 2;

                var strIsLateFee = $("#IsLateFee").combobox("getValue");
                var MonthCount = ((d2.getFullYear() * 12 + d2.getMonth()) - (d1.getFullYear() * 12 + d1.getMonth()) + 1);

                if (MonthCount > 6 && strIsLateFee == "1") {
                    HDialog.Info("费用期间超过6个月，将不计算合同违约金!");
                    $('#IsLateFee').combobox("setValue", "0");
                }

                if ($("#CommNames").val()=="") {
                    HDialog.Info("选择要查询的项目!");
                    return;
                }

                $('#scExcel').linkbutton('enable');
                setIsSQLData();

                $('#StaticType').val('begin');
                $.messager.confirm('提示', title, function (r) {
                    if (r) {

                        //第一次统计生成统计表
                        $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch1', $('#NewFeesDueCutSearch').serialize() + "&k=0&DataCount=" + DataCount,
                            function Init() {

                                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                                var ht = parseInt($(window).scrollTop());
                                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                                $('#divtime').html("正在生成欠费,请等待");
                                //  var value = $('#dprocessbar').progressbar('getValue');
                                $('#dprocessbar').progressbar('setValue', 0);
                            },
                            function callback(_Data) {
                                var BeginData = _Data;
                                if (BeginData.split('|')[0] == 'true') {
                                    StaticChild(1, DataCount, '');
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                                return false;
                            });

                    }
                });

            }

            function StaticChild(k, DataCount, StartDate) {
                if (DataCount - 2 > 1) {
                    if (k <= DataCount - 2) {
                        k++;
                        var FeesBeginDate = StartDate;
                        if (StartDate == '') {
                            FeesBeginDate = $('#EditBeginDate').val();
                        }
                        //默认开始时间为 1970
                        if (FeesBeginDate == '') {
                            FeesBeginDate = '1970-01-01'
                        }

                        var d1 = new Date(FeesBeginDate.replace('-', '/').replace('-', '/'));
                        var Year = d1.getFullYear();
                        var Month = d1.getMonth() + 1;
                        var Day = d1.getDate();

                        var BD = Year + '/' + Month + '/' + Day;
                        var ED = Year + '/' + 12 + '/' + 31;

                        var ND = Year + 1 + '/1/1';
                        var bd1 = new Date($('#EditEndDate').val().replace('-', '/').replace('-', '/'));
                        var bd2 = new Date(ND);
                        if (bd2 > bd1) {
                            ED = $('#EditEndDate').val();
                        }
                        $('#StaticType').val('process');
                        $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch1', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount + "&BD=" + BD + "&ED=" + ED,
                            function Init() {
                                $('#divtime').html("正在生成" + Year + "年欠费,请等待");
                                var process = Math.round(k / (DataCount) * 100);
                                $('#dprocessbar').progressbar('setValue', process);
                            },
                            function callback(_Data) {

                                var Data = _Data;

                                if (Data.split('|')[0] == 'true') {
                                    StaticChild(k, DataCount, ND);
                                }
                                else {
                                    return false;
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                                return false;
                            });

                    }
                    else {

                        StaticEnd(k, DataCount);
                    }
                }
                else {
                    var BD = $('#EditBeginDate').val();
                    var ED = $('#EditEndDate').val();
                    $('#StaticType').val('process');
                    $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch1', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount + "&BD=" + BD + "&ED=" + ED,
                        function Init() {
                            $('#divtime').html("正在生成欠费,请等待");
                            var process = Math.round(k / (DataCount) * 100);
                            $('#dprocessbar').progressbar('setValue', process);
                        },
                        function callback(_Data) {

                            var Data = _Data;

                            if (Data.split('|')[0] == 'true') {
                                var process = Math.round(Data.split('|')[1] / (DataCount) * 100);
                                $('#dprocessbar').progressbar('setValue', process);
                                StaticEnd(k, DataCount);
                            }
                            else {
                                return false;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                            return false;
                        });
                }
            }

            function StaticEnd(k, DataCount) {
                $('#StaticType').val('end');
                $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch1', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount,
                    function Init() {
                        $('#divtime').html("正在生成汇总欠费信息,请等待");
                        var process = Math.round(k / (DataCount) * 100);
                        $('#dprocessbar').progressbar('setValue', process);
                    },
                    function callback(_Data) {

                        var Data = _Data;

                        if (Data.split('|')[0] == 'true') {
                            $('#StaticType').val('result');
                            LoadList();
                        }
                        else {
                            return false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        return false;
                    });
            }

            function ResPorcessbar() {

                $(".datagrid-mask").css({ display: "none" });
                $(".datagrid-mask-msg").css({ display: "none" });

                var value = $('#dprocessbar').progressbar('getValue');
                if (value > 99) {

                    value = 0;
                    $('#dprocessbar').progressbar('setValue', value);
                    window.clearInterval(intervalProcess);
                }

            }

            $('#hiIsSQLData').val("-1");
            LoadList();

            $(window).resize(function () {
                $('#TableContainer').datagrid('resize');
            });

        </script>

        <script type="text/javascript">

            function SelBuild() {

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }

            function SelRegion() {

                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";

                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);
                        $('#hiRegionNames').val(RegionNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                        $('#hiRegionNames').val(RegionNames);

                    }
                });

            }
            function SelCarpark() {

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx", '车位区域选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");

                        var CarparkIDs = "";
                        var CarparkNames = "";
                        $('#CarparkIDs').val(CarparkIDs);
                        $('#CarparkNames').searchbox('setValue', CarparkNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                                CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                        $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                    }
                });

            }

            function SelPark() {

                HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx", '车位选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新                        

                        var data = _Data.split('|');
                        if (data.length > 0) {
                            var ParkIDs = "";
                            var ParkNames = "";

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);
                                    if (obj.ParkID != 0) {
                                        ParkIDs = ParkIDs + "," + obj.ParkID;
                                        ParkNames = ParkNames + ',' + obj.ParkName;
                                    }
                                }
                            }

                            $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                            $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));
                        }
                    }
                });

            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }

                });
                return false;
            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);

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

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);
                });

            }

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");

                    $('#btnSelCost').focus();
                    return false;
                }

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);

                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";

                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                    }
                });

                return false;
            }

            function SelRooms() {
                var varReturn;

                var w = $(window).width();;
                var h = $(window).height();;

                HDialog.Open(w, h, "../dialogNew/MultiRoomDlg.aspx", '房屋多选', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var data = _Data;// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                        var SelAll = data.split('◆')[0];
                        var SelRoomSigns = data.split('◆')[1];
                        var SelRoomIDs = data.split('◆')[2];

                        if (SelAll == "1") {
                            $('#RoomSigns').searchbox('setValue', '全部');
                        }
                        else {
                            $('#RoomSigns').searchbox('setValue', SelRoomSigns);;
                        }

                        $('#SelRoomSigns').val(SelRoomSigns);
                        $('#SelRoomIDs').val(SelRoomIDs);
                        $('#RoomIDs').val(SelRoomIDs);

                        $('#SelAll').val(SelAll);

                        return true;
                    }
                });

                return false;
            }


            function SelRoomState() {

                var strRoomStates = "";

                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#RoomStates').val(varObjects[0]);
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                        $('#hiRoomStateNames').val(varObjects[0]);
                        var arrRoomStateSNums = varObjects[0].split(',');
                        $('#RoomStateNum').val(arrRoomStateSNums.length);
                    }

                });
            }

            function btnClear_OnClick() {

                $('#BuildSNums').val('');
                $('#BuildNames').searchbox('setValue', '');
                $('#RegionSNums').val('');
                $('#RegionNames').searchbox('setValue', '');
                $('#hiRegionNames').val('');

                $('#CustTypeID').val('');
                $('#ChargeTypeID').val('');

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                //$('#RoomState').val('');
                $('#SearchRange').val('');
                $('#BankName').val('');

                $('#CarparkIDs').val('');
                $('#CarparkNames').searchbox('setValue', '');

                $('#ParkIDs').val('');
                $('#ParkNames').searchbox('setValue', '');

                $('#CostIDs').val('');
                $('#CostNames').searchbox('setValue', '');

                $('#StanIDs').val('');
                $('#StanNames').searchbox('setValue', '');

                $('#CompSymbol1').val('');
                $('#Comp_Month').val('');
                $('#Comp_Month2').val('');
                $('#CompSymbol2').val('');
                $('#Comp_Amount').val('');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');
                $('#RoomStateNum').val('');

                $('#IsPrec').val('');
                $('#IsProperty').val('');

            }

            function ExcuteOnServer() {

                if ($("#CommNames").val() == "") {
                    HDialog.Info("选择要查询的项目!");
                    return;
                }

                $('#SearchDlg').dialog('close');
                if ($('#StaticType').val() != '') {
                    $.messager.confirm('提示', '是否重新生成欠费', function (r) {
                        if (r) {

                            Static();
                        }
                        else {

                            $('#hiIsSQLData').val("1");

                            GetFlag();

                            $('#scExcel').linkbutton('enable');
                            LoadList();
                            $('#SearchDlg').dialog('close');

                        }
                    });
                }
                else {
                    Static();
                }
            }

            function GetFlag() {

                var strFlag = "";
                var strCostIDs = $('#CostIDs').val();
                var strRoomIDs = $('#RoomIDs').val();
                var strParkIDs = $('#ParkIDs').val();
                var strBuildSNums = $('#BuildSNums').val();

                if (strCostIDs != "") {
                    strFlag = strFlag + "A";
                }
                if (strRoomIDs != "" || strBuildSNums != "") {
                    strFlag = strFlag + "B";
                }
                if (strParkIDs != "") {
                    strFlag = strFlag + "C";
                }

                $('#Flag').val(strFlag);

            }
            function ToExcel() {

                GetFlag();
                var strFlag = $('#Flag').val(); 
                window.location.href = "NewFeesDebtCutSearchCre.aspx?Flag=" + strFlag + "&CommID=" + $("#CommIDs").val();
            }

            $('#tt').tabs({
                border: false,
                onSelect: function (title, index) {

                    //  alert(title+' is selected');
                    if (index == 0) {
                        $('#pag1').attr('src', '');
                        $('#pag2').attr('src', '');
                        $('#pag3').attr('src', '');
                        $('#pag4').attr('src', '');
                        $('#pag5').attr('src', '');
                        $('#pag6').attr('src', '');
                        $('#pag7').attr('src', '');
                        $('#pag8').attr('src', '');
                    }
                    //if (index == 1) {
                    //    $('#pag1').attr('src', 'CorpNewFeesDebtCut1Search.aspx');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 2) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', 'NewAlgorithmFeesDebtCut7Search.aspx');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 3) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', 'NewAlgorithmFeesDebtCut9Search.aspx');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 4) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', 'NewAlgorithmFeesDebtCut2Search.aspx');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 5) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', 'NewFeesDebtCut8Search.aspx');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 6) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', 'NewFeesDebtCut3Search.aspx');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 7) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', 'NewFeesDebtCut4Search.aspx');
                    //    $('#pag8').attr('src', '');
                    //}
                    //if (index == 8) {
                    //    $('#pag1').attr('src', '');
                    //    $('#pag2').attr('src', '');
                    //    $('#pag3').attr('src', '');
                    //    $('#pag4').attr('src', '');
                    //    $('#pag5').attr('src', '');
                    //    $('#pag6').attr('src', '');
                    //    $('#pag7').attr('src', '');
                    //    $('#pag8').attr('src', 'NewFeesDebtCut5Search.aspx');
                    //}
                }
            });

        </script>

    </form>
</body>
</html>
