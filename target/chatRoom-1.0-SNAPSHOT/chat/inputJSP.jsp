<%--
  Created by IntelliJ IDEA.
  User: yangshuai
  Date: 2020/5/12 0012
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #input_content{
            height: 50px;
            width: 99%;
            margin: auto;

        }

    </style>
</head>
<body>
<div id="input">
<%--    <h1>这是inputjsp</h1>--%>
    <form action="/getMessage" >
        <input id="input_content" autofocus="autofocus" type="text">
        <input  type="submit" value="发送">
    </form>
</body>
</html>
