package muscle.client.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.admin.acs.service.AcsService;
import muscle.common.common.CommandMap;

@Controller
public class ClientAcsController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="acsService")
	private AcsService acsService;
	
	
	///////////////Client 공지///////////////
	
	
	@RequestMapping(value="/client/acsBoardList.do") 
	public ModelAndView acsBoardList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/acsList");
		List<Map<String, Object>> list = acsService.acsBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/client/openAcsDetail.do")
	   public ModelAndView openAcsDetail(CommandMap commandMap)throws Exception {
	      ModelAndView mv = new ModelAndView("/client/acsDetail");
	      Map<String, Object> map = acsService.acsDetail(commandMap.getMap());
	      mv.addObject("map", map);
	      return mv;
	}
	
	@RequestMapping(value="/client/allList.do") 
	public ModelAndView allList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/acsList");
		List<Map<String, Object>> list = acsService.allList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/client/notice.do")	
	public ModelAndView notice(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/acsList");
		List<Map<String, Object>> list = acsService.notice(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/client/event.do")	
	public ModelAndView event(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/acsList");
		List<Map<String, Object>> list = acsService.event(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/client/SearchAcs.do")	
	public ModelAndView SearchAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/acsList");
		List<Map<String, Object>> list = acsService.SearchAcs(commandMap.getMap());
		mv.addObject("list", list);
		return mv;  
	}

	
	
	/////////////FAQ///////////////////
	
	
	
	@RequestMapping(value="/client/faqBoardList.do") 
	public ModelAndView faqBoardList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/client/faqList");
		List<Map<String, Object>> list = acsService.faqBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	//배송조회
	@RequestMapping("/client/tracking.do")
	public String tracking(Model model, HttpServletRequest request) {
		System.out.println(request.getParameter("TrackingNumber"));
		request.setAttribute("TrackingNumber", request.getParameter("TrackingNumber"));
		return "/client/trackingPackage";
	}
}