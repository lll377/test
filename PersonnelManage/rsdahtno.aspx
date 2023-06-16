<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rsdahtno.aspx.cs" Inherits="M_Main.PersonnelManage.rshahtno" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server" clientidmode="Static">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server" clientidmode="Static">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1024px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Name" name="Name" />
                    </td>
                    <td class="TdTitle">人事所属机构
                    </td>
                    <td class="TdContent">
                        <input id="PDepName" name="PDepName" class="easyui-searchbox" searcher="SelDepartment"
                            style="width: 138px"/>
                    </td>
                    <td class="TdTitle">人员状态
                    </td>
                    <td class="TdContent">
                        <select id="PPersonState" name="PPersonState" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="已建档">已建档</option>
                            <option value="已入职未转正">已入职未转正</option>
                            <option value="已转正未离职">已转正未离职</option>
                            <option value="已离职">已离职</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="loadlist" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="DepCode" name="DepCode" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function SelDepartment() {
                HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("~");
                        var varDepObj = "";
                        var depName = "";
                        var depCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varDepObj = varObjects[i].split('\t');
                            depName += varDepObj[2] + ",";
                            depCode += varDepObj[0] + ",";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        $("#PDepName").searchbox("setValue", depName);
                        document.all.PDepName.value = depName;
                        $("#DepCode").val(depCode);
                    }
                });
            }


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 3 + "px");
            }
            InitTableHeight();
            var frozenColumns = [[
                {
                    field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href=\"rsda_xx.aspx?OpType=edit&Id=" + row.Pid + "\">" + row.Name + "</a>";
                        return str;
                    }
                }
            ]]
            var YdToolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function getNewDay(dateTemp, days) {
                var dateTemp = dateTemp.split("-");
                var nDate = new Date(dateTemp[0] + '-' + dateTemp[1] + '-' + dateTemp[2]); //转换为MM-DD-YYYY格式   

                var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
                var rDate = new Date(millSeconds);
                var year = rDate.getFullYear();
                var month = rDate.getMonth() + 1;
                if (month < 10) month = "0" + month;
                var date = rDate.getDate();
                if (date < 10) date = "0" + date;
                return (year + "-" + month + "-" + date);
            }

            var Column = [[
                 { field: 'Pid', title: 'Pid', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'Sex', title: '性别', width: 50, align: 'left', sortable: true },
                    { field: 'Age', title: '年龄', width: 50, align: 'left', sortable: true },
                    { field: 'parantDepName', title: '人事所属机构', width: 150, align: 'left', sortable: true },
                    { field: 'PDepName', title: '部门', width: 120, align: 'left', sortable: true },
                    { field: 'PRoleName', title: '岗位', width: 100, align: 'left', sortable: true }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=GetPersonContract1&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: Column,
                    fitColumns: true,
                    frozenColumns: frozenColumns,
                    title: "无合同人员",
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: YdToolbar,
                    sortOrder: "asc"
                });
            }
        </script>
    </form>
</body>
</html>
