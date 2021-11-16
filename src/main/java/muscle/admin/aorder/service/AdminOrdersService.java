package muscle.admin.aorder.service;

import java.util.List;
import java.util.Map;

import muscle.common.common.CommandMap;

public interface AdminOrdersService {
	List<Map<String, Object>> selectAdminOrdersList(Map<String, Object> commandMap) throws Exception;
	
	List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception; // 주문/배송-리스트초기화면
	
	List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception; //어드민 - 주문상세

	List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception;//어드민 - 주문 detail상세
	
	void order_state(CommandMap map) throws Exception; // 주문/배송- 주문상태변경
	
	void order_state_ex(CommandMap commandMap) throws Exception; // 주문/배송 - 송장번호 입력
	
	List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception; // 교환.환불.AS 신청목록 
	
	void as_cancle_a(CommandMap commandMap) throws Exception; // 교환.환불.AS 요청 취소
	
	void as_ok_a(CommandMap commandMap) throws Exception; // as_list 교환.환불.AS (1)신규요청 처리
	
}
