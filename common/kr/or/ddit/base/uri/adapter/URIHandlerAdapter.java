package kr.or.ddit.base.uri.adapter;

import java.util.Map;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.base.uri.handler.URIHandlerMapper;


// 역할 : Properties 파일 내 데이터(클라이언트 요청 시 서블릿 패스를 키 = 해당 요청을 처리하는 커맨드 컨트롤러의 패키지 명.클래스명)
// 이 데이터를 활용하여 커맨트 컨트롤러를 특정하고 동적으로 인스턴스화 처리 후 반환
public class URIHandlerAdapter {
	
	public static IAction getAction(String servletPath) {
		Map<String, String> actionMap = URIHandlerMapper.getActionMap(); // Map 반환 받음
		
		IAction action = null;
		
		if(actionMap.containsKey(servletPath)) { // 저장이 되어 있는지 없는지 검증
			try {
				Class targetClass = Class.forName(actionMap.get(servletPath)); // 클래스 로더가 그 패키지에 올린 메모리 정보를 취득
				action = (IAction)targetClass.newInstance(); // 취득한 메모리 정보를 동적으로 인스턴스 화
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return action; // WebController에 제공
	}
}
