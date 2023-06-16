<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_FirstInOutSelFrame.aspx.cs" Inherits="M_Main.Mt.CheckOutDialog.New_FirstInOutSelFrame" %>

<!DOCTYPE html>

<html>
	<head>
		<title>物资选择</title>
		<script src="../../jscript/jquery-1.11.3.min.js"></script>
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
            padding:0px;
        }
        .ContainerLeft {
            float:left;
            overflow-y:auto;
            border-right:1px solid #cccccc;
        }
         .ContainerRight {
            float:left;
            width:70%;
            overflow:hidden; 
            padding:0px;
        }
        .ContainerBottom {
            width:100%;
            font-size:12px;
            font-family:微软雅黑;
            overflow:hidden; 
        }
     </style>
	</head>
    <body style="margin:0px;padding:0px;">
        <div class="Container">
                <div id="ContainerLeft" class="ContainerLeft">
                    <iframe  src="New_FirstInOutSelLeft.aspx?WareHouseId=<%=WareHouseId %>"  id="New_FirstInOutSelLeft" name="New_FirstInOutSelLeft" style="border:none;width:100%;"></iframe>
                </div>
                <div id="ContainerRight"  class="ContainerRight">
                    <iframe src="New_FirstInOutSelRight.aspx?WareHouseId=<%=WareHouseId %>"  id="New_FirstInOutSelRight" name="New_FirstInOutSelRight"  style ="border:none;width:100%;"></iframe>
                </div>
        </div>
        <div id="ContainerBottom">
                    <iframe  src="New_FirstInOutSelBottom.aspx"  id="New_FirstInOutSelBottom" name="New_FirstInOutSelBottom" style="border:none;width:100%;margin-top:-3px;"></iframe>
        </div>
          <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height()*0.6;
                var w = $(window).width() * 0.30 - 1;

                $("#ContainerLeft").css("width", w + "px");
                $("#New_FirstInOutSelLeft").css("height", h + "px");

                $("#ContainerRight").css("height", h + "px");
                $("#New_FirstInOutSelRight").css("height", h + "px");

                var selH = $(window).height() * 0.4+1;
                $("#ContainerBottom").css("height", selH + "px");
                $("#New_FirstInOutSelBottom").css("height", selH + "px");
            }
            InitFunction();
        </script>
    </body>
</html>