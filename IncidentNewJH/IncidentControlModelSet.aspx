<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentControlModelSet.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentControlModelSet" %>

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
        <input type="hidden" id="HiInfoSource_Reply" name="HiInfoSource_Reply" runat="server" />
        <div style="height: 10px;"></div>

        <div class="panel panel-primary" style="width: 85%; margin: 0px auto; text-align: center;">

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">报事受理</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 32px;">
                        <td colspan="4" class="TContent">1、业主端报事系统默认报事大类：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">户内报事：</td>
                        <td class="TContent">
                            <input name="TypeName_Accep" type="text" id="TypeName_Accep" class="easyui-validatebox" onclick="SelIncidentType();" readonly="" runat="server" />
                            <input name="TypeCode_Accep" type="hidden" id="TypeCode_Accep" runat="server" />
                        </td>
                        <td class="Td">公区报事：</td>
                        <td class="TContent">
                            <input name="PubilcTypeName_Accep" type="text" id="PubilcTypeName_Accep" class="easyui-validatebox" onclick="SelIncidentType2();" readonly="" runat="server" />
                            <input name="PubilcTypeCode_Accep" type="hidden" id="PubilcTypeCode_Accep" runat="server" />
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" colspan="2">2、业主端报事是否允许选择人员：
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <%--</td>
                        <td class="TContent">--%>
                            <select id="IsSelPeople_Accep" name="IsSelPeople_Accep" runat="server" style="width: 120px; margin-left: 2%;">
                                <option value="是" selected="selected">是</option>
                                <option value="否">否</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" colspan="2">3、业主端报事选择人员业务规则：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">(1)人员状态：</td>
                        <td class="TContent">
                            <select id="EmployeeStatus_Accep" name="EmployeeStatus_Accep" runat="server" style="width: 120px;">
                                <option value="在线" selected="selected">在线</option>
                                <option value="离线">离线</option>
                                <option value="不限">不限</option>
                            </select>
                        </td>
                        <td class="Td">(2)在办工单：</td>
                        <td class="TContent">
                            <select id="Condition_Accep" name="Condition_Accep" runat="server" style="width: 50px;">
                                <option value="<=" selected="selected"><=</option>
                                <%--<option value=">">></option>--%>
                            </select>
                            <input id="Num_Accep" name="Num_Accep" style="width: 50px;" type="text" runat="server" runat="server" />单
                        </td>
                    </tr>
                </table>

            </div>
            <div class="divHe"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">抢单/派单</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 32px;">
                        <td class="TContent">1、是否开通区域工单：</td>
                        <td class="TContent">
                            <select id="IsOrge_Assigned" name="IsOrge_Assigned" runat="server" style="width: 120px;">
                                <option value="是" selected="selected">是</option>
                                <option value="否">否</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">2、员工抢单业务规则：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">(1)在办工单：</td>
                        <td class="TContent">
                            <select id="Condition_Assigned" name="Condition_Assigned" runat="server" style="width: 50px;">
                                <option value="<=" selected="selected"><=</option>
                                <%--<option value=">">></option>--%>
                            </select>
                            <input id="Num_Assigned" name="Num_Assigned" style="width: 50px;" type="text" runat="server" runat="server" />单
                        </td>
                        <td class="Td">(2)是否按预约到期先后抢单：</td>
                        <td class="TContent">
                            <select id="IsReserve_Assigned" name="IsReserve_Assigned" runat="server" style="width: 120px;">
                                <option value="是">是</option>
                                <option value="否" selected="selected">否</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">3、系统派单业务规则：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">(1)人员状态：</td>
                        <td class="TContent">
                            <select id="EmployeeStatus_Assigned" name="EmployeeStatus_Assigned" runat="server" style="width: 120px;">
                                <option value="在线" selected="selected">在线</option>
                                <option value="离线">离线</option>
                                <option value="不限">不限</option>
                            </select>
                        </td>
                        <td class="Td">(2)在办工单：</td>
                        <td class="TContent">
                            <select id="Condition2_Assigned" name="Condition2_Assigned" runat="server" style="width: 50px;">
                                <option value="<=" selected="selected"><=</option>
                                <%--<option value=">">></option>--%>
                            </select>
                            <input id="Num2_Assigned" name="Num2_Assigned" style="width: 50px;" type="text" runat="server" runat="server" />单
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="Td">(3)是否按员工星级优先派单：</td>
                        <td class="TContent">
                            <select id="IsEmployeeStar_Assigned" name="IsEmployeeStar_Assigned" runat="server" style="width: 120px;">
                                <option value="是">是</option>
                                <option value="否" selected="selected">否</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">报事处理</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 2px;">
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">1、到场、完成时照片上传方式：</td>
                        <td class="TContent">
                            <select id="IsUploadImg_Handle" name="IsUploadImg_Handle" runat="server" style="width: 120px;">
                                <option value="直接拍照" selected="selected">直接拍照</option>
                                <option value="相册选择">相册选择</option>
                                <option value="不限">不限</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">2、有偿服务是否需要事前确认：</td>
                        <td class="TContent">
                            <select id="IsConfirm_Handle" name="IsConfirm_Handle" runat="server" style="width: 120px;">
                                <option value="是" selected="selected">是</option>
                                <option value="否">否</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">报事回访</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 32px;">
                        <td colspan="6" class="TContent">1、报事回访范围：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="3" class="TContent">（1）书面报事的投诉工单</td>
                        <td colspan="3" class="TContent">（2）书面报事的收费工单</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="6" class="TContent">（3）满足条件的其它工单：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" colspan="6">&nbsp;&nbsp;&nbsp;①报事类型：书面派工

                        <%--</td>
                        <td class="TContent" style="width: 16.66%">--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;②是否回访：是

                       <%-- </td>
                        <td class="TContent" style="width: 16.66%">--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;③报事来源：
                            <select id="Source_Reply" name="Source_Reply" runat="server" style="width: 90px;">
                                <option value="客户报事">客户报事</option>
                                <option value="自查报事">自查报事</option>
                                <option value="全部" selected="selected">全部</option>
                            </select>

                            <%--</td>
                        <td class="TContent" style="width: 16.66%">--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;④报事位置：
                            <select id="Position_Reply" name="Position_Reply" runat="server" style="width: 90px;">
                                <option value="户内">户内</option>
                                <option value="公区">公区</option>
                                <option value="全部" selected="selected">全部</option>
                            </select>

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⑤报事方式：
                            <select id="InfoSource_Reply" name="InfoSource_Reply" class="easyui-combobox"
                                data-options=" multiple: true " style="width: 90px;" runat="server">
                            </select>
                        </td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="6" class="TContent">2、报事回访评价：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="6" class="TContent">（1）综合满意度评价维度：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="非常满意" id="checkbox_1" name="checkbox_1" runat="server" disabled="disabled" checked="checked" />
                            非常满意</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="满意" id="checkbox_2" name="checkbox_2" runat="server" disabled="disabled" checked="checked" />
                            满意</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="一般" id="checkbox_3" name="checkbox_3" runat="server" />
                            一般</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="不满意" id="checkbox_4" name="checkbox_4" runat="server" disabled="disabled" checked="checked" />
                            不满意</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="非常不满意" id="checkbox_5" name="checkbox_5" runat="server" disabled="disabled" checked="checked" />
                            非常不满意：</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="无效评价" id="checkbox_6" name="checkbox_6" runat="server" checked="checked" />
                            无效评价</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="6" class="TContent">（2）其它评价维度：</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="服务是否及时" id="checkbox_7" name="checkbox_7" runat="server" />
                            服务是否及时</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="问题是否解决" id="checkbox_8" name="checkbox_8" runat="server" />
                            问题是否解决</td>
                        <td class="TContent" style="width: 16.66%">
                            <input type="checkbox" value="言行是否合规" id="checkbox_9" name="checkbox_9" runat="server" />
                            言行是否合规</td>
                    </tr>
                </table>

            </div>
            <div class="divHe"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">时间周期</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 2px;">
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                        <td class="TContent"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">系统派单、报事预警时间周期：</td>
                        <td class="TContent" colspan="3">
                            <input type="text" id="Minute" name="Minute" runat="server" />分钟（不得低于5分钟）
                        </td>
                    </tr>
                </table>
            </div>

            <div class="divHe"></div>

        </div>

        <div style="text-align: center; width: 100%; height: 45px; line-height: 45px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
    </form>
    <script type="text/javascript">
        function SelIncidentType() {
            HDialog.Open(650, 530, "../IncidentNew/ReportMatterIncidentTypeHaveSon.aspx?IsOutSel=1" + "&Ram=" + Math.random(), "请选择原因大类", 'true', function callback(varReturn) {
                if (varReturn != "") {//**获得返回的参数信息     
                    varReturn = eval("(" + varReturn + ")");
                    varReturn = eval("(" + varReturn + ")");
                    $('#TypeName_Accep').val(varReturn[0].TypeName);
                    $('#TypeCode_Accep').val(varReturn[0].TypeID);
                }
            });
        }

        function SelIncidentType2() {
            HDialog.Open(650, 530, "../IncidentNew/ReportMatterIncidentTypeHaveSon.aspx?IsOutSel=1" + "&Ram=" + Math.random(), "请选择原因大类", 'true', function callback(varReturn) {
                if (varReturn != "") {//**获得返回的参数信息     
                    varReturn = eval("(" + varReturn + ")");
                    varReturn = eval("(" + varReturn + ")");
                    $('#PubilcTypeName_Accep').val(varReturn[0].TypeName);
                    $('#PubilcTypeCode_Accep').val(varReturn[0].TypeID);
                }
            });
        }

        window.onload = function () {
            var InfoSo = $('#HiInfoSource_Reply').val();

            $("#InfoSource_Reply").combobox({

                onChange: function () {
                    var InfoSource = $("#InfoSource_Reply").combobox('getText');
                    //console.log(InfoSource);
                    if (InfoSource != "") {
                        $('#HiInfoSource_Reply').val(InfoSource);
                    }
                }
            });

            if (InfoSo != "") {
                var arr = InfoSo.split(',');
                for (var i = 0; i < arr.length; i++) {
                    $("#InfoSource_Reply").combobox('select', arr[i]);
                }
            }
        }


    </script>
</body>
</html>
