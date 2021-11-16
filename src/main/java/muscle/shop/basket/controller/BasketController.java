package muscle.shop.basket.controller;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.shop.basket.service.BasketService;



@SuppressWarnings("unused")
@Controller
public class BasketController {


Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	//세션값으로 장바구니 전체리스트
	   @RequestMapping(value="/shop/basketList.do")
	      public ModelAndView basketList(CommandMap commandMap, HttpServletRequest request) throws Exception {
	   
	         ModelAndView mv = new ModelAndView("/shop/basketList"); //jsp 파일의 경로
	            
	         HttpSession session = request.getSession();           
	         commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	         System.out.println("MEM_NUM   "+ ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	         
	         commandMap.put("MEM_ID", ((Map)session.getAttribute("session_MEMBER")).get("MEM_ID"));
	         System.out.println("MEM_ID = "+ ((Map)session.getAttribute("session_MEMBER")).get("MEM_ID"));
	         System.out.println("put 후 commandMap.MEM_ID = " + commandMap.get("MEM_ID"));

	              List<Map<String,Object>> list = basketService.basketList(commandMap);
	                            
	              mv.addObject("list", list);
	              mv.addObject("MEM_ID", commandMap.get("MEM_ID"));
	              
	              System.out.println("list = " + list);              
	              System.out.println("mv = " + mv);   
	              
	              return mv;
	                      
	      }
		
		//장바구니 수량 수정
		@RequestMapping(value="/shop/basketModify.do")
		public ModelAndView basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("redirect:/shop/basketList.do");
			System.out.println(commandMap.get("BASKET_NUM"));
			basketService.basketModify(commandMap, request);
			return mv;
		}
		
		//장바구니 선택삭제(1개)
		
		@RequestMapping(value="/shop/basketDelete.do")
		public ModelAndView basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("redirect:/shop/basketList.do");
			System.out.println(commandMap.get("MEM_NUM"));
			basketService.basketDelete(commandMap, request);
			return mv;
		}
		
		//정바구니 전체삭제
		@RequestMapping(value="/shop/basketAllDelete.do")
		public ModelAndView basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession(); 
			  commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));				  
			ModelAndView mv = new ModelAndView("redirect:/shop/basketList.do");
			 System.out.println("MEM_NUM   "+ ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
			basketService.basketAllDelete(commandMap, request);
			return mv;
		}
		
	}
