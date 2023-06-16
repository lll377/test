<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCardFrame.aspx.cs" Inherits="M_Main.SysNew.EmployeeCardFrame" %>

<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<script src="../jscript/jquery-1.11.3.min.js"></script>
        <style type="text/css">
        body {
            margin:0px;
            margin-top:0px;
            overflow:hidden;
            background-color:#ffffff;
        }
        .Container {
            width:100%;
            font-size:12px;
            font-family:微软雅黑;
        }
        .ContainerLeft {
            float:left;
            overflow-y:auto;
            border-right:1px solid #cccccc;
        }
         .ContainerRight {
            float:left;
            width:75%;
            overflow:auto;
        }
     </style>
	</head>
    <body>

        <div class="Container">
                <div id="ContainerLeft" class="ContainerLeft">
                    <iframe  src="EmployeeTree.aspx"  id="EmployeeTree" name="EmployeeTree" style="border:none;width:100%;"></iframe>
                </div>
                <div id="ContainerRight"  class="ContainerRight">
                    <iframe src="EmployeeCardPunchList.aspx"  id="EmployeeCardPunchList" name="EmployeeCardPunchList" style="border:none;width:100%;"></iframe>
                </div>
        </div>
          <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width()*0.25-1;
                $("#EmployeeTree").css("width", w + "px");
                $("#EmployeeTree").css("height", h + "px");
                $("#EmployeeCardPunchList").css("height", h + "px");
            }
            InitFunction();
        </script>
    </body>
</html>
