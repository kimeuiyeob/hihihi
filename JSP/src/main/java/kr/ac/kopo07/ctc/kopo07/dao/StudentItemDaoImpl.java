package kr.ac.kopo07.ctc.kopo07.dao;

import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo07.ctc.kopo07.domain.StudentItem;

public class StudentItemDaoImpl implements StudentItemDao {

	String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
	String user = "root";
	String pw = "1234";

	@Override
	public StudentItem create() {
		return null;
	}
	// ====================================================================

	@Override
	public int totalCount() {
		return 1000;
	}

//	====================================================================
	// 랜덤 학생 10명 넣기
	@Override
	public void insertRandomStudent10() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			int id = 0;
			ResultSet rset = stmt.executeQuery("select MAX(studentid) from twice");
			while (rset.next()) {
				id = rset.getInt(1);
			}
			if (id == 0) {
				id = 209900;
			}
			id++;
			String name = "";
			int kor;
			int eng;
			int mat;
			for (int i = 0; i <= 10; i++) {
				name = String.format("홍길동%02d", i);
				kor = (int) (Math.random() * 101);
				eng = (int) (Math.random() * 101);
				mat = (int) (Math.random() * 101);
				stmt.execute(
						"insert into twice value('" + name + "'," + id + "," + kor + "," + eng + "," + mat + ",null);");
				id++;
			}
			stmt.close();
			conn.close();
		} catch (Exception e) {
			;
		}
	}

//	====================================================================
	// 학생 한명 조회
	@Override
	public StudentItem selectOne(int id) {
		StudentItem studentItem = new StudentItem();
		Connection conn = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from twice where id=" + id + "");

			while (rset.next()) {
				studentItem.setName(rset.getString(1));
				studentItem.setStudentid(rset.getInt(2));
				studentItem.setKor(rset.getInt(3));
				studentItem.setEng(rset.getInt(4));
				studentItem.setMat(rset.getInt(5));
				studentItem.setId(rset.getInt(6));
			}

			conn.close();
			stmt.close();
			rset.close();

		} catch (Exception e) {
			System.out.println("회원 한명 조회 에러~~");
		}
		return studentItem;
	}

//	====================================================================

	@Override
	public List<StudentItem> selectAll(int page, int countPerPage) {
		return null;
	}

