package muscle.board.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO {
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openAdminReport(Map<String, Object> map) throws Exception{
      return (List<Map<String, Object>>)selectList("report.selectReportList", map);
   }
   
    public void insertReport(Map<String, Object> map)throws Exception{
         insert("report.insertReport", map);
      }
      
      @SuppressWarnings("unchecked")
      public Map<String, Object>selectBoardReport(Map<String, Object> map)throws Exception{
         return (Map<String, Object>)selectOne("report.selectBoardReport", map);
      }
      
      @SuppressWarnings("unchecked")
      public Map<String, Object>selectCommentReport(Map<String, Object> map)throws Exception{
         return (Map<String, Object>)selectOne("report.selectCommentReport", map);
      }
      
      public void insertCommentReport(Map<String, Object> map) throws Exception{
         insert("report.insertCommentReport", map);
      }


   @SuppressWarnings("unchecked")
   public Map<String, Object> selectReportDetail(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne ("report.selectReportDetail", map);
   }
   
   public void updateAdminReport(Map<String, Object> map)throws Exception{
	   update("report.updateStatus", map);
   }
   
   public void updateMemWarning(Map<String, Object> map)throws Exception{
	   System.out.println(map.get("REPORT_MEM_NUM1"));
	  update("report.memWarning", map);
   }
   
   public void updateMemStatus1(Map<String, Object> map)throws Exception{
	   System.out.println(map.get("REPORT_MEM_NUM1"));
	   update("report.updateMemStatus", map);
   }
}