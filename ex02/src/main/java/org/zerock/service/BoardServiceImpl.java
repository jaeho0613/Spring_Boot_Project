package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j

// @AllArgsConstructor 
// - 스프링 4.3 단일 파라미터를 받는 생성자의 경우
// - 필요한 파라미터를 자동으로 주입할 수 있습니다.
// - 모든 파라미터를 이용하는 생성자를 만든다.
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;

	// @AllArgsConstructor가 없을 경우
	// @Setter(onMethod_ = @Autowired)
	// private BoardMapper Mapper;

	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
