<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기성적관리</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>경기성적관리 프로그램</h2>
		</div>
		국제학교 포탈에서 건구 정보, 경기결과정보 데이터베이스를 구축하고 경기결과관리 프로그램을 작성하는 프로그램이다.
		프로그램 작성 순서
		<br><br>
		<ol>
			<li>선수정보 테이블을 생성한다.</li>
			<li>경기결과정보 테이블을 생성한다.</li>
			<li>선수정보, 경기결과 정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>선수정보 입력 화면 프로그램을 작성한다.</li>
			<li>선수정보 조회/수정 프로그램을 작성한다.</li>
			<li>경기결과 정보 조회 프로그램을 작성한다.</li>
		</ol>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>