<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommActivityList.aspx.cs" Inherits="M_Main.CommActivity.CommActivityList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>获取社区活动列表</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/score/socre.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        td {
            line-height: 25px;
        }

        .TdTitle {
            width: 12%;
        }

        .TdContent input[type="text"] {
            border: 1px solid #cccccc;
            height: 16px;
            line-height: 16px;
            width: 80%;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="SponsorCustId" type="hidden" name="SponsorCustId" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden; width: 640px; height: 300px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">活动类别</td>
                    <td class="TdContent">
                        <select id="ActivityCategory" class="easyui-combobox" name="ActivityCategory" runat="server" data-options="editable:false" style="cursor: pointer"></select>
                    </td>
                    <td class="TdTitle">活动主题</td>
                    <td class="TdContentSearch">
                        <input id="ActivityTheme" class="easyui-textbox" type="text" name="ActivityTheme" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContentSearch">
                        <input id="Sponsor" class="easyui-searchbox" type="text" name="Sponsor" data-options="searcher:SelSponsor, prompt:'请选择发起人', editable:false" />
                    </td>
                    <td class="TdTitle">是否收费</td>
                    <td class="TdContent">
                        <select id="IsCharge" class="easyui-combobox" name="IsCharge" runat="server" data-options="editable:false" panelheight='auto'></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否线上报名</td>
                    <td class="TdContent">
                        <select id="IsOnlineRegistr" class="easyui-combobox" name="IsOnlineRegistr" runat="server" data-options="editable:false" panelheight='auto'></select>
                    </td>
                    <td class="TdTitle">是否审核通过</td>
                    <td class="TdContent">
                        <select id="IsApproved" class="easyui-combobox" name="IsApproved" runat="server" data-options="editable:false" panelheight='auto'></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否关闭显示</td>
                    <td class="TdContent">
                        <select id="IsCloseDisplay" class="easyui-combobox" name="IsCloseDisplay" runat="server" data-options="editable:false" panelheight='auto'></select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="SearchContainer" id="TableContainer"></div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                InitFunction();
            });

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                LoadList();
            }

            function SelSponsor() {
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open($(window).width(), $(window).height(), conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#Sponsor').searchbox("setValue", data.CustName);
                    $('#SponsorCustId').val(data.CustID);
                });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail('Add', '');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        $.messager.confirm('确定', '是否删除该项', function (r) {
                            if (r) {
                                $.tool.DataGet('CommActivityNew', 'DeleteCommActivity', 'ActivitiesId=' + row.ActivitiesId,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var result = JSON.parse(_Data);
                                        HDialog.Info(result.Message);
                                        if (result.Code == 200 && result.IsSuccess) {
                                            LoadList();
                                        }
                                        if (result.Code == 500) {
                                            console.log(result.ErrorMessage);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ]
            var column = [
                [

                    { field: 'ck', checkbox: true },
                    { width: 150, align: 'center', field: 'ActivitiesCategoryName', title: '活动类别' },
                    {
                        width: 220, align: 'center', field: 'ActivitiesTheme', title: '活动主题',
                        formatter: function (value, row, index) {
                            var optType = row.IsEnd == 1 ? 'View' : 'Edit';
                            var str = "<a class=\"HrefStyle\"  href='javascript:void(0);' onclick=\"ViewDetail('" + optType + "','" + row.ActivitiesId + "');\">" + row.ActivitiesTheme + "</a>";
                            return str;
                        }
                    },
                    { width: 150, align: 'center', field: 'ActivitiesStartDate', title: '活动开始时间' },
                    { width: 150, align: 'center', field: 'ActivitiesEndDate', title: '活动结束时间' },
                    { width: 150, align: 'center', field: 'CustName', title: '发起人' },
                    { width: 100, align: 'center', field: 'IsCharge_Text', title: '是否收费' },
                    { width: 100, align: 'center', field: 'IsOnlineRegistr', title: '是否线上报名' },
                    { width: 100, align: 'center', field: 'IsApproved_Text', title: '是否审核通过' },
                    {
                        width: 100, align: 'center', field: 'RegistrCount', title: '报名户数',
                        formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\"  href='javascript:void(0);' onclick=\"ViewPersonList('" + row.ActivitiesId + "');\">" + value + "</a>";
                            return str;
                        }
                    },
                    { width: 100, align: 'center', field: 'SignUpCount', title: '报名人数' },
                    { width: 100, align: 'center', field: 'JoinCount', title: '参加人数' },
                    {
                        width: 100, align: 'center', field: 'ActivityType', title: '活动状态',
                        formatter: function (value, row, index) {
                            var str = "<span style='color:red;'>" + value + "</span>";
                            return str;
                        }
                    },
                    { width: 100, align: 'center', field: 'LimitType', title: '是否满员' },
                    {
                        width: 200, align: 'center', field: 'OverallRating', title: '综合评分',
                        formatter: function (value, row, index) {
                            if (isNaN(value)) {
                                value = 0.0;
                            }
                            return value;
                            var str = '';
                            if (parseFloat(value) == 0) {
                                str = '<div class="iconfont star-five"><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><b>' + value + '分</b></div>';
                            } else {
                                var obj = value.split('.');
                                var integral = obj[0];
                                var incomplete = obj[1];
                                if (incomplete > 0 && incomplete <= 4) {
                                    str = '<div class="iconfont star-five incomplete1">';
                                } else if (incomplete == 5) {
                                    str = '<div class="iconfont star-five incomplete2">';
                                } else if (incomplete == 6) {
                                    str = '<div class="iconfont star-five incomplete3">';
                                } else if (incomplete == 7) {
                                    str = '<div class="iconfont star-five incomplete4">';
                                } else if (incomplete == 8) {
                                    str = '<div class="iconfont star-five incomplete5">';
                                } else if (incomplete == 9) {
                                    str = '<div class="iconfont star-five incomplete6">';
                                }
                                for (var i = 0; i < integral; i++) {
                                    str += '<span class="integral">&#xe634;</span>';
                                }
                                var lenght = 5 - integral - 1;
                                if (incomplete > 0) {
                                    str += '<span data-content="&#xe634;">&#xe634;</span>';
                                } else {
                                    lenght += 1;
                                }

                                for (var i = 0; i < lenght; i++) {
                                    str += '<span>&#xe634;</span>';
                                }
                                str += '<b>' + value + '分</b></div>';
                            }
                            return str;
                        }
                    },
                    { width: 100, align: 'center', field: 'IsCloseDisplay_Text', title: '是否关闭显示' }
                ]
            ];

            //加载数据
            function LoadList() {
                $("#SearchDlg").dialog("close");
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {

                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CommActivityNew", "CommActivityList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            function ViewDetail(optType, activitiesId) {
                var w = window.innerWidth;
                var h = window.innerHeight;
                var url = '../CommActivity/CommActivityDetail.aspx?OptType=' + optType + "&ActivitiesId=" + activitiesId;

                var title = '';
                if (optType == 'Add')
                    title = '添加社区活动';
                else if (optType == 'Edit')
                    title = '修改社区活动';
                else if (optType == 'View')
                    title = '查看活动详情';

                HDialog.Open(w, h, url, title, false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function ViewPersonList(activitiesId) {
                var w = window.innerWidth;
                var h = window.innerHeight;
                var url = '../CommActivity/CommActivityPersonList.aspx?ActivitiesId=' + activitiesId;

                HDialog.Open(w, h, url, '人员登记列表', false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>
