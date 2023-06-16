<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DictionaryBrowse.aspx.cs" Inherits="M_Main.SysNew.DictionaryBrowse" %>

 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>

</title>
     <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" /><link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" /><link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" /><link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" /><link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>    
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
</head>
<body>
    <form id="frmForm">
    <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="DictionaryBrowseFees"  refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">基础模块</a>
                </li>
                <li class="" refpage="rszdsz" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">人事模块</a>
                </li> 
                <li class="" refpage="MaterialBaseList" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">物资模块</a>
                </li> 
                <li class="" refpage="PatrolDictionaries" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">品质模块</a>
                </li> 
                <li class="" refpage="SysDictionary" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">验房模块</a>
                </li> 
                <li class="" refpage="EqDictionary" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false">设备模块</a>
                </li> 
                <li class="" refpage="EmergencyDictionary" refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="false">应急模块</a>
                </li> 
                <li class="" refpage="TargetDictionary" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="false">目标模块</a>
                </li> 
                <li class="" refpage="PlanDictionary" refsel="0"><a data-toggle="tab" href="#tab-9" aria-expanded="false">计划模块</a>
                </li> 
                <li class="" refpage="CostDictionary" refsel="0"><a data-toggle="tab" href="#tab-10" aria-expanded="false">预算模块</a>
                </li> 
                <li class="" refpage="CostDictionary1" refsel="0"><a data-toggle="tab" href="#tab-11" aria-expanded="false">成本模块</a>
                </li>  
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="DictionaryBrowseFees" src="DictionaryBrowseFees.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                <%--<div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="rszdsz" src="../PersonnelManage/rszdsz.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div> 
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="MaterialBaseList" src="../Mt/MaterialBaseList.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div> 
                
                <div id="tab-4" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="PatrolDictionaries" src="../ComprehensivePatrols/PatrolDictionaries.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-5" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="SysDictionary" src="../HouseInspect/SysDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-6" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="EqDictionary" src="../EquipmentNew/EqDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-7" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="EmergencyDictionary" src="../Emergency/EmergencyDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-8" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="TargetDictionary" src="../Target/TargetDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-9" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="PlanDictionary" src="../Plan/PlanDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-10" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="CostDictionary" src="../CostManageNew/CostDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
                
                <div id="tab-11" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="CostDictionary1" src="../CostManageNew/CostDictionary.aspx" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>--%>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 55;
                $(".Frm").css({ "height": h + "px" });
            }

            InitTableHeight();

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                 
                var src = "";
                if (refpage == 'DictionaryBrowseFees') {
                    src = 'DictionaryBrowseFees.aspx';
                }
                if (refpage == 'rszdsz') {
                    src = '../PersonnelManage/rszdsz.aspx';
                }
                else if (refpage == 'MaterialBaseList') {
                    src = '../Mt/MaterialBaseList.aspx';
                }
                else if (refpage == 'PatrolDictionaries') {
                    src = '../ComprehensivePatrols/PatrolDictionaries.aspx';
                }
                else if (refpage == 'SysDictionary') {
                    src = '../HouseInspect/SysDictionary.aspx';
                }
                else if (refpage == 'EqDictionary') {
                    src = '../EquipmentNew/EqDictionary.aspx';
                }
                else if (refpage == 'EmergencyDictionary') {
                    src = '../Emergency/EmergencyDictionary.aspx';
                }
                else if (refpage == 'TargetDictionary') {
                    src = '../Target/TargetDictionary.aspx';
                }
                else if (refpage == 'PlanDictionary') {
                    src = '../Plan/PlanDictionary.aspx';
                }
                else if (refpage == 'CostDictionary' || refpage == 'CostDictionary1') {
                    src = '../CostManageNew/CostDictionary.aspx';
                }
                //alert(src);
                //if (refsel == 0) {
                    $("#DictionaryBrowseFees").attr("src", src );
                    //$(this).attr("refsel", "1");
                //}
            });
    </script>
    </form>
</body>
</html>
