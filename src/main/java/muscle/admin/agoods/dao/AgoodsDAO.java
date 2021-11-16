package muscle.admin.agoods.dao;
import java.util.List;

import java.util.Map;
import org.springframework.stereotype.Repository;
import muscle.common.common.SearchDTO;
import muscle.common.dao.AbstractDAO;
@Repository("agoodsDAO")
public class AgoodsDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openAgoodsList(Map<String, Object>map)throws Exception{
		return (List<Map<String, Object>>)selectPagingList("aGoods.aGoodsList", map);
	}
	
	public void deleteAdminGoods(Map<String, Object> map)throws Exception{
		delete("aGoods.deleteAdminGoods", map);		
	}
	
	public void deleteAdminGoodsATT(Map<String, Object> map)throws Exception{
	      delete("aGoods.deleteAdminGoodsATT", map);
	   }
	
	public void updateGoods(Map<String, Object> map) throws Exception { // 惑前 荐沥
		update("aGoods.updateGoods", map);
	}	
	
	public void attributeDelete(Map<String, Object> map) throws Exception { // 惑前可记 昏力
		insert("aGoods.attributeDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTypeList(SearchDTO searchDTO) throws Exception {
		return (List<Map<String,Object>>) selectList("aGoods.selectTypeList", searchDTO);
	}
}