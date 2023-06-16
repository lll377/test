<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterReadingExpendManage.aspx.cs" Inherits="M_Main.HouseNew.MeterReadingExpendManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>抄表支出管理</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        td {
            padding:4px 0;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="Id" type="hidden" name="Id" runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">年度</td>
                <td class="TdContentSearch">
                    <input name="Year" type="text" id="Year" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy', autoPickDate: true })" runat="server" />
                </td>
                <td class="TdTitle">月份</td>
                <td class="TdContentSearch">
                    <select id="Month" runat="server" name="Month">
                        <option value="1">1月</option>
                        <option value="2">2月</option>
                        <option value="3">3月</option>
                        <option value="4">4月</option>
                        <option value="5">5月</option>
                        <option value="6">6月</option>
                        <option value="7">7月</option>
                        <option value="8">8月</option>
                        <option value="9">9月</option>
                        <option value="10">10月</option>
                        <option value="11">11月</option>
                        <option value="12">12月</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">表计类型</td>
                <td class="TdContentSearch">
                    <select id="MeterType" runat="server" name="MeterType"></select>
                </td>
                <td class="TdTitle">表计区域</td>
                <td class="TdContentSearch">
                    <select id="MeterArea" runat="server" name="MeterArea">
                        <option selected value="房间表">房间表</option>
                        <option value="公区表">公区表</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">支出金额(元)</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="ExpendAmount" name="ExpendAmount" runat="server" />
                </td>
                <td class="TdTitle">备注</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" id="Remarks" name="Remarks" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input id="btnSave" type="button" value="保存" runat="server" class="button" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="btnReturn" type="button" value="关闭" runat="server" class="button" />
                </td>
            </tr>
        </table>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $("#btnSave").click(function () {
                    if ($("#Year").val() == '') {
                        HDialog.Info('请选择年度!');
                        return;
                    }
                    if ($("#MeterType").val() == '') {
                        HDialog.Info('请选择表计类型!');
                        return;
                    }
                    if ($("#MeterArea").val() == '') {
                        HDialog.Info('请选择表计区域!');
                        return;
                    }
                    if ($("#ExpendAmount").val() == '') {
                        HDialog.Info('请选择输入支出金额!');
                        return;
                    }
                    
                    $.tool.DataPost('MeterReadingExpend', 'Save', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('保存成功!');
                            } else {
                                HDialog.Info('保存失败!');
                            }
                        },
                        function completeCallback() { },
                        function errorCallback() { }
                    );
                });

                $('#btnReturn').click(function () {
                    HDialog.Close();
                });
            });

        </script>
    </form>
</body>
</html>
