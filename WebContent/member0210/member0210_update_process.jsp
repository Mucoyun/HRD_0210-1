<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습26 - </title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		joindate = joindate.substring(0,4)+"-"+joindate.substring(4,6)+"-"+joindate.substring(6,8);
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
	
		//System.out.println(joindate);
		
		try{
			String sql = "update member0210 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, custno);
			pstmt.executeUpdate();
			%><script>
				alert("회원정보 수정이 완료 되었습니다.");
				location.href = "/HRD_0210/member0210/member0210_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>