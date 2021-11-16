package muscle.admin.acs.service;

import java.util.List;
import java.util.Map;

public interface AcsService {
	List<Map<String, Object>> acsBoardList(Map<String, Object> map)throws Exception; //리스트
	Map<String, Object> acsDetail(Map<String, Object> map)throws Exception;	 //디테일
	void insertAcs(Map<String, Object> map)throws Exception; //글 작성
	Map<String, Object> updateAcsForm(Map<String, Object> map)throws Exception; //수정 폼
	void updateAcs(Map<String, Object> map)throws Exception; //수정완료
	void deleteAcs(Map<String, Object> map)throws Exception; //삭제
	List<Map<String, Object>> allList(Map<String, Object> map)throws Exception; //전체 리스트
	List<Map<String, Object>> notice(Map<String, Object> map)throws Exception; //공지 리스트
	List<Map<String, Object>> event(Map<String, Object> map)throws Exception; //이벤트 리스트
	List<Map<String, Object>> SearchAcs(Map<String, Object> map)throws Exception; //검색
	
	//faq	
	List<Map<String, Object>> faqBoardList(Map<String, Object> map)throws Exception; //리스트
	void insertFaq(Map<String, Object> map)throws Exception; //글 작성
	Map<String, Object> updateFaqForm(Map<String, Object> map)throws Exception; //수정 폼
	void updateFaq(Map<String, Object> map)throws Exception; //수정완료
}
