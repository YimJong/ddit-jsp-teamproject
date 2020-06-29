<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="memberMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원관리</div>
					<form name="search_form">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th width="120">기본검색</th>
								<td>
									<select style="width: 130px;" name="search_base">
											<option selected="selected">선택하세요</option>
											<option value="search_name">이름</option>
											<option value="search_id">아이디</option>
									</select>
								<input name="search_base_keyword" type="text" size="20" /></td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<select style="width: 130px;" name="search_sido">
											<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="search_gugun">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<select style="width: 100px;" name="search_hp1">
										<option selected="selected">선택하세요</option>
									</select> - 
									<input name="search_hp2" type="text" id="search_hp2" size="20" /> - 
									<input name="search_hp3" type="text" id="search_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="radio" name="search_calendar" value="solar" checked="checked"/>양력
									<input type="radio" name="search_calendar" value="lunar" />음력 
									<select style="width: 130px;" name="search_year">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="search_month">
										<option selected="selected">선택하세요</option>
									</select> 
									<select style="width: 130px;" name="search_day">
										<option selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
						</table>
						<div style="padding-top: 5px; text-align: right;">
							<input class="btn1" type="reset" value="초기화"/>
							<input class="btn1" type="button" value="검색하기" />
						</div>
					</form>
					<div style="padding-top: 5px;" id="search_totalMembers">
						<label class="totalmembers"></label>
						<select style="width: 50px; float: right;" name="search_count">
							<option selected="selected" value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
						</select>
					</div>
					<div style="height: 15px;"></div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
								<th width="10%">
								    <input type="checkbox" name="selectTotal" class="checkbox_align"/>&nbsp;선택
								</th>
								<th width="20%">아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>메일</th>
							</tr>
						</thead>
						<tbody class="memberList"></tbody>
					</table>
					<div align="center">
						<input class="publishingCoupon" type="submit" value="선택회원 메일발송" style="float: left;"/>
						<span class="pagingHtml"></span>
						<input class="btn2" type="button" value="Excel작성" style="float: right;"/>
						<input class="btn2" type="button" value="PDF작성" style="float: right; margin-right: 5px;"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>