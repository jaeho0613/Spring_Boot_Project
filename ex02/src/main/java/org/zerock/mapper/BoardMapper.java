package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {

	// @Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();

	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	// 정상적으로 데이터가 삭제되면 = 1
	// 해당 번호의 게시물이 없다면 = 0
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
}
