<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomStateManage.aspx.cs" Inherits="M_Main.ChargesNew.RoomStateManage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">序号</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="SortNum" name="SortNum" runat="server" />
                </td>
                <td class="DialogTdTitle">交房状态</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="StateName" name="StateName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">收费比率</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="FeesRate" name="FeesRate" runat="server" />
                </td>
                <td class="DialogTdTitle">备注</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="StateMemo" name="StateMemo" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">自动变为本交房状态条件设置</span>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">当前交房状态</td>
                <td class="DialogTdContent" colspan="3">
                    <input id="NowStateNames" runat="server" name="NowStateNames" style="width: 94%;" onclick="SelStateName();" placeholder="多选所设交房状态以外的其它交房状态" />
                    <input id="NowRoomStates" name="NowRoomStates" runat="server" value="" type="hidden" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">缴纳收费科目</td>
                <td class="DialogTdContent" colspan="3">
                    <textarea id="CorpCostItems" runat="server" name="CorpCostItems" style="border: 1px solid #cccccc;" onclick="SelCost();">
                    </textarea>
                    <input id="CorpCostIDs" name="CorpCostIDs" runat="server" value="" type="hidden" />
                </td>
            </tr>

            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px;">
                    <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>

        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="RoomState" type="hidden" name="RoomState" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'CorpRoomState', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            HDialog.Close('1');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            //选择交房状态
            function SelStateName() {
                HDialog.Open('700', '450', "../dialogNew/RoomStateDlg.aspx?RoomState=" + $("#RoomState").val(),
                    '交房状态选择', false, function (_data) {
                        var varReturn = _data;
                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");

                            $("#NowStateNames").val(varObjects[0]);
                            $("#NowRoomStates").val(varObjects[1]);
                        }
                    });
            }



            //选择费用科目
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx?Ram=" + Math.random(),
                    '收费项目选择', false, function (_data) {
                        var varReturn = _data;
                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");
                            $.tool.DataGet('CorpRoomState', 'GetBool', 'RoomState=' + $("#RoomState").val() + '&CorpCostIDs=' + varObjects[0],
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info("缴纳收费科目设置重复!");
                                        //$("#BtnSave").attr("disabled", true);
                                    } else {
                                        $("#CorpCostIDs").val(varObjects[0]);
                                        $("#CorpCostItems").val(varObjects[1]);
                                        //$("#BtnSave").attr("disabled", false);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    });
            }

        </script>

    </form>
</body>
</html>
