package kr.or.ddit.base.controller;

import java.awt.image.TileObserver;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.base.uri.adapter.URIHandlerAdapter;

// MVC 패턴 모델 2 : 소프트웨어 공학의 소프트에어 디자인 패턴
//               Model(M - service layer, DAO layer, VO, Bean),
//               View(V - JSP),
//               Controller(C - Servlet or filter)로 레이어별 역할을 구분
//               분리하며, 프론트엔드 컨트롤러(디자인 패턴 활용).
//               이러한 컨트롤러를 클라이언트의 요청을 일괄 처리하고,커맨드 컨트롤러(커맨드 디자인패턴 활용)를
//				  통해 일괄 취득된 클라이언트의 요청을 실제 처리.  서번트 컨트롤러라고도 지칭함.
//               다양한 클라이언트의 요청은 서번트 클래스의 인스턴스화 및 요청처리를 위해 어댑터를
//               활용한 비지니스 로직의 진입점으로 사용 및 Mapper를 통한 응답 제어 수행.

public class WebController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 프론트 엔드 컨트롤러 : WebController
		//                    어댑터 - 클라이언트의 해당 요청을 처리 할 커맨드 컨트롤러를 특정.
		//                          * 기준 - 클라이언트의 요청 시 서블릿 패스
		
		// 어댑터 : properties 파일 내 서블릿 패스 = 패키지명.커맨드 컨트롤러명 패턴으로 정리된 데이터를
		//                                 활용하여 특정 서블릿 패스 요청을 처리 할 커맨드 컨트롤러의 동적인 인스턴스화를 수행 후 활용.
		
		// http://localhost/user/freeboard/freeboardList.do            => kr.or.ddit.user.freeboard.FreeboardListAction implements IAction
		//                 /user/freeboard/freeboardForm.do            => kr.or.ddit.user.freeboard.FreeboardFormAction implements IAction
		//                 /user/freeboard/freeboardView.do?bo_no=1    => kr.or.ddit.user.freeboard.FreeboardViewAction implements IAction
		//                 /user/freeboard/insertFreeboardView.do      => kr.or.ddit.user.freeboard.InsertFreeboardAction implements IAction
		//                 /user/freeboard/deleteFreeboardView.do      => kr.or.ddit.user.freeboard.DeleteFreeboardAction implements IAction
		
		String servletPath = request.getServletPath(); // 서블릿 패스 취득
		
		IAction action =  URIHandlerAdapter.getAction(servletPath); // 어댑터 생성
		
		if(action != null) { 
			String viewName = action.process(request, response);
			if(viewName != null) {
				if(action.isRedirect()) {
					// 리다이렉트 처리
					response.sendRedirect(request.getContextPath() + viewName);
				} else {
					// 포워딩 처리
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
					dispatcher.forward(request, response);
				}
			}
			// viewName 널 (process 메서드에서 null 반환하는 경우) : ajax 응답 처리
			//											      파일 다운로드 처리 : 이 두가지는 null 반환을 해야 하므로 else 처리 안함.
			//  * 해당 커맨드 컨트롤러의 process() 메서드 내에서 response를 활용해 응답 컨텐츠(ajax json데이터, 파일 다운로드 설정) 처리 해야함.
		} else {
			// properties파일에 정의가 되어있지 않을 경우
			// 404 응답 처리 
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // SC_NOT_FOUND 상수를 넣어주면 응답 헤더에 추가 후 클라이언트에 전송)
		}
	}
}
