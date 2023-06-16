<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceFeesLeftNew.aspx.cs" Inherits="M_Main.ChargesNew.ReceFeesLeftNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>前台收费树</title>
    <link href="../Jscript-Ui/zTree_v3/zTreeStyle.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <script src="../Jscript-Ui/zTree_v3/jquery-1.4.4.min.js"></script>
    <script src="../Jscript-Ui/zTree_v3/jquery.ztree.core.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--<input type="text" data-options="prompt:'请选择项目',searcher:SelCommInfo" id="CommName" class="easyui-searchbox" />--%>
        <input type="hidden" id="CommId" runat="server" />
        <%--<a href="javascript:void(0)" class="easyui-linkbutton reloadbtn" id="clears" data-options="iconCls:'icon-reload'">清空</a>--%>
        <div id="trees" class="ztree">
        </div>
    </form>

    <script>
        var setting = {
            treeId: 'ztrees',
            async: {
                enable: true,
                url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum","FloorSNum"],
                otherParam: ['selCommId', $("#CommId").val()]
            },
            callback: {
                onClick: function (event, treeId, treeNode) {
                    parent.$("#ReceFeesBrowse").attr("src", "ReceFeesBrowse.aspx?CommID=" + treeNode.Id + "&RoomID=" + treeNode.RoomID);
                }
            }
        };

        function SelCommInfo() {
            HDialog.Open(570, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommId").val(arrRet.id);
                $("#CommName").searchbox('setValue', arrRet.name);
                var setting_sel = {
                    treeId: 'ztrees',
                    async: {
                        enable: true,
                        url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                        autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum", "FloorSNum"],
                        otherParam: ['selCommId', $("#CommId").val()]
                    },
                    callback: {
                        onClick: function (event, treeId, treeNode) {
                            parent.$("#ReceFeesBrowse").attr("src", "ReceFeesBrowse.aspx?CommID=" + treeNode.Id + "&RoomID=" + treeNode.RoomID);
                        }
                    }
                };
                $.fn.zTree.init($("#trees"), setting_sel, null);
            });
        };

        $(function () {
            $.fn.zTree.init($("#trees"), setting, null);
            //$('#clears').bind('click', function () {
            //    $.fn.zTree.init($("#trees"), setting, null);
            //    $("#CommId").val(null);
            //    $("#CommName").searchbox('setValue', null);
            //});
        })
    </script>
</body>
</html>
