<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentWorkingHoursAudit.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentWorkingHoursAudit" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body style="overflow-y: auto">
    <form id="frmForm" runat="server">
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server">
        <input type="hidden" id="SearchResult" name="SearchResult" runat="server" />
        <table id="Header_TableMain" class="DialogTable" style="width: 100%; height: 100%;">
            <tr>
                <td valign="top">
                    <table style="width: 100%; height: 100%; line-height: 30px">
                        <tbody>
                            <tr>
                                <td class="TdTitle">额定工时（小时）</td>
                                <td class="TdContent">
                                    <input type="text" id="RatedWorkHour" name="RatedWorkHour" runat="server" />
                                </td>
                                <td class="TdTitle">绩效系数</td>
                                <td class="TdContent">
                                    <input type="text" id="KPIRatio" name="KPIRatio" runat="server" readonly />
                                </td>
                            </tr>
                            <tr>

                                <td class="TdTitle">实际工时（小时）</td>
                                <td class="TdContent">
                                    <input type="text" id="ActualWorkHour" name="ActualWorkHour" runat="server" readonly />
                                </td>
                                <td class="TdTitle">处理人数</td>
                                <td class="TdContent">
                                    <input type="text" id="HandlePeopleNum" name="HandlePeopleNum" runat="server" readonly />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">有偿服务费用</td>
                                <td class="TdContent">
                                    <input type="text" id="DueAmount" name="DueAmount" runat="server" readonly />
                                </td>
                            </tr>
                            <tr>

                                <td class="TdTitle">审核人</td>
                                <td class="TdContent">
                                    <input type="text" id="AuditUser" name="AuditUser" runat="server" readonly />
                                </td>
                                <td class="TdTitle">审核时间</td>
                                <td class="TdContent">
                                    <input type="text" id="AuditDate" name="AuditDate" runat="server" readonly />
                                </td>
                            </tr>

                            <%--                            <tr>
                                <td class="TdContent" style="width: 80px; height: 40px"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="DialogTdSubmit" style="text-align: center">
                                    <input type="button" class="button" value="保存" id="BtnSave" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="button" class="button" value="放弃返回" id="BtnReturn" />
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>

        <table class="DialogTable" style="width: 100%; height: 100%;">
            <tr>
                <td valign="top">
                    <table style="width: 100%; height: 100%; line-height: 30px">
                        <tbody>
                            <tr>
                                <td class="TdContent" style="width: 80px; height: 40px"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="DialogTdSubmit" style="text-align: center">
                                    <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="button" class="button" value="放弃返回" id="BtnReturn" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            var editrows = [];
            var editIndex = undefined;

            $("#BtnSave").click(function () {
                $('#TableContainer').datagrid('acceptChanges');
                var rows = $('#TableContainer').datagrid('getData').rows;
                $('#SearchResult').val(JSON.stringify(rows));

                $.tool.DataPostAsync('IncidentCheckPost', 'WorkingHoursAudit', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == 'true') {
                            close();
                            HDialog.Info('操作成功');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    }, false);
            });

            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close();
            }

            function InitFunction() {
                var h = $(window).height() - 420;
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                { field: 'PeopleType', title: '人员类别', align: 'center', width: 50, sortable: true },
                { field: 'PeopleName', title: '人员名称', width: 150, align: 'center', sortable: true },
                { field: 'ActualWorkHour', title: '实得工时', align: 'center', width: 150, sortable: true, editor: { type: 'validatebox' } },
                { field: 'DueAmount', title: '实得费用', align: 'center', width: 150, sortable: true, editor: { type: 'validatebox' } }
            ]];

            $("#TableContainer").datagrid({
                nowrap: true,
                pageSize: 50,
                pageList: [50, 150, 300],
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                border: false,
                showFooter: true,
                striped: true,
                remoteSort: false,
                onDblClickRow: function (rowIndex, rowData) {
                    if (editIndex != undefined) {
                        $(this).datagrid('endEdit', editIndex);
                    }
                    $(this).datagrid('beginEdit', rowIndex);
                }
            });


            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());

            //加载数据
            $('#TableContainer').datagrid('loadData', Rows);
        </script>

    </form>
</body>
</html>
