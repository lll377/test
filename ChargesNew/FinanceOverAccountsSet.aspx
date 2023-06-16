<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinanceOverAccountsSet.aspx.cs" Inherits="M_Main.ChargesNew.FinanceOverAccountsSet" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>财务结账设置</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
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

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <style>
        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            font-family: 'Microsoft YaHei';
        }
    </style>

</head>
<body style="overflow-y: auto;">
    <form id="FinanceOverAccountsSet" method="post" runat="server">
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OverAccountEndDate" name="OverAccountEndDate" type="hidden" runat="server" />
        <table class="DialogTable" id="Table1" style="width: 100%">
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td class="TdTitle">项目名称
                </td>
                <td class="TdContentSearch" colspan="3">
                    <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelCommInfo();" style="width: 90%"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">结账年份
                </td>
                <td class="TdContentSearch">
                    <input type="text" id="OverAccountYear" name="OverAccountYear" runat="server" />
                </td>
                <td class="TdTitle">结账月份
                </td>
                <td class="TdContentSearch">
                    <select name="OverAccountMouth1" id="OverAccountMouth1" paneimaxheight="100px" style="width: 80px" runat="server">
                        <option value="1">1月份</option>
                        <option value="2">2月份</option>
                        <option value="3">3月份</option>
                        <option value="4">4月份</option>
                        <option value="5">5月份</option>
                        <option value="6">6月份</option>
                        <option value="7">7月份</option>
                        <option value="8">8月份</option>
                        <option value="9">9月份</option>
                        <option value="10">10月份</option>
                        <option value="11">11月份</option>
                        <option value="12">12月份</option>
                    </select>
                    至
                     <select name="OverAccountMouth2" id="OverAccountMouth2" paneimaxheight="100px" style="width: 80px" runat="server">
                         <option value="1">1月份</option>
                         <option value="2">2月份</option>
                         <option value="3">3月份</option>
                         <option value="4">4月份</option>
                         <option value="5">5月份</option>
                         <option value="6">6月份</option>
                         <option value="7">7月份</option>
                         <option value="8">8月份</option>
                         <option value="9">9月份</option>
                         <option value="10">10月份</option>
                         <option value="11">11月份</option>
                         <option value="12">12月份</option>
                     </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">结账日期
                </td>
                <td class="TdContentSearch" colspan="3">
                    <input type="checkbox" id="SetNow" name="check" checked onclick="checkCanel(this)" />当月
                    <input type="checkbox" id="SetNext" name="check" onclick="checkCanel(this)" />次月
                    <label>(</label>
                    <input type="text" id="OverAccountDay" name="OverAccountDay" value="32" runat="server" style="border: hidden; width: 15px;" />
                    <label>)</label>
                    日
                    <input id="OverAccountSetDate" name="OverAccountSetDate" runat="server" style="display: none;" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 30px; color: crimson; text-align: center; font-weight: 600; font-size: 14px"></td>
            </tr>
        </table>
        <div id="Error" style="text-align: left; font-size: 14px; font-weight: 500; color: royalblue; padding: 0 0 77px 77px">
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSet" type="button" value="设 置" name="btnImport" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关 闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>


<script type="text/javascript">

    function checkCanel(Obj) {
        $("input[name='check']").each(function () {
            $(this).attr("checked", false);
        });
        Obj.checked = true;
    }

    $(function () {

        $('#OverAccountYear').bind("click", function () {
            WdatePicker({
                readOnly: true,
                dateFmt: 'yyyy'
            });
        });

        var nowdays = new Date();
        var year = nowdays.getFullYear();
        var month = nowdays.getMonth();
        if (month == 0) {
            month = 12;
            year = year - 1;
        }
        if (month < 10) {
            month = month;
        }
        var myDate = new Date(year, month, 0);
        var lastDay = myDate.getDate();//上个月的天数
        var aa = 0;
        $('#OverAccountYear').val(year);

        //$('#OverAccountMouth1').combobox('select', 1);
        //$("#OverAccountMouth2").combobox({
        //    onChange: function (n, o) {
        //        aa = parseInt($("#OverAccountMouth2").combobox('getValue')) + 1;
        //        $('#OverAccountSetDate').bind("click", function () {
        //            WdatePicker({
        //                readOnly: true,
        //                dateFmt: 'yyyy-MM-dd ',
        //                minDate: '{' + $('#OverAccountYear').val() + '}-{' + aa + '}-{1}',
        //                //maxDate: '%y-%M-{%d}'
        //            });
        //        });
        //        $('#OverAccountSetDate').val('');
        //    }
        //});

        $('#OverAccountMouth2').val(month + 1);

        //设置
        $("#btnSet").click(function () {

            if (!$("#CommIDs").val()) {
                HDialog.Info("项目名称不能为空！");
                return false;
            }

            if (!$("#OverAccountYear").val()) {
                HDialog.Info("结账年度不能为！！");
                return false;
            }
            if (!$("#OverAccountMouth1").val()) {
                HDialog.Info("结账开始月份不能为空！");
                return false;
            }
            if (!$("#OverAccountMouth2").val()) {
                HDialog.Info("结账结束月份不能为空！");
                return false;
            }
            var Mouth2 = parseInt($("#OverAccountMouth2").val(), 10);

            var Mouth1 = parseInt($("#OverAccountMouth1").val(), 10);

            if (Mouth2 < Mouth1) {
                HDialog.Info("结账开始月份不能大于结账结束月份！");
                return false;
            }
            if (!$("#OverAccountDay").val()) {
                HDialog.Info("结账日期日不能为空！");
                return false;
            }

            if ($('#SetNext').is(':checked')) {
                //结账日期次月
                $("#OverAccountMouth1").val(parseInt($("#OverAccountMouth1").val()) + 1);
                $("#OverAccountMouth2").val(parseInt($("#OverAccountMouth2").val()) + 1);
            }

            $.tool.DataPostChk('FinanceOverAccountsSet', 'FinanceOverAccountsSetInfo', 'CheckIsSeted', $('#FinanceOverAccountsSet').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "1") {
                        HDialog.MessageBox("所选项目中包含当月已设置结账的项目，是否覆盖!!!", "覆盖", "取消",
                            function () {
                                SetOverAccountEndDate();
                            },
                            function () {
                            });
                    } else if (_Data == "2") {
                        HDialog.Info("结账日期不能小于往期结账日期！！！");
                    } else if (_Data == "3") {
                        HDialog.Info("所选项目中包含往期结账月，不能设置往期！！！");
                    } else if (_Data == "4") {
                        HDialog.Info("所选项目中包已设置关帐月份，并且已结账不能覆盖！！！");
                    }
                    else {
                        SetOverAccountEndDate();
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                })
        });

        //返回
        $("#btnReturn").click(function () {
            HDialog.Close();
        });

    });

    function SetOverAccountEndDate() {
        $.tool.DataPostChk('FinanceOverAccountsSet', 'FinanceOverAccountsSetInfo', 'SetOverAccountEndDate', $('#FinanceOverAccountsSet').serialize(),
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
    }

    function SelCommInfo() {
        HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            $("#CommIDs").val(arrRet.id);
            $("#CommNames").val(arrRet.name);
        });
    }

</script>
