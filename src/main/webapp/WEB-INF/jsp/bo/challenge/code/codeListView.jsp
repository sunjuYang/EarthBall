<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="grpCode" id="grpCode" value="${param.grpCode}"/>
<table class="table table-hover">
  <thead>
  <tr>
    <th class="text-center" width="15%">그룹코드</th>
    <th class="text-center" width="15%">공통코드</th>
    <th class="text-center" width="20%">공통코드명</th>
    <th class="text-center" width="10%">우선순위</th>
    <th class="text-center" width="10%">수정</th>
    <th class="text-center" width="10%">삭제</th>
  </tr>
  </thead>
  <tbody class="table-border-bottom-0">
  <c:if test="${empty codeList}">
    <tr>
      <td colspan="6">
        <strong>등록된 데이터가 없습니다.</strong>
      </td>
    </tr>
  </c:if>
  <c:if test="${not empty codeList}">
    <c:forEach var="item" items="${codeList}">
      <tr>
        <td class="text-center"><strong>${item.grpCode}</strong></td>
        <td class="text-center"><strong>${item.code}</strong></td>
        <td class="text-center"><strong>${item.codeName}</strong></td>
        <td class="text-center"><strong>${item.sortNo}</strong></td>
        <td>
          <button type="button" class="btn btn-primary" onclick="updateCode('${item.grpCode}', '${item.code}')">수정</button>
        </td>
        <td>
          <button type="button" class="btn btn-primary" onclick="deleteCode('${item.grpCode}', '${item.code}')">삭제</button>
        </td>
      </tr>
    </c:forEach>
  </c:if>
  </tbody>
</table>