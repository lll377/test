<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanInfoManage.aspx.cs" Inherits="M_Main.InformationManage.PlanInfoManage" %>

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
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style>
        body {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <form id="PlanForm" runat="server">
        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td class="TdTitle">规划区域</td>
                <td class="TdContentSearch">
                    <input type="text" id="PlanArea" class="easyui-validatebox textbox_two" data-options="required:true" name="PlanArea" runat="server" />
                    <input type="hidden" id="PlanID" name="PlanID" runat="server" />
                </td>
                <td class="TdTitle">容积率</td>
                <td class="TdContentSearch">
                    <input type="text" id="VolumeRate"  class="easyui-numberbox" precision="2" max="99999.99"   data-options="required:true" name="VolumeRate" runat="server" />%
                </td>
            </tr>
            
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="background-color: gray; color: white; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">占地面积</span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td class="TdTitle">住宅用地</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-numberbox" precision="2"  id="ResidentialArea" name="ResidentialArea" runat="server" /> ㎡
                </td>

                <td class="TdTitle">公建用地</td>
                <td class="TdContentSearch">
                    <input type="text"  class="easyui-numberbox" precision="2"   id="PublicArea" name="PublicArea" runat="server" /> ㎡
                </td>
            </tr>
            <tr>
                <td class="TdTitle">道路用地</td>
                <td class="TdContentSearch">
                    <input type="text"  class="easyui-numberbox" precision="2"   id="RoadArea" name="RoadArea" runat="server" /> ㎡
                </td>

                <td class="TdTitle">公共绿地</td>
                <td class="TdContentSearch">
                    <input type="text"  class="easyui-numberbox" precision="2"   id="GreenArea" name="GreenArea" runat="server" /> ㎡
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="background-color: gray; color: white; font-size: 16px; text-align: center; font-weight: 100; font-family: 微软雅黑;">
                    <span style="font-size: 16px">物业数量</span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td class="TdTitle">住宅</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-numberbox" id="HouseQuantity" name="HouseQuantity" runat="server" /> 户
                </td>

                <td class="TdTitle">商业</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-numberbox" id="CommercialAuantity" name="CommercialAuantity" runat="server" /> 户
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-numberbox" id="ParkeNumber" name="ParkeNumber" runat="server" /> 户
                </td>

                <td class="TdTitle">其他</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-numberbox" id="OtherQuantity" name="OtherQuantity" runat="server" /> 户
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="background-color: gray; color: white; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">总建筑面积</span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 10px;"></td>
            </tr>
            <tr>
                <td class="TdTitle">住宅</td>
                <td class="TdContentSearch">
                    <input type="text"   class="easyui-numberbox" precision="2"  id="TotalResidentialArea" name="TotalResidentialArea" runat="server" /> ㎡
                </td>

                <td class="TdTitle">商业</td>
                <td class="TdContentSearch">
                    <input type="text"   class="easyui-numberbox" precision="2"  id="TotalCommercialArea" name="TotalCommercialArea" runat="server" /> ㎡
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位</td>
                <td class="TdContentSearch">
                    <input type="text"   class="easyui-numberbox" precision="2"  id="TotalParkingArea" name="TotalParkingArea" runat="server" /> ㎡
                </td>

                <td class="TdTitle">其他</td>
                <td class="TdContentSearch">
                    <input type="text"   class="easyui-numberbox" precision="2"  id="OtherTotalArea" name="OtherTotalArea" runat="server" /> ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="height: 26px;">文件上传</td>
                <td colspan="3">
                    <span style="float: left">文件说明：
                            <input id="FileRemark" name="FileRemark" runat="server" style="width: 190px" />
                    </span>
                    <input style="float: left; width: 240px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
                    <input style="float: left; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        value="上传" type="button" name="btnFileUp" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False" OnItemCommand="DGrid_ItemCommand">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn DataField="FileRemark" HeaderText="文件说明">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="FileSize" HeaderText="大小(KB)" DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[下载]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="[删除]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" TabIndex="1" runat="server" CausesValidation="false" CommandName="Delete"
                                        Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
            <tr>
                <td style="height: 60px;"></td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" onclick="javascript: if (CheckAllData() == false) return false;" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script>
    $(function () {

        $("#btnReturn").click(function () {
            close("1");
        })

        $("#btnFile").change(function () {
            $("#FileRemark").val(this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1"));
        });

        //保存
        //$("#btnSave").click(function () {
        //    $.tool.DataPostChk('PlanForm', 'PlanInfo', 'Insert', $('#PlanForm').serialize(),
        //        function Init() {
        //        },
        //        function callback(_Data) {
        //            var data = _Data.split("|");
        //            if (data[0] == "true") {
        //                HDialog.Info(data[1]);
        //                close("1");
        //            }
        //            else {
        //                HDialog.Info(data[1]);
        //            }
        //        },
        //        function completeCallback() {
        //        },
        //        function errorCallback() {

        //        })
        //})
    })

    function CheckAllData() {
        return $("#PlanForm").form('validate');
    }

    function btnFileUp_Onclick() {

        if ($('#FileRemark').val() == "" || $('#FileRemark').val() == null) {
            HDialog.Info("请输入文件附件名称,此项不能为空!");
            return false;
        }

        if ($('#btnFile').val() == "" || $('#btnFile').val() == null) {
            HDialog.Info("请选择要上传的本地文件!");
            return false;
        }

        return true;
    }

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>
