package muscle.admin.aorder.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import muscle.admin.aorder.service.AdminOrdersService;
import muscle.common.common.CommandMap;

@Controller
public class AdminOrdersController {
Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="adminOrdersService")
   private AdminOrdersService adminOrdersService;
   
   
   @RequestMapping(value="/admin/openAdminOrderList.do") 
   public ModelAndView openMainList(Map<String,Object> commandMap) throws Exception{
      ModelAndView mv = new ModelAndView("/admin/adminOrderList"); 
      return mv; 
   }
    
   // 주문.배송에 STATE별 리스트
      @RequestMapping(value="/admin/order_admin_a.do")
      public ModelAndView order_admin_a(CommandMap commandMap,HttpServletRequest request) throws Exception {
         
         ModelAndView mv = new ModelAndView("/admin/adminOrderList");
         
         String AORDER_STATE = "0";
         System.out.println("뷰에서 받는값:"+request.getParameter(""));
         if(request.getParameter("os") != null && request.getParameter("os") != ""){

            AORDER_STATE = request.getParameter("os");
           }
         commandMap.put("AORDER_STATE", AORDER_STATE);
         
         List<Map<String,Object>> order_a = adminOrdersService.order_admin_a(commandMap);
         System.out.println("AORDER_STATE:"+AORDER_STATE);
         
         if (order_a.isEmpty()) {
            mv.addObject("order_a", order_a);
            mv.addObject("AORDER_STATE", AORDER_STATE);
         }else {
            mv.addObject("order_a", order_a);
         }

         System.out.println("mv:"+mv);   
         return mv;
      }
      
      // 주문/변경 상세보기 
      @RequestMapping(value="/admin/order_detail.do")
      public ModelAndView order_detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

         ModelAndView mv = new ModelAndView("/admin/order_detail");

         String ORDER_NUM = request.getParameter("AORDER_ORDER_NUM");

         List<Map<String, Object>> order_detail = adminOrdersService.order_detail(commandMap);
         System.out.println("order_detail:" + order_detail);

         List<Map<String, Object>> order_detail_sub = adminOrdersService.order_detail_sub(commandMap);
         System.out.println("order_detail_sub:" + order_detail_sub);

         mv.addObject("order_detail", order_detail);
         mv.addObject("order_detail_sub", order_detail_sub);

         return mv;
      }
      
       // state변경 
      @RequestMapping(value="/admin/order_admin_a.do", method = RequestMethod.POST)
      public ModelAndView order_state(CommandMap commandMap, HttpServletRequest request) throws Exception {

         ModelAndView mv = new ModelAndView("/admin/adminOrderList");

         String AORDER_STATE = "0";
         String AORDER_ORDER_NUM = "";
         String AORDER_TRACKING = "";
         // System.out.println("뷰에서 받는값:"+request.getParameter("os"));

         if (request.getParameter("AORDER_STATE") != null && request.getParameter("AORDER_STATE") != "") {
            AORDER_STATE = request.getParameter("order_state");
         }
         if (request.getParameter("AORDER_ORDER_NUM") != null && request.getParameter("AORDER_ORDER_NUM") != "") {
            AORDER_ORDER_NUM = request.getParameter("AORDER_ORDER_NUM");
         }
         System.out.println("AORDER_STATE:"+request.getParameter("AORDER_STATE"));
         System.out.println("AORDER_TRACKING:"+request.getParameter("AORDER_TRACKING"));
         if (request.getParameter("AORDER_STATE").equals("1") && request.getParameter("AORDER_TRACKING") != null) {
            AORDER_TRACKING = request.getParameter("AORDER_TRACKING");
            commandMap.put("AORDER_TRACKING", AORDER_TRACKING);
            commandMap.put("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
            commandMap.put("AORDER_STATE", AORDER_STATE);

            adminOrdersService.order_state_ex(commandMap); // 송장번호 넣기

         } else {
            commandMap.put("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
            commandMap.put("AORDER_STATE", AORDER_STATE);

            adminOrdersService.order_state(commandMap);
         }
         
         commandMap.put("AORDER_STATE", request.getParameter("AORDER_STATE"));
         List<Map<String, Object>> order_a = adminOrdersService.order_admin_a(commandMap);

         mv.addObject("order_a", order_a);

         return mv;
      }
      
      //어드민 AS요청 LIST
      @RequestMapping(value="/admin/as_admin.do")
      public ModelAndView as_admin_list(CommandMap commandMap, HttpServletRequest request) throws Exception {
         
         ModelAndView mv = new ModelAndView("/admin/adminETCList");
         
         String AORDER_STATE = "6";
         System.out.println("뷰에서 받는값:"+request.getParameter("as"));

         if(request.getParameter("as") != null && request.getParameter("as") != ""){
            AORDER_STATE = request.getParameter("as");
           }

         commandMap.put("AORDER_STATE", AORDER_STATE);
         
         List<Map<String,Object>> as_admin_list = adminOrdersService.as_admin_list(commandMap);
         System.out.println("AORDER_STATE:"+AORDER_STATE);
         
         if (as_admin_list.isEmpty()) {
            mv.addObject("as_admin_list", as_admin_list);
            mv.addObject("AORDER_STATE", AORDER_STATE);
         }else {
            mv.addObject("as_admin_list", as_admin_list);
         }
         System.out.println("mv:"+mv);
         return mv;
         
      }
      
      // AS페이지 - as취소
      @RequestMapping(value="/admin/as_cancle.do")
      public ModelAndView as_cancle(CommandMap commandMap,HttpServletRequest request) throws Exception {
         
         ModelAndView mv = new ModelAndView("/admin/adminETCList");

         String AORDER_NUM = request.getParameter("AORDER_NUM");
         String AORDER_ORDER_NUM = request.getParameter("AORDER_ORDER_NUM"); // order_no 
         String AORDER_STATE = request.getParameter("AORDER_STATE"); //order_list에서 받은 order_state
     
         System.out.println(AORDER_NUM);
         
         if (AORDER_NUM == null || AORDER_STATE == null || AORDER_ORDER_NUM == null) {
            commandMap.put("AORDER_STATE", '6');
            List<Map<String,Object>> as_admin_list = adminOrdersService.as_admin_list(commandMap);
            return mv;
         }
         
            commandMap.put("AORDER_NUM", AORDER_NUM);
            commandMap.put("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
            commandMap.put("AORDER_STATE", AORDER_STATE);
            adminOrdersService.as_cancle_a(commandMap);
         
         
         //mv.setViewName("admin/as_admin.jsp?as=3");
         //처리후 다시 리스트 불러오기
         commandMap.put("AORDER_STATE", AORDER_STATE);
         List<Map<String,Object>> as_admin_list = adminOrdersService.as_admin_list(commandMap);
         mv.addObject("as_admin_list", as_admin_list);
         mv.addObject("AORDER_STATE", AORDER_STATE);
      
         return mv;
      }
      
      // AS페이지 - AS확인&요청처리
      @RequestMapping(value="/admin/as_ok.do")
      public ModelAndView as_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
         
         ModelAndView mv = new ModelAndView("/admin/adminETCList");

         String AORDER_NUM = request.getParameter("AORDER_NUM");
         String AORDER_ORDER_NUM = request.getParameter("AORDER_ORDER_NUM"); 
         String AORDER_STATE = request.getParameter("AORDER_STATE");
         
         if (AORDER_NUM == null || AORDER_STATE == null || AORDER_ORDER_NUM == null) {
            commandMap.put("AORDER_STATE", '4');
            List<Map<String,Object>> as_admin_list = adminOrdersService.as_admin_list(commandMap);
            return mv;
         }
         
            commandMap.put("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
            commandMap.put("AORDER_NUM", AORDER_NUM);
            commandMap.put("AORDER_STATE", AORDER_STATE);
            adminOrdersService.as_ok_a(commandMap);
         
         //mv.setViewName("/admin/a");
         //처리후 다시 리스트 불러오기
         commandMap.put("AORDER_STATE", request.getParameter("AORDER_STATE"));
         List<Map<String,Object>> as_admin_list = adminOrdersService.as_admin_list(commandMap);
         mv.addObject("as_admin_list", as_admin_list);
         System.out.println(AORDER_STATE);
         mv.addObject("AORDER_STATE", AORDER_STATE);
      
         return mv;
      }
   
}