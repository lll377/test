<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rectification_HousesInfo.aspx.cs" Inherits="M_Main.HouseInspect.Rectification_HousesInfo" %>
<!DOCTYPE html >
<html>
<head id="Head2" runat="server">
    <title>房屋/公区详情</title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="Form1" runat="server">

        <%--查看整改类型--%>
        <input type="hidden" id="Type" name="Type" runat="server"/>

        <%--项目ID--%>
        <input type="hidden" id="HiCommID" name="HiCommID" runat="server"/>
        <input type="hidden" id="CommID" name="CommID" runat="server"/>

        <%--查验批次--%>
        <input type="hidden" id="Batch" name="Batch" runat="server"/>

        <%--所属专业--%>
        <input type="hidden" id="Profession" name="Profession" runat="server"/>

        <input type="hidden" id="IsComplete" name="IsComplete" runat="server"/>
        <input type="hidden" id="HouseId" name="HouseId" runat="server"/>
        <input type="hidden" id="DutyUnit" name="DutyUnit"/>
        <input type="hidden" id="RectificationUnit" name="RectificationUnit"/>

        <div style="width: 100%;" id="TableContainer">
        </div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

          
           var column = [[
                { field: 'HouseCode', title: '房屋/公区编号', width: 20, align: 'left', sortable: true },
               {
                   field: 'IsComplete', title: '是否完成', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                       var result = "否";
                       if (row.IsComplete == "1") {
                           result = "是";
                       }
                       return result;
                   }},
                { field: 'CompletePName', title: '完成人', width: 20, align: 'left', sortable: true },
                { field: 'CompleteDate', title: '完成时间', width: 20, align: 'left', sortable: true },
               {
                   field: 'TaskNum', title: '全部标准数量', width: 20, align: 'center', halign :'left', sortable: true,
                   formatter: function (value, row, index) {
                       var str = "<a sclass=\"HrefStyle\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.CommId + "','" + row.HouseId + "','" + row.RoleCode + "','" + row.Profession + "','All');\" href=\"#\">" + row.TaskNum + "</a>";
                       return str;
                   }
               },
               {
                   field: 'QualifiedTaskNum', title: '合格标准数量', width: 20, align: 'center', halign :'left', sortable: true,
                   formatter: function (value, row, index) {
                       var str = "<a sclass=\"HrefStyle\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.CommId + "','" + row.HouseId + "','" + row.RoleCode + "','" + row.Profession + "','Qualified');\" href=\"#\">"+row.QualifiedTaskNum+"</a>";
                       return str;
                   }
               },
               {
                   field: 'ProblemTaskNum', title: '问题标准数量', width: 20, align: 'center', halign :'left', sortable: true,
                   formatter: function (value, row, index) {
                       var str = "<a sclass=\"HrefStyle\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.CommId + "','" + row.HouseId + "','" + row.RoleCode + "','" + row.Profession + "','Problem');\" href=\"#\">"+row.ProblemTaskNum+"</a>";
                       return str;
                   }
               },
               {
                   field: 'RejectionNum', title: '甩项标准数量', width: 20, align: 'center', halign: 'left', sortable: true,
                   formatter: function (value, row, index) {
                       var str = "<a sclass=\"HrefStyle\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.CommId + "','" + row.HouseId + "','" + row.RoleCode + "','" + row.Profession + "','Rejection');\" href=\"#\">" + row.RejectionNum + "</a>";
                       return str;
                   }
               },
               {
                   field: 'CheckTaskNum', title: '验收标准数量', width: 20, align: 'center', halign :'left', sortable: true,
                   formatter: function (value, row, index) {
                       var str = "<a sclass=\"HrefStyle\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.CommId + "','" + row.HouseId + "','" + row.RoleCode + "','" + row.Profession + "','Check');\" href=\"#\">" + row.CheckTaskNum + "</a>";
                       return str;
                   }
               }
            ]];

            //查看项目详情
            function TaskDetail(TaskId,CommID, HouseId,RoleCode,Profession, OpType) {
                  $('.easyui-dialog').parent().appendTo($("form:first"));
                var url = '../HouseInspect/TaskStandardList.aspx?CommID=' + CommID + '&HouseId=' + HouseId + "&Batch=" + $("#Batch").val() +
                    "&DutyUnitId=" + $("#DutyUnit").val() + "&RectificationUnitId=" + $("#RectificationUnit").val() +
                    "&Profession=" + Profession + '&OpType=' + OpType + '&RoleCode=' + RoleCode + '&TaskId=' + TaskId + '&HiCommID=' + CommID;
                HDialog.Open('1000', '570', url, '标准详情', false, function callback(_Data) {
                });
            }

          

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,                    
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsHouseInspect", "Rectification_HousesInfo", "TableContainer", param);
                    }
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>
