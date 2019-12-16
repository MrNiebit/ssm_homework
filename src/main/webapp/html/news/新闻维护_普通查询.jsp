<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>个人设置</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/js/util.js">
    </script>
    <style type="text/css">
        <!--
        .style1 {
            font-size: 14px
        }

        .style2 {
            color: #333333
        }

        -->
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="25" align="center" valign="bottom" class="td06">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                        &nbsp;
                    </td>
                    <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><img
                            src="${pageContext.request.contextPath}/images/main_28.gif" width="9" height="9"
                            align="absmiddle"></td>
                    <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                        <div align="left"><font color="#FFFFFF">新闻维护</font></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <td width="79%" class="td_page style1">--普通查询--<a href="${pageContext.request.contextPath}/html/news/新闻维护_按时间查询.jsp"
                                                      class="style1">按时间查询</a>--
    </td>
</table>
<form name="form1" method="get" action="${pageContext.request.contextPath}/news/selectMany">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0"

           class="table01">
        <tr>
            <td colspan="3" class="td_02"><SPAN class=td_title>新闻查询</SPAN></td>
            <td class="td_02">&nbsp;</td>
        </tr>

        <tr>
            <td width="14%" align="center" class="td_02">栏目名称</td>
            <td width="34%" class="td_02"><select name="labelId" style="width:98.9% ">
                <option value="0" selected>--请选择--</option>
                <c:forEach var="newslabel" items="${newslabel_list}">
                    <option value="${newslabel.id}" <c:if test="${labelId == newslabel.id}"> selected="selected"</c:if> > ${newslabel.labelName}</option>
                </c:forEach>
            </select>
                <span class="td_form02"></span></td>
            <td align="center" class="td_02"></td>
            <td width="34%" class="td_02"><!-- <select name="select" class="input" 

style="width:98.9% ">
              <option value="1" selected>--请选择--</option>
              <option value="2">天下足球</option>
              <option value="3">我猜</option>
                                    </select> --></td>
        </tr>
        <tr>
            <td class="td_02" align="center">新闻标题</td>
            <td class="td_02">
                <input name="title" type="text" class="input" value="${title}" style="width:98.9% "></td>
            <td align="center" class="td_02"><input type="submit" class="buttonface02" value="  查询  "></td>
            <td class="td_02"><!-- <input name="textfield3" type="text" class="input" 

style="width:98.9% " > --></td>
        </tr>
        <!-- <tr>
          <td class="td_02" align="center">关键词</td>
          <td class="td_02">
            <input name="textfield" type="text" class="input" style="width:98.9% " >

    </td>
          <td class="td_02" align="center">&nbsp;</td>
          <td class="td_02"></td>
        </tr> -->
    </table>
</form>
    <br>
    <form name="form1" method="post" action="${pageContext.request.contextPath}/news/deleteNews">
        <input type="hidden" name="page" value="${page_list.currentPage}">
        <input type="hidden" name="labelId" value="${labelId}">
        <input type="hidden" name="title" value="">

    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_page">
                <div align="right">
                    <input name="Submit" type="submit" class="buttonface02" value="删 除" onClick="return confirm('删除后将无法恢复, 确定删除吗?')">
                </div>
            </td>
        </tr>
    </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0"

           class="table01">


        <tr>
            <h4 style="color: red; text-align: center;">${msg}</h4>
            <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath}/images/1.gif"
                                                            width="4" height="5" align="absmiddle"><a
                    href="${pageContext.request.contextPath}/news/selectMany?page=1&labelId=${labelId}&title=${title}">首页</a>　 <img
                    src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">
                <c:choose>
                    <c:when test="${page_list.currentPage - 1 <= 0}">
                        <a href="#" onclick="return false;" >上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/news/selectMany?page=${page_list.currentPage - 1}&labelId=${labelId}&title=${title}">上一页</a>
                    </c:otherwise>
                </c:choose>
                　
                <img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5"
                     align="absmiddle">
                <c:choose>
                    <c:when test="${page_list.currentPage + 1 > page_list.pages}">
                        <a href="#" onclick="return false;" >下一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/news/selectMany?page=${page_list.currentPage + 1}&labelId=${labelId}&title=${title}">下一页</a>
                    </c:otherwise>
                </c:choose>
                <img src="${pageContext.request.contextPath}/images/3.gif" width="4" height="5"
                     align="absmiddle"> &nbsp;<a
                        href="${pageContext.request.contextPath}/news/selectMany?page=${page_list.pages}&labelId=${labelId}&title=${title}">末页</a>
                当前: 第${page_list.currentPage}页
                　　共 ${page_list.pages}
                页 ${page_list.totalCount} 条记录
            </td>
        </tr>
        <%--防止后台接收空对象, 会异常--%>
        <input type="hidden" name="ids" value="0">

        <tr>
            <td width="6%" class="td_top" align="center">
                <input name="chk" type="checkbox" id="chk" onClick="selectAllByChk(chk,ids)" value="0">
            </td>
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


<br>
<br>
</body>
</html>