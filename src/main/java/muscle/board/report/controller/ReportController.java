package muscle.board.report.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.board.report.service.ReportService;
import muscle.common.common.CommandMap;

@Controller
public class ReportController {
   
   @Resource(name="reportService")
   private ReportService reportService;
   
   @RequestMapping(value="/report/openAdminReport.do")
   public ModelAndView openAdminReport(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/admin/adminReportList");
      List<Map<String,Object>> list = reportService.openAdminReport(commandMap.getMap());
      mv.addObject("list",list);
      
      return mv;
   }
   
   @RequestMapping(value="/report/openAdminReportDetail.do")
   public ModelAndView openAdminReportDetail(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/admin/adminReportDetail");
      Map<String, Object> map = reportService.selectReportDetail(commandMap.getMap());
      mv.addObject("map", map);
      return mv;
   }
   
   @RequestMapping(value="/report/openReportBoardForm.do")
   public ModelAndView openReportForm(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/board/reportBoardForm");
      Map<String, Object> map = reportService.selectBoardReport(commandMap.getMap());
      mv.addObject("map", map);
      return mv;
   }
   
   @RequestMapping(value="/report/insertReport.do")
   public ModelAndView insertReport(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
      reportService.insertReport(commandMap.getMap());
      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
      return mv;
   }
   
   @RequestMapping(value="/report/openReportCommentForm.do")
   public ModelAndView openCommentForm(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/board/reportCommentForm");
      Map<String, Object> map = reportService.selectCommentReport(commandMap.getMap());
      mv.addObject("map", map);
      
      return mv;
   }
   
   @RequestMapping(value="/report/insertCommentReport.do")
   public ModelAndView insertCommentReport(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
      reportService.insertCommentReport(commandMap.getMap());
      mv.addObject("COMMENTS_NUM", commandMap.get("COMMENTS_NUM"));
      return mv;
   }
   
   @RequestMapping(value="/report/updateAdminReport.do")
   public ModelAndView updateAdminReport(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/report/openAdminReport.do");
      
      if(commandMap.get("REPORT_MEM_CNUM")!=null) {
    	  commandMap.put("REPORT_MEM_NUM", commandMap.get("REPORT_MEM_CNUM"));
      }else {
    	  commandMap.put("REPORT_MEM_NUM", commandMap.get("REPORT_MEM_NUM1"));
      }
      System.out.println(commandMap.getMap());
      reportService.updateAdminReport(commandMap.getMap());
      
      return mv;
   }

}