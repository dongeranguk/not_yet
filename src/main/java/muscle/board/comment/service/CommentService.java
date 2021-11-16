package muscle.board.comment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CommentService {
	List<Map<String, Object>> openCommentList(Map<String, Object> map)throws Exception;
	void insertCommentWrite(Map<String, Object> map, HttpServletRequest request)throws Exception;
	void deleteComment(Map<String, Object> map) throws Exception;
	Map<String, Object> updateCommentForm(Map<String, Object> map)throws Exception;
	void updateComment(Map<String, Object> map)throws Exception;
}
