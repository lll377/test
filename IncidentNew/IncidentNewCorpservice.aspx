<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentNewCorpservice.aspx.cs" Inherits="M_Main.IncidentNew.IncidentNewCorpservice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公司级报事服务费统计</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/export.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #CostNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
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
    <form id="IncidentSeach">

        <input id="HidTypeCode" name="HidTypeCode" value="" type="hidden" />
        <input id="hidTypeName" name="hidTypeName" value="" type="hidden" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" class="easyui-datagrid"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table>
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="CommName" class="easyui-searchbox"  searcher="SelCommInfo" data-options="editable:false" name="CommName" runat="server" />
                        <input id="hiCommName" type="hidden" name="hiCommName" runat="server" />
                        <input id="CommID" type="hidden" name="CommID" runat="server" />

                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" data-options="editable:false"
                            style="width: 144px;" searcher="SelTypeName" runat="server" />
                        <input id="TypeID" name="TypeID" type="hidden" runat="server" />
                    </td>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="DrClass" name="DrClass" runat="server" width="144px"></select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContentSearch">
                        <select id="IncidentSource" style="width: 154px;" name="IncidentSource" runat="server">
                            <option value="" selected="selected">全部</option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置
                    </td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事责任
                    </td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" runat="server" style="width: 154px;">
                            <option value="" selected="selected">全部</option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentBeginDate" name="IncidentBeginDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default', alwaysUseStartDate: true })" class="Wdate" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentEndDate" name="IncidentEndDate" style="width: 140px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ startDate: '%y-%M-%d 23:59:59', dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default', alwaysUseStartDate: true })" format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginReserveDate" name="BeginReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndReserveDate" name="EndReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            function SelCommInfo() {
                if ($('#hCommID').val() == '') {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setText", arrRet.name);
                    });
                }
            }

            function SelTypeName() {
                //HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsClosed=1', '选择报事类别', true, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    $("#HidTypeCode").val(arrRet.code);
                //    $("#hidTypeName").val(arrRet.text);
                //    $("#TypeName").searchbox("setValue", arrRet.text);
                //});

                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#HidTypeCode").val(arrRet.code);
                    $("#hidTypeName").val(arrRet.text);
                    $("#TypeName").searchbox("setValue", arrRet.text);
                    $("#TypeID").val(arrRet.id);
                });
            }

            function Clear() {
                $("#TypeName").val("");
                $("#CommID").val("");

                $("#hidTypeName").val("");
                $("#HidTypeCode").val("");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            var column = [[
                { field: 'OrganName', title: '区域', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: 'CommName', title: '项目', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '报事类别', title: '报事类别', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '原因细类', title: '原因细类', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: 'IncidentID', title: '有偿服务工单数量', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: 'DebtsAmount', title: '有偿服务费用金额', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '已收费数量', title: '已收费数量', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '已收费金额', title: '已收费金额', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '未收费数量', title: '未收费数量', fixed: true, align: 'left', sortable: true, width: 120 },
                { field: '未收费金额', title: '未收费金额', fixed: true, align: 'left', sortable: true, width: 120 }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
                , '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('报事费用统计', $('#TableContainer'));
                        }
                    }
                }
            ];

            var ProgressInterval;
            function Search() {
                if ($("#CommID").val() == "") {
                    HDialog.Info("请选择需要统计的小区");
                    return;
                }

                //if ($("#HidTypeCode").val() == "") {
                //    HDialog.Info("请选择需要统计的报事类别");
                //    return;
                //}
                if ($("#ChargeStartDate").val() == "" || $("#ChargeStartDate").val() == "") {
                    HDialog.Info("日期不能为空");
                    return;
                }

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

            function LoadData() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CSCustInfo", "incidentnewcorpserviceLoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('CSCustInfo', 'incidentnewcorpserviceStartTask', $('#IncidentSeach').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }




            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable(exportGrid, column));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                //document.body.removeChild(f);
            }

            //初始化加载数据
            LoadData();

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('CSCustInfo', 'incidentnewcorpserviceTakeProgress', $('#IncidentSeach').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
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
    </form>
</body>
</html>
