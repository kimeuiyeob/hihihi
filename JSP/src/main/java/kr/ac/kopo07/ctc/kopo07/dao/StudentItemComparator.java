package kr.ac.kopo07.ctc.kopo07.dao;

import java.util.Comparator;

import kr.ac.kopo07.ctc.kopo07.dto.StudentItemDto;

public class StudentItemComparator implements Comparator<StudentItemDto> {

	@Override
	public int compare(StudentItemDto o1, StudentItemDto o2) {
		if (o1.getSum() < o2.getSum()) {
			return 1;
		} else if (o1.getSum() > o2.getSum()) {
			return -1;
		}
		return 0;
	}
}
