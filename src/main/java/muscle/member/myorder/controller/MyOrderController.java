package muscle.member.myorder.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.member.myorder.service.MyOrderService;

@Controller
public class MyOrderController {
   
   @Resource(name="myOrderService")
   private MyOrderService myOrderService;
   
   @RequestMapping(value="/member/openMyOrderList.do") //상품 리스트 (주문한거)
   public ModelAndView openMyOrderList(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/member/myOrderList");
      List<Map<String, Object>> list = myOrderService.openMyOrderList(commandMap.getMap());
      Map<String, Object> map = myOrderService.myOrderStatus(commandMap.getMap());
      mv.addObject("map", map);
      mv.addObject("list", list);
      
      
      return mv;
   }
   
   @RequestMapping(value="/member/openMyOrderDetail.do")
   public ModelAndView openMyOrderDetail(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/member/myOrderDetail");
      List<Map<String, Object>> list = myOrderService.openMyOrderDetailList(commandMap.getMap());
      mv.addObject("list", list);
      Map<String, Object> map = myOrderService.openMyOrderDetail(commandMap.getMap());
      mv.addObject("map", map);
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
      mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
      
      return mv;
   }
   
   @RequestMapping(value="/member/openMyChangeForm.do")
   public ModelAndView openMyChangeForm(CommandMap commandMap, HttpServletRequest request)throws Exception{
      ModelAndView mv = new ModelAndView("/member/requestExchangeForm");
 
      System.out.println(commandMap.getMap());
      commandMap.put("ORDER_DETAIL_SIZE", request.getParameter("ORDER_DETAIL_SIZE"));
      commandMap.put("ORDER_DETAIL_COLOR", request.getParameter("ORDER_DETAIL_COLOR"));
      System.out.println(commandMap.getMap());
      Map<String, Object> map = myOrderService.openMyChangeForm(commandMap.getMap());
      
      mv.addObject("map", map);
      
      return mv;
   }

   
   @RequestMapping(value="/member/updateMyChange.do")
   public ModelAndView updateMyChange(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/member/openMyOrderList.do");
      myOrderService.updateMyChange(commandMap.getMap());
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
      mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
      
      return mv;
      
   }
   
      
}