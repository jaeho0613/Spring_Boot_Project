package org.zerock.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	// 여러개의 Method 요청을 받고 싶을 때
	// http://localhost:8080/sample/basic
	@RequestMapping(value = "/basic", method = { RequestMethod.GET, RequestMethod.POST })
	public void basicGet() {
		log.info("basic...................");
	}

	// 한개의 Method 요청을 받을 때
	// http://localhost:8080/sample/basicOnlyGet
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only get.........");
	}

	// DTO 변수를 자동으로 채워줌
	// - 이전 JSP/Servlet의 request.getParameter()를 사용하지 않아도 됨
	// - 자동으로 형을 맞춰 줌
	// http://localhost:8080/sample/ex01?name=AAA&age=11
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info("" + dto);

		return "ex01";
	}

	// - Parameter를 원하는 형으로 정하고 싶을 때
	// - Parameter의 이름과 DTO의 변수명이 다를 때
	// http://localhost:8080/sample/ex02?name=AAA&age=11
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {

		log.info("name: " + name);
		log.info("age: " + age);

		return "ex02";
	}

	// 리스트 처리
	// - 동일한 이름의 파라미터가 있을 경우
	// http://localhost:8080/sample/ex02List?ids=111&ids=222&ids=333&ids=111
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {

		log.info("ids: " + ids);

		return "ex02List";
	}

	// 배열 처리
	// - 리스트와 동일
	// http://localhost:8080/sample/ex02Array?ids=111&ids=222&ids=333&ids=111
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {

		log.info("ids: " + Arrays.toString(ids));

		return "ex02Array";
	}

	// DTO 객체의 리스트 처리
	// - 여러개의 DTO객체를 처리할 수 있다.
	// - [ = %5B
	// - ] = %5D
	// http://localhost:8080/sample/ex02Bean?list%5B0%5D.name=aaa&list%5B1%5D.name=bbb&list%5B2%5D.name=ccc&

	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {

		log.info("list dtos: " + list);

		return "ex02Bean";
	}
}
