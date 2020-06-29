<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
</head>
<body onload="setInitContents();">
<jsp:include page="../inc/header.jsp"></jsp:include>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="memberMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보</div>
					<form method="post" name="updateMemberForm">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td><label class="mem_name"></label></td>
							</tr>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td><label class="mem_id"></label></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pass" type="text" id="mem_pass" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td><input name="mem_pass_confirm" type="text" id="mem_pass_confirm" size="20" /></td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<input name="mem_mail2" type="text" id="mem_mail2" size="20" /> 
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<select style="width: 130px; margin-right: 10px;" name="mem_sido">
											<option selected="selected">선택하세요</option>
									</select>
									
									<select style="width: 130px;" name="mem_gugun">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><select style="width: 100px;" name="mem_hp1">
										<option selected="selected">선택하세요</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="radio" name="mem_calendar" value="solar" />양력
									<input type="radio" name="mem_calendar" value="lunar" />음력 
									<select style="width: 130px; margin-left: 10px;" name="mem_year">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_month">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="mem_day">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
						</table>
						<div style="float: right;">
							<input class="btn2" type="button" value="변경내용 저장" id="updateMember"/>
							<input class="btn2" type="reset" value="취소" />
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>