package kr.ac.kopo07.ctc.kopo07.dao;

import java.util.List;

import kr.ac.kopo07.ctc.kopo07.domain.StudentItem;

public interface StudentItemDao {

	// ========crud========

	StudentItem create();

	StudentItem selectOne(int id);
	
	int totalCount();

	List<StudentItem> selectAll(int page, int countPerPage);
	
	//페이지 없이 학생전부 조회 => 나중에 위랑 결합시켜야함!!
	List<StudentItem> selectAllStudent();

	// update();

	// delete

}
