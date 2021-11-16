package muscle.board.board.controller;
import java.util.Map;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import muscle.board.board.service.BoardService;
import muscle.board.comment.service.CommentService;
import muscle.common.common.CommandMap;

@Controller
public class BoardController {
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="boardService")
   private BoardService boardService;
   
   @Resource(name="commentService")
   private CommentService commentService;
   
   
   @RequestMapping(value = "/board/openBoardList.do")
   public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.openBoardList(commandMap.getMap());
      mv.addObject("list", list);
      
      return mv;
   }

   
   @RequestMapping(value="/board/selectBoardList.do")
	public ModelAndView boardListPaging(CommandMap commandMap) throws Exception {
		ModelAndView mv=new ModelAndView("jsonView");
		
		List<Map<String,Object>> list=boardService.selectBoardList(commandMap.getMap());
		mv.addObject("list",list);	
		if(list.size() > 0){
   		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
   	}
   	else{
   		mv.addObject("TOTAL", 0);
   	}
		return mv;
	}   
   
   @RequestMapping(value="/board/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap)throws Exception{
         ModelAndView mv = new ModelAndView("board/boardWrite");
            
         return mv;
   }
      
   @RequestMapping(value="/board/insertBoard.do") //글작성
    public ModelAndView insertJoin(CommandMap commandMap, HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
      commandMap.put("BOARD_IMAGE", request.getSession().getAttribute("GOODS_IMG_THUM"));
      boardService.insertBoardWrite(commandMap.getMap(), request);
      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
         
      return mv;
   }
   
   @RequestMapping(value = "/board/boardDelete.do")
   public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
      boardService.deleteBoard(commandMap.getMap());
      
      return mv;      
   }
   
   @RequestMapping(value="/board/openBoardDetail.do")//글 디테일 보기
   public ModelAndView openBoardDetail(CommandMap commandMap)throws Exception {
      ModelAndView mv = new ModelAndView("/board/boardDetail");
      List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
      mv.addObject("list1", list1);
      Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
      mv.addObject("map", map);
      return mv;
   }
   
   @RequestMapping(value="/board/updateBoardForm.do") //보드 수정폼
   public ModelAndView updateBoardForm(CommandMap commandMap) throws Exception{
      ModelAndView mv = new ModelAndView("/board/boardModify");
      Map<String, Object> map = boardService.updateBoardForm(commandMap.getMap());
      mv.addObject("map", map);
            
      return mv;
   }
   
   @RequestMapping(value="/board/updateBoard.do") //수정 완성
   public ModelAndView updateBoard(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
      boardService.updateBoard(commandMap.getMap());
      return mv;
   }
   
   @RequestMapping(value = "/board/etcBoard.do")
   public ModelAndView etcBoard(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.etcList(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value = "/board/HomeCareBoard.do")
   public ModelAndView HomeCareBoard(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.HomeCareBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value = "/board/HealthyDietBoard.do")
   public ModelAndView HealthyDietBoard(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.HealthyDietBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value = "/board/HomeTrainingBoard.do")
   public ModelAndView HomeTrainingBoard(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.HomeTrainingBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value="/board/RecentlyBoard.do")
   public ModelAndView RecentlyBoard(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.RecentlyBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value="/board/CountBoard.do")
   public ModelAndView CountBoard(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.CountBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
   }
   
   @RequestMapping(value="/board/SearchBoard.do")
   public ModelAndView SearchBoard(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("board/boardList");
      List<Map<String, Object>> list = boardService.SearchBoard(commandMap.getMap());
      mv.addObject("list", list);
      return mv;
      
   }
   
   @RequestMapping(value = "/board/openTopBoardList.do")
   public ModelAndView openTopBoardList(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("jsonView");
      List<Map<String, Object>> list = boardService.openTopBoardList(commandMap.getMap());
      mv.addObject("list", list);
      
      return mv;
   }
}