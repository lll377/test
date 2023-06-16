<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewIncidentEmployeeKPIStatistics.aspx.cs" Inherits="M_Main.IncidentNewJH.NewIncidentEmployeeKPIStatistics" %>


<!DOCTYPE html>

<html>
<head>
    <title>报事绩效统计</title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/export.js" type="text/javascript"></script>


    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
 
            height: 350px;
 
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

        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #TypeName {
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
        <input id="hiIsSQLData" name="hiIsSQLData" value="" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
            size="1" name="hiCommNames" runat="server">
        <input id="CommIDs" style="width: 8px; height: 22px" type="hidden"
            size="1" name="CommIDs" runat="server">
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />


        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" class="easyui-datagrid"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();" style="width: 90%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="TypeName" name="TypeName" onclick="SelTypeName();" style="width: 90%;"></textarea>
                        <input id="TypeID" name="TypeID" type="hidden" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="DrClass" runat="server" width="144px"></select>
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
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">人员姓名
                    </td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="UserName" name="UserName" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentBeginDate" name="IncidentBeginDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentEndDate" name="IncidentEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">预约处理时间
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate1" name="ReserveDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate2" name="ReserveDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">完成时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="MainStartEndDate" name="MainStartEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="MainEndEndDate" name="MainEndEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                </tr>
                  <tr>
                    <td class="TdTitle">岗位</td>
                    <td class="TdContent">
                        <input type="text" id="PostInfo" name="PostInfo" runat="server" onclick="SelRole()" class="easyui-validatebox" readonly />
                        <input type="hidden" id="RoleCode" name="RoleCode" runat="server" />
                    </td>
                    <td class="TdTitle">报事位置</td>
                    <td class="TdContent">
                        <select id="Position" name="Position" style="width: 35%;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value="" selected="selected">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
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
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }
 
            function SelRole() {

                //HDialog.Open('500', '500', '../DialogNew/SelCommRoleInfo.aspx', '选择通用岗位', true, function callback(_Data) {
                //    console.log(_Data)
                //    var arrRet = JSON.parse(_Data);
                //    $("#RoleCode").val(arrRet.id);
                //    $("#PostInfo").val(arrRet.name);

                //})
                HDialog.Open('500', '500', '../DialogNew/SelCommRoleBS.aspx', '选择通用岗位', true, function callback(_Data) {
                    //var arrRet = _Data.split(',');
                    //$("#RoleCode").val(arrRet[0]);
                    //$("#PostInfo").val(arrRet[1]);

                    //var Obj = JSON.parse(_Data);
                    //$("#RoleCode").val(Obj.attributes.InPopedom);
                    //$("#PostInfo").searchbox("setValue", Obj.text);

                    var arrRet = JSON.parse(_Data);
                    $("#RoleCode").val(arrRet.id);
                    $("#PostInfo").val(arrRet.name);


                });
            }
 
            function SelTypeName() {
                HDialog.Open('650', '500', '../DialogNew/CorpBigIncidentTypeDlg.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', true, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").val(arrRet.text);
                });
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();



            var column = [[
                {
                    field: 'OrganName', width: 100, title: '区域', align: 'left',
                },
                {
                    field: 'CommName', width: 100, title: '项目', align: 'left',
                },
                { field: 'UserName', title: '人员姓名', width: 150, align: 'left', sortable: true },
                { field: 'PostInfo', title: '岗位', width: 150, align: 'left', sortable: true },
                { field: 'HappenNum', title: '报事接单量', width: 150, align: 'left', sortable: true },
                { field: 'FinishNum', title: '报事完成量', width: 150, align: 'left', sortable: true },
                { field: 'RegularFinishNum', title: '按期完成量', width: 150, align: 'left', sortable: true },
                {
                    field: 'RegularFinishPercentage', title: '按期完成率%', width: 150, align: 'left', sortable: true
                },
                { field: 'DealHour', title: '处理总工时(分钟)', width: 150, align: 'left', sortable: true },
                { field: 'FinishHour', title: '完成总工时(分钟)', width: 150, align: 'left', sortable: true },
                {
                    field: 'ResponseHourAverage', title: '平均响应时长/单(分钟)', width: 150, align: 'left', sortable: true
                },
                {
                    field: 'DealHourAverage', title: '平均处理时长/单(分钟)', width: 150, align: 'left', sortable: true
                },
                {
                    field: 'WorkHour', title: '额定工时（小时）', width: 150, align: 'left', sortable: true, formatter: function (value, rowData, rowIndex) {
                        return value;
                    }
                },
                { field: 'KPIPercent', title: '绩效分数', width: 100, align: 'left', sortable: true },
                { field: 'DueAmount', title: '有偿服务费用', width: 100, align: 'left', sortable: true }
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
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('没有数据');
                        }
                        else {
                            Export('人员绩效统计表', $('#TableContainer'));
                        }
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


            //加载数据
            function LoadData() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    //frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("JHNewIncidentReport9", "LoadCorpData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });

            }


            $('#hiIsSQLData').val('1');
            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('JHNewIncidentReport9', 'StartTask', $('#frmForm').serialize(),
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
                $.tool.DataPostNoLoading('JHNewIncidentReport9', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            CloseProgress();
                            LoadData();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                CloseProgress();

                                LoadData();
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
