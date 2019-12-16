<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻审核</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<script>
function shenhe()
{
	var tg = confirm("是否审核当前新闻？");
	if(tg == true)
	{
		alert("确认审核！！！");
		return true
	}
	else
	{
		alert("取消审核！！！");
		return false;
	}
	return false;
}


window.onunload = function(){
  var body = document.getElementsByTagName('body')[0]
  var a = document.createElement('a')
  a.setAttribute("href", "${pageContext.request.contextPath}/news/selectPage")
  body.append(a)
  a.click()
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
          <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><div align="left"><font color="#FFFFFF">新闻审核</font></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="${pageContext.request.contextPath}/news/newsinfoVerify">
    <br>
    <span class="td_form02"><span class="td_form01">
    </span></span>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
      <input type="hidden" name="id" value="${news.id}">
      <tr>
        <td width="15%" class="td_02">姓 &nbsp;&nbsp;&nbsp;名</td>
        <td width="35%" class="td_02">
        <input type="text" class="input" style="width:99% " value="${user.nickname}" readonly="true"></td>
        <td width="15%" class="td_02">部门</td>
        <td width="38%" class="td_02">
          <input type="text" class="input" style="width:99% " value="技术部" readonly="true">        </td>
      </tr>
      <tr>
        <td width="15%" class="td_02">上级栏目名称</td>
        <td width="35%" class="td_02"><input name="textfield2" type="text" style="width:99%" value="${news.newslabel.newslabel.labelName}" readonly="true" ></td>
        <td width="15%" class="td_02">栏目名称</td>
        <td width="35%" class="td_02"><input name="textfield3" type="text" style="width:99%" value="${news.newslabel.labelName}" readonly="true" ></td>
      </tr>
      <tr>
        <td width="15%" class="td_02">新闻标题</td>
        <td colspan="3" class="td_02">
          <input name="textfield" type="text" style="width:99% " value="${news.title}"  readonly="true">        </td>
      </tr>
      <tr>
        <td width="15%" class="td_02">关键词</td>
        <td colspan="3" class="td_02">
          <input name="textfield" type="text" style="width:99% " value="${news.title}"  readonly="true">        </td>
      </tr>
      <tr>
        <td width="15%" class="td_02">新闻内容</td>
        <td colspan="3" class="td_02">
          <textarea name="textarea" style="width:99% " rows="10" readonly="true">${news.content}</textarea>        </td>
      </tr>
      <tr>
        <td width="15%" class="td_02">审批意见</td>
        <td colspan="3" class="td_02"><textarea name="suggest" style="width:99% " rows="10">${news.suggest}</textarea></td>
      </tr>
      <tr>
        <td width="15%" class="td_02">审批结果</td>
        <td colspan="3" class="td_02">
          <select name="status" style="width:99% ">
            <c:if test="${news.status eq 1}">
              <option value="1" selected>是</option>
              <option value="0">否</option>

            </c:if>
            <c:if test="${news.status eq 0}">
              <option value="0" selected>否</option>
              <option value="1">是</option>
            </c:if>
          </select>        </td>
      </tr>
    </table>
    <br>
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page">
          <div align="center">
    <input name="Submit" type="submit" class="buttonface02" value="  确认审核  " onClick="return shenhe()">
&nbsp;
    <input name="Submit" type="button" class="buttonface02" value="  关   闭   " onClick="window.close()">
</div></td>
      </tr>
      <tr>
        <h4 style="color: red; text-align: center">${msg}</h4>
      </tr>
    </table>
    <br>

  </form>
</center>
</body>
</html>
