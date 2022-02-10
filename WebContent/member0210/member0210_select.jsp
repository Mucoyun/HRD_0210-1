<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습26 - </title>
	<style>
		#s_table tr{
			height: 25px;
		}#s_table td{
			text-align: center;
		}#s_table a{
			color: white;
			font-weight: bold;
		}#s_table a:HOVER{
			color: red;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	
	<section>
		<h2>회원목록조회/수정</h2>
		<table id="s_table">
			<tr>
				<th width="100">회원번호</th>
				<th width="100">회원성명</th>
				<th width="200">전화번호</th>
				<th width="300">주소</th>
				<th width="100">가입일자</th>
				<th width="100">고객등급</th>
				<th width="100">거주지역</th>
			</tr>
			<%
				try{
					String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city from member0210 order by custno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery(); 
					while(rs.next()){
						String custno = rs.getString(1); 
						String custname = rs.getString(2);
						String phone = rs.getString(3);
						String address = rs.getString(4);
						String joindate = rs.getString(5);
						String grade = rs.getString(6);
						String city = rs.getString(7);
						
						if(grade.equals("A")){ grade="VIP"; }
						else if(grade.equals("B")){ grade="일반"; }
						else if(grade.equals("C")){ grade="직원"; } 
						
						%>
						<tr>
							<td><a href="member0210_update.jsp?send_custno=<%=custno%>"><%=custno %></a></td>
							<td><%=custname %></td>
							<td><%=phone %></td>
							<td><%=address %></td>
							<td><%=joindate %></td>
							<td><%=grade %></td>
							<td><%=city %></td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>