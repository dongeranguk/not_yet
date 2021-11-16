package muscle.board.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openBoardList(Map<String, Object> map) throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.selectBoardList", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> etcList(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.etcList", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> HomeCareBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.HomeCare", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> HealthyDietBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.HealthyDiet", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> HomeTrainingBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.HomeTraining", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> RecentlyBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.RecentlyBoard", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> CountBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.CountBoard", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> SearchBoard(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardList("board.SearchBoard", map);
   }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> CommentCount(Map<String, Object> map)throws Exception{
      return (Map<String, Object>)selectOne("board.CommentCount", map);
   }
   
   public void insertBoard(Map<String, Object> map) throws Exception{
      insert("board.insertBoard", map);
   }
   
   public void insertFile(Map<String, Object> map) throws Exception {
      insert("board.insertFile", map);
   }
   
   public Map<String, Object> insertBoardM(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne("board.insertBoardM", map);
   }
   
   public void updateHitCnt(Map<String, Object> map) throws Exception{ 
      update("board.updateHitCnt", map); 
      }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception{
      
      return (Map<String, Object>) selectOne ("board.openBoardDetail", map);
   }
   
   public void deleteBoard(Map<String, Object> map) throws Exception {
         update("board.deleteBoard", map);
      }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> updateBoardForm(Map<String, Object> map)throws Exception{
      return (Map<String, Object>)selectOne("board.updateBoardForm", map); 
   }
   
   public void updateBoard(Map<String, Object> map)throws Exception{
      update("board.updateBoard", map);
   }
   
// 자유게시판 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("board.selectBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	   public List<Map<String, Object>> openTopBoardList(Map<String, Object> map) throws Exception{
	      return (List<Map<String, Object>>)openBoardList("board.selectTopBoardList", map);
	   }
}