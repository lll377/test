<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSetVersionBrowse.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSetVersionBrowse" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>    
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <style>
        .panel-body div {
            margin-bottom:5px;
        }
        #row1 .panel-body {
            height:140px;
        }
        #row1 .panel-footer {
            height:180px;
        }

         #row2 .panel-body {
            height:100px;
        }
        #row2 .panel-footer {
            height:130px;
        }

        #row3 .panel-body {
            height:100px;
        }
        #row3 .panel-footer {
            height:130px;
        }

    </style>
</head>
<body>
<form id="frmForm">
<input id="ConfigID" type="hidden" name="ConfigID" runat="server" />
<div class="row" style="margin-left:3px;margin-right:3px;">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5></h5>
                    </div>
                    <div class="ibox-content">

                        <div id="row1" class="row">
                            <div class="col-sm-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <i class="fa fa-info-circle"></i>&nbsp;凭证版本设置
                                    </div>
                                    <div class="panel-body">
                                        <div style="margin-bottom:5px;">凭证输出版本：
                                            <select id="VersionCode" name="VersionCode" runat="server">
                                            <option value="U8">用友U8版</option>
	                                        <option value="T6">用友T6版</option>
	                                        <option value="T6_2">用友T6版2</option>
	                                        <option value="T_2B">用友T+版</option>
	                                        <option value="NC">用友NC版</option>
	                                        <option value="JD">金蝶KIS</option>
	                                        <option value="JDW">金蝶WIS</option>
	                                        <option value="JDE">金蝶EAS</option>
	                                        <option value="JDS">金蝶EAS版本2</option>
	                                        <option value="JDS7">金蝶EAS7.5版本</option>
	                                        <option value="JDDBF">金蝶EASS版本2(dbf)</option>
	                                        <option value="JDK">金蝶K3</option>
                                            </select></div>                                       
                                    </div>
                                    <div class="panel-footer">
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <div style="height:50px;"></div>
        <div style="text-align:center;bottom:0;position:fixed;width:100%;height:50px;line-height:50px;background-color:#f5f5f5;margin-right:45px;border-top:1px solid #E7EAEC;"><input type="button" class="button" value="保存" id="BtnSave"  /></div>
        <script type="text/javascript">
            $("#BtnSave").click(function (e) {
                HDialog.Prompt("确认保存吗?", function a() {

                    $.tool.DataPost('UFJDPushFees', 'SaveVersion', $("#frmForm").serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {
                                HDialog.Info("保存成功");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                })
            });
        </script>
    </form>
</body>
</html>