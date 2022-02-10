<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습26 - </title>
	<script>
		function gotry() {
			if(document.iu_form.custname.value==""){
				alert("회원성명이 입력되지 않았습니다.");
				document.iu_form.custname.focus();
			}else if(document.iu_form.phone.value==""){
				alert("회원전화가 입력되지 않았습니다.");
				document.iu_form.phone.focus();
			}else if(document.iu_form.address.value==""){
				alert("회원주소가 입력되지 않았습니다.");
				document.iu_form.address.focus();
			}else if(document.iu_form.joindate.value==""){
				alert("가입일자가 입력되지 않았습니다.");
				document.iu_form.joindate.focus();
			}else if(document.iu_form.grade.value==""){
				alert("고객등급이 입력되지 않았습니다.");
				document.iu_form.grade.focus();
			}else if(document.iu_form.city.value==""){
				alert("도시코드가 입력되지 않았습니다.");
				document.iu_form.city.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "member0210_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int custno = 0;
		try{
			String sql = "select member0210_custno_seq.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			if(rs.next()){
				custno = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<form name="iu_form" method="post" action="member0210_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%=custno%>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" maxlength="8"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>