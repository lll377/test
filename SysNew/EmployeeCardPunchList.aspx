<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCardPunchList.aspx.cs" Inherits="M_Main.SysNew.EmployeeCardPunchList" %>

<!DOCTYPE html>

<html>
<head>
    <title>打卡明细</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>


    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 450px;
            height: 100px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 20%;
            }

            .SearchTable .TdContent {
                width: 30%;
            }

        #SearchDlg .TdTitle {
            width: 14%;
            text-align: left;
        }

        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td class="TdTitle">人员名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" class="easyui-validatebox" style="width: 80.7%;" runat="server" />
                    </td>
                    <td class="TdTitle">员工状态</td>
                    <td class="TdContent">
                        <select id="EmployeeStatus" name="EmployeeStatus" runat="server">
                            <option value="" selected>全部</option>
                            <option value="在线">在线</option>
                            <option value="离线">离线</option>
                        </select></td>
                </tr>
                <tr style="height: 10px;">
                </tr>
                <tr>
                    <td class="TdTitle">打卡时间从
                    </td>
                    <td class="TdContent">
                        <%--<input id="BegDate" name="BegDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />--%>
                        <input type="text" class="Wdate"  style="width: 150px;" onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="BegDate" runat="server" name="BegDate" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <%--<input id="EndDate" name="EndDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />--%>
                        <input type="text" class="Wdate"  style="width: 150px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M-01 23:59:59', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="EndDate" name="EndDate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">查询</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

    </form>
</body>
</html>

<script type="text/javascript">


    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }
    InitFunction();
    var frozenColumns = [[
        { field: 'DepName', title: '组织机构', width: 100, align: 'left', sortable: true },
    ]];

    var column = [[
        { field: 'UserName', title: '人员名称', width: 100, align: 'left', sortable: true },
        { field: 'LoginCode', title: '登录账号', width: 100, align: 'left', sortable: true },
        { field: 'OperateTime', title: '打卡时间', width: 100, align: 'left', sortable: true },
        { field: 'OnlineStateValue', title: '当前状态', width: 100, align: 'left', sortable: true },
        { field: 'Location', title: '当前位置', width: 100, align: 'left', sortable: true }
    ]];


    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-filter',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"));
                $('#SearchDlg').dialog('open');
            }
        }, '-',
        {
            text: 'Excel导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = 'EmployeeCardPunchList_Excel.aspx?' + $('#frmForm').serialize();
            }
        }
    ];

    //加载数据
    function LoadData() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: true,
            pageSize: 100,
            pageList: [100, 200, 500],
            columns: column,
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            frozenColumns: frozenColumns,
            fitColumns: true,  //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("EmployeeCardPunch", "GetEmployeeCardPunchList", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                $("#SearchDlg").dialog("close");
            },
        });

    }

    //初始化加载数据
    LoadData();

</script>
