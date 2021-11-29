package goo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import goo.admin.model.SiteSettingsDTO;
import goo.admin.model.SiteSettingsService;

public class AppInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private SiteSettingsService siteSettingsService;
	
	/**
	 * Controller 실행 요청 전에 수행되는 메서드 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출된다. return 값으로
	 * boolean값을 전달하는데 false인경우 controller를 실행 시키지 않고 요청을 종료한다. 보통 이곳에서 각종 체크작업과 로그를
	 * 기록하는 작업을 진행한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("interceptor 실행");
		SiteSettingsDTO dto=siteSettingsService.get_site_settings();
		HttpSession session=request.getSession();
		session.setAttribute("dto", dto);
		
		return super.preHandle(request, response, handler);
	}

	/**
	 * view단으로 forward 되기전에 수행 컨트롤러 로직이 실행된 이후 호출된다. 컨트롤러 단에서 에러 발생 시 해당 메서드는 수행되지
	 * 않는다. request로 넘어온 데이터 가공 시 많이 사용된다.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 컨트롤러 종료 후 view가 정상적으로 랜더링 된 후 제일 마지막에 실행되는 메서드
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		super.afterCompletion(request, response, handler, ex);
	}

	/**
	 * Servlet 3.0부터 비동기 요청이 가능해짐에 따라 비동기 요청 시 PostHandle와 afterCompletion메서드를 수행하지
	 * 않고 이 메서드를 수행하게 된다. 거의 사용 안함
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}	
}