package service;

import kr.ac.kopo07.ctc.kopo07.dto.Pagination;
import kr.ac.kopo07.ctc.kopo07.service.StudentItemDaoMock;
import kr.ac.kopo07.ctc.kopo07.service.StudentItemService;
import kr.ac.kopo07.ctc.kopo07.service.StudentItemServiceImpl;

// junit 테스트
public class StudentItemServiceTest {

	public static void main(String[] args) {

		StudentItemDaoMock studentItemDao = new StudentItemDaoMock();
		StudentItemService studentItemService = new StudentItemServiceImpl();
		studentItemService.setStudentItemDao(studentItemDao);
		Pagination pagination = studentItemService.getPagination(1, 10);

	}
}
