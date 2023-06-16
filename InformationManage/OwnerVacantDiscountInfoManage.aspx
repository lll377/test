<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OwnerVacantDiscountInfoManage.aspx.cs" Inherits="M_Main.InformationManage.OwnerVacantDiscountInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>业主空置优惠信息-编辑</title>
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
    <style>
        .TdTitle {
            height: 16px;
            width: 20%;
            text-align: center;
            padding-left: 20px;
        }
    </style>
</head>
<body>

    <form id="OwnerVacantDiscountForm" runat="server">
        <input type="hidden" id="OwnerVacantDiscountID" name="OwnerVacantDiscountID" runat="server" />
        <table class="DialogTable" style="width: 100%;">
            <tr>
                <td class="TdTitle">业主空置房收取比例：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="CollectProportion" name="CollectProportion" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="height: 26px;">文件上传</td>
                <td>
                    <span style="float: left">文件说明：
                            <input id="FileRemark" name="FileRemark" runat="server" type="text" class="textbox_two" />
                    </span>
                    <input style="float: left; width: 200px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
                    <input style="float: left; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        value="上传" type="button" name="btnFileUp" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
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

        </table>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="btnSave" type="button" id="btnSave" class="button" onclick="javascript: if (CheckAllData() == false) return false;" value="保存" runat="server" />
            <input type="button" class="button" value="放弃" id="btnReturn" />
        </div>

    </form>
    <script>

        function CheckData() {
            if ($('#CollectProportion').val() == "") {
                HDialog.Info("业主空置房收取比例,此项不能为空!");
                $('#CollectProportion').focus();
                return false;
            }
            return true;
        }

        $(function () {
            //取消
            $("#btnReturn").click(function () {
                HDialog.Close("");
            });

            //保存
            //$("#btnSave").click(function () {
            //    if (CheckData()) {
            //        $.tool.DataPostChk('OwnerVacantDiscountForm', 'OwnerVacantDiscountInfo', 'Insert', $('#OwnerVacantDiscountForm').serialize(),
            //            function Init() {
            //            },
            //            function callback(_Data) {
            //                if (_Data == "true") {
            //                    HDialog.Info("保存成功!");
            //                    HDialog.Close("true");
            //                }
            //            },
            //            function completeCallback() {
            //            },
            //            function errorCallback() {
            //                HDialog.Info("保存错误!");
            //            })
            //    }
            //});
        })

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

        $("#btnFile").change(function () {
            $("#FileRemark").val(this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1"));
        });

        function CheckAllData() {
            return $("#LitigationForm").form('validate');
        }
    </script>
</body>
</html>

