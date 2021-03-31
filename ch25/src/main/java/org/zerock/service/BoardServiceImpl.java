package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j

// @AllArgsConstructor 
// - 스프링 4.3 단일 파라미터를 받는 생성자의 경우
// - 필요한 파라미터를 자동으로 주입할 수 있습니다.
// - 모든 파라미터를 이용하는 생성자를 만든다.
public class BoardServiceImpl implements BoardService {

	// private BoardMapper mapper;

	// @AllArgsConstructor가 없을 경우
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("register.........." + board);

		mapper.insertSelectKey(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
			
		});

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
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		
		return attachMapper.findByBno(bno);
	}
}
