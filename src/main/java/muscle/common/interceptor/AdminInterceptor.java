package muscle.common.interceptor;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttributeNames().hasMoreElements()) {

		} else {
			response.sendRedirect("/muscle");
			return false;
		}

		String se_name = "";
		String se_value = "";

		Enumeration enum_01 = session.getAttributeNames();
		int i = 0; 
		while (enum_01.hasMoreElements()) {
			se_name = enum_01.nextElement().toString();
			se_value = session.getAttribute(se_name).toString();
		}

		@SuppressWarnings("unchecked")
		HashMap<String, Object> admchk = (HashMap<String, Object>) session.getAttribute("session_MEMBER");
		if (admchk.get("MEM_ADMIN").equals("Y")) {
			return true;
		} else {
			response.sendRedirect("/muscle");
			return false;
		}
	}
}
