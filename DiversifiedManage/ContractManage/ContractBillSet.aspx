<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractBillSet.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractBillSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经管理-合同编号设置</title>
    <script src="../../jscript/jquery-1.11.3.min.js"></script>
    <link href="../../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link href="../../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .panel-body div {
            margin-bottom: 5px;
        }

        body {
            margin-top: 50px;
        }

        label {
            cursor: pointer;
            font-weight:normal;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; margin: 0px auto;">

            <div style="width: 650px; margin: 0px auto;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-info-circle"></i>&nbsp;合同参数设置
                    </div>
                    <div class="panel-body">
                        <div style="margin-bottom: 5px;">
                            合同编号生成模式：<label>
                                <input id="BillFlag1" type="radio" checked value="Radio1" name="BillFlag" runat="server" />手动输入合同编号&nbsp;</label>
                            <label>
                                <input id="BillFlag2" type="radio" value="Radio2" name="BillFlag" runat="server" />&nbsp;系统默认合同编号</label>
                        </div>
                        <div style="margin-bottom: 5px;">
                            合同点位办理模式：<label>
                                <input id="IsAutoHandle1" type="radio" checked value="Radio1" name="IsAutoHandle" runat="server" />手动办理启用退租&nbsp;</label>
                            <label>
                                <input id="IsAutoHandle2" type="radio" value="Radio2" name="IsAutoHandle" runat="server" />&nbsp;自动办理启用退租</label>
                        </div>
                        <div style="padding-top: 5px; width: 100%; text-align: center;">
                            <input onserverclick="BtnSave_ServerClick" type="button" class="button" value="保存" id="BtnSave" runat="server" />
                        </div>

                    </div>
                    <div class="panel-footer">
                        *备注：系统默认合同编号结构为：收入合同“SR+年度+6位流水号”。
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
