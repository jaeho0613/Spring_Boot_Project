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

		log.info("register.........." + board);

		mapper.insertSelectKey(board);

	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get...........");

		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify..............");

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...............");

		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		log.info("getList...........");

		return mapper.getList();
	}

}
