package kr.or.ddit.base.uri.handler;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

// 역할 : Properties 파일 내 데이터(클라이언트 요청 시 서블릿 패스를 키 = 해당 요청을 처리하는 커맨드 컨트롤러의 패키지 명.클래스명)
// Map에 저장 후 반환
public class URIHandlerMapper {
	private static Map<String, String> actionMap = new HashMap<String, String>();
	
	static {
		// properties 파일에 접근 => properties 파일에 서블릿 패스, 커맨드 컨트롤러 패스로 정리 할 예정
		ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.base.uri.mapper.requestURIMapper");  
		Enumeration<String> keys =  bundle.getKeys(); // Enumeration 반환
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			String value = bundle.getString(key);
			actionMap.put(key, value); // 키와 값을 actionMap에 저장.
		}
	}
	
	public static Map<String, String> getActionMap() { // Map을 반환하는 메서드
		return actionMap;
	}
}
