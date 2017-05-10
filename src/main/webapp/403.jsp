<%@ include file="/common/taglibs.jsp"%>



<head>
    <title><fmt:message key="403.title"/></title>
    <meta name="heading" content="<fmt:message key='403.title'/>"/>
</head>

<p>
    <fmt:message key="403.message">
        <fmt:param><c:url value="/"/></fmt:param>
    </fmt:message>
</p>
<p style="text-align: center; margin-top: 20px">
    <a href="http://localhost:8080/index.jsp"
        title="Hawaii, click to Zoom In">
    <img src="<c:url value="assets/images/403.jpg"/>" alt="Hawaii" /></a>
</p>
