package muscle.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params) {
		printQueryId(queryId);
		Map<String, Object> map = (Map<String, Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex=0;
		int nPageRow=15;
		
		if(StringUtils.isEmpty(strPageIndex) == false){
	        nPageIndex = Integer.parseInt(strPageIndex)-1;
	    }
	    if(StringUtils.isEmpty(strPageRow) == false){
	        nPageRow = Integer.parseInt(strPageRow);
	    }
	    map.put("START", (nPageIndex * nPageRow) + 1);
	    map.put("END", (nPageIndex * nPageRow) + nPageRow);
		/* map.put("KEYWORD", (String)map.get("KEYWORD")); */
	     
	    return sqlSession.selectList(queryId, map);
	}
	
	public List<Map<String,Object>> bestGoodsList(String queryId, Object params) { 
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	public List<Map<String,Object>> newGoodsList(String queryId, Object params) { 
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	@SuppressWarnings("rawtypes")
	public List openBoardList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List openBoardList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	@SuppressWarnings("rawtypes")
	public List openCommentList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List openCommentList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	public List<Map<String,Object>> member_detail(String queryId, Object params) { // �ֹ�/��� �󼼺��� 
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
     }
	
	//adminDAO �߰�����
	public List<Map<String,Object>> order_admin_a(String queryId, Object params) { // �ֹ�/���-�ű��ֹ� 
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
     }
	
	public List<Map<String,Object>> order_detail(String queryId, Object params) { // �ֹ�/��� �󼼺��� 
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
     }
     
     public List<Map<String,Object>> order_detail_sub(String queryId, Object params) { // �ֹ�/��� �󼼺��� ��ǰ 
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
     }
     
     public List<Map<String,Object>> order_state(String queryId, Object params) { // �ֹ����� ���� 
         printQueryId(queryId);
         return sqlSession.selectList(queryId,params);
      }
      
      public List<Map<String,Object>> order_state_ex(String queryId, Object params) { // �ֹ�����.��� ���� 
         printQueryId(queryId);
         return sqlSession.selectList(queryId,params);
      }
      
      public List<Map<String,Object>> as_admin_list(String queryId, Object params) { // ��ȯ.ȯ��.AS - ���������� 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
      
      public void as_cancle_a(String queryId, Object params) { // as��û��� - as_list state=3 edate���� 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
      
      public void as_ok_state(String queryId, Object params) { // �ű� as��ûȮ��(AS_LIST state Ȯ�������� ����) 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void as_ok_orderState(String queryId, Object params) { // �ű� as��ûȮ��(Order_LIST STATE����) 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }

}
