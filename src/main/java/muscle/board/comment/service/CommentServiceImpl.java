package muscle.board.comment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import muscle.board.comment.dao.CommentDAO;
import muscle.common.util.FileUtils;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;
	
	@Resource(name="fileUtils")
	   private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> openCommentList(Map<String, Object> map)throws Exception{
		return commentDAO.openCommentList(map);
	}
	@Override
	public void insertCommentWrite(Map<String, Object> map, HttpServletRequest request)throws Exception{
		commentDAO.insertComment(map);
		map.put("BOARD_NUM", map.get("BOARD_NUM"));
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
	         commentDAO.insertFile(list.get(i));
	      }
	}
	
	@Override
	   public void deleteComment(Map<String, Object> map) throws Exception {
	      commentDAO.deleteComment(map);
	   }
	
	@Override
	public Map<String, Object> updateCommentForm(Map<String, Object> map)throws Exception{
		return commentDAO.updateCommentForm(map);
	}
	
	@Override
	public void updateComment(Map<String, Object> map)throws Exception{
		commentDAO.updateComment(map);
	}
}
