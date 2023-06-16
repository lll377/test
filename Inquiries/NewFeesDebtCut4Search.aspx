<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDebtCut4Search.aspx.cs" EnableEventValidation="false" EnableSessionState="ReadOnly" ViewStateEncryptionMode="Never" EnableViewStateMac="false" EnableViewState="false" Inherits="M_Main.Inquiries.NewFeesDebtCut4Search" %>

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
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

</head>
<body scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">

        <input style="width: 8px" id="CostIDs" size="1" type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="hiCostNames" size="1" type="hidden" name="hiCostNames" runat="server" />

        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server">
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server">
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server">
        <input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server"><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server"><input style="height: 22px; width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server"><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server"><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">
        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 130px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">欠费主体</td>
                    <td class="TdContentSearch">
                        <input id="Text1" style="width: 90%" class="easyui-textbox" name="ArrearsSubName" runat="server" /></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" style="width: 90%" class="easyui-searchbox" searcher="SelCost" data-options="editable:false"
                            name="CostNames" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left">收款截止时间&nbsp;<input type="text" class="easyui-datebox" id="FeesStopEndDate" runat="server" name="FeesStopEndDate" />&nbsp;
             时间类型&nbsp;<select id="FeesDateType" name="FeesDateType" runat="server">
                 <option value="1" selected>费用日期</option>
                 <option value="2">应收日期</option>
             </select>&nbsp;
                    </td>
                    <td rowspan="2">&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();LoadList();">生成欠费</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">按欠费主体输出</a>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;费用时间从&nbsp;<input type="text" class="easyui-datebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datebox" id="EditEndDate" name="EditEndDate" />
                        &nbsp;是否垫付&nbsp;<select id="IsProperty" name="IsProperty" runat="server">
                            <option selected></option>
                        </select>
                        &nbsp;是否预收&nbsp;<select id="IsPrec" name="IsPrec" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px'>
            <div id='Divprogressbar' class='easyui-progressbar' style='width: 200px; margin-top: 10px;'></div>
            <div id='divtime' style='width: 200px; text-align: center'></div>
            <div id='DivProcName' style='width: 200px; text-align: center;'></div>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();

            var NewCol = [[
                { field: 'ArrearsSubName', title: '欠费主体', align: 'left', sortable: true, width: 100 }
            ]];
            var intervalProcess;

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

                btnClear_OnClick();
            }

            function setIsSQLData() {
                $('#hiIsSQLData').val("1");
            }

            function SetEasyUiColumn(_Data) {
                var col = "";
                var obj = "";
                if (_Data.rows.length > 0) {
                    obj = _Data.rows[0];
                    var i = 0;
                    for (var attr in obj) {
                        i = i + 1;
                        var s = attr;
                        col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'left\', sortable: true,width:200}";
                    }

                    col = col.substr(1, col.length);
                    col = "[[" + col + "]]";
                    NewCol = eval(col);
                }

            }

            function LoadList() {

                if ($('#hiIsSQLData').val() != "-1") {
                    var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                    var ht = parseInt($(window).scrollTop());
                    $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                    $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                    $('#divtime').html("正在查询中,请等待，耗时: 0秒");
                }

                if ($('#hiIsSQLData').val() != "-1") {

                    var value = $('#Divprogressbar').progressbar('getValue');
                    $('#Divprogressbar').progressbar('setValue', 0);

                    intervalProcess = window.setInterval("GetProcess()", 1000);
                }

                $.tool.DataPost2('FeesDebtSearch', 'FeesDebtSearch4', "page=1&rows=50&" + $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        SetEasyUiColumn(Data);
                        LoadListBindingColumn(Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadListBindingColumn(_Data) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    title: '按欠费主体查询',
                    loadMsg: '',
                    pageSize: 50,
                    pageList: [50, 100, 200],
                    columns: NewCol,
                    nowrap: false,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        if (row.欠费主体.indexOf('合计') < 0) {
                            return 'color:red;';
                        }
                    },
                    onAfter: function (target) {
                        ResPorcessbar();
                        $('#divtime').html("");
                        $('#DivProcName').html("");
                    },
                    onLoadSuccess: function () {

                        var pg = $("#TableContainer").datagrid("getPager");
                        if (pg) {
                            $(pg).pagination({
                                onBeforeRefresh: function () {

                                },
                                onRefresh: function (pageNumber, pageSize) {

                                },
                                onChangePageSize: function () {
                                },
                                onSelectPage: function (Pn, Ps) {

                                    LoadList(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;
                                }
                            });
                        }

                        var value = $('#Divprogressbar').progressbar('getValue');
                        if (value < 100) {

                            value = 100;
                            $('#Divprogressbar').progressbar('setValue', value);

                        }

                    },
                    onLoadError: function () {
                        window.clearInterval(intervalProcess);
                        alert('按费用明细生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });
            }
            function ResPorcessbar() {

                $(".datagrid-mask").css({ display: "none" });
                $(".datagrid-mask-msg").css({ display: "none" });

                var value = $('#Divprogressbar').progressbar('getValue');
                if (value > 99) {

                    value = 0;
                    $('#Divprogressbar').progressbar('setValue', value);
                    window.clearInterval(intervalProcess);
                }

            }

            function GetProcess() {

                $.tool.DataGet2("ExecutionProgress", "Process", $("#NewFeesDueCutSearch").serialize(),
                    function Init() { },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data + ")"); //转换为json对象
                        if (varObjects.rows.length > 0) {
                            var obj = varObjects.rows[0];
                            if (obj.Process < 100) {
                                var value = $('#Divprogressbar').progressbar('getValue');
                                $('#Divprogressbar').progressbar('setValue', obj.Process);

                                $('#divtime').html("正在查询中,请等待，耗时: " + obj.Times + "秒");
                            }
                            else {
                                window.clearInterval(intervalProcess);
                            }
                        }
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                        window.clearInterval(intervalProcess);
                    });
            }
            var beforeLoad = function (param) {

                $("select").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });

                $("input").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });
                var gridOpts = $('#TableContainer').datagrid('getPager').data("pagination").options;

                param.page = gridOpts.pageNumber;
                param.rows = gridOpts.pageSize;
            };

            $('#hiIsSQLData').val("-1");

            LoadList();

            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });

        </script>
        <script type="text/javascript">
            function SelCost() {

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function btnClear_OnClick() {

                $('#ArrearsSubName').val('');

                $('#CostIDs').val('');
                $('#CostNames').searchbox('setValue', '');
            }

            function ExcuteOnServer() {

                $('#hiIsSQLData').val("1");

                LoadList();
                $('#SearchDlg').dialog('close');
            }


            function ToExcel() {
                var strFlag = $('#Flag').val();
                var CostIDs = $('#CostIDs').val();

                location.href = "FeesDebtCutSearchFourCre.aspx?Flag=" + strFlag + "&CostIDs=" + CostIDs
            }

        </script>
    </form>
</body>
</html>
