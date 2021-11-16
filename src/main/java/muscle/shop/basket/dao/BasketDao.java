package muscle.shop.basket.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import muscle.common.common.CommandMap;
import muscle.common.dao.AbstractDAO;

@Repository("basketDao")
public class BasketDao extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception{
		return (List<Map<String,Object>>) selectList("basketList.basketList", commandMap.getMap());
	}

	public void basketModify(CommandMap commandMap) throws Exception{
		update("basketList.basketModify", commandMap.getMap());
	}
	
	public void basketDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketDelete", commandMap.getMap());
		
	}
	
	public void basketAllDelete(CommandMap commandMap) throws Exception{
		delete("basketList.basketAllDelete", commandMap.getMap());
		
	}
	
	public List<Map<String, Object>> basketSelectList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("basketList.basketSelectList", commandMap.getMap());
	}
	

}