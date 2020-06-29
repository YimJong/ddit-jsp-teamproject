function Get_Cookie( check_name ) {  // 키 생성 , 쿠키의 키를 주면 저장소의 쿠키 value 값을 반환함.
	var a_all_cookies = document.cookie.split( ';' ); // document.cookie = 저장소의 쿠키에 접근
	var a_temp_cookie = '';
	var cookie_name = '';  // 쿠키 이름
	var cookie_value = '';  // 쿠키 값
	var b_cookie_found = false; 
	for (var i = 0; i < a_all_cookies.length; i++ ){  // 모든 쿠키 가져 와서 loop
		a_temp_cookie = a_all_cookies[i].split( '=' );  // 쿠키 이름과 값을 나눔
		cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');  // [=] 기호 앞의 값을 쿠키
		if ( cookie_name == check_name ){// 이름으로
				b_cookie_found = true;
			if ( a_temp_cookie.length > 1 ){
				// [=] 기호 뒤의 값을 쿠키값으로
				cookie_value = unescape( a_temp_cookie[1].replace(/^\s+|\s+$/g, '') );  
			}
			return cookie_value;  // cookie 값 리턴
			break;
		}
		a_temp_cookie = null; // temp 쿠키를 비워줌
		cookie_name = ''; // 쿠키 이름을 비워줌
	}
	if ( !b_cookie_found ) {
		return null;
	}
}
 
function Set_Cookie( name, value, expires, path, domain, secure ) { // 쿠키생성
	var today = new Date();
	today.setTime( today.getTime());
	if ( expires ){ // expires 
		expires = expires * 1000 * 60 * 60 * 24;  // 자바스크립트는 유효시간이 밀리세컨드 단위
	}
	var expires_date = new Date( today.getTime() + (expires) );
	document.cookie = name + "=" +escape( value ) +
				( ( expires ) ? ";expires=" + expires_date.toGMTString() : "" ) +
				( ( path ) ? ";path=" + path : "" ) + 
				( ( domain ) ? ";domain=" + domain : "" ) +
				( ( secure ) ? ";secure" : "" );
}

function Delete_Cookie( name, path, domain ) {  // 쿠키삭제
	if ( Get_Cookie( name ) ) document.cookie = name + "=" +
		( ( path ) ? ";path=" + path : "") +
		( ( domain ) ? ";domain=" + domain : "" ) +
		";expires=Thu, 01-Jan-1970 00:00:01 GMT"; // 이전시간 셋팅으로 쿠키 삭제
}



