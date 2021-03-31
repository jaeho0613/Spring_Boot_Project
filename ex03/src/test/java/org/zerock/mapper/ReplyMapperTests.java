package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = { 1L, 2L, 3L, 4L, 5L };

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

//	@Test
	public void testCreate() {

		IntStream.rangeClosed(1, 10).forEach(i -> {

			ReplyVO vo = new ReplyVO();

			// 게시물의 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);

			mapper.insert(vo);
		});
	}

//	@Test
	public void testRead() {

		Long targetRno = 5L;

		ReplyVO vo = mapper.get(targetRno);

		log.info(vo);
	}

	public void testMapper() {
		log.info(mapper);
	}

//	@Test
	public void testDelete() {

		Long targetRno = 1L;

		mapper.delete(targetRno);
	}

//	@Test
	public void testUpdate() {

		Long targetRno = 10L;

		ReplyVO vo = mapper.get(targetRno);

		vo.setReply("Update Reply ");

		int count = mapper.update(vo);

		log.info("Update Count : " + count);
	}

	@Test
	public void testList() {

		Criteria cri = new Criteria();

		// 리스트
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);

		replies.forEach(reply -> log.info(reply));
	}

//	@Test
	public void testList2() {

		Criteria criteria = new Criteria(2, 10);

		// 327680L
		List<ReplyVO> replies = mapper.getListWithPaging(criteria, 327680L);
		System.out.println("Rplies Size : " + replies.size());

		replies.forEach(reply -> log.info(reply));
	}
}
