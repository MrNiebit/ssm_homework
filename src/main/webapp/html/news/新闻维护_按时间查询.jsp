<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>个人设置</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
  <script src="${pageContext.request.contextPath}/js/gdate_0.1.2.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gdate_0.1.2.css"/>
  <SCRIPT language=JavaScript type=text/JavaScript>


    window.onload = function () {
        document.getElementById("form_one").onfocus=function(){
            gdate(this,function(dateStr){
                this.value=dateStr;
            });
        }

        document.getElementById("form_one2").onfocus=function(){
            gdate(this,function(dateStr){
                this.value=dateStr;
            });
        }


    }


    <%--reVal = window.open ("${pageContext.request.contextPath}/html/time.jsp", '',--%>
		<%--"status:no;center:yes;scroll:no;resizable:no;help:no;dialogWidth:255px;dialogHeight:260px");--%>
	<%--if (reVal != null)--%>
	<%--{--%>
		<%--if (nText == 1)--%>
			<%--document.getElementById("beginTime").value = reVal;--%>
		<%--if (nText == 2)--%>
			<%--document.getElementById("endTime").value = reVal;--%>
	<%--}--%>

</SCRIPT>
<style type="text/css">
<!--
.style1 {font-size: 14px}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">&nbsp;</td>
          <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><img src="${pageContext.request.contextPath}/images/main_28.gif" width="9" height="9" align="absmiddle"></td>
          <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><div align="left"><font color="#FFFFFF">新闻维护</font></div></td>
        </tr>
    </table></td>
  </tr>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <td width="79%" class="td_page style1">--<a href="${pageContext.request.contextPath}/news/selectMany?labelId=0">普通查询</a>--按时间查询--</td>
</table>
<form name="form1" method="post" action="${pageContext.request.contextPath}/news/selectByTime">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" 

class="table01">
    <tr>
      <td colspan="4" class="td_02"><span class=td_title>新闻查询</span></td>
    </tr>
	

    <tr>
      <td width="10%" align="center" class="td_02">开始时间</td>
      <td width="40%" class="td_02">
        <input type="text" id="form_one" name="startTime" placeholder="点击选择yyyy-mm-dd" value="${time.startTime}" gdate-format="yyyy-mm-dd" maxlength="12" readonly="readonly" />
        <%--<img src="../../images/search.gif" id="form_one2" width="21" height="20" align="absmiddle" onclick="GetDate()" />--%>
        <select name="startHour" class="input2">
          <option value="1">01</option>
          <option value="2">02</option>
          <option value="3">03</option>
          <option value="4">04</option>
          <option value="5">05</option>
          <option value="6">06</option>
          <option value="7">07</option>
          <option value="8" selected="selected">08</option>
          <option value="9">09</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
        </select>
点
<select name="startMin" class="input2">
  <option value="0" selected="selected">00</option>
  <option value="15">15</option>
  <option value="30">30</option>
  <option value="45">45</option>
</select>
分 </td>
      <td width="10%" align="center" class="td_02">结束时间</td>
      <td width="40%"><span class="td_02">
        <input type="text" name="endTime" id="form_one2" placeholder="点击选择yyyy-mm-dd" gdate-format="yyyy-mm-dd" value="${time.endTime}" maxlength="12" readonly="readonly" />

        <select name="endHour" class="input2">
          <option value="1">01</option>
          <option value="2">02</option>
          <option value="3">03</option>
          <option value="4">04</option>
          <option value="5">05</option>
          <option value="6">06</option>
          <option value="7">07</option>
          <option value="8">08</option>
          <option value="9">09</option>
          <option value="10" selected="selected">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
        </select>
        点
  <select name="endMin" class="input2">
    <option value="0" selected="selected">00</option>
    <option value="15">15</option>
    <option value="30">30</option>
    <option value="45">45</option>
  </select>
      分</span></td>
    </tr>
    <tr>
      <td class="td_02" align="center">&nbsp;</td>
      <td class="td_02">&nbsp;</td>
      <td class="td_02" align="center">&nbsp;</td>
      <td class="td_02"><input name="Submit" type="submit" class="buttonface02"
value="  查询  " /></td>
    </tr>
  </table>
</form>
  <br>
  <form name="form1" method="post" action="${pageContext.request.contextPath}/news/deleteNews2">
    <input type="hidden" name="startTime" value="${time.startTime}">
    <input type="hidden" name="startHour" value="${time.startHour}">
    <input type="hidden" name="startMin" value="${time.startMin}">
    <input type="hidden" name="endTime" value="${time.endTime}">
    <input type="hidden" name="endHour" value="${time.endHour}">
    <input type="hidden" name="endMin" value="${time.endMin}">
    <input type="hidden" name="currentPage" value="${page_list.currentPage}" >
    <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="td_page"><div align="right">
                <input name="Submit" type="submit" class="buttonface02" value="  删 除  " 

