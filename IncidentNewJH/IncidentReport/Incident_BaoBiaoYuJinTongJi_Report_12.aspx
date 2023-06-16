<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Incident_BaoBiaoYuJinTongJi_Report_12.aspx.cs" Inherits="M_Main.IncidentNewJH.Incident_BaoBiaoYuJinTongJi_Report_12" %>

<!DOCTYPE html>

<html>
<head>
    <title>报事预警统计</title>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../../jscript/export.js"></script>


    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 250px;
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
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" value="" type="hidden" runat="server" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server">
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">预警岗位
                    </td>
                    <td class="TdContent" colspan="3">
                        <input type="text" id="RoleNameList" name="RoleNameList" class="easyui-searchbox" style="width: 91.7%;" data-options="editable:false" searcher="SelRoleName" runat="server" />
                        <input type="hidden" id="RoleCodeList" name="RoleCodeList" runat="server">
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <%--               <input type="text" id="BeginIncidentDate" name="BeginIncidentDate" style="width: 150px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" class="Wdate"
                            format="date" />--%>
                        <input id="BeginIncidentDate" name="BeginIncidentDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <%--  <input type="text" id="EndIncidentDate" name="EndIncidentDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />--%>
                        <input id="EndIncidentDate" name="EndIncidentDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <%--          <input type="text" id="BeginReserveDate" name="BeginReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />--%>
                        <input id="BeginReserveDate" name="BeginReserveDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />

                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <%--          <input type="text" id="EndReserveDate" name="EndReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />--%>
                        <input id="EndReserveDate" name="EndReserveDate" type="text" runat="server" style="width: 150px;" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>

    </form>
</body>
</html>

<script type="text/javascript">

    function SelRoleName() {
        HDialog.Open('650', '500', '../DialogNew/SysCheckRoleDlg.aspx?IsCheck=1', '选择预警岗位', false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            $("#RoleCodeList").val(arrRet.id);
            $("#RoleNameList").searchbox("setText", arrRet.text);
        });
    }
    function SelCommInfo() {
        if ($('#hCommID').val() == '') {
            var w = $(window).width() * 0.7;
            HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommIDs").val(arrRet.id);
                $("#CommNames").val(arrRet.name);
            });
        }
    }

    function Clear() {
        $("#CostIDs").val("");
        $("#CostNames").val("");
    }

    function InitFunction() {
        var h = $(window).height();
        //$('#SelClass').val(2);

        $("#TableContainer").css("height", h + "px");
    }
    InitFunction();
    var frozenColumns = [[
        { field: '区域', title: '区域', width: 100, align: 'left', sortable: true },
        { field: '项目', title: '项目', width: 100, align: 'left', sortable: true },
        { field: '预警岗位', title: '预警岗位', width: 100, align: 'left', sortable: true },
    ]];

    var column = [[
        { field: '分派超时量', title: '分派超时量', width: 100, align: 'left', sortable: true },
        { field: '接单超时量', title: '接单超时量', width: 100, align: 'left', sortable: true },
        { field: '处理超时量', title: '处理超时量', width: 100, align: 'left', sortable: true },
        { field: '关闭超时量', title: '关闭超时量', width: 100, align: 'left', sortable: true }
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
                window.location.href = 'Incident_BaoBiaoYuJinTongJi_Report_12_Excel.aspx';
            }
        }
    ];

    var ProgressInterval;

    function SearchData() {

        if ($("#OrganCode").val() != "01") {
            if ($("#CommIDs").val() == "") {
                HDialog.Info("请选择需要统计的小区");
                return;
            }
        }
        $("#SearchDlg").dialog("close");
        //启动任务
        StartTask();
        //展示进度
        ShowProgress();
        //获取执行情况进度
        ProgressInterval = setInterval("TakeProgress()", 1000);
    }
    $('#hiIsSQLData').val('1');
    function StartTask() {
        //启动一个任务
        $.tool.DataPostNoLoading('Incident_BaoBiaoYuJinTongJi_Report_12', 'StartTask', $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                LoadData();
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    //加载数据
    function LoadData() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: true,
            pageSize: 100,
            pageList: [100, 200, 500],
            columns: column,
            fitColumns: false,
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            frozenColumns: frozenColumns,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Incident_BaoBiaoYuJinTongJi_Report_12", "LoadCorpData", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                $("#SearchDlg").dialog("close");
            },
        });

    }

    function Export(strXlsName, exportGrid) {
        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
        var l = $('<input type="hidden" id="txtName" name="txtName" />');
        i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
        i.appendTo(f);
        l.val(strXlsName);
        l.appendTo(f);
        f.appendTo(document.body).submit();
        document.body.removeChild(f);
    }

    //初始化加载数据
    LoadData();

    //TakeProgress();
    ////展示进度
    //ShowProgress();
    ////获取执行情况进度
    //ProgressInterval = setInterval("TakeProgress()", 1000);

    //获取进度
    function TakeProgress() {
        $.tool.DataPostNoLoading('Incident_BaoBiaoYuJinTongJi_Report_12', 'TakeProgress', $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                var Obj = JSON.parse(_Data);
                console.log(Obj)
                
                if (_Data == '[]') {
                    LoadData();
                    CloseProgress();
                }
                else {
                    SetProgress(Obj);

                    if (Obj[0].Curr == '100') {
                        $('#hiIsSQLData').val('1');
                        LoadData();

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
        $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
        $('#DivMsg').html(Obj[0].MessageInfo);
    }
</script>
