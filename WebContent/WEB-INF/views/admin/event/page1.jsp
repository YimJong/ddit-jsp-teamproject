<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<?	
	include "../inc/header.php";
?> 

<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td width="180"><?		include "menu.php";?></td>
    <td width="30">&nbsp;</td>
    <td width="790"> 

	<!--START-->	
	<div id="container">
	<div class="title">이벤트관리</div>
   <table border="0" cellspacing="1" cellpadding="1">
  <tr>
    <th>번호</th>
    <th>브랜드</th>
    <th width="405">제목</th>
    <th>기간</th>
    <th>조회</th>
  </tr>
  <tr>
    <td align="center">10</td>
    <td align="center">가맹문의</td>
    <td><p>가맹 문의드립니다</p></td>
    <td align="center">2013-02-01~2013-02-28</td>
    <td align="center">13</td>
  </tr>
</table>


<div style="text-align:right"><input class="btn2" type="submit" value="등록"/></div>
    
    <div style="text-align:center;"><select style="width:100px;">
      <option select="select">제목</option>
    </select> 
    <input name="unname" type="text" id="uname" size="20" /> <input class="btn1" type="submit" value="검색"/></div>

<br />
<br />

	<!--게시물보기-->	
   <table border="0" cellspacing="1" cellpadding="1">
  <tr>
    <th width="90">브랜드</th>
    <td>다이닝 앤 라운지 케이타운</td>
    <th width="90">기간</th>
    <td>2013-02-01~2013-02-28</td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="3">예젝 레귤러 사이즈 - 10년전 가격행사</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="border-bottom:1px solid #CCC;"><p><br />
      <br />
      이벤트 컨텐츠 영역<br />
      <br />
      <br />
    </p></td>
  </tr>
</table>






    
<div style="text-align:right"><input class="btn2" type="submit" value="답변"/>  <input class="btn1" type="submit" value="목록"/></div>
<br />
<br />


	<!--게시물수정-->
       <table border="0" cellspacing="1" cellpadding="1">
  <tr>
    <th width="90">브랜드</th>
    <td><select style="width:100px;">
      <option select="select">브랜드</option>
    </select></td>
    <th width="90">기간</th>
    <td><input name="unname" type="text" id="uname" size="15" /> 
    <img src="../image/calendar.png" width="18" height="18" /> ~ <input name="unname" type="text" id="uname" size="15" /> <img src="../image/calendar.png" width="18" height="18" /> <input type="checkbox" name="check<?=$name_num?>2" value="<?=$data[no]?>" /> 상시모집</td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="3">예젝 레귤러 사이즈 - 10년전 가격행사</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="border-bottom:1px solid #CCC;"><p><br />
      <br />
      이벤트 컨텐츠 영역<br />
      <br />
      <br />
    </p></td>
  </tr>
</table>
    
<div style="text-align:right"><input class="btn2" type="submit" value="등록"/> <input class="btn1" type="submit" value="취소"/> <input class="btn1" type="submit" value="목록"/></div>
<br />
<br />

    
    
    
    

	</div>
    
    

	<!--END-->
<? include "../inc/footer.php";?>
</body>
</html>