<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysStandardFrame.aspx.cs" Inherits="M_Main.HouseInspect.SysStandardFrame" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 75%;
            overflow: auto;
        }
    </style>
</head>
<body>

    <div class="Container">
        <div id="ContainerLeft" class="ContainerLeft">
            <iframe src="SysObjectList.aspx?ContainerRightUrl=SysStandardItem.aspx" id="SysObjectList" name="SysObjectList" style="border: none; width: 100%;"></iframe>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <iframe src="SysStandardItem.aspx" id="SysStandardItem" name="SysStandardItem" style="border: none; width: 100%;"></iframe>
        </div>
    </div>
    <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width()*0.25-1;
                $("#SysObjectList").css("width", w + "px");
                $("#SysObjectList").css("height", h + "px");
                $("#SysStandardItem").css("height", h + "px");
            }
            InitFunction();
    </script>
</body>
</html>
