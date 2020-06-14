<%--
  Created by IntelliJ IDEA.
  User: yangshuai
  Date: 2020/5/12 0012
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #main{
            height: 500px;
            width: 500px;
            padding: 10px;
            border: 5px solid #cccccc;
            border-radius: 5px;
            box-shadow: #cccccc;
        }
        #frame{
            height: 61.8%;
            padding: 10px;
            border: 5px solid #cccccc;
            border-radius: 5px;
            box-shadow: #cccccc;
            overflow-y: auto;
            /*background-color: black;*/
        }
        #listen{
            height: 30px;
            padding: 30px;
            display: none;

        }
    </style>
</head>
<body>
<div id="main">
    <iframe id="frame" src="showJSP.jsp"></iframe>
    <div><jsp:include   page="inputJSP.jsp" flush="true"/></div>


</div>
-____
<iframe id="listen" src="listener.jsp"></iframe>
</body>
</html>
