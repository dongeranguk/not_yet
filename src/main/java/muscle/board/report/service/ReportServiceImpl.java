package muscle.board.report.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import muscle.board.report.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService{

   @Resource(name="reportDAO")
   private ReportDAO reportDAO;
   
   public void insertReport(Map<String, Object> map)throws Exception{
         reportDAO.insertReport(map);
      }
      
      public Map<String, Object> selectBoardReport(Map<String, Object>map)throws Exception{
         return reportDAO.selectBoardReport(map);
      }
      
      public Map<String, Object> selectCommentReport(Map<String, Object> map)throws Exception{
         return reportDAO.selectCommentReport(map);
      }
      
      public void insertCommentReport(Map<String, Object> map)throws Exception{
         reportDAO.insertCommentReport(map);
      }

   
   @Override
   public List<Map<String, Object>> openAdminReport(Map<String, Object> map) throws Exception {
      return reportDAO.openAdminReport(map);
   }
   
   @Override
   public Map<String, Object> selectReportDetail(Map<String, Object> map)throws Exception{
      return reportDAO.selectReportDetail(map);
   }
   
   
   public void updateAdminReport(Map<String, Object> map)throws Exception{
	   System.out.println(map.get("REPORT_STATE"));
	   if(map.get("REPORT_STATE").equals("2")) {
		   reportDAO.updateAdminReport(map);
		   reportDAO.updateMemWarning(map);
		   reportDAO.updateMemStatus1(map);
	   } else {
		   reportDAO.updateAdminReport(map);
	   }
   }
}