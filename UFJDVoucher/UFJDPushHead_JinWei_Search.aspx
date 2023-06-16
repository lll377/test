<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDPushHead_JinWei_Search.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDPushHead_JinWei_Search" %>


<!DOCTYPE html>
<html>
<head>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="IsRefer" type="hidden" size="1" name="IsRefer" runat="server" value="1"/>
         <input id="AllData" name="AllData" type="hidden" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" class="Wdate"
                            onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">截止时间</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate" class="Wdate"
                            onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">推送类别</td>
                    <td class="TdContentSearch"><SELECT id="PushSetType" name="PushSetType" runat="server">                                                
                         <OPTION value=""></OPTION>
                       <%-- <OPTION value="1">应收单</OPTION>--%>
                        <OPTION value="2">收款单</OPTION>
					</SELECT></td>
                     <td class="TdTitle">是否推送成功</td>
                    <td class="TdContentSearch"><SELECT id="ResultCode" name="ResultCode" runat="server">                                                
                         <OPTION value=""></OPTION>
                        <OPTION value="1">成功</OPTION>
                        <OPTION value="0">失败</OPTION>
					</SELECT></td>
                </tr>
                <tr>
                   <td class="TdTitle">删除条件</td>
                    <td class="TdContentSearch"><SELECT id="IsDel" name="IsDel" runat="server">
                          <OPTION value="0">未删除</OPTION>
                         <OPTION value="1">标记删除</OPTION>
                         <OPTION value="2">已删除</OPTION>
					</SELECT></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'ChargeModeName', title: '结算方式', width: 100, align: 'left', sortable: true },
                {
                    field: 'PushDate', title: '提交时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('推送明细','" + row.VID + "');\">" + formatDate(row.PushDate, "yyyy-MM-dd HH:mm:ss") + "</a>";

                        if ($("#IsDel").val() == "2") {
                            str = value;
                        }
                        return str;
                    }
                },
                { field: 'PushUserName', title: '提交人', width: 100, align: 'left', sortable: true },
                {
                    field: 'BeginDate', title: '开始时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BeginDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'EndDate', title: '结束时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.EndDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'PushAmount', title: '发生额', width: 80, align: 'left', sortable: true },
                { field: 'PushMemo', title: '备注', width: 100, align: 'left', sortable: true },
                { field: 'VBillNo', title: '单据编号', width: 120, align: 'left', sortable: true },
                { field: 'IsSendName', title: '是否推送', width: 80, align: 'left', sortable: true },
                {
                    field: 'SendDate', title: '推送时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.SendDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'ResultCodeName', title: '是否成功', width: 80, align: 'left', sortable: true },
                { field: 'ResultMessage', title: '返回信息', width: 200, align: 'left', sortable: true , formatter: function (value, row, index) {
                         return "<div style='width:200px;height:100px;overflow-y:auto' >" + row.ResultMessage + "</div>";
                    }
                },

               { field: 'IsDelSendName', title: '是否删除推送', width: 50, align: 'left', sortable: true },
                {
                    field: 'DelSendDate', title: '删除推送时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.DelSendDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'DelResultCodeName', title: '删除是否成功', width: 50, align: 'left', sortable: true },
                { field: 'DelResultMessage', title: '删除返回信息', width: 200, align: 'left', sortable: true , formatter: function (value, row, index) {
                         return "<div style='width:200px;height:100px;overflow-y:auto' >" + row.DelResultMessage + "</div>";
                    }
                }
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
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            //var row = $("#TableContainer").datagrid("getSelected");
                            //if (row != undefined && row != null) {
                            //    DelRecord(row.VID);
                            //}

                            
                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "") {
                                HDialog.Info('请选择记录!');
                            }
                            else {

                                var SelData = JSON.stringify(rows);
                                $('#AllData').val(SelData);

                                HDialog.Prompt('是否删除该项', function () {
                                    $.tool.DataPostChk('frmForm', 'UFJDPushFees_JinWei', 'RecBatchDelete', $('#frmForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');

                                        if (r[0] == "true") {

                                            LoadList();
                                        }
                                        HDialog.Info(r[1]);
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                                });
                            }

                        }
                    }
            ];

            
            function DelRecord(Id) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('UFJDPushFees_JinWei', 'RecDelete', 'VID=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            
                            var varObjects = _Data.split("|");

                            if (varObjects[0] == "true") {
                                HDialog.Info(varObjects[1]);
                            }
                            else { HDialog.Info('删除失败,' + varObjects[1]); }
                            LoadList();


                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,                    
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("UFJDPushFees_JinWei", "LoadRecPushHead", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            LoadList();

            function ViewDetail(title, VID) {
                var w = $(window).width();
                var h = $(window).height()+100;
                HDialog.Open(w, h, '../UFJDVoucher/UFJDPushHead_JinWeiEntryDetail.aspx?VID=' + VID, '推送明细', false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>


