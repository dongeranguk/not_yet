package muscle.admin.agoods.service;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import muscle.common.common.SearchDTO;
public interface AgoodsService {
	
	void deleteAdminGoods(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> openAgoodsList(Map<String, Object> map)throws Exception;
	
	void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품 수정
	
	
	List<Map<String, Object>> searchTypeList(SearchDTO searchDTO) throws Exception;
}