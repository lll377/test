<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtControlModelSet.aspx.cs" Inherits="M_Main.Mt.MtControlModelSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管控模型设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/PersonDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <link href="../css/button.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .Td {
            height: 16px;
            width: 23%;
            text-align: right;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .TContent {
            height: 16px;
            width: 22%;
            margin-left: 15px;
            padding-left: 15px;
            text-align: left;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .spanTitle {
        }

        .fontSizes {
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .divHe {
            height: 10px;
        }
    </style>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow-x: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 10px;"></div>

        <div class="panel panel-primary" style="width: 85%; margin: 0px auto; text-align: center;">
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">计价方式</div>
            <div class="panel-body" style="text-align: left;">

                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">物资出库计价方式：</td>
                        <td class="TContent">
                            <select id="CheckOutModel" name="CheckOutModel" runat="server" style="width: 120px;">
                                <option value="1000">个别计价 </option>
                                <option value="1001">先入先出</option>
                                <option value="1002">加权平均</option>
                            </select>
                        </td>
                        <td class="Td">单价保留小数点位：</td>
                        <td class="TContent">
                            <select id="DecimalNum" name="DecimalNum" style="width: 120px;">
                                <option value="2">二位</option>
                                <option value="4" selected="selected">四位</option>
                                <option value="8">八位</option>
                            </select>
                        </td>
                    </tr>

                    <tr style="height: 32px;">
                        <td class="Td">总价保留小数点位：</td>
                        <td class="TContent">
                            <select id="MoneyNum" name="MoneyNum" style="width: 120px;">
                                <option value="2" selected="selected">两位</option>
                                <option value="4">四位</option>
                            </select>
                        </td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>

                </table>

            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">价格管控</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" class="fontSizes" style="width: 100%; text-align: center; font-weight: bold"><span class="spanTitle">有分供方供货价格</span></td>
                    </tr>
                    <tr>

                        <td class="Td">采购申请时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="Ture_Purchase_UpdatePrice_Up" name="Ture_Purchase_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                            <input id="Ture_Purchase_UpdatePrice_Down" name="Ture_Purchase_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>

                        <td class="Td">采购审批时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="Ture_Purchase_Check_UpdatePrice_Up" name="Ture_Purchase_Check_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                              <input id="Ture_Purchase_Check_UpdatePrice_Down" name="Ture_Purchase_Check_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td class="Td">计划办理时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="Ture_Plan_Check_UpdatePrice_Up" name="Ture_Plan_Check_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                            <input id="Ture_Plan_Check_UpdatePrice_Down" name="Ture_Plan_Check_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>

                        <td class="Td">入库办理时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="Ture_Storage_UpdatePrice_Up" name="Ture_Storage_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                              <input id="Ture_Storage_UpdatePrice_Down" name="Ture_Storage_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" class="fontSizes" style="height: 12px; text-align: center; font-weight: bold"><span class="spanTitle">无分供方供货价格</span></td>
                    </tr>
                    <tr>
                        <td class="Td">采购申请时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="False_Purchase_UpdatePrice_Up" name="False_Purchase_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                            <input id="False_Purchase_UpdatePrice_Down" name="False_Purchase_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>

                        <td class="Td">采购审批时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="False_Purchase_Check_UpdatePrice_Up" name="False_Purchase_Check_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                              <input id="False_Purchase_Check_UpdatePrice_Down" name="False_Purchase_Check_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>
                    </tr>
                    <tr>
                        <td class="Td">计划办理时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="False_Plan_Check_UpdatePrice_Up" name="False_Plan_Check_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                            <input id="False_Plan_Check_UpdatePrice_Down" name="False_Plan_Check_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>

                        <td class="Td">入库办理时是否允许修改价格：</td>
                        <td class="TContent">
                            <input id="False_Storage_UpdatePrice_Up" name="False_Storage_UpdatePrice" value="1" type="checkbox" />&nbsp;调高&nbsp;&nbsp;
                              <input id="False_Storage_UpdatePrice_Down" name="False_Storage_UpdatePrice" value="2" type="checkbox" />&nbsp;调低
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">采购管控</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px; text-align: center;"></td>
                    </tr>
                    <tr>
                        <td class="Td">采购/计划申请自动失效时间(天)：</td>
                        <td class="TContent">
                            <%-- <input type="text" class="easyui-datebox" style="width:121px;" id=""  name="Purchase_Apply_Lose_Time" />--%>
                            <input id="Purchase_Apply_Lose_Time" style="width: 121px;" maxlength="3" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,''); if(this.value>100){this.value = 100;}}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,''); if(this.value>100){this.value = 100;}}" name="Purchase_Apply_Lose_Time" class="easyui-validatebox validatebox-text" type="text" />


                        </td>

                        <td class="Td">计划采购申请每月次数：</td>
                        <td class="TContent">
                            <%-- data-options="required:true"--%>
                            <input id="Plan_Purchase_Apply_Month_Num" style="width: 121px;" maxlength="3" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,''); if(this.value>100){this.value = 100;}}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,''); if(this.value>100){this.value = 100;}}" name="Plan_Purchase_Apply_Month_Num" class="easyui-validatebox validatebox-text" type="text" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                </table>
            </div>




            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">盘点管控</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px; text-align: center;"></td>
                    </tr>
                    <tr>
                        <td class="Td">是否强制月盘：</td>
                        <td class="TContent">
                            <select id="pandianDay" name="pandianDay">
                                <option value="0" selected="selected">是</option>
                                <option value="1">否</option>
                            </select>
                        </td>

                        <td class="Td">是否强制季盘：</td>
                        <td class="TContent">
                            <select id="pandianQuarter"  name="pandianQuarter">
                                <option value="0">是</option>
                                <option value="1" selected="selected">否</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                </table>
            </div>



        </div>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 45px; line-height: 45px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onclick="Save();" />
            <%-- <input type="button" class="button" value="返回" id="BtnReturn" onclick="btnClose();" />--%>
        </div>
        <%--出库计价方式ID--%>
        <input type="hidden" id="Id" name="Id" value="" />
        <%--价格管控ID--%>
        <input type="hidden" id="BaseId" name="BaseId" value="" />
    </form>
    <script type="text/javascript">
        function Save() {
            $.tool.DataGet('MaterialBaseHandle', 'SaveMtControlModelSet', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存成功");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        function Bind() {
            $.tool.DataGet('MaterialBaseHandle', 'SelMtControlModelSet', $('#FrmForm').serialize(),
                function Init() {

                },
                function callback(_Data) {
                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        $.JQForm._Data = _Data;
                        $.JQForm.FillForm();
                        $("#FrmForm").form('validate');
                        switch (varObjects[0].Ture_Purchase_UpdatePrice) {
                            case "3":
                                $("[name='Ture_Purchase_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#Ture_Purchase_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#Ture_Purchase_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].Ture_Purchase_Check_UpdatePrice) {
                            case "3":
                                $("[name='Ture_Purchase_Check_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#Ture_Purchase_Check_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#Ture_Purchase_Check_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].Ture_Plan_Check_UpdatePrice) {
                            case "3":
                                $("[name='Ture_Plan_Check_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#Ture_Plan_Check_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#Ture_Plan_Check_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].Ture_Storage_UpdatePrice) {
                            case "3":
                                $("[name='Ture_Storage_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#Ture_Storage_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#Ture_Storage_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].False_Purchase_UpdatePrice) {
                            case "3":
                                $("[name='False_Purchase_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#False_Purchase_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#False_Purchase_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].False_Purchase_Check_UpdatePrice) {
                            case "3":
                                $("[name='False_Purchase_Check_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#False_Purchase_Check_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#False_Purchase_Check_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }

                        switch (varObjects[0].False_Plan_Check_UpdatePrice) {
                            case "3":
                                $("[name='False_Plan_Check_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#False_Plan_Check_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#False_Plan_Check_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        switch (varObjects[0].False_Storage_UpdatePrice) {
                            case "3":
                                $("[name='False_Storage_UpdatePrice']").attr("checked", 'true');
                                break;
                            case "2":
                                $("#False_Storage_UpdatePrice_Down").attr("checked", 'true');
                                break;
                            case "1":
                                $("#False_Storage_UpdatePrice_Up").attr("checked", 'true');
                                break;
                        }
                        //月盘
                        $("#pandianDay").val(varObjects[0].pandianDay);
                        //季盘
                        $("#pandianQuarter").val(varObjects[0].pandianQuarter);
                                           
                        $("#Id").val(varObjects[0].BaseId);
                        $("#DecimalNum").val(varObjects[0].DecimalNum);
                        $("#MoneyNum").val(varObjects[0].MoneyNum);
                        $("#BaseId").val(varObjects[0].Id);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        Bind()
       

    </script>
</body>
</html>
