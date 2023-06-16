<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractInfoManageCost.aspx.cs" Inherits="M_Main.InformationManage.ContractInfoManageCost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script language="javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <link href="../css/base.css" rel="stylesheet" />
    <style type="text/css">
        .TableForm {
            width: 97%;
            margin: 5px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }


            .TableForm tr td.TdTitle {
                color: #666;
                padding: 4px;
                width: 20%;
                text-align: right;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
                background: #F8F8F8;
            }

            .TableForm tr td.TdContentSearch {
                padding: 4px;
                width: 80%;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

                .TableForm tr td.TdContentSearch img {
                    width: 200px;
                    height: 200px;
                }

            .TableForm tr td input {
            }

            .TableForm tr td select {
                width: 170px;
                height: 22px;
                padding: 0px;
            }

            .TableForm tr td .Wdate, input[type=text], select, textarea {
                border: 1px #95B8E7 solid;
                width: 160px;
                height: 12px;
                font-size: 12px;
                margin: 0;
                margin-right: 0px;
                margin-left: 0px;
                padding: 4px;
                /*padding-top: 4px;
                padding-bottom: 4px;*/
                white-space: normal;
                vertical-align: top;
                outline-style: none;
                resize: none;
                -moz-border-radius: 5px 5px 5px 5px;
                -webkit-border-radius: 5px 5px 5px 5px;
                border-radius: 5px 5px 5px 5px;
            }

        .HeavyMoment {
            display: none;
        }
    </style>
</head>
<body>
    <form id="ContractForm" runat="server">
        <input type="hidden" id="ContractID" name="ContractID" value="" runat="server" />
        <table class="TableForm" id="Table1">
            <tr>
                <td class="TdTitle">标准类型</td>
                <td class="TdContentSearch">
                    <select id="CostID" name="CostID" onchange="" style="width:400px">
                        <option value="高层收费标准" checked="checked">高层收费标准</option>
                        <option value="小高层收费标准">小高层收费标准</option>
                        <option value="多层收费标准">多层收费标准</option>
                        <option value="双拼/联排别墅收费标准">双拼/联排别墅收费标准</option>
                        <option value="独栋别墅收费标准">独栋别墅收费标准</option>
                        <option value="办公收费标准">办公收费标准</option>
                        <option value="商业收费标准">商业收费标准</option>
                        <option value="幼儿园收费标准">幼儿园收费标准</option>
                        <option value="会所面积收费标准">会所面积收费标准</option>
                        <option value="管理用房收费标准">管理用房收费标准</option>
                        <option value="步梯洋房收费标准">步梯洋房收费标准</option>
                        <option value="电梯洋房收费标准">电梯洋房收费标准</option>
                        <option value="三拼别墅收费标准">三拼别墅收费标准</option>
                        <option value="四拼别墅收费标准">四拼别墅收费标准</option>
                        <option value="公寓收费标准">公寓收费标准</option>
                        <option value="花园收费标准">花园收费标准</option>
                        <option value="地下室收费标准">地下室收费标准</option>
                        <option value="商铺收费标准">商铺收费标准</option>
                        <option value="会所收费标准">会所收费标准</option>
                        <option value="办公楼/写字楼收费标准">办公楼/写字楼收费标准</option>
                        <option value="地下车位收费标准">地下车位收费标准</option>
                        <option value="露天车位收费标准">露天车位收费标准</option>
                        <option value="学校收费标准">学校收费标准</option>
                        <option value="其他收费标准">其他收费标准</option>
                        <option value="物业服务费违约金收费标准">物业服务费违约金收费标准</option>
                    </select>

                </td>
            </tr>
            <tr>
                <td class="TdTitle">单价</td>
                <td class="TdContentSearch">
                    <input type="text" id="Price" name="Price" class="easyui-validatebox" data-options="required:true" value="" runat="server" style="width:390px"/>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">单位</td>
                <td class="TdContentSearch">
                    <select id="sltMemo" name="sltMemo" onchange="MemoChange()" runat="server" style="width:400px">
                        <option value="元/月•平方米" checked="checked">元/月•平方米</option>
                        <option value="元/月•个">元/月•个</option>
                        <option value="元/月">元/月</option>
                        <option value="元/季">元/季</option>
                        <option value="元/半年">元/半年</option>
                        <option value="元/年">元/年</option>
                        <option value="%">%</option>
                        <option value="‰">‰</option>
                        <option value="其他">其他</option>
                    </select>
                    <input type="text" id="txtMemo" name="txtMemo" class="easyui-validatebox" data-options="required:true" value=""  style="display:none"/>
                    <input type="hidden" id="Memo" name="Memo" value="元/月•平方米" />
                </td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" onclick="InserDate();" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" onclick="colse()" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script>
        $(function () {
            $("#txtMemo").validatebox("disableValidation");
        });
        function MemoChange() {
            var val = $('#sltMemo option:selected').val();
            if (val == "其他") {
                $("#txtMemo").validatebox("enableValidation");
                $("#txtMemo").show();
            } else {
                $("#txtMemo").validatebox("disableValidation");
                $("#txtMemo").hide();
            }
            $("#Memo").val(val);

        }
        function CheckAllData() {
            return $("#ContractForm").form('validate');
        }

        function InserDate() {
            if ($('#sltMemo option:selected').val() == "其他") {
                $("#Memo").val($("#txtMemo").val());
            }
            //var sel = $("#CostID").val();
            //if (sel == "其他收费标准" && $("#Memo").val().indexOf("单位") < 0) {
            //    HDialog.Info("其他收费标准 的说明中必须包含 ‘单位’字样");
            //    return false;
            //}
            if ($('#ContractForm').form('validate')) {
                $.tool.DataPost('ContractInfo', 'InsertContractCost', '&ContractID=' + $("#ContractID").val() + '&CostID=' + $("#CostID").val() + '&Price=' + $("#Price").val() + '&Memo=' + $("#Memo").val(),
                    function Init() {
                    },
                    function callback(_Data1) {

                        if (_Data1 == "0") {
                            HDialog.Info("保存成功!");
                        }
                        HDialog.Close("1");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        function colse() {
            HDialog.Close("1");
        }

        function SelChange() {
            var sel = $("#CostID").val();
            if (sel == "其他收费标准") {
                $("#Memo").val("单位：");
            }
        }


    </script>

</body>
</html>
