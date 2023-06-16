<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditingSetBrowse.aspx.cs" Inherits="M_Main.ChargesNew.AuditingSetBrowse" %>
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
            height:80px;
        }
        #row1 .panel-footer {
            height:80px;
        }

         #row2 .panel-body {
            height:80px;
        }
        #row2 .panel-footer {
            height:80px;
        }

        #row3 .panel-body {
            height:80px;
        }
        #row3 .panel-footer {
            height:80px;
        }

    </style>
</head>
<body>
<form id="frmForm">
<input id="SetID" type="hidden" name="SetID" runat="server" />
<input id="IsAuditing8" type="hidden" size="1" name="IsAuditing8" runat="server" />
<input id="IsAuditing13" type="hidden" value="1" name="IsAuditing13" runat="server" />
<input id="IsAuditing1" type="hidden" value="1" name="IsAuditing1" runat="server" />
<input id="IsAuditing3" type="hidden" value="1" name="IsAuditing3" runat="server" />
<input id="IsAuditing7" type="hidden" value="1" name="IsAuditing7" runat="server" />
<input id="IsAuditing2" type="hidden" value="1" name="IsAuditing2" runat="server" />
<input id="IsAuditing6" type="hidden" value="1" name="IsAuditing6" runat="server" />
<input id="IsAuditing19" type="hidden" value="1" name="IsAuditing19" runat="server" />
    
