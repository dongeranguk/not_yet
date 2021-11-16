package muscle.shop.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.common.CommandMap;
import muscle.common.dao.AbstractDAO;

@Repository("goodsDao")
public class GoodsDao extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { // 최신 상품 리스트

		return (List<Map<String, Object>>) newGoodsList("goods.newGoodsList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception { // 베스트 상품 리스트

		return (List<Map<String, Object>>) bestGoodsList("goods.bestGoodsList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception { // 카테고리 별 상품 리스트
		System.out.println("카테고리리스트" + map);
		return (List<Map<String, Object>>) selectPagingList("goods.cateGoodsList", map);
	}
	
	public void insertGoods(Map<String, Object> map) throws Exception { // 상품 등록
		insert("goods.goodsInsert", map);
	}
	
	public void goodsAttribute(Map<String, Object> map) throws Exception { // 상품옵션 등록
		insert("goods.attributeInsert", map);
	}
	
	public void insertGoodsThumbnail(Map<String, Object> map) throws Exception { // 상품 썸네일 이미지 등록
		update("goods.updateGoodsThumbnail", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception { // 상품 이미지파일 등록
		insert("goods.insertFile", map);
	}
	
	public void insertGoodsLike(Map<String, Object> map) throws Exception { // 상품 디테일에서 좋아요 등록
		System.out.println("좋아요" + map);
		insert("goods.insertGoodsLike", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception { // 상품 디테일 데이터 가져오기
		return (Map<String, Object>) selectOne("goods.selectGoodsDetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception { // 상품옵션 컬러 사이즈 배열 가져오기
		return (Map<String, Object>) selectOne("goods.selectGoodsAtt", map);
	}
	
	public void goodsHitCnt(Map<String, Object> map) throws Exception { // 조회수 증가
		System.out.println("goodsHitCntDao=" + map);
		update("goods.goodsReadCntUp", map);
	}
	
	public void insertBasket(Map<String, Object> map) throws Exception { // 상품 디테일에서 장바구니 등록
		System.out.println("장바구니추가=" + map);
		insert("goods.insertBasket", map);
	}
	
	public void gumeListDelete(Map<String, Object> map) throws Exception { // 구매 리스트 초기화
		System.out.println("구매리스트 삭제:"+map);
		delete("goods.gumeListDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception { // 장바구니 시퀀스번호 가져오기
		System.out.println("selectBasketNo" + map);
		return (List<Map<String, Object>>) selectList("goods.selectBasketNo", map);
	}
	
}
