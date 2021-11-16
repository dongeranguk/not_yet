package muscle.board.comment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muscle.board.board.service.BoardService;
import muscle.board.comment.service.CommentService;
import muscle.common.common.CommandMap;

@Controller
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="/comment/insertComment.do") //댓글작성
    public ModelAndView insertComment(CommandMap commandMap, HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
      commentService.insertCommentWrite(commandMap.getMap(), request);
      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
         
      return mv;
   }
	
	
	@RequestMapping(value = "/comment/commentDelete.do")
	   public ModelAndView commentDelete(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	      commentService.deleteComment(commandMap.getMap());
	      mv.addObject("COMMENT_NUM", commandMap.get("COMMENT_NUM"));
	      
	      return mv;      
	   }
	
	@RequestMapping(value="/comment/updateCommentForm.do")
	   public ModelAndView updateCommentForm(CommandMap commandMap)throws Exception {
	      ModelAndView mv = new ModelAndView("/board/commentModify");
	      List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
	      mv.addObject("list1", list1);
	      Map<String, Object> map = commentService.updateCommentForm(commandMap.getMap());
	      mv.addObject("map", map);
	      mv.addObject("CONTENTS_NUM", commandMap.get("COMMENTS_NUM"));
	      return mv;
	   }
	
		   @RequestMapping(value="/comment/updateComment.do") //수정 완성
	   public ModelAndView updateComment(CommandMap commandMap)throws Exception{
		   ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
		   mv.addObject("CONTENTS_NUM", commandMap.get("COMMENTS_NUM"));
		   mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		   mv.addObject("CONTENTS_CONTENT", commandMap.get("COMMENTS_CONTENT"));
		   commentService.updateComment(commandMap.getMap());
		   return mv;
	   }
}
