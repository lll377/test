<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentDealManChecked.aspx.cs" Inherits="M_Main.DialogNew.IncidentDealManChecked" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 240px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        <input type="hidden" id="IsAssignedBatch" name="IsAssignedBatch" runat="server" />
        <input type="hidden" id="CheckedUserLists" name="CheckedUserLists" runat="server" />
        <input type="hidden" id="IsTransmit" name="IsTransmit" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
        <input type="hidden" id="pdlist" name="pdlist" value="" runat="server" />
        <input type="hidden" id="IncidentID" name="IncidentID" value="" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">人员姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
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
            var column;
            column = [[
                { field: 'UserCode', checkbox: true },
                { field: 'UserName', title: '员工姓名', width: 40, align: 'left', sortable: true },
                {
                    field: 'EmployeeStatus', title: '状态', width: 40, align: 'left', sortable: true
                },
                {
                    field: 'EmployeeProfession', title: '工种', width: 40, align: 'left', sortable: true
                },
                { field: 'RoleName', title: '通用岗位', width: 160, align: 'left', sortable: true },
                { field: 'NotOverNum', title: '在办工单', width: 100, align: 'left', sortable: true },
                {
                    field: 'LastLocation', title: '当前位置', width: 100, align: 'left', sortable: true
                }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        if (UserLists.length == 0) {
                            HDialog.Info('请选择');
                        }
                        else {
                            var strRets = "";
                            for (var i = 0; i < UserLists.length; i++) {
                                strRets += ',' + UserLists[i];
                            }
                            // alert(strRets);
                            //return;
                            HDialog.Close(strRets);
                        }
                    }

                }, {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];
            var UserLists = [];  //设置全局数组,用来存储选择的记录值</span>
            $(document).ready(function () {
                var CheckedUserLists = $('#CheckedUserLists').val();     //后台查出的,已经操作的记录
                if (CheckedUserLists) {
                    var Users = CheckedUserLists.split(",");
                    for (var i = 0; i < Users.length; i++) {
                        if (Users[i] != "" && checkExist(Users[i]) == -1) {
                            UserLists.push(Users[i]);
                        }
                    }
                }
            });
            //翻页后如何给checkbox赋值呢？关键就在这里，datagrid重写了$.fn.datagrid.defaults.view的onAfterRender事件
            //因此在datagrid的view事件里绑定这个函数就OK了。onAfterRender事件是当easyui的元素渲染完毕后执行的事件，
            //在这里会调用onAfterRender函数来实现对checkbox的赋值
            var fileview = $.extend($.fn.datagrid.defaults.view, {
                onAfterRender: function (target) {
                    for (var i = 0; i < UserLists.length; i++) {
                        if (UserLists[i] != "") {
                            $('#TableContainer').datagrid('selectRecord', UserLists[i].split('|')[0]); //根据id选中行 
                        }
                    }
                }
            });
            //检测选中的记录,或者要删除的记录在原数组中是否存在
            function checkExist(user) {
                for (var i = 0; i < UserLists.length; i++) {
                    if (UserLists[i] == user) return i;
                }
                return -1;
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=IncidentDealMan&' + $('#frmForm').serialize(),
                    method: "get",
                    idField: 'UserCode',
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    pagination: true,
                    //      pageSize:5,//分页大小  
                    //pageList:[5,30,50,100],//每页的个数
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: false,
                    checkOnSelect: true,
                    checkbox: true,
                    onLoadSuccess: function (data) {
                        console.log(data);
                    },
                    onCheck: function (rowIndex, rowData) {      //单个复选框被选中时触发
                        var rows = $('#TableContainer').datagrid('getChecked');
                        for (var i = 0; i < rows.length; i++) {
                            var strRe = rows[i].UserCode + "|" + rows[i].UserName;
                            if (checkExist(strRe) == -1) {        //这里-1,因为后台传输的数据最后多带了个逗号,在这里-1可以少循环一次,可以根据自己情况优化
                                UserLists.push(strRe);
                            }
                        }
                    },
                    onCheckAll: function () {                        //批量复选框选中时触发
                        var rows = $('#TableContainer').datagrid('getChecked');
                        for (var i = 0; i < rows.length; i++) {
                            var strRes = rows[i].UserCode + "|" + rows[i].UserName;
                            if (checkExist(strRes) == -1) {
                                UserLists.push(strRes);
                            }
                        }
                    },
                    onUncheck: function (rowIndex, rowData) {       //单记录复选框取消时触发
                        var strRess = rowData.UserCode + "|" + rowData.UserName;
                        var k = checkExist(strRess);
                        if (k != -1) {
                            UserLists.splice(k, 1);
                        }
                    },
                    onUncheckAll: function (rows) {                //批量复选框取消选中时触发
                        for (var i = 0; i < rows.length; i++) {
                            var strResss = rows[i].UserCode + "|" + rows[i].UserName;
                            var k = checkExist(strResss);
                            if (k != -1) {
                                UserLists.splice(k, 1);      //这个地方一定注意,网上很多都是写的splice(i,1)<img alt="鄙视" src="http://static.blog.csdn.net/xheditor/xheditor_emot/default/despise.gif" />
                            }
                        }
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        //var mUserCode = "";
                        //var mUserName = "";
                        //mUserCode = rowData.UserCode;
                        //mUserName = rowData.UserName;
                        //var strRe = mUserCode + "\t" + mUserName;
                        //HDialog.Close(strRe);
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();

        </script>
    </form>
</body>
</html>
