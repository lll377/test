<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" EnableSessionState="ReadOnly" ViewStateEncryptionMode="Never" EnableViewStateMac="false" EnableViewState="false" CodeBehind="NewCostStandardBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewCostStandardBrowse" %>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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



    <script language="javascript" type="text/javascript">
    <!--
    function btnClear_OnClick() {

        document.getElementById('StanName').value = "";
        document.getElementById('CostID').value = "";
        $('#CostNames').searchbox('setValue', '');
        $('#StanName').searchbox('setValue', '');
        $('#StanID').val('');
        $('#hiStanName').val('');

        document.getElementById('hiCostName').value = "";


    }
    function btnSelCost_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            NewFeesDueCutSearch.CostID.value = varObjects[0];
            NewFeesDueCutSearch.CostName.value = varObjects[2];


            return true;
        }

        return false;
    }
    </script>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="hiCorpID" name="hiCorpID" type="hidden" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 12px;" id="hiCustName" class="easyui-text" size="1" type="hidden" name="hiCustName" runat="server" />
        <input style="width: 12px;" id="hiCustName2" class="easyui-text" size="1" type="hidden" name="hiCustName2" runat="server" />
        <input style="width: 12px;" id="hiCostStanDetail" class="easyui-text" size="1" type="hidden" name="hiCostStanDetail" runat="server" />
        <div style="background: #F4F4F4; vertical-align: middle;">

            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td style="width: auto;" align="left" valign="middle">费用项目&nbsp;
             <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                 name="CostNames" runat="server">
                        &nbsp;收费标准&nbsp;
                        <input id="StanName" class="easyui-searchbox"
                            name="StanName" searcher="SelStan" data-options="editable:false" runat="server">
                        &nbsp; 是否允许项目修改标准:  &nbsp;
                        <select id="IsCanUpdate" name="IsCanUpdate" runat="server">
                            <option selected></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                        &nbsp; <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadList();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a>
                    </td>
                </tr>

            </table>
        </div>
        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>


        <input style="width: 8px" id="CostID" class="easyui-validatebox" size="1"
            type="hidden" name="CostID" runat="server" />
        <input style="width: 8px" id="hiStanName" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanName" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <input style="width: 8px" id="StanID" class="easyui-validatebox" size="1"
            type="hidden" name="StanID" runat="server" />
        <input id="StanFormula" style="width: 8px; height: 22px" type="hidden"
            size="1" name="StanFormula" runat="server">
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height() - 30;

                $("#TableContainer").css("height", h + "px");



            }


            InitTableHeight();



            var Columns = [[
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 200 },
                {
                    field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 250, formatter: function (value, row, index) {

                        var StanID = row.StanID;
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ShowDetail('" + StanID + "','" + row.CorpCostID + "','" + row.CorpStanID + "','" + row.IsCanUpdate + "');\">" + row.StanName + "</a>";
                        return str;
                    }
                },
                { field: 'StanFormulaName', title: '计算方式', align: 'left', sortable: true, width: 100 },
                { field: 'StanAmount', title: '通用收费标准', align: 'left', sortable: true, width: 100 },
                { field: 'StanExplain', title: '标准说明', align: 'left', sortable: true, width: 300 },
                { field: 'StanEndHit', title: '标准状态', align: 'left', sortable: true, width: 100 },
                { field: 'DelinRates', title: '违约金比例', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsCanUpdate', title: '是否允许项目修改', align: 'left', sortable: true, width: 100, formatter: function (val, row, index) {

                        return row.IsCanUpdate == 1 ? "是" : "否";
                    }
                }
            ]];


            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostID').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function SelStan() {
                var tmpCostID = $('#CostID').val();
                if (tmpCostID == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    return;
                }
                var conent = "../dialogNew/NewStanDlg.aspx?CostID=" + tmpCostID;
                HDialog.Open('700', '400', conent, '收费标准选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var data = JSON.parse(_Data);
                        $('#StanID').val(data.StanID);
                        $('#StanName').searchbox('setValue', data.StanName);
                        $('#hiStanName').val(data.hiStanName);
                    }
                });
            }
            var Columns2 = [[
                { field: 'StartCondition', title: '开始条件', align: 'left', sortable: true, width: 100 },
                { field: 'EndCondition', title: '结束条件', align: 'left', sortable: true, width: 100 },
                { field: 'CondStanAmount', title: '收费标准', align: 'left', sortable: true, width: 200 },
                { field: 'IsFixName', title: '标准性质', align: 'left', sortable: true, width: 200 }
            ]];


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
            };


            function ShowDetail(stanID, CorpCostID, CorpStanID, IsCanUpdate) {

                var w = $(window).width();
                var h = $(window).height();

                if ($('#hiCorpID').val() == '2158') {
                    if (IsCanUpdate == '1') {
                        HDialog.Open(w, h, '../ChargesNew/CorpCostStandardManage.aspx?CorpCostID=' + CorpCostID + '&CorpStanID=' + CorpStanID + '&OpType=edit', '项目标准设置', false, function callback(_Data) {
                            if (_Data != "") {
                                LoadList();
                            }
                        });
                    } else {
                        HDialog.Open(w, h, '../ChargesNew/CostStandardManage.aspx?OpType=edit&StanID=' + stanID, '项目标准设置', false, function callback(_Data) {
                            if (_Data != "") {
                                LoadList();
                            }
                        });
                    }
                } else {
                    HDialog.Open(w, h, '../ChargesNew/CostStandardManage.aspx?OpType=edit&StanID=' + stanID, '项目标准设置', false, function callback(_Data) {
                        if (_Data != "") {
                            LoadList();
                        }
                    });
                }
            }
            function LoadList(page, rows) {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Columns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CostStanSeach", "CostStandard", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = 1;

            }

            document.getElementById('hiIsSQLData').value = 1;
            LoadList();



        </script>


    </form>
</body>
</html>
