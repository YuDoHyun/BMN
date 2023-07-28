package com.bob.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bob.goods.vo.GoodsVO;
import com.bob.goods.vo.ImageFileVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
	
	public List<GoodsVO> allGoodsList(GoodsVO goodsVO) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;
}