onClick="return confirm('删除后将无法恢复, 确定删除吗?')">
               </div></td>
          </tr>
        </table>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" 

class="table01">
          <tr>
            <h4 style="color: red; text-align: center;">${msg}</h4>
            <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath}/images/1.gif"
                                                            width="4" height="5" align="absmiddle"><a
                    href="${pageContext.request.contextPath}/news/selectByTime?page=1&startTime=${time.startTime}&startHour=${time.startHour}&startMin=${time.startMin}&endTime=${time.endTime}&endHour=${time.endHour}&endMin=${time.endMin}">首页</a>　 <img
                    src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">
              <c:choose>
                <c:when test="${page_list.currentPage - 1 <= 0}">
                  <a href="#" onclick="return false;" >上一页</a>
                </c:when>
                <c:otherwise>
                  <a href="${pageContext.request.contextPath}/news/selectByTime?page=${page_list.currentPage - 1}&startTime=${time.startTime}&startHour=${time.startHour}&startMin=${time.startMin}&endTime=${time.endTime}&endHour=${time.endHour}&endMin=${time.endMin}">上一页</a>
                </c:otherwise>
              </c:choose>
              　
              <img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5"
                   align="absmiddle">
              <c:choose>
                <c:when test="${page_list.currentPage + 1 > page_list.pages}">
                  <a href="#" onclick="return false;" >下一页</a>
                </c:when>
                <c:otherwise>
                  <a href="${pageContext.request.contextPath}/news/selectByTime?startTime=${time.startTime}&startHour=${time.startHour}&startMin=${time.startMin}&endTime=${time.endTime}&endHour=${time.endHour}&endMin=${time.endMin}&page=${page_list.currentPage + 1}">下一页</a>
                </c:otherwise>
              </c:choose>
              <img src="${pageContext.request.contextPath}/images/3.gif" width="4" height="5"
                   align="absmiddle"> &nbsp;<a
                      href="${pageContext.request.contextPath}/news/selectByTime?page=${page_list.pages}&startTime=${time.startTime}&startHour=${time.startHour}&startMin=${time.startMin}&endTime=${time.endTime}&endHour=${time.endHour}&endMin=${time.endMin}">末页</a>
              当前: 第${page_list.currentPage}页
              　　共 ${page_list.pages}
              页 ${page_list.totalCount} 条记录
            </td>
          </tr>
	  <tr>
        <%--防止后台接收空对象, 会异常--%>
        <input type="hidden" name="ids" value="0">
	    <td width="6%" class="td_top"c align="center"><input name="chk" type="checkbox" 

id="chk" onClick="selectAllByChk(chk,ids)" value="checkbox0"></td>
	    <td width="16%" class="td_top">新闻标题</td>
        <td width="15%" class="td_top">栏目名称</td>
        <td width="14%" class="td_top">上级栏目名称</td>
        <td width="13%" class="td_top">新闻发布者</td>
        <td width="19%" class="td_top">新闻发布时间</td>
        <td width="11%" class="td_top">审核状态</td>
        <td width="6%" class="td_top">修改</td>
      </tr>
          <c:forEach var="newsinfo" items="${page_list.datas}">
            <tr>
              <td class="td07" align="center">
                <input type="checkbox" name="ids" value="${newsinfo.id}">
              </td>
              <td class="td07"><a href="#"
                                  onClick="javascript:windowOpen('${pageContext.request.contextPath}/news/selectOne?id=${newsinfo.id}','','',670,450,'no','yes','100','100')">${newsinfo.title}</a>
              </td>
              <td class="td07">${newsinfo.newslabel.labelName}</td>
              <td class="td07">${newsinfo.newslabel.newslabel.labelName}</td>
              <td class="td07">${user.nickname}</td>
              <td class="td07"><FONT style="FONT-SIZE: 10pt" color=#000000>${newsinfo.date}&nbsp;<FONT

                      style="FONT-SIZE: 10pt" color=#000000>${newsinfo.hour}:${newsinfo.minute}:${newsinfo.seconds}</FONT></FONT></td>
              <td class="td07"><a href="#"
                                  onClick="javascript:windowOpen('${pageContext.request.contextPath}/news/verifyPage?id=${newsinfo.id}','','',700,600,'no','yes','100','100')"><c:if test="${newsinfo.status == 0}">未审核</c:if><c:if test="${newsinfo.status == 1}">已审核</c:if></a>
              </td>
              <td class="td07">
                <a href="#" onClick="javascript:windowOpen('${pageContext.request.contextPath}/news/modifyPage?id=${newsinfo.id}','','',700,430,'no','yes','100','100')">修改</a>
              </td>
            </tr>
          </c:forEach>

      <tr>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
      </tr>
      <tr>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
        <td class="td07">&nbsp;</td>
      </tr>
     

    </table>
    <p><br>
    </p>
</form>
</body>
</html>