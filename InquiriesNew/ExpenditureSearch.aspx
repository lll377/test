<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpenditureSearch.aspx.cs" Inherits="M_Main.InquiriesNew.ExpenditureSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <script type="text/javascript">

        function SelMultiUser() {
            var N = $("#UserNames").val();
            var C = $("#UserCodes").val();
            HDialog.Open('800', '600', '../DialogNew/MultiUserDlg.aspx?SelUserName=' + N + '&SelUserCode=' + C, '选择人员', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = _Data.split(';');

                    $("#UserCodes").val(varObjects[1]);
                    $("#UserNames").searchbox("setValue", varObjects[0]);
                }
            });
        }

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

        function SelCost() {

            HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("\t");

                    $('#CostIDs').val(varObjects[0]);
                    $('#CostNames').searchbox('setValue', varObjects[1]);

                }
            });
        }

        function SelCommInfo() {
            if ($('#hiCommID').val() != '') {
                return;
            }
            else {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var json = JSON.parse(_Data);
                    $("#CommIDs").val(json.id);
                    $("#CommNames").searchbox("setText", json.name);
                });
            }
        }

    </script>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="BuildSNums" type="hidden"
            size="1" name="BuildSNums" runat="server" /><input id="hiBuildNames" type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />


        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 200px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input id="CommNames" searcher="SelCommInfo" name="CommNames" class="easyui-searchbox" data-options="editable:false" runat="server" />
                        <input id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server" />
                    </td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用起始年月</td>
                    <td colspan="3" class="TdContentSearch">
                        <input class="easyui-datetimebox" onclick="WdatePicker({ dateFmt: 'yyyy-MM' })" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM' })" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">收费起始日期</td>
                    <td colspan="3" class="TdContentSearch">
                        <input class="easyui-datetimebox" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" id="ChargeBeginDate" name="ChargeBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" class="easyui-datetimebox" id="ChargeEndDate" name="ChargeEndDate" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">收款人</td>
                    <td class="TdContentSearch">
                        <input name="UserNames" id="UserNames" class="easyui-searchbox" searcher="SelMultiUser" data-options="editable:false" runat="server" />
                        <input name="UserCodes" type="hidden" id="UserCodes" />
                    </td>
                   <%-- <td class="TdTitle">收款方式</td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected></option>
                        </select>
                    </td>--%>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td colspan="3" class="TdContentSearch">
                        <input name="CostNames" id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ConfirmOnClick(); ">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
            type="hidden" name="StanIDs" runat="server" />
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanNames" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

            }

            InitTableHeight();

            var column = [[

                { field: 'CostName', title: '统计类别', align: 'left', sortable: true, width: 150 },
                { field: '总户数', title: '总户数', align: 'left', sortable: true, width: 150 },
                { field: 'RefundAllAmount', title: '付款金额', align: 'left', sortable: true, width: 100 }
            ]];


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
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ToExcel();
                    }
                }
            ];

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }


            function setIsSQLData() {
                $('#ExcelDc').linkbutton('enable');
                document.getElementById('hiIsSQLData').value = 1;
            }


            function ConfirmOnClick() {
                document.getElementById('hiIsSQLData').value = 1;
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('IncomeExpenditure', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    toolbar: toolbar,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncomeExpenditure", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('IncomeExpenditure', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {

                            LoadList(1, 50);
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadList(1, 50);
                                CloseProgress();
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                var i = parseInt(Obj[0].Curr);
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
            
            LoadList();
            document.getElementById('hiLoadFeesPaid').value = 1;
            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });


            function ToExcel() {
                window.location.href = "../InquiriesNew/ExpenditureSearchCre.aspx";
            }

        </script>
    </form>
</body>
</html>
