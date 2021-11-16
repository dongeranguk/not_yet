package muscle.member.myinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.servlet.ModelAndView;

import muscle.common.common.CommandMap;
import muscle.member.myinfo.service.MyInfoService;
import muscle.member.myorder.service.MyOrderService;

@Controller
public class MyInfoController {
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="myInfoService")
   private MyInfoService myInfoService;
   
   @Resource(name="myOrderService")
   private MyOrderService myOrderService;
   
   @RequestMapping(value="/member/openMyInfoForm.do") //마이페이지
   public ModelAndView openMyInfoForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView("member/myInfoForm");
      HttpSession session = request.getSession();
      commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
      commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
      Map<String, Object> map = myInfoService.selectMyInfoForm(commandMap.getMap());
      System.out.println("openMyInfoForm map값 확인1: "+map);
      Map<String, Object> map1 = myOrderService.myOrderStatus(commandMap.getMap());
      System.out.println("openMyInfoForm map값 확인2: "+map1);
      mv.addObject("map", map); 
      mv.addObject("map1", map1);
      
      return mv;
   }

   
   @RequestMapping(value="/member/updateMyInfoForm.do") //마이페이지 수정폼
   public ModelAndView updateMyInfoForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView("/member/myInfoModifyForm");
      HttpSession session = request.getSession();
      commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
      Map<String, Object> map = myInfoService.updateMyInfoForm(commandMap.getMap());
      mv.addObject("map", map);   
      
      return mv;
   }
   
   @RequestMapping(value="/member/updateMyInfo.do") //마이페이지 수정!
   public ModelAndView updateMyInfo(CommandMap commandMap, HttpServletRequest request)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/member/openMyInfoForm.do");      
      HttpSession session = request.getSession();
      commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
      myInfoService.updateMyInfo(commandMap.getMap());
      
      return mv;
   }
   
    @RequestMapping(value="/member/deleteMyInfo.do") //회원탈퇴
    public ModelAndView deleteMyInfo(CommandMap commandMap, HttpServletRequest request)throws Exception{
       ModelAndView mv = new ModelAndView("redirect:/main/openMainList.do");
       HttpSession session = request.getSession();
       commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
       myInfoService.deleteMyInfo(commandMap.getMap());
       session.invalidate();
       
       return mv;
     }
    
   
    @RequestMapping(value = "/member/openMyBoardList.do")  //내 게시물 리스트
    public ModelAndView openMyBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("member/myBoardList");
       HttpSession session = request.getSession();
       commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
       List<Map<String, Object>> list = myInfoService.openMyBoardList(commandMap.getMap());
       mv.addObject("list", list);
       
       return mv;
    }
}