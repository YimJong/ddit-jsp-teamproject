<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>테스트1</td>
					<td>홍길동</td>
					<td>2016-01-01</td>
					<td>2</td>
				</tr>
				<tr>
					<td>2</td>
					<td>테스트2</td>
					<td>홍길동</td>
					<td>2016-01-01</td>
					<td>2</td>
				</tr>
				<tr>
					<td>3</td>
					<td>테스트3</td>
					<td>홍길동</td>
					<td>2016-01-01</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div >
<form action="#" method="post" class="form-inline pull-right">
		<input id="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control">게시글 등록</button>
</form>
</div>	
</body>
</html>