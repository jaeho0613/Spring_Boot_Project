package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

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

	// ====================================Binding================================================//

	// 파라미터를 받을 때 최초 실행 됨
	// @InitBinder
	// - DTO의 @DateTimeFormat 설정이 없는 경우 사용
	public void initBinder(WebDataBinder binder) {
		System.out.println("initBinder!! : " + binder.getObjectName());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}

	// Paramter의 날짜 정보를 저장함
	// http://localhost:8080/sample/ex03?title=test?&dueDate=2021-03-12 ->
	// DateTimeFormat이 없는 경우
	// http://localhost:8080/sample/ex03?title=test?&dueDate=2021/03/12 ->
	// DateTimeFormat이 있는 경우
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo: " + todo);
		return "ex03";
	}

	// ====================================Model================================================//

	// page는 Bean에 저장 되지 않는다.
	// http://localhost:8080/sample/ex04?name=aaa&age=10&page=9
	// @GetMapping("/ex04")
	// public String ex04(SampleDTO dto, int page) {
	//
	// log.info("dto: " + dto);
	// log.info("page: " + page);
	//
	// return "/sample/ex04";
	// }

	// 위와 다르게 @ModelAttribute 사용하여 전달 받은 parameter를 다시 넘겨줌.
	// - get set이 없는 parameter를 사용할 때 용이함.
	// http://localhost:8080/sample/ex04?name=aaa&age=10&page=9
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {

		log.info("dto: " + dto);
		log.info("page: " + page);

		return "/sample/ex04";
	}

	// ====================================Return
	// 타입================================================//

	// Return Void
	// - 해당 URL의 경로를 그대로 jsp 파일의 이름으로 사용할 때 사용
	// http://localhost:8080/sample/voidEx05
	@GetMapping("/voidEx05")
	public void voidEx05() {
		log.info("/voidEx05.............");
	}

	// Return String
	// - 상황에 따라 다른 화면을 보여줄 경우 유용함.
	// http://localhost:8080/sample/stringEx05?page=1
	@GetMapping("/stringEx05")
	public String stringEx05(@ModelAttribute("page") int page) {

		// 넘어온 parameter에 따라 다른 return값을 줄 수 있다.
		log.info("/stringEx05..............");

		if (page == 0) {
			return "stringEx05/page0";
		} else if (page == 1) {
			return "stringEx05/page1";
		} else {
			return "stringEx05/page2";
		}
	}

	// Return VO, DTO
	// - 복합적인 데이터가 들어간 리턴 타입의 경우 주로 JSON 데이터를 만들어 내는 용도로 사용
	// - *Jackson-datbind 라이브러리 필수
	// http://localhost:8080/sample/ex06
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06..............");

		SampleDTO dto = new SampleDTO();
		dto.setAge(26);
		dto.setName("정재호");

		return dto;
	}

	// Return ResponseEntity
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {
		log.info("/ex07................");

		// {"name": "정재호"}
		String msg = "{\"name\": \"정재호\"}";

		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");

		return new ResponseEntity<String>(msg, header, HttpStatus.OK);
	}
}
