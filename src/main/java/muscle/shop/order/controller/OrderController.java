package muscle.shop.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.shop.basket.service.BasketService;
import muscle.shop.order.service.OrderService;

@Controller
public class OrderController {
	
	Logger log = Logger.getLogger(this.getClass()); //로그
	/*
	 * @Resource(name="orderService") private OrderService orderService;
	 */
	

	@Resource(name="basketService")
	private BasketService basketService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	//장바구니 모두구매
		@RequestMapping(value="/order/basketAllOrderWrite.do")
		public ModelAndView basketAllOrderSelect(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("shop/orderForm");
			Object MEM_NUM = ""; //세션값 가져오기 
			HttpSession session = request.getSession(); 
			commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
			
			List<Map<String,Object>> list = basketService.basketList(commandMap);
			Map<String,Object> map = orderService.orderMemberInfo(commandMap, request);
			mv.addObject("list", list);
			mv.addObject("map", map);
			
			System.out.println(list);
			System.out.println(map);
			
			return mv;
		}
		
		//상품 주문완료(결제)
		@RequestMapping(value="/order/orderPay.do")
		public ModelAndView orderPay(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("shop/orderCompleted");
			
			System.out.println("들어옴");
			Object MEM_NUM = ""; //세션값 가져오기 
			HttpSession session = request.getSession(); 
			commandMap.put("ORDER_USER_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
			commandMap.put("ORDER_PRICE", Integer.parseInt((String)commandMap.get("ORDER_cost")));
			
			System.out.println(commandMap.get("ORDER_cost"));
			System.out.println(commandMap.get("ORDER_PRICE"));
			System.out.println(commandMap.get("ORDER_TCOST"));
			
			
			orderService.insertOrder(commandMap, request);
			Map<String,Object> map = orderService.selectOrder(commandMap, request);
			
			mv.addObject("map", map);
			
			map.put("MEM_NAME", commandMap.get("MEM_NAME"));
			 map.put("ORDER_TCOST", commandMap.get("ORDER_TCOST"));
			 map.put("ORDER_USER_NAME", commandMap.get("ORDER_USER_NAME"));
			 map.put("ORDER_PHONE1", commandMap.get("ORDER_PHONE1"));
			 map.put("ORDER_DZIPCODE", commandMap.get("ORDER_DZIPCODE"));
			 map.put("ORDER_DADD1", commandMap.get("ORDER_DADD1"));
			 map.put("ORDER_DADD2", commandMap.get("ORDER_DADD2"));
			 map.put("ORDER_DMEMO", commandMap.get("ORDER_DMEMO"));	
			
			return mv;
			}
		
		//장바구니 선택상품 구매
	      @RequestMapping(value="/order/basketSelectOrder.do")
	      public ModelAndView basketSelect(CommandMap commandMap, HttpServletRequest request) throws Exception {
	         
	         ModelAndView mv = new ModelAndView("shop/orderForm");
	         Object MEM_NUM = ""; //세션값 가져오기 
	         HttpSession session = request.getSession(); 
	         MEM_NUM = (Object)session.getAttribute("session_MEMBER"); 
	         commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	         List<Map<String,Object>> list = basketService.basketSelectList(commandMap, request); //선택한 장바구니번호의 상품 
	         Map<String,Object> map = orderService.orderMemberInfo(commandMap, request); //주문자정보

	         mv.addObject("list", list);
	         mv.addObject("map", map);

	         System.out.println(list);
	         System.out.println(map);

	         return mv;
	      }

}
