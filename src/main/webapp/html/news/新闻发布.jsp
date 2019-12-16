<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻发布</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<script>
function fabu()
{
	var str = confirm("是否确定发布新闻？");
	if(str == true)
	{
		alert("确认新闻发布！！！");
	}
	else
	{
		alert("取消新闻发布！！！");
	}
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"> <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><img src="${pageContext.request.contextPath}/images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><div align="left"><font color="#FFFFFF">新闻发布</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="${pageContext.request.contextPath}/news/addNews">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <tr>
        <td class="td_02">姓名</td>
        <input type="hidden" value="${user.uid}" name="uid">
        <td width="37%" class="td_02">
          <input type="text" class="input" style="width:99% " value="${user.nickname}" readonly="true">
        </td>
        <td width="13%" class="td_02"></td>
        <td width="37%" class="td_02">
          <!-- <input name="textfield" type="text" class="input" style="width:99% " value="技术部" readonly="true"> -->
        </td>
      </tr>
      <tr>
        <td class="td_02">栏目名称</td>
        <td class="td_02">
          <select name="labelId" style="width:99% ">
            <option value="0" selected>--请选择--</option>
            <c:forEach var="newslabel" items="${newslabel_list}">
              <option value="${newslabel.id}">${newslabel.labelName}</option>
            </c:forEach>
          </select>
        </td>
        <td class="td_02"></td>
        <td class="td_02"><!-- <select name="select2" class="input" style="width:99% ">
          <option value="1" selected>--请选择--</option>
          <option value="2">天下足球</option>
          <option value="3">我猜</option>
        </select> --></td>
      </tr>
      <tr>
        <td class="td_02">新闻标题</td>
        <td colspan="3" class="td_02">
          <input name="title" type="text" class="input content" style="width:99% " >
        </td>
      </tr>
      <!-- <tr>
        <td width="13%" class="td_02">关键词</td>
        <td colspan="3" class="td_02">
          <input name="textfield" type="text" class="input" style="width:99% " >
       </td>
      </tr> -->
      <tr>
        <td class="td_02">新闻内容</td>
        <td colspan="3" class="td_02">
          <textarea name="content" class="content" style="width:99% " rows="10"></textarea>
        </td>
      </tr>
    </table>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page"><div align="right">
            <input name="Submit" type="submit" class="buttonface02" value="  发 布  " onClick="return confirm('是否确定发布新闻？');">
&nbsp;
<input name="Submit" type="reset" class="buttonface02" value="  重 置  ">
&nbsp;&nbsp; </div></td>
      </tr>
    </table>
    <h3 style="color: red;">${msg}</h3>
  </form>
</center>
</body>
</html>