//	====================================================================
	// 학생 전부 가져오기
	@Override
	public List<StudentItem> selectAllStudent() {
		Connection conn = null;
		List<StudentItem> studentItemList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from twice order by studentid");

			while (rset.next()) {
				StudentItem studentItem = new StudentItem();

				studentItem.setName(rset.getString(1));
				studentItem.setStudentid(rset.getInt(2));
				studentItem.setKor(rset.getInt(3));
				studentItem.setEng(rset.getInt(4));
				studentItem.setMat(rset.getInt(5));
				studentItem.setId(rset.getInt(6));

				studentItemList.add(studentItem);
			}
			stmt.close();
			conn.close();
			rset.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("학생 전부 조회하기 에러");
		}
		return studentItemList;
	}

	// ====================================================================
	// 학생 삭제
	@Override
	public void deleteOne(int id) {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();

			stmt.executeUpdate("delete from twice where id =" + id + "");
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("학생 삭제 에러~~");
		}
	}

	// ====================================================================
	// 학생번호로 학생 한명 조회
	@Override
	public StudentItem selectOneByStudentId(int studentid) {
		Connection conn = null;
		StudentItem studentItem = new StudentItem();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from twice where studentid=" + studentid + "");

			while (rset.next()) {
				studentItem.setName(rset.getString(1));
				studentItem.setStudentid(rset.getInt(2));
				studentItem.setKor(rset.getInt(3));
				studentItem.setEng(rset.getInt(4));
				studentItem.setMat(rset.getInt(5));
				studentItem.setId(rset.getInt(6));
			}

			conn.close();
			stmt.close();
			rset.close();

		} catch (Exception e) {
			System.out.println("학생 번호로 학생 한명 조회 에러~~");
		}
		return studentItem;
	}

	// ====================================================================
	// 학생 한명 수정
	@Override
	public StudentItem update(StudentItem studentItem) {
		Connection conn = null;
		StudentItem oneStudent = studentItem;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();

			String QueryTxt = " ";
			QueryTxt = String.format("update twice set name='%s', kor='%s', eng='%s', mat='%s'  where id='%s';",
					studentItem.getName(), studentItem.getKor(), studentItem.getEng(), studentItem.getMat(),
					studentItem.getId());
			stmt.execute(QueryTxt);

			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("학생 수정 에러~~");
		}
		return oneStudent;
	}

	// ====================================================================
	// 테이블 생성
	@Override
	public void createTable() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();

			stmt.execute("drop table if exists twice;");
			stmt.execute("create table twice (name varchar(20), studentid int not null UNIQUE , "
					+ "kor int, eng int, mat int, id int not null auto_increment primary key)");

			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("테이블 생성 실패~~");
		}
	}

	// ====================================================================
	// 테이블 삭제
	@Override
	public void dropTable() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			stmt.execute("drop table twice");
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("테이블 삭제 실패~~");
		}
	}

	// ====================================================================
	// 학생 추가
	@Override
	public StudentItem insert(StudentItem oneStudent) {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();

			stmt.execute("insert into twice value('" + oneStudent.getName() + "'," + oneStudent.getStudentid() + ","
					+ oneStudent.getKor() + "," + oneStudent.getEng() + "," + oneStudent.getMat() + ",null);");

			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("학생 추가 에러~~");
		}
		return null;
	}

	// ====================================================================
	// 비어있는 학번 찾기
	@Override
	public int emptyStudentId() {
		Connection conn = null;
		int maxNumber = 0;
		int minNumber = 0;

		int newID = 0;
		int k = 0;
		List<Integer> studentList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select MAX(studentid),MiN(studentid) from twice");
			while (rset.next()) {
				maxNumber = rset.getInt(1);
				minNumber = rset.getInt(2);
			}
			ResultSet rset2 = stmt.executeQuery("select studentid from twice where studentid >= " + minNumber
					+ " and studentid <= " + maxNumber + ";");
			while (rset2.next()) {
				int num = rset2.getInt(1);
				studentList.add(num);
			}

			for (int i = 209900; i <= maxNumber; i++) {
				if ((i + 1) != studentList.get(k)) {
					newID = i + 1;
					break;
				} else {
					newID = maxNumber + 1;
				}
				k++;
			}
			maxNumber++;
			stmt.close();
			conn.close();
			rset.close();
			rset2.close();
		} catch (Exception e) {
		}
		return newID;
	}

	// ====================================================================
	// 등수 찾기
	public int getRank(int studentid) {
		Connection conn = null;
		int rank = 0;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(
					"select (select count(*) + 1 from twice " + "where (a.kor+a.eng+a.mat) < (kor + eng + mat))"
							+ " from twice as a where studentid = " + studentid);
			rset.next();
			rank = rset.getInt(1);
		} catch (Exception e) {
		}
		return rank;
	}

	// ====================================================================
	// 방문자 카운트
	public String countVisitor() {
		String data = "";
		int cnt = 0;
		try {
			FileReader fl = new FileReader("C:\\Users\\euiyeob\\Desktop\\csvFile\\visitor.txt");
			StringBuffer sb = new StringBuffer();
			int ch = 0;

			while ((ch = fl.read()) != -1) {
				sb.append((char) ch);
			}
			data = sb.toString().trim().replace("\n", "");
			fl.close();

			cnt = Integer.parseInt(data);
			cnt++;
			data = Integer.toString(cnt);

			FileWriter fl2 = new FileWriter("C:\\Users\\euiyeob\\Desktop\\csvFile\\visitor.txt");
			fl2.write(data);
			fl2.close();

		} catch (Exception e) {
			;
		}
		return data;
	}
}
