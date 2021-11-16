package muscle.board.report.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
   void insertReport(Map<String, Object> map)throws Exception;
      Map<String, Object> selectBoardReport(Map<String, Object>map)throws Exception;
      Map<String, Object> selectCommentReport(Map<String, Object> map)throws Exception;
      void insertCommentReport(Map<String, Object> map)throws Exception;
   List<Map<String, Object>> openAdminReport(Map<String, Object> map)throws Exception;
   Map<String, Object> selectReportDetail(Map<String, Object> map)throws Exception;
   void updateAdminReport(Map<String, Object> map)throws Exception;
}