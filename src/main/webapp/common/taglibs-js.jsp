<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="application/x-javascript;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="indexPage" value="/pages/main.jsp" />
<c:set var="datePattern"><fmt:message key="date.format"/></c:set>
<%out.clear();%>
