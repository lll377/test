<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrearsReasonSearch.aspx.cs" Inherits="M_Main.CorpCostStatistNew.ArrearsReasonSearch" %>

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

        function SelCost() {
            HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                var varReturn = _data;
                if (varReturn != "") {//**获得返回 刷新
                    var varObjects = varReturn.split("\t");
                    $('#CorpCostIDs').val(varObjects[0]);
                    $('#CostNames').searchbox('setValue', varObjects[1]);
                }
            });
        }

        function SelCommInfo() {
            if ($('#hiCommID').val() != '0') {
                return;
            }
            else {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }
        }

    </script>
    <style>
        #CostNames {
            width: 550px;
            height: 30px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 550px;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 200px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle" style="width: 200px;">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="hiCommNames" type="hidden" name="hiCommNames" runat="server">
                        <input id="CommIDs" type="hidden" name="CommIDs" runat="server">
                        <input id="hiCommID" type="hidden" name="hiCommID" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用期间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" id="EditBeginDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" name="EditBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" runat="server" style="width: 163px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" /></td>
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

        <input style="width: 8px" id="CorpCostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CorpCostIDs" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

            }
            InitTableHeight();

            var column = [[
                { field: 'OrganName', title: '区域名称', align: 'left', sortable: true, width: 200 },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 200 },
                { field: 'ArrearsReason', title: '欠费原因', align: 'left', sortable: true, width: 150 },
                { field: 'ArrearsNum', title: '欠费户数', align: 'left', sortable: true, width: 150 },
                { field: 'ArrearsAmount', title: '欠费金额', align: 'left', sortable: true, width: 100 },
                { field: 'ArrearsRate', title: '金额占比', align: 'left', sortable: true, width: 100 }
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
                //, '-',
                //{
                //    text: 'Excel导出',
                //    iconCls: 'icon-page_white_excel',
                //    handler: function () {
                //        ToExcel();
                //    }
                //}
            ];

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }


            function ConfirmOnClick() {
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
                $.tool.DataPostNoLoading('ArrearsReason_NEW', 'StartTask_Corp', $('#NewFeesDueCutSearch').serialize(),
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
                    //fitColumns: true,
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
                        param = $.JQForm.GetParam("ArrearsReason_NEW", "CorpLoadData", "TableContainer", param);
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
                $.tool.DataPostNoLoading('ArrearsReason_NEW', 'TakeProgress_Corp', $('#NewFeesDueCutSearch').serialize(),
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
            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });


            function ToExcel() {
                window.location.href = "../CorpCostStatistNew/ExpenditureSearchCre.aspx";
            }

        </script>
    </form>
</body>
</html>
