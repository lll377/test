<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendLetterDetailFrame.aspx.cs" Inherits="M_Main.UrgeFees.SendLetterDetailFrame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

     <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
       <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
  
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
     
    <link href="../css/button.css" rel="stylesheet" />
    


    <style type="text/css">
        body {
            background-color: #f5f5f5;
       
            overflow: hidden;
        }
    </style>
</head>
<body >
    
    <form id="SendLetterDetailFrame">
        <script type="text/javascript">
            function btnOK() { 
           $("#IsAuditing").val("1"); 
           HDialog.Open(300, 150, '../UrgeFees/SendLetterDlgOK.aspx?setype=1&SendLetterID=' + $("#SendLetterID").val(), "审批确认", false, function callback(_Data) {
               if (_Data == "1") {
                   HDialog.Close(1);
                   $('#SendLetterDetailNew').attr('src', $('#SendLetterDetailNew').attr('src'));
               }

           });

    }


        function btnNO() {
          //  $("#IsAuditing").val("2"); 
            HDialog.Open(300, 150, '../UrgeFees/SendLetterDlgOK.aspx?setype=2&SendLetterID=' + $("#SendLetterID").val(), "审批确认", false, function callback(_Data) {
                if (_Data == "1") {
                    HDialog.Close(1);
                    $('#SendLetterDetailNewCus').attr('src', $('#SendLetterDetailNewCus').attr('src'));

                }
               
            });
        }
            </script>
        <input type="hidden" name="SendLetterID" id="SendLetterID" runat="server" value="" />
        <input id="IsAuditing"   type="hidden" size="1" name="IsAuditing"  runat="server" />
         <input type="hidden" name="OPType" id="OPType" runat="server" value="" />
    <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" name="SendLetterDetailNew" refpage="SendLetterDetailNew" refsel="1"><a data-toggle="tab" href="#tab-2" aria-expanded="true">筛选欠费明细</a>
                </li>
                
                <li class="" name="SendLetterDetailNewCus" refpage="SendLetterDetailNewCus" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">查看欠费户数/登记处理结果</a>
                </li>
            </ul>
            <div class="tab-content">
               
                <div id="tab-2" class="tab-pane active">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="SendLetterDetailNew" src="" style="width:100% ; border:none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding:0px;">
                        <iframe id="SendLetterDetailNewCus" style="width:100%;border:none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>

            <div id="smb" style="display:none;margin: 0 auto;width: 252px;margin-top:7px;">

        <input class="button" id="btnCreFees"  
                            type="button" value="审核通过" name="btnCreFees"  onclick="btnOK()" />&nbsp; 
         <input class="button" id="btnReturn" onclick="btnNO();" type="button" value="审核不通过" name="btnReturn" />
        </div>
        </div > 
   
    


        <script type="text/javascript">

        

        function InitTableHeight() {
            var h = $(window).height() - 38;
            if ($("#OPType").val() == "Auditing") { h = h - 50;}
            $(".Frm").css({ "height": h  + "px" });
        }

        InitTableHeight();

        $(".tabs-container li").click(function () {
            var refpage = $(this).attr("refpage");
            var refsel = $(this).attr("refsel");
            $("#" + refpage).attr("src", refpage + ".aspx?SendLetterID=" + $("#SendLetterID").val());
                $(this).attr("refsel", "1");
        });

        $(function () {
            $("#SendLetterDetailNew").attr("src", "SendLetterDetailNew.aspx?SendLetterID=" + $("#SendLetterID").val());
              
            if ($("#OPType").val() == "Auditing") {
                $("#smb").css("display", "block"); 
            }
          
            


        });
             
    </script>

         

    </form>
</body>
</html>

