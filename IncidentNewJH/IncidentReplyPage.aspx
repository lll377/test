<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentReplyPage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentReplyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
        .TdTitle {
            width: 15%;
        }

        td {
            padding-bottom: 8px;
        }

        textarea {
            resize: none;
            border: 1px solid #ccc;
            height: 75px;
        }

        input:disabled {
            border: 0px;
            background-color: #fff;
            color: #ACA899;
        }
    </style>
</head>
<body style="overflow-y: scroll;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="hiIncidentID" name="hiIncidentID" runat="server" />
        <input type="hidden" id="hidIncidentNum" name="hidIncidentNum" runat="server" />
        <input type="hidden" id="ReplySituationCode" name="ReplySituationCode" runat="server" />
        <table class="DialogTable" align="center" style="width: 100%;">
            <tr>
                <td class="TdTitle">回访内容：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="ReplyContent" class="easyui-validatebox" data-options="required:true" name="ReplyContent" style="width: 100%;" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">回访结果：</td>
                <td class="TdContent">
                    <select id="ReplyResult" class="easyui-combobox" runat="server" style="width: 100px;">
                        <option value="1">成功回访</option>
                        <option value="0">不成功回访</option>
                    </select>
                </td>
                <%-- <td class="TdTitle" id="ReplyWayTitle">跟进方案</td>
                <td class="TdContent">
                    <asp:DropDownList ID="ReplyWay" class="easyui-combobox" runat="server" Width="100px">
                        <asp:ListItem Value="继续回访">继续回访</asp:ListItem>
                        <asp:ListItem Value="关闭回访">关闭回访</asp:ListItem>
                    </asp:DropDownList>id="trReplySituation"
                </td>--%>
                <td class="TdTitle trReplySituation">不成功原因：
                </td>
                <td class="TdContent trReplySituation">
                    <select id="ReplySituation" class="easyui-combobox" runat="server" style="width: 80%;">
                    </select>
                </td>
            </tr>

            <tr class="trReplySituation">

                <td class="TdTitle" id="ReplyWayTitle">跟进方案</td>
                <td class="TdContent">
                    <asp:DropDownList ID="ReplyWay" class="easyui-combobox" runat="server" Width="100px">
                        <asp:ListItem Value="继续回访">继续回访</asp:ListItem>
                        <asp:ListItem Value="关闭回访">关闭回访</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">满意度评价：
                </td>
                <td class="TdContent" colspan="5">
                    <span id="ServiceQuality_1">
                        <asp:RadioButton ID="ServiceQuality1" GroupName="ServiceQuality" Text="非常满意" Checked="true" runat="server" /></span>
                    <span id="ServiceQuality_2">
                        <asp:RadioButton ID="ServiceQuality2" GroupName="ServiceQuality" Text="满意" runat="server" /></span>
                    <span id="ServiceQuality_3">
                        <asp:RadioButton ID="ServiceQuality3" GroupName="ServiceQuality" Text="一般" runat="server" /></span>
                    <span id="ServiceQuality_4">
                        <asp:RadioButton ID="ServiceQuality4" GroupName="ServiceQuality" Text="不满意" runat="server" /></span>
                    <span id="ServiceQuality_5">
                        <asp:RadioButton ID="ServiceQuality5" GroupName="ServiceQuality" Text="非常不满意" runat="server" /></span>
                    <span id="ServiceQuality_6">
                        <asp:RadioButton ID="ServiceQuality6" GroupName="ServiceQuality" Text="无效评价" runat="server" /></span>
                </td>

            </tr>
            <tr>
                <td class="TdTitle VisiteIsTimely_">服务是否及时</td>
                <td class="VisiteIsTimely_">
                    <select name="VisiteIsTimely" id="VisiteIsTimely" style="width: 70px;" class="easyui-combobox">
                        <option value=""></option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>

                </td>
                <td class="TdTitle VisiteIsSolve_">问题是否解决</td>
                <td class="VisiteIsSolve_">
                    <select name="VisiteIsSolve" id="VisiteIsSolve" style="width: 70px;" class="easyui-combobox">
                        <option value=""></option>
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select></td>
                <td class="TdTitle VisiteIsCharge_">言行是否合规</td>
                <td class="VisiteIsCharge_">
                    <select name="VisiteIsCharge" id="VisiteIsCharge" style="width: 70px;" class="easyui-combobox">
                        <option value=""></option>
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select></td>
            </tr>
            <tr style="height: 30px;">
                <td class="TdTitle">回访时间：
                </td>
                <td class="TdContent">
                    <input id="ReplyDate" type="text" style="border: none;" disabled runat="server" />
                </td>
                <td class="TdTitle">回访人：
                </td>
                <td class="TdContent">
                    <input id="ReplyMan" type="text" style="border: none;" disabled runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="6" class="DialogTdSubmit" style="text-align: center; padding-top: 10px;">
                    <input class="button" type="button" value="保存" onclick="javascript: btnNewSave();" />
                    <input type="button" class="button" value="保存" id="BtnSave" style="display: none;" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="放弃返回" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">

            function btnNewSave() {
                //验证
                var replyContent = $('#ReplyContent').val();
                if (!replyContent) {
                    HDialog.Info('请输入回访内容');
                    return;
                }
                if (replyContent.length > 1000) {
                    HDialog.Info('回访内容不能超过1000字');
                    return;
                }
                $("#BtnSave").click();
            }
            $("#BtnReturn").click(function () {
                HDialog.Close();
            });

            $(document).ready(function () {

                $("#ReplySituation").combobox({
                    onChange: function (n, o) {
                        var valc = $("#ReplySituation").combobox('getValue');
                        $('#ReplySituationCode').val(valc);
                    }
                });
                $('#ReplyWay').next(".combo").hide();
                $('#ReplyWayTitle').hide();
                $('.trReplySituation').hide();
                $("#ReplyResult").combobox({
                    onChange: function (n, o) {
                        var val = $("#ReplyResult").combobox('getValue');
                        if (val == '0') {//不成功回访
                            $("input[name='ServiceQuality']").attr('disabled', 'disabled');
                            $('#ReplyWay').next(".combo").show();
                            $('#ReplyWayTitle').show();
                            $('.trReplySituation').show();
                        }
                        else {
                            $("input[name='ServiceQuality']").removeAttr('disabled');
                            $('#ReplyWay').next(".combo").hide();
                            $('#ReplyWayTitle').hide();
                            $('.trReplySituation').hide();
                        }
                    }
                });

                LoadingData();
            });
            function ReplySituationOnChange() {
                //var vals = $("#ReplySituation").val();//.combobox('getValue');
                //$('#ReplySituationCode').val(vals);
            }

            function LoadingData() {
                $.tool.DataGet('IncidentCheckPost', 'IncidentControlModelSet', '',
                    function Init() {
                    },
                    function callback(_Data) {
                        var json = eval('(' + _Data + ')');
                        console.log(json);
                        if (json.Result == 'True') {
                            var data = json.data[0];
                            if (data.checkbox_1 == '0') {
                                $('#ServiceQuality_1').hide();
                            }
                            if (data.checkbox_2 == '0') {
                                $('#ServiceQuality_2').hide();
                            }
                            if (data.checkbox_3 == '0') {
                                $('#ServiceQuality_3').hide();
                            }
                            if (data.checkbox_4 == '0') {
                                $('#ServiceQuality_4').hide();
                            }
                            if (data.checkbox_5 == '0') {
                                $('#ServiceQuality_5').hide();
                            }
                            if (data.checkbox_6 == '0') {
                                $('#ServiceQuality_6').hide();
                            }
                            if (data.checkbox_7 == '0') {
                                $('.VisiteIsTimely_').hide();
                            }
                            if (data.checkbox_8 == '0') {
                                $('.VisiteIsSolve_').hide();
                            }
                            if (data.checkbox_9 == '0') {
                                $('.VisiteIsCharge_').hide();
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        </script>
    </form>
</body>
</html>
