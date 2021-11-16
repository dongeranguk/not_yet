package muscle.shop.basket.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import muscle.common.common.CommandMap;

public interface BasketService {
	
	
	//장바구니 전체리스트 검색
	List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception;

	//장바구니 수량수정
	void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//장바구니 테이블에서 삭제
	void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;

	//장바구니 전체삭제
	void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;
	
	//장바구니에서 선택상품 주문시 검색 
	List<Map<String, Object>> basketSelectList(CommandMap commandMap, HttpServletRequest request) throws Exception;
	
}
