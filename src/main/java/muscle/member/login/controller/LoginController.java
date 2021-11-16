package muscle.member.login.controller;


import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.member.join.service.JoinService;
import muscle.member.login.dao.UserVO;
import muscle.member.login.service.KakaoService;
import muscle.member.login.service.LoginService;
import muscle.member.login.service.MailService;


@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="mailService")
	private MailService mailService;

	@Inject
	private JavaMailSender mailSender;

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name="kakaoService")
	private KakaoService kakaoService;

	@Resource(name="joinService")
	private JoinService joinService;


	/*
	 * @RequestMapping(value = "/member/openLoginForm.do") // loginForm.jsp public
	 * ModelAndView loginForm(HttpServletRequest request, Model model) throws
	 * Exception {
	 * 
	 * 
	 * 
	 * 
	 * //session HttpSession session = request.getSession();
	 * 
	 * System.out.println("session : " + session.getAttribute("session_MEMBER"));
	 * 
	 * if(session.getAttribute("session_MEMBER")!=null) { ModelAndView mv = new
	 * ModelAndView(); mv.setViewName("redirect:main/openMainList.do"); return mv; }
	 * else { ModelAndView mv = new ModelAndView("/member/loginForm");
	 * model.addAttribute("userVo", new UserVo()); return mv; } }
	 */


	@RequestMapping(value = "/member/openLoginForm.do") // loginForm.jsp
	public String loginForm(HttpServletRequest request, Model model) throws Exception {


		//session
		HttpSession session = request.getSession();

		System.out.println("session : " + session.getAttribute("session_MEMBER"));

		if(session.getAttribute("session_MEMBER")!=null) {
			return "redirect:main/openMainList.do";

		} else {
			model.addAttribute("userVO", new UserVO());
			return "member/loginForm";
		}
	}


	@RequestMapping(value = "/member/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@ModelAttribute @Valid UserVO vo, BindingResult result, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login");
		String message = "";
		String url = "";

		if(result.hasErrors()) { // 에러를 List로 저장 
			List<ObjectError> list = result.getAllErrors(); 
			for(ObjectError error : list ){
				System.out.println("login메소드 컨트롤러 : " + error);
			}

			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("/member/loginForm");
			return mv2; 
		}

		HttpSession session = request.getSession();

		//아이디 확인문
		Map<String, Object> chk = loginService.login(commandMap.getMap());
		if (chk==null) { // 아이디가 있는지 없는지를 확인
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if (chk.get("MEM_PW").equals(vo.getMEM_PW())) {
				session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID"));
				session.setAttribute("session_MEM_NUM", commandMap.get("MEM_NUM")); //commandMap에는 mem_id만 담겨있으니까 null 값을 가져왔다.
				session.setAttribute("session_MEM_ADMIN", commandMap.get("MEM_ADMIN"));
				session.setAttribute("session_MEMBER", chk);
				System.out.println(commandMap.get("MEM_NUM"));
				System.out.println(commandMap.get("MEM_ADMIN"));
				
				System.out.println("세션저장체크" + session.getAttribute("session_MEM_ID"));
				System.out.println("세션저장체크" + session.getAttribute("session_MEM_NUM"));
				System.out.println("세션저장체크" + session.getAttribute("session_MEM_ADMIN"));
				System.out.println();
				
			} else { // if문을 통해 sql과 정보 일치 확인
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		System.out.println(chk);
		mv.addObject("message",message);
		mv.addObject("url",url);

		return mv;
	}

	@RequestMapping(value="/member/logout.do") // 로그아웃 
	public ModelAndView logout(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(); if (session != null)
			session.invalidate(); ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/main/logoutSc.do"); 
			return mv; 
	}

	@RequestMapping(value="/login/kakao_login.do")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("5cc74eda6966240a1c6d5f938e19ad0c");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:8007/muscle/kakao_callback.do");
		loginUrl.append("&response_type=code");
		return "redirect:" + loginUrl.toString();
	}

	@RequestMapping(value="/kakao_callback.do", method=RequestMethod.GET)
	public String redirectkakao(Model model, @RequestParam String code, CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("코드 : " + code);

		String kakaoToken = kakaoService.getReturnAccessToken(code);
		System.out.println("카카오 토큰 : " + kakaoToken);

		Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
		System.out.println("컨트롤러 출력 : " + result);

		String kakao_id = (String)result.get("account_email");
		System.out.println(kakao_id);
		model.addAttribute("MEM_KAKAO_ID", kakao_id);
		model.addAttribute("MEM_KAKAO_LINK", "Y");
		commandMap.put("MEM_KAKAO_ID", kakao_id);
		commandMap.put("MEM_KAKAO_LINK", "Y");
		
		
		Map<String, Object> chk = loginService.findKakaoId(commandMap.getMap());
		if(chk != null) {
			session.setAttribute("session_MEM_ID", chk.get("MEM_ID"));
			session.setAttribute("session_MEM_NUM", chk.get("MEM_NUM"));
			session.setAttribute("session_MEM_ADMIN", chk.get("MEM_ADMIN"));
			session.setAttribute("session_MEM_KAKAO_ID", chk.get("MEM_KAKAO_ID"));
			session.setAttribute("session_MEM_KAKAO_LINK", chk.get("MEM_KAKAO_LINK"));
			session.setAttribute("session_MEMBER", chk);
			return "redirect:/main/openMainList.do";
		}
		return "redirect:/member/openKakaoLoginForm.do";
	}



	@RequestMapping(value="/member/openKakaoLoginForm.do")
	public String kakaoLoginForm(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String kakaoId = (String)commandMap.get("MEM_KAKAO_ID");
		String kakaoLink = (String)commandMap.get("MEM_KAKAO_LINK");
		System.out.println("----------------------------"); // 값이 넘어왔는지 확인!
		System.out.println(kakaoId);
		System.out.println(kakaoLink);
		System.out.println("----------------------------");
		
		model.addAttribute("MEM_KAKAO_ID", kakaoId);
		model.addAttribute("MEM_KAKAO_LINK", kakaoLink);
		model.addAttribute("userVO", new UserVO());


		if(session.getAttribute("session_MEM_KAKAO_ID") != null) {
			return "redirect:main/openMainList.do";
		}
		return "member/kakaoLoginForm";
	}

	@RequestMapping(value="/member/kakaoLogin.do", method={RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaoLogin(@ModelAttribute @Valid UserVO vo, BindingResult result, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/kakaoLogin");
		String url = "";
		String message = "";

		if(result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for(ObjectError error : list) {
				System.out.println("카카오 로그인 메소드 : " + error);
			}

			mv.setViewName("/member/kakaoLoginForm");
			return mv;
		}

		String kakaoId = (String)commandMap.get("MEM_KAKAO_ID");
		String kakaoLink = (String)commandMap.get("MEM_KAKAO_LINK");
		String mem_id = (String)commandMap.get("MEM_ID");
		System.out.println("-----------------------------------");
		System.out.println("kakaoLogin Method : " + kakaoId);
		System.out.println("kakaoLogin Method : " + kakaoLink);
		System.out.println("kakaoLogin Method : " + mem_id);
		System.out.println("-----------------------------------");

		Map<String, Object> chk = loginService.finder(commandMap.getMap());
		
		if(chk == null) {
			message = "해당 아이디는 존재하지 않습니다.";
		} else if(chk.get("MEM_PW").equals(vo.getMEM_PW())) {
			int i = loginService.kakaoUpdate1(commandMap.getMap());
			System.out.println("업데이트된 행의 수 : " + i);
			if(i < 0) {
				Map<String, Object> chk2 = loginService.finder(commandMap.getMap());
				HttpSession session = request.getSession();
				session.setAttribute("session_MEM_ID", chk2.get("MEM_ID"));
				session.setAttribute("session_MEM_NUM", chk2.get("MEM_NUM"));
				session.setAttribute("session_MEM_ADMIN", chk2.get("MEM_ADMIN"));
				session.setAttribute("session_MEM_KAKAO_ID", chk2.get("MEM_KAKAO_ID"));
				session.setAttribute("session_MEM_KAKAO_LINK", chk2.get("MEM_KAKAO_LINK"));
				session.setAttribute("session_MEMBER", chk2);

				System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_ID"));
				System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_NUM"));
				System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_ADMIN"));
				System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_KAKAO_ID"));
				System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_KAKAO_LINK"));
				System.out.println(chk2);
				mv.setViewName("redirect:/main/openMainList.do");

			}
			HttpSession session = request.getSession();
			session.setAttribute("session_MEM_ID", chk.get("MEM_ID"));
			session.setAttribute("session_MEM_NUM", chk.get("MEM_NUM"));
			session.setAttribute("session_MEM_ADMIN", chk.get("MEM_ADMIN"));
			session.setAttribute("session_MEM_KAKAO_ID", chk.get("MEM_KAKAO_ID"));
			session.setAttribute("session_MEM_KAKAO_LINK", chk.get("MEM_KAKAO_LINK"));
			session.setAttribute("session_MEMBER", chk);

			System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_ID"));
			System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_NUM"));
			System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_ADMIN"));
			System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_KAKAO_ID"));
			System.out.println("세션 저장 체크 : " + session.getAttribute("session_MEM_KAKAO_LINK"));
			System.out.println(chk);
		} else {
			message = "비밀번호가 맞지 않습니다.";
		}
		mv.addObject("message", message);
		mv.addObject("url", url);
		return mv;

	}

	@RequestMapping(value="/main/logoutSc.do")
	public ModelAndView openJoinForm(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/member/logout");

		return mv;
	}


	@RequestMapping(value = "/member/findId.do") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/findAccount");
		int ran = new Random().nextInt(900000) + 100000;

		mv.addObject("random",ran);

		return mv;
	}

	@RequestMapping(value = "/member/openFindIdResult.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")

	public @ResponseBody String findIdResult(CommandMap commandMap) throws Exception {
		String id = String.valueOf(loginService.findId(commandMap.getMap()));

		if(id.equals("1")) {
			String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
			System.out.println(findId);
			return findId;

		}else {
			return id;
		}
	}


	@RequestMapping(value = "/member/findPw.do") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/findAccount");
		int ran = new Random().nextInt(900000) + 100000;

		mv.addObject("random",ran);

		return mv;
	}

	@RequestMapping(value = "/member/openFindPwResult.do", method=RequestMethod.GET) //鍮꾨�踰덊샇 李얘린
	@ResponseBody
	public boolean findPwEmail(CommandMap commandMap,@RequestParam String MEM_ID, @RequestParam String MEM_EMAIL, @RequestParam int random, HttpServletRequest req) throws Exception {

		String emailCheck = String.valueOf(loginService.findPwWithEmail(commandMap.getMap()));
		System.out.println(emailCheck);
		if(emailCheck.equals("1")) {
			int ran = new Random().nextInt(900000) + 100000;
			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(ran);
			session.setAttribute("authCode", authCode);
			session.setAttribute("random", random);
			String subject = "muscle 비밀번호 변경 코드 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는 " + authCode + "입니다.");

			commandMap.put("MEM_ID", MEM_ID);
			commandMap.put("MEM_EMAIL", MEM_EMAIL);
			commandMap.put("authCode", authCode);
			loginService.updateTempPw(commandMap.getMap());
			return mailService.send(subject, sb.toString(),"chkch1991@gmail.com", MEM_EMAIL, null);
		}else {
			return false;
		}
	}
}