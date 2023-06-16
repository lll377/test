<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendInformationManage.aspx.cs" Inherits="M_Main.InformationManage.AttendInformationManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>参加协会信息-编辑</title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script language="javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>


    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <input type="hidden" id="AttendID" name="AttendID" runat="server" />
        <table class="DialogTable" id="Table1">
            <tr>
                <td class="TdTitle">项目名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="RegionName" name="RegionName" runat="server" class="easyui-validatebox textbox_two" readonly="true" data-options="required:true" />
                </td>
                <td class="TdTitle">协会名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="AssociationName" name="AssociationName" runat="server" class="easyui-validatebox textbox_two" data-options="required:true" />
                </td>
                <td class="TdTitle">加入协会时间</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox Wdate" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" data-options="editable:false,required:true" id="JoinDate" name="JoinDate" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">协会级别</td>
                <td class="TdContentSearch">
                    <input type="text" class="textbox_two" id="AssociationLevel" name="AssociationLevel" runat="server" />
                </td>
                <td class="TdTitle">任职情况</td>
                <td class="TdContentSearch">
                    <input type="text" class="textbox_two" id="JobStatus" name="JobStatus" runat="server" />
                </td>
                <td class="TdTitle">会费标准</td>
                <td class="TdContentSearch">
                    <input type="text" class="textbox_two" id="MembershipFee" name="MembershipFee" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdSubmit" align="center" colspan="6">
                    <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" />
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" /></td>
            </tr>
        </table>
    </form>

    <script>
        $(function () {
            //取消
            $("#btnReturn").click(function () {
                HDialog.Close("");
            });

            //保存
            $("#btnSave").click(function () {
                $.tool.DataPostChk('form1', 'AttendInfo', 'Insert', $('#form1').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var data = _Data.split("|");
                        if (data[0] == "true") {
                            HDialog.Info(data[1]);
                            HDialog.Close("true");
                        }
                        else {
                            HDialog.Info(data[1]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    })
            });
        })
    </script>
</body>
</html>
