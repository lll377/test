<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommActivityPersonList.aspx.cs" Inherits="M_Main.CommActivity.CommActivityPersonList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>获取人员登记列表</title>
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
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="ActivitiesId" type="hidden" name="ActivitiesId" value="" runat="server" />

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

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail('Add', '', $("#ActivitiesId").val());
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        ViewDetail('Edit', row.ActivitiesPersonId, row.ActivitiesId);
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
                                $.tool.DataGet('CommActivityNew', 'DeleteCommActivityPerson', 'ActivitiesPersonId=' + row.ActivitiesPersonId,
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
                    text: 'Excel导出',
                    iconCls: 'icon-filter',
                    handler: function () {
                        var activitiesId = $("#ActivitiesId").val();
                        window.open("../CommActivity/CommActivityPersonListExport.aspx?ActivitiesId=" + activitiesId);
                    }
                }
            ]
            var column = [
                [
                    { field: 'ck', checkbox: true },
                    { width: 120, align: 'center', field: 'CustName', title: '客户名称' },
                    { width: 150, align: 'center', field: 'RoomSign', title: '房屋编号' },
                    { width: 120, align: 'center', field: 'LinkPhone', title: '联系电话' },
                    //{ width: 120, align: 'center', field: 'RegistrCount', title: '报名户数' },
                    { width: 100, align: 'center', field: 'SignUpCount', title: '报名人数' },
                    { width: 100, align: 'center', field: 'JoinCount', title: '参加人数' },
                    {
                        width: 100, align: 'center', field: 'Score', title: '评分',
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
                    }
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
                        param = $.JQForm.GetParam("CommActivityNew", "CommActivityPersonList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            function ViewDetail(optType, activitiesPersonId, activitiesId) {
                var w = window.innerWidth * 0.6;
                var h = window.innerHeight * 0.5;;
                var url = '../CommActivity/CommActivityPersonDetail.aspx?OptType=' + optType + "&ActivitiesPersonId=" + activitiesPersonId + "&ActivitiesId=" + activitiesId;

                var title = '';
                if (optType == 'Add')
                    title = '社区活动人员登记';
                else if (optType == 'Edit')
                    title = '社区活动人员登记';
                else if (optType == 'View')
                    title = '查看社区活动人员登记详情';

                HDialog.Open(w, h, url, title, false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
