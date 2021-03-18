package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	private String title;
	
	// - InitBinder를 사용하지 않고 DTO에서 제어할 수 도 있다.
	// http://localhost:8080/sample/ex03?title=test?&dueDate=2021/03/12
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dueDate;
}
