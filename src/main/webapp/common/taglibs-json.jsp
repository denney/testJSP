<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="application/json;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="indexPage" value="/pages/main.jsp" />
<c:set var="datePattern"><fmt:message key="date.format"/></c:set>
<%out.clear();%>
