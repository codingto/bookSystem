
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
