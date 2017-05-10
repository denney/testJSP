<%@ include file="/common/taglibs.jsp"%>



<head>
    <title><fmt:message key="404.title"/></title>
    <meta name="heading" content="<fmt:message key='404.title'/>"/>
</head>

<p>
    <fmt:message key="404.message">
        <fmt:param><c:url value="/index.jsp"/></fmt:param>
    </fmt:message>
</p>
<p style="text-align: center; margin-top: 20px">
    <a href="http://localhost:8080/index.jsp"
        title="Emerald Lake - Western Canada, click to Zoom In">
    <img  src="<c:url value="assets/images/404.jpg"/>" alt="Emerald Lake - Western Canada" /></a>
</p>