<input id="IsAuditing5" type="hidden" value="1" name="IsAuditing5" runat="server" />
<input id="IsAuditing18" type="hidden" value="1" name="IsAuditing18" runat="server" />
<input id="IsAuditing9" type="hidden" value="1" name="IsAuditing9" runat="server" />
<input id="IsAuditing11" type="hidden" value="1" name="IsAuditing11" runat="server" />
<input id="IsAuditing10" type="hidden" value="1" name="IsAuditing10" runat="server" />
<input id="IsAuditing15" type="hidden" value="1" name="IsAuditing15" runat="server" /> 
<input id="IsAuditing22" type="hidden" value="1" name="IsAuditing22" runat="server" />
<div class="row" style="margin-left:3px;margin-right:3px;">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 收费科目是否需要审核：<select id="IsAuditing21" name="IsAuditing21" style="font-weight:normal" runat="server"></select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，公司财务设置后直接发送项目，提高工作效率。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 交房状态修改生效时间：<select id="IsAuditing14" name="IsAuditing14" style="font-weight:normal" runat="server"></select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：交房态改变后，按照新的收费标准计费，是当月生效还是次月生效，建议“次月”。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 有欠费时是否允许预存：<select id="IsAuditing17" name="IsAuditing17" style="font-weight:normal" runat="server"></select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，先结清欠费再进行预存。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 预存是否允许部分冲抵：<select id="IsAuditing12" name="IsAuditing12" style="font-weight:normal" runat="server"></select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，比如应交100元，预存余额20元，不允许部分冲抵，而由客户前来缴费时自动冲抵20元，然后打印剩余80元的收据。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 票号是否使用系统票号：<select id="IsAuditing20" name="IsAuditing20" style="font-weight:normal" runat="server"></select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，由公司购买带有票号的收据并按号发放。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 零头结转取整位数：<select id="RoundingNum" name="RoundingNum" style="font-weight:normal" runat="server">
																	<option selected></option>
																</select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“分”，也即不进行零头结转，避免出现无法进行价税分离打票的问题。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 零头结转取整策略：<select id="SurplusGame" name="SurplusGame" style="font-weight:normal" runat="server">
																	<option selected value="0">向下取整</option>
                                                                    <option value="1">向上取整</option>
																</select></h4>
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“向下取整”，比如应收100.12元，零头结转取整到元时，默认收取100元，待结转的领头凑足1元时收取。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 交款申请是否按人进行：<select id="IsAuditing16" name="IsAuditing16" style="font-weight:normal" runat="server"></select></h4> 
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，一般由项目统一向公司提交交款申请，而不是由每个收费员分别向公司提交交款申请。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 交款申请时间是否强制连续：<select id="IsAuditing24" name="IsAuditing24" style="font-weight:normal" runat="server"></select></h4> 
                        <h4 style="color:darkgray;margin-top:10px; margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp;说明：建议“否”，一般项目提交交款申请时，考虑部分交款期间收款业务异常需调整时，可跳过该时段提交其他期间交款申请。</h4>
                        <h4 style="font-weight:bold"><font style=" color:blueviolet">◆</font> 配置收款时间是否选择：<select id="IsAuditing25" name="IsAuditing25" style="font-weight:normal" runat="server">
                                                                                                                        <option value="0">否</option>
                                                                                                                        <option value="1">是</option>
                                                                                                                      </select></h4> 
                       
                    </div>
                    <div class="ibox-content" style="display:none">

                        <div id="row1" class="row">
                            <div class="col-sm-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <i class="fa fa-info-circle"></i>&nbsp;收费标准管控
                                    </div>
                                     <div class="panel-body">
                                        <div style="margin-bottom:5px;">收费标准是否需要审核： </div>
  
                                    </div>
                                    <div class="panel-footer">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">
                                        <i class="fa fa-asterisk"></i>&nbsp;房屋状态管控
                                    </div>
                                    <div class="panel-body">
                                        <div style="margin-bottom:5px;">交房状态修改生效时间：</div>
                                        
                                    </div>
                                    <div class="panel-footer">
                                        说明：交房态改变后，按照新的收费标准计费，是当月生效还是次月生效，建议“次月”。
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <i class="fa fa-cogs "></i>&nbsp;费用预交管控
                                    </div>
                                     <div class="panel-body">
                                        <div>有欠费时是否允许预存：</div> 
                                       
                                    </div>
                                    <div class="panel-footer">
                                        说明：建议“否”，先结清欠费再进行预存。  
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="row2" class="row">
                            <div class="col-sm-4">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <i class="fa fa-copy"></i>&nbsp;费用预存管控
                                    </div>
                                     <div class="panel-body">
                                        <div style="margin-bottom:5px;">  预存是否允许部分冲抵：</div>                                    
                                    </div>
                                    <div class="panel-footer">
                                        说明：建议“否”，比如应交100元，预存余额20元，不允许部分冲抵，而由客户前来缴费时自动冲抵20元，然后打印剩余80元的收据。
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <i class="fa fa-repeat "></i>&nbsp;票据管控
                                    </div>
                                     <div class="panel-body">
                                        <div>票号是否使用系统票号：</div> 
                                        
                                    </div>
                                    <div class="panel-footer">
                                       说明：建议“否”，由公司购买带有票号的收据并按号发放。
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-warning"></i>&nbsp;零头取整管控
                                    </div>
                                     <div class="panel-body">
                                        <div style="margin-bottom:5px;">零头结转取整位数： </div> 
                                        
                                        
                                    </div>
                                    <div class="panel-footer">
                                        说明：建议“分”，也即不进行零头结转，避免出现无法进行价税分离打票的问题。
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <div id="row3" class="row">
                            <div class="col-sm-4">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">
                                        <i class="fa fa-exchange"></i>&nbsp;零头结转管控
                                    </div>
                                     <div class="panel-body">
                                        <div style="margin-bottom:5px;">零头结转取整策略：</div>
  
                                    </div>
                                    <div class="panel-footer">
                                       说明：建议“向下取整”，比如应收100.12元，零头结转取整到元时，默认收取100元，待结转的领头凑足1元时收取。
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <i class="fa fa-exchange"></i>&nbsp;交款申请管控
                                    </div>
                                     <div class="panel-body">
                                        <div style="margin-bottom:5px;">交款申请是否按人进行：</div>  
                                    </div>
                                    <div class="panel-footer">
                                         说明：建议“否”，一般由项目统一向公司提交交款申请，而不是由每个收费员分别向公司提交交款申请。
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

                    $.tool.DataPost('AuditingSet', 'Save', $("#frmForm").serialize(),
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