package muscle.member.join.controller;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.member.join.dao.JoinVO;
import muscle.member.join.service.JoinService;
import muscle.member.join.service.JoinValidator;
import muscle.member.login.service.LoginService;
@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@Resource(name="joinVO")
	private JoinVO joinVO;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/member/openJoinForm.do")
	public ModelAndView openJoinForm(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/member/joinForm");
		mv.addObject("joinVO", new JoinVO());
		return mv;
	}
	
	@RequestMapping(value="/member/openKakaoJoinForm.do", method= {RequestMethod.GET, RequestMethod.POST}) // 요청 URL 처리 메소드가 없어서 ClassCastException 발생?
	public ModelAndView openKakaoJoinForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("joinVO", new JoinVO());
		String kakao_id = request.getParameter("kakao_id");
		String kakao_link = request.getParameter("kakao_link");
		System.out.println("카카오 아이디 : " + kakao_id + ", 카카오 링크 : " + kakao_link);
		mv.addObject("MEM_KAKAO_ID" , kakao_id);
		mv.addObject("MEM_KAKAO_LINK", kakao_link);
		mv.setViewName("member/kakaoJoinForm");
		return mv;
	}
	
	@RequestMapping(value="/member/insertKakaoJoin.do")
	public ModelAndView insertKakaoJoin(CommandMap commandMap, @ModelAttribute JoinVO joinVO, Errors errors, BindingResult result) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(commandMap.get("MEM_KAKAO_ID"));
		System.out.println(commandMap.get("MEM_KAKAO_LINK"));
		JoinValidator joinValidator = new JoinValidator();
		
		joinValidator.validate(joinVO, errors);
		if(errors.hasErrors()) {
			mv.addObject("joinVO", joinVO);
			mv.addObject("MEM_KAKAO_ID", commandMap.get("MEM_KAKAO_ID"));
			mv.addObject("MEM_KAKAO_LINK", commandMap.get("MEM_KAKAO_LINK"));
			mv.setViewName("/member/kakaoJoinForm");
			return mv;
		}
		System.out.println("insertKakaoJoin 메소드로 넘어왔나? : " + commandMap.get("MEM_KAKAO_ID"));
		System.out.println("insertKakaoJoin 메소드로 넘어왔나? : " + commandMap.get("MEM_KAKAO_LINK"));
		
		commandMap.put("MEM_KAKAO_ID", commandMap.get("MEM_KAKAO_ID"));
		commandMap.put("MEM_KAKAO_LINK", commandMap.get("MEM_KAKAO_LINK"));
		loginService.kakaoJoin4(commandMap.getMap());
		mv.setViewName("redirect:/member/openLoginForm.do");
		return mv;
	}
	
	@RequestMapping(value="/member/insertJoin.do")
	public ModelAndView insertJoin(CommandMap commandMap,@ModelAttribute JoinVO joinVO, Errors errors, BindingResult result) throws Exception {
		ModelAndView mv = new ModelAndView();
		JoinValidator joinValidator = new JoinValidator();
		
		joinValidator.validate(joinVO, errors);
		if(errors.hasErrors()) {
			
			List<Errors> list1 = new ArrayList<Errors>();
			list1.add(errors);
			Iterator iter1 = list1.iterator();
			
			while(iter1.hasNext()) {
				System.out.println(iter1.next());
			}
			
			
			mv.addObject("joinVO", joinVO);
			mv.setViewName("/member/joinForm");
			return mv;
		}
	
		joinService.insertJoin(commandMap.getMap());
		mv.setViewName("redirect:/member/openLoginForm.do");
		return mv;
	}
	
	@RequestMapping(value = "/member/idCheck.do") //아이디 중복확인
	   public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {
	     
	      System.out.println(commandMap.getMap());
	     
	      String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
	     
	      System.out.println(idCheck);
	      return idCheck;
	   }
	
	@RequestMapping(value = "/member/nickCheck.do") //닉네임 중복확인
	   public @ResponseBody String nickCheck(CommandMap commandMap) throws Exception {
	     
	      System.out.println(commandMap.getMap());
	     
	      String nickCheck = String.valueOf(joinService.selectNickCheck(commandMap.getMap()));
	     
	      System.out.println(nickCheck);
	      return nickCheck;
	   }
	
	@RequestMapping(value="/member/openAgree.do") //이용약관 보여주기
	   public ModelAndView openAgree(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/member/agree");
	     
	      return mv;
	   }
}