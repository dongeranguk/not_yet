package muscle.admin.agoods.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import muscle.admin.agoods.dao.AgoodsDAO;
import muscle.common.common.SearchDTO;
import muscle.shop.goods.dao.GoodsDao;
@Service("agoodsService")
public class AgoodsServiceImpl implements AgoodsService {
	
	@Resource(name="agoodsDAO")
	private AgoodsDAO agoodsDAO;
	
	@Resource(name="goodsDao")
	private GoodsDao goodsDao;
	
	public void deleteAdminGoods(Map<String, Object> map)throws Exception{
	      agoodsDAO.deleteAdminGoodsATT(map);
	      agoodsDAO.deleteAdminGoods(map);
	   }
	
	public List<Map<String, Object>> openAgoodsList(Map<String, Object> map)throws Exception{
		
		return agoodsDAO.openAgoodsList(map);
	}
	
	@Override
	   public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception { // 상품 수정
	      agoodsDAO.updateGoods(map); // 상품테이블 업데이트
	      agoodsDAO.attributeDelete(map); // 기존 상품에 있는 옵션들 삭제
	      map.get("GOODS_SIZE");
	      map.get("GOODS_COLOR");
	      System.out.println("선택한 컬러="+map.get("GOODS_SIZE"));
	      System.out.println("선택한 사이즈="+map.get("GOODS_COLOR"));
	     
	      String Size = map.get("GOODS_SIZE").toString();
	      String Color = map.get("GOODS_COLOR").toString();
	      String ColorList[] = Color.split(",");
	      String SizeList[] = Size.split(",");
	      System.out.println(ColorList.length);
	     
	      for(int i=0; i <=ColorList.length-1; i++) {
	         for(int j=0; j<=SizeList.length-1; j++) {
	            System.out.println("배열입니당="+ColorList[i]+","+SizeList[j]);
	            map.put("GOODS_SIZE", SizeList[j]);
	            map.put("GOODS_COLOR", ColorList[i]);
	            goodsDao.goodsAttribute(map); // 상품 수정시 선택한 컬러 사이즈 다시 등록
	         }
	      }
	}
	
	@Override
	public List<Map<String, Object>> searchTypeList(SearchDTO searchDTO) throws Exception {
		return agoodsDAO.searchTypeList(searchDTO);
	}
}