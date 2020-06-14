<%--
  Created by IntelliJ IDEA.
  User: yangshuai
  Date: 2020/5/13 0013
  Time: 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #flash{
            height: 20px;
            width: 20px;
            background-color: black;
        }
    </style>
</head>
<body>
<script language="javascript" type="text/javascript">
    window.onload = function () {
        getmessage();

    }

    function getmessage() {
        window.location.href = "/getMessage";
        setTimeout(function () {
            getmessage();
        },1000);
    }
    func
</script>
<div id="flash"></div>
</body>
</html>
