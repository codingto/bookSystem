<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.ui.Model" %><%--
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
        #show_content {
            height: 61.8%;
            padding: 10px;
            border: 5px solid #cccccc;
            border-radius: 5px;
            box-shadow: #cccccc;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<script language="javascript" type="text/javascript">
    window.onload = function () {
       showmess();

    }

    // function getmessage() {
    //     window.location.href = "/getMessage";
    //     setTimeout(function () {
    //         getmessage();
    //     }, 10000);
    // }
    function showmess() {
        <%--var me = new BacklogOverview("${allMessage}");//获取model中的内容--%>
        // alert("allallala");
        var table = document.getElementById("showtable");
        // alert('asdsad');
        table.innerHTML='<c:forEach items="${allMessage}" var="a"><tr><td>${a.message}</td><td>${a.name}</td></tr></c:forEach>';
        // alert("laalala");
        console.log("tttt");
        setTimeout(function () {//递归执行自身
            showmess();
        }, 100);
    }
</script>


<table id="showtable">

</table>
<%--<input type="button" onclick="showmess()" value="hahhaha">--%>

<%--<div id="show_content" >--%>
<%--&lt;%&ndash;${allMessage}&ndash;%&gt;--%>
<%--&lt;%&ndash;    <form action="/getMessage" method="get">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <input type="submit" value="submit">&ndash;%&gt;--%>
<%--&lt;%&ndash;    </form>&ndash;%&gt;--%>
<%--</div>--%>
</body>
</html>
