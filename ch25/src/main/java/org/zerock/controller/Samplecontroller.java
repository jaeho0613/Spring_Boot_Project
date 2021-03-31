package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;

import javafx.scene.layout.VBox;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class Samplecontroller {

	// http://localhost:8080/sample/getText
	@GetMapping(value = "/getText", produces = "text/plain; charset=utf-8")
	public String getText() {
		log.info("Mime Type : " + MediaType.TEXT_PLAIN_VALUE);

		return "안녕하세요";
	}

	// http://localhost:8080/sample/getSample
	@GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public SampleVO getSample() {
		return new SampleVO(112, "스타", "로드");
	}

	// http://localhost:8080/sample/getSample2.json
	@GetMapping(value = "/getSample2")
	public SampleVO getSample2() {
		return new SampleVO(113, "로켓", "라쿤");
	}

	// http://localhost:8080/sample/getList.json
	@GetMapping(value = "/getList")
	public List<SampleVO> getList() {
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "First", i + " Last"))
				.collect(Collectors.toList());
	}

	// http://localhost:8080/sample/getMap.json
	@GetMapping(value = "getMap")
	public Map<String, SampleVO> getMap() {

		Map<String, SampleVO> map = new HashMap<String, SampleVO>();
		map.put("First", new SampleVO(111, "그루트", "주니어"));

		return map;
	}

	// http://localhost:8080/sample/check.json?height=160&weight=70
	@GetMapping(value = "/check", params = { "height", "weight" })
	public ResponseEntity<SampleVO> check(Double height, Double weight) {

		SampleVO vo = new SampleVO(0, "" + height, "" + weight);

		ResponseEntity<SampleVO> result = null;

		if (height < 150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}

		return result;
	}

	// http://localhost:8080/sample/product/outer/12354.json
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") String pid) {
		return new String[] { "category: " + cat, "productid: " + pid };
	}

	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {

		log.info("convert........ticket" + ticket);
		
		return ticket;
	}
}
