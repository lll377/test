<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractInfoManage.aspx.cs" Inherits="M_Main.InformationManage.ContractInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script language="javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <style>
        body {
            overflow-y: scroll;
        }
    </style>
    <style type="text/css">
        .tipRed {
            color: red;
        }

        .TableForm {
            width: 99%;
            margin: 5px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }


            .TableForm tr td.TdTitle {
                color: #666;
                padding: 4px;
                width: 13%;
                text-align: right;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
                background: #F8F8F8;
            }

            .TableForm tr td.TdContentSearch {
                padding: 4px;
                width: 20%;
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

            .TableForm tr td input[type=checkbox] {
                width: 16px;
                height: 16px;
            }

        .HeavyMoment {
            display: none;
        }
    </style>
</head>
<body>
    <form id="ContractForm" runat="server">
        <input type="hidden" value="" id="HidContractID" name="HidContractID" runat="server" />
        <table class="TableForm" id="Table1">
            <tr>
                <td class="TdTitle">项目营业执照的物业公司全称</td>
                <td class="TdContentSearch">
                    <input type="text" id="PropertyName" name="PropertyName" class="easyui-validatebox" data-options="required:true" runat="server" />
                </td>
                <td class="TdTitle">合同类型</td>
                <td class="TdContentSearch">
                    <select name="ContractType" id="ContractType" runat="server" data-options="required:true"></select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">常规物业收费模式</td>
                <td class="TdContentSearch">
                    <select name="ConventionalCharges" id="ConventionalCharges" runat="server" data-options="required:true"></select>
                </td>
                <td class="TdTitle">常规物业服务模式</td>
                <td class="TdContentSearch">
                    <select name="ConventionalServicea" id="ConventionalServicea" runat="server" data-options="required:true"></select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractName" name="ContractName" class="easyui-validatebox" data-options="required:false" runat="server" />
                </td>
                <td class="TdTitle">合同状态</td>
                <td class="TdContentSearch" colspan="3">
                    <select name="ContractState" id="ContractState" runat="server" data-options="required:true">
                        <option value="有效" checked="checked">有效</option>
                        <option value="已失效">已失效</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同甲方<span class="tipRed">*</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="PartyA" name="PartyA" class="easyui-validatebox" data-options="required:true" runat="server" />
                    <input type="hidden" id="ContractID" name="ContractID" runat="server" />
                    <a id="tipContractID" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>
                <td class="TdTitle">合同乙方<span class="tipRed">*</span></td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" id="PartyB" name="PartyB" class="easyui-validatebox" data-options="required:true" runat="server" />
                    <a id="tipPartyB" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">合同管理范围</td>
                <td class="TdContentSearch">
                    <input type="text" id="ManageScope" name="ManageScope" runat="server" />
                    <a id="tipManageScope" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>

                <td class="TdTitle">合同管理面积<span class="tipRed">*</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="TotalManageArea" name="TotalManageArea" class="easyui-numberbox" precision="2" data-options="required:true" runat="server" />
                    ㎡<a id="tipTotalManageArea" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">合同签订日期<span class="tipRed">*</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractDate" name="ContractDate" class="easyui-validatebox Wdate" data-options="required:true" runat="server" onclick="WdatePicker()" />
                    <a id="tipContractDate" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>
                <td class="TdTitle">合同结束日期<span class="tipRed">*</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractEndDate" name="ContractEndDate" class="easyui-validatebox Wdate" data-options="required:true" runat="server" onclick="WdatePicker()" />
                    <a id="tipContractEndDate" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                    <input type="checkbox" value="false" id="ContractEndDateCheck" name="ContractEndDateCheck" onchange="onchange_checkbox(this)" runat="server" />无固定期限
                   
                </td>
            </tr>

            <tr>
                <td class="TdTitle">合同生效日期<span class="tipRed">*</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractCommDate" name="ContractCommDate" class="easyui-validatebox Wdate" data-options="required:true" runat="server" onclick="WdatePicker()" />
                    <a id="tipContractCommDate" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                </td>
                <td class="TdTitle">合同金额</td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractAmount" class="easyui-numberbox areatxt" precision="2" name="ContractAmount" runat="server" />
                    元
                </td>
            </tr>

            <tr>
                <td class="TdTitle">开发商股权从属</td>
                <td class="TdContentSearch">
                    <input type="text" id="DeveloperEquitySubordination" name="DeveloperEquitySubordination" class="easyui-validatebox" data-options="required:false" runat="server" />
                </td>

                <td class="TdTitle">关连方持股比例</td>
                <td class="TdContentSearch">
                    <input type="text" id="ShareholdingRatioOfRelatedParties" class="easyui-numberbox areatxt" precision="0" name="ShareholdingRatioOfRelatedParties" runat="server" />
                    %
                </td>
            </tr>

            <tr>
                <td class="TdTitle">占地面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="CoverageArea" class="easyui-numberbox areatxt" precision="2" name="CoverageArea" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">建筑面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ConstructionArea" class="easyui-numberbox areatxt" precision="2" name="ConstructionArea" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">收费面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ChargesArea" class="easyui-numberbox areatxt" precision="2" name="ChargesArea" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">高层面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="HighRiseArea" class="easyui-numberbox areatxt" precision="2" name="HighRiseArea" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">小高层面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="TinyHighRiseArea" class="easyui-numberbox areatxt" precision="2" name="TinyHighRiseArea" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">多层面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="MultiLayerArea" class="easyui-numberbox areatxt" precision="2" name="MultiLayerArea" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">双拼/联排别墅面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="TownHouseArea" name="TownHouseArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">独栋别墅面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="FamilyVillasArea" name="FamilyVillasArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">办公面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="OfficeArea" name="OfficeArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">商业面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="BusinessArea" name="BusinessArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">幼儿园面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="KindergartenArea" name="KindergartenArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">会所面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClubArea" name="ClubArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">管理用房面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ManageRoomArea" name="ManageRoomArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">步梯洋房面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="LadderHouseArea" name="LadderHouseArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">电梯洋房面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ElevatorVillaArea" name="ElevatorVillaArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">三拼别墅面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ThreeSpellVillaArea" name="ThreeSpellVillaArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">四拼别墅面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="FourSpellVillaArea" name="FourSpellVillaArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">公寓面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ApartmentArea" name="ApartmentArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">花园面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="GardenArea" name="GardenArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">地下室面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="BasementArea" name="BasementArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">商铺面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="ShopsArea" name="ShopsArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">办公楼/写字楼面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="OfficeBuildeArea" name="OfficeBuildeArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">地下车位数量</td>
                <td class="TdContentSearch">
                    <input type="text" id="UndergroundParkeTotalCount" name="UndergroundParkeTotalCount" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">地下车位面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="UndergroundParkeArea" name="UndergroundParkeArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">露天车位数量</td>
                <td class="TdContentSearch">
                    <input type="text" id="OpenParkeTotalCount" name="OpenParkeTotalCount" class="easyui-numberbox areatxt" precision="0" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">露天车位面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="OpenParkeArea" name="OpenParkeArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">学校面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="SchoolArea" name="SchoolArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>

                <td class="TdTitle">其他面积</td>
                <td class="TdContentSearch">
                    <input type="text" id="OtherArea" name="OtherArea" class="easyui-numberbox areatxt" precision="2" runat="server" />
                    ㎡
                </td>
            </tr>

            <tr>
                <td class="TdTitle">合同变更日期</td>
                <td class="TdContentSearch" colspan="3">
                    <label id="UpdateDate" runat="server"></label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="SearchContainer" id="TableContainer2" style="width: 99%"></div>
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="height: 26px;">文件上传<span class="tipRed">*</span> <a id="tipFileRemark" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a></td>
                <td colspan="3">
                    <span style="float: left">文件说明：
                            <input id="FileRemark" name="FileRemark" runat="server" style="width: 190px" />
                    </span>
                    <input style="float: left; width: 200px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
                    <input style="float: left; line-height: 24px; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
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

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 40px; line-height: 40px; background-color: #f5f5f5;">
            <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" onclick="javascript: if (CheckAllData() == false) return false;" />
            <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
        </div>
    </form>
</body>
</html>

<script>
    $('#tipFileRemark').tooltip({
        position: 'top',
        content: '<div><p>有录入合同信息则必须同步上传合同盖章版扫描件，若有录入合同信息但未上传合同文件则保存不成功!</p></div>',
    });
    $('#tipContractID').tooltip({
        position: 'top',
        content: '<div><p>按照合同签订的甲方名称录入。</p></div>',
    });
    $('#tipPartyB').tooltip({
        position: 'top',
        content: '<div><p>按照合同签订的乙方名称录入。</p></div>',
    });
    $('#tipManageScope').tooltip({
        position: 'top',
        content: '<div><p>填写物业管理合同约定的物业管理区域（四至）。</p></div>',
    });
    $('#tipTotalManageArea').tooltip({
        position: 'top',
        content: '<div><p>按照合同“物业基本情况”中的建筑面积面积填写，无约定建筑面积的，填写合同约定的管理面积。</p><p>（系统设置检验公式：合同管理面积必须等于所有面积之和，否则无法保存）。</p></div>',
    });
    $('#tipContractCommDate').tooltip({
        position: 'top',
        content: '<div><p>根据合同签订的生效日期填写,不能留空。</p></div>',
    });
    $('#tipContractEndDate').tooltip({
        position: 'top',
        content: '<div><p>根据合同约定条款填写，有固定服务期限的合同则填写具体的结束日期；无约定结束时间的则按统一填写“无固定期限”。</p></div>',
    });
    $('#tipContractDate').tooltip({
        position: 'top',
        content: '<div><p>填写合同签订的日期。</p></div>',
    });

    function onchange_checkbox(obj) {
        var id = $(obj).attr("id").replace('Check', '');
        if ($(obj).is(':checked')) {
            $("#" + id).val('');
            $("#" + id).attr('disabled', 'disabled');
            $("#" + id).validatebox('disableValidation');
        } else {
            $("#" + id).removeAttr('disabled');
            $("#" + id).validatebox('enableValidation');
        }
        $(obj).val($(obj).is(':checked'));
    }
    var column = [[
        { field: 'ID', title: '', width: 50, align: 'center', sortable: true, hidden: true },
        { field: 'ContractID', title: '物资类别', width: 100, align: 'center', sortable: true, hidden: true },
        { field: 'CostID', title: '标准类型', width: 200, align: 'center', sortable: true },
        { field: 'Price', title: '单  价', width: 100, align: 'center', sortable: true, editor: { type: 'numberbox', options: { precision: 6, min: 0 } } },
        { field: 'Memo', title: '单  位', align: 'center', width: 100, sortable: true }
    ]];

    var editIndex = undefined;
    var toolbar;
    var toolbar = [
        {
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                Detail();
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer2").datagrid("getSelected");
                $.tool.DataGet('ContractInfo', 'DelContractCost', 'ID=' + row["ID"],
                    function Init() {
                    },
                    function callback(_Data) {
                        var row = $("#TableContainer2").datagrid("getSelected");
                        var index = $("#TableContainer2").datagrid("getRowIndex", row);
                        $('#TableContainer2').datagrid('deleteRow', index);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }

    ];
    function InitFunction() {
        $("#TableContainer2").css("height", "250px");
    }



    function LoadList2() {
        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            onAfterEdit: function (rowIndex, rowData, changes) {//结束修改，提交数据
                //var TaxesStr = Taxes.TaxPrice(rowData["Price"], rowData["Taxes"]);

                //rowData["NoTaxPrice"] = parseFloat(TaxesStr).toFixed(decimalPos);
                $.tool.DataPost('ContractInfo', 'UpdateContractCost', '&List=[' + JSON.stringify(rowData) + ']',
                    function Init() {
                    },
                    function callback(_Data1) {
                        LoadList2();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            },
            onDblClickCell: function (rowIndex, rowData) {//开始修改
                if (editIndex != undefined) {
                    $(this).datagrid('endEdit', editIndex);
                }
                $(this).datagrid('beginEdit', rowIndex);
                var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'Price' });
                $(ed.target).focus();
                editIndex = rowIndex;
            },
            onClickRow: function (rowIndex, rowData) {
                $(this).datagrid('endEdit', editIndex);
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("ContractInfo", "GetContractCostList", "TableContainer2", param);
            },
            onLoadSuccess: function (data) {
                $("#SearchDlg").dialog("close");
            }
        });
    }


    function Detail() {//Id、操作类型
        var w = top.$(window).width() * 0.5;
        var h = parent.$(window).height() * 0.5;

        HDialog.Open(w, h, '../InformationManage/ContractInfoManageCost.aspx?ContractID=' + $("#HidContractID").val(), '添加标准信息', true, function callback(_Data) {
            LoadList2();
        });
    }



    $(function () {
        InitFunction();

        onchange_checkbox($("#ContractEndDateCheck"));

        $("#btnFile").change(function () {
            $("#FileRemark").val(this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1"));
        });

        $("#btnReturn").click(function () {
            close("1");
        })

        //计算面积和
        //$(".areatxt").each(function () {
        //    $(this).next("span").children().first().blur(function () {
        //        var areas = parseFloat(parseFloat($("#LadderHouseArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ElevatorVillaArea").val()) || 0)
        //            + parseFloat(parseFloat($("#FamilyVillasArea").val()) || 0)
        //            + parseFloat(parseFloat($("#TownHouseArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ThreeSpellVillaArea").val()) || 0)
        //            + parseFloat(parseFloat($("#FourSpellVillaArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ApartmentArea").val()) || 0)
        //            + parseFloat(parseFloat($("#GardenArea").val()) || 0)
        //            + parseFloat(parseFloat($("#BasementArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ShopsArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ClubArea").val()) || 0)
        //            + parseFloat(parseFloat($("#OfficeBuildeArea").val()) || 0)
        //            + parseFloat(parseFloat($("#SchoolArea").val()) || 0)
        //            + parseFloat(parseFloat($("#UndergroundParkeArea").val()) || 0)
        //            + parseFloat(parseFloat($("#OpenParkeArea").val()) || 0)
        //            + parseFloat(parseFloat($("#ManageRoomArea").val()) || 0)
        //            + parseFloat(parseFloat($("#OtherArea").val()) || 0);
        //        $("#TotalManageArea").val(parseFloat(areas.toFixed(2)));
        //    })
        //});


        //加载列表
        var ContractID = "";
        ContractID = $('#HidContractID').val();
        if (ContractID != "") {
            LoadList2();
        }

    })

    function CheckAllData() {
        var result = $("#ContractForm").form('validate');

        //alert(result);
        var msg = "";
        //var msg = "列表不能为空,且标准类型为 ( 物业服务费违约金收费标准 ) 是必添加项!";
        var areas = parseFloat(parseFloat($("#LadderHouseArea").val()) || 0)
            + parseFloat(parseFloat($("#ElevatorVillaArea").val()) || 0)
            + parseFloat(parseFloat($("#FamilyVillasArea").val()) || 0)
            + parseFloat(parseFloat($("#TownHouseArea").val()) || 0)
            + parseFloat(parseFloat($("#ThreeSpellVillaArea").val()) || 0)
            + parseFloat(parseFloat($("#FourSpellVillaArea").val()) || 0)
            + parseFloat(parseFloat($("#ApartmentArea").val()) || 0)
            + parseFloat(parseFloat($("#GardenArea").val()) || 0)
            + parseFloat(parseFloat($("#BasementArea").val()) || 0)
            + parseFloat(parseFloat($("#ShopsArea").val()) || 0)
            + parseFloat(parseFloat($("#ClubArea").val()) || 0)
            + parseFloat(parseFloat($("#OfficeBuildeArea").val()) || 0)
            + parseFloat(parseFloat($("#SchoolArea").val()) || 0)
            + parseFloat(parseFloat($("#UndergroundParkeArea").val()) || 0)
            + parseFloat(parseFloat($("#OpenParkeArea").val()) || 0)
            + parseFloat(parseFloat($("#ManageRoomArea").val()) || 0)
            + parseFloat(parseFloat($("#OtherArea").val()) || 0);
        //alert(areas);
        //alert($("#TotalManageArea").val());
        if (result) {
            var rows = $('#TableContainer2').datagrid('getRows');
            //debugger;
            if (rows.length > 0) {
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].CostID == "物业服务费违约金收费标准") {
                        msg = "";
                        break;
                    }
                }
            }
            if (rows.length == 0) {
                msg = "收费类型列表不能为空,且标准类型为 ( 物业服务费违约金收费标准 ) 是必添加项!";
            }
            if ($("#DGrid tr").length == 1) {
                msg = "必须上传1个或多个附件,请上传附件!";
            }
            if (parseFloat($("#TotalManageArea").val()) != parseFloat(areas.toFixed(2))) {
                msg = "合同管理面积不正确,不等于所有面积之和!";
            }
            if (msg != "") {
                HDialog.Info(msg);
                result = false;
            } else {
                result = true;
            }
        }

        return result;
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
