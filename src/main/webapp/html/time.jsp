<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>选择日期</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style>
        body{
            background-color: #ccc;
        }
    </style>
</head>
<body onload="fload()" bgcolor='#EFEFEF'>
<script src="${pageContext.request.contextPath}/js/date.js">
</script>

<script>
function fload()
{
  fPopCalendar(document.all.txt1, document.all.txt1);
}

function fkeydown()
{
  if(event.keyCode==27)
  {
    event.returnValue = null;
    window.returnValue = null;
    window.close ();
  }
}

document.onkeydown=fkeydown;
</script>
<input type=text id="txt1" style="display:none">
</body>
</html>