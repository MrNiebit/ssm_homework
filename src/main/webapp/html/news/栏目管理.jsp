<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>栏目管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
    <script>
        function shanchu() {
            var str = confirm("是否确定删除上级栏目？");
            if (str) {
                alert("确定删除！");
            }else{
                alert("取消删除 !")
            }

            return str;
        }

        function selectSubmit(){
            document.getElementsByName('form1')[0].submit()
        }
    </script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                            &nbsp;
                        </td>
                        <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                            <img src="        </tr>
images/main_28.gif" width="9" height="9" align="absmiddle"></td>
                        <td height="30" valign="middle"
                            background="${pageContext.request.contextPath}/images/bg_03.gif">
                            <div align="left"><font color="#FFFFFF">栏目管理</font></div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form name="form1" method="post" action="${pageContext.request.contextPath}/newslabel/management">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
            <tr>
                <td colspan="2" class="td_02"><SPAN class=td_title>根据栏目名称查询</SPAN></td>
            </tr>
            <tr>
                <td width="14%" class="td_02">栏目名称</td>
                <td width="86%" class="td_02">
                    <select onchange="selectSubmit()" name="select" class="input" style="width:99% ">
                        <option value="0" selected>--请选择--</option>
                        <c:forEach var="newslabel" items="${byPid}">
                                <option value="${newslabel.id}" <c:if test='${newslabel.id == pid}'>selected='selected'</c:if> >${newslabel.labelName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <!--  <tr>
               <td class="td_02">二级栏目名称</td>
               <td class="td_02">
                 <select name="select" class="input" style="width:99% ">
                   <option value="1" selected>--请选择--</option>
                   <option value="2">天下足球</option>
                   <option value="3">我猜</option>
                 </select>
               </td>
             </tr> -->
        </table>
        <br>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_page" align="left">
                    <div align="right">
                        <input name="Submit" type="submit" class="buttonface02" value="添加栏目"
                               onClick="javascript:windowOpen('${pageContext.request.contextPath}/newslabel/addPage','','',700,300,'','','')">
                    </div>
                </td>
            </tr>
        </table>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">

            <tr>
                <h4 style="color: red; text-align: center;">${msg}</h4>
                <td colspan="5" align="right" class="td07"><img src="${pageContext.request.contextPath}/images/1.gif"
                                                                width="4" height="5" align="absmiddle"><a
                        href="${pageContext.request.contextPath}/newslabel/management?page=1&select=${pid}">首页</a>　 <img
                        src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">
                    <c:choose>
                        <c:when test="${page_list.currentPage - 1 <= 0}">
                            <a href="#" onclick="return false;" >上一页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/newslabel/management?page=${page_list.currentPage - 1}&select=${pid}">上一页</a>
                        </c:otherwise>
                    </c:choose>
                    　
                    <img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5"
                                  align="absmiddle">
                    <c:choose>
                        <c:when test="${page_list.currentPage + 1 > page_list.pages}">
                            <a href="#" onclick="return false;" >下一页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/newslabel/management?page=${page_list.currentPage + 1}&select=${pid}">下一页</a>
                        </c:otherwise>
                    </c:choose>
                    <img src="${pageContext.request.contextPath}/images/3.gif" width="4" height="5"
                                  align="absmiddle"> <a
                        href="${pageContext.request.contextPath}/newslabel/management?page=${page_list.pages}&select=${pid}">末页</a>
                        当前: 第${page_list.currentPage}页
                    　　共 ${page_list.pages}
                    页 ${page_list.totalCount} 条记录
                </td>
            </tr>
            <tr>
                <td width="17%" class="td_top">栏目名称</td>
                <td width="15%" class="td_top">上级栏目名称</td>
                <td width="44%" class="td_top">栏目描述</td>
                <td width="12%" class="td_top">删除</td>
                <td width="12%" class="td_top">修改</td>
            </tr>
            <c:forEach var="news" items="${page_list.datas}">
                <%--        <c:if test="${news.newslabel.labelName != null}">--%>
                <tr>
                    <td class="td07">${news.labelName}</td>
                    <td class="td07">${news.newslabel.labelName}</td>
                    <td class="td07">${news.labelContent}</td>
                    <td class="td07"><a onClick="return confirm('删除会将其子栏目全部删除并且无法恢复, 确定要删除吗?')" href="${pageContext.request.contextPath}/newslabel/deleteNewslabel?currentPage=${page_list.currentPage}&select=${pid}&id=${news.id}">删除</a></td>
                    <td class="td07"><a href="#"
                                        onClick="javascript:windowOpen('${pageContext.request.contextPath}/newslabel/modifyPage?id=${news.id}','','',670,260,'no','yes','100','100')">修改</a>
                    </td>
                </tr>
                <%--        </c:if>--%>

            </c:forEach>

            <tr>
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
            </tr>
        </table>
        <p>&nbsp;</p>
    </form>
</center>
</body>
</html>
