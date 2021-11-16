package muscle.shop.goods.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import muscle.common.common.CommandMap;
import muscle.common.util.FileUtils;
import muscle.shop.goods.dao.GoodsDao;


@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="goodsDao") 
	private GoodsDao goodsDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { // 최신 상품 리스트 
		
		return goodsDao.newGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception { // 베스트 상품 리스트
		
		return goodsDao.bestGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String GOODS_CATEGORY2) throws Exception { // 카테고리별 상품 리스트
		map.put("GOODS_CATEGORY2", GOODS_CATEGORY2);
		System.out.println(GOODS_CATEGORY2);
		return goodsDao.cateGoodsList(map);
	}
	
	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception { // 상품등록
		
		
		// 상품정보 등록 쿼리 실행
		goodsDao.insertGoods(map);
		System.out.println("****12132* " + map);
		
		
		map.get("GOODS_SIZE");
		map.get("GOODS_COLOR");
		System.out.println("선택한 컬러="+map.get("GOODS_COLOR"));
		System.out.println("선택한 사이즈="+map.get("GOODS_SIZE"));
		
		String Size = map.get("GOODS_SIZE").toString();
		String Color = map.get("GOODS_COLOR").toString();
		String ColorList[] = Color.split(",");
		String SizeList[] = Size.split(",");
		System.out.println(ColorList.length);
		
		for(int i=0; i <=ColorList.length-1; i++) { // 상품등록시 선택한 사이즈 컬러 하나하나씩 상품옵션테이블에 등록해줌
			for(int j=0; j<=SizeList.length-1; j++) {
				System.out.println("배열입니당="+ColorList[i]+","+SizeList[j]);
				map.put("GOODS_SIZE", SizeList[j]);
				map.put("GOODS_COLOR", ColorList[i]);
				goodsDao.goodsAttribute(map);
				
			}
		}
		
		System.out.println("옵션값="+map);
		
	}
	
	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception { // 상품 디테일
		System.out.println("map1111111="+map.get("IDX"));
		
		
		if(map.get("IDX").getClass().getName().equals("java.lang.String")){  // PK값이 일반 스트링으로 왔을 때
			Map<String,Object> map1 = new HashMap<String,Object>();
			map1.put("IDX", map.get("IDX"));
			goodsDao.goodsHitCnt(map1); //조회수
		}else { // PK값이 배열로 넘어 왔을 때 
			String[] Goods_No = (String[])map.get("IDX");
			map.put("IDX", Goods_No[0]);
			goodsDao.goodsHitCnt(map); //조회수
		}
		
		System.out.println("map="+map);
		Map<String, Object> resultMap = goodsDao.selectGoodsDetail(map);

		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception { // 상품 상세보기 컬러랑 사이즈 가져오기(배열로 되있음)
		
		Map<String, Object> resultMap = goodsDao.selectGoodsAtt(map);
		
		return resultMap;
	}
	
	@Override
	public void insertBasket(Map<String, Object> map, HttpServletRequest request) throws Exception { // 상품디테일에서 장바구니 추가
		map.remove("resultList");
		System.out.println("서비스맵"+map);
		goodsDao.insertBasket(map);

	}
	
	@Override
	public void gumeListDelete(Map<String, Object> map) throws Exception {
		goodsDao.gumeListDelete(map);
		
	}
	
	@Override
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception { // 장바구니 PK값 가져오기
		
		return goodsDao.selectBasketNo(map);
	}
	
}
