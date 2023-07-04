<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${ not empty alertMsg }">
 	<script>
 		alert("${alertMsg}");
 	</script>
 	<c:remove var="alertMsg" scope="session"/>
</c:if>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="/main" class="app-brand-link">
      <img src="/resources/fo/img/logo.png" class="navbar-brand-img" alt="..." style="width: 50px;">
      <h2 style="margin-left: 5px; margin: 0 auto; color: #19a7ce; font-weight: bold;">지구공</h2>
    </a>

    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item ${param.menuId eq '00' ? 'active' : ''}">
      <a href="sample" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">Dashboard</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '10' ? 'active' : ''}">
      <a href="menuMember.me" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">회원</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '20' ? 'active' : ''}">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">상품</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item ${param.menuId eq '21' ? 'active' : ''}">
          <a href="adminlist.pro" class="menu-link">
            <div data-i18n="Account">상품리스트</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '22' ? 'active' : ''}">
          <a href="adminEnrollForm.pro" class="menu-link">
            <div data-i18n="Notifications">상품 추가</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item ${param.menuId eq '30' ? 'active' : ''}">
      <a href="bolist.no" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">공지사항</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '40' ? 'active' : ''}">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">매장</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item ${param.menuId eq '41' ? 'active' : ''}">
          <a href="adminlist.st" class="menu-link">
            <div data-i18n="Account">매장리스트</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '42' ? 'active' : ''}">
          <a href="adminSignUpList.st" class="menu-link">
            <div data-i18n="Notifications">매장 신청리스트</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item ${param.menuId eq '50' ? 'active' : ''}">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">챌린지</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item ${param.menuId eq '51' ? 'active' : ''}">
          <a href="/list.grp" class="menu-link">
            <div data-i18n="Account">그룹코드/공통코드 관리</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '52' ? 'active' : ''}">
          <a href="/list.ca" class="menu-link">
            <div data-i18n="Notifications">카테고리 관리</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '53' ? 'active' : ''}">
          <a href="/list.chall" class="menu-link">
            <div data-i18n="Connections">참여 게시판 관리</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '54' ? 'active' : ''}">
          <a href="/list.conf" class="menu-link">
            <div data-i18n="Connections">인증 게시판 관리</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item ${param.menuId eq '60' ? 'active' : ''}">
      <a href="/list.cpa" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">주문</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '70' ? 'active' : ''}">
      <a href="https://desk.channel.io/#/channels/137317/user_chats/648c1a7e590055d485df" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">챗봇</div>
      </a>
    </li>
  </ul>
</aside>
