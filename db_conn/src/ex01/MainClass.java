package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

class DB_con{
	private Connection con; //연결 객체
	private PreparedStatement ps; //데이터 베이스 명령어 전송
	private ResultSet rs; //데이터 저장
	public DB_con() {

		try {//처음에 초기화 해줘야함
			Class.forName("oracle.jdbc.driver.OracleDriver"); // DB의 기능을 불러온다.
			System.out.println("오라클 기능 사용 가능(드라이브 로드)");

			//18q버전 이하 :xe, 19버전 이상 :orcl
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "c##java";
			String pwd = "1234";

			con = DriverManager.getConnection(url, id, pwd);//오라클이랑 연결
			System.out.println("db 연결 성공 : "+con);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//자바프로젝트에서 설정 > 빌드패스 > 라이브러리 > 모듈패스 선택하고 > 외부 추가 > ojdbc8.jar 추가 > 확인 
	//모듈 인포에도 추가해주어야하는데 자동추가하는 기능이 있다. 찾아서 요약해놓을것
	//자바프로젝트에서 컨피그 > 모듈인포 생성 - 자동으로 추가해줌
	//	exports ex01; requires java.sql; 두개가 필요했는데 첫번째것만 자동입력해줌

	public ArrayList<MememberDTO> select() { //DAO에 들어갈 메소드
		String sql = "select*from member_test";
		ArrayList<MememberDTO> arr = new ArrayList<>();
		try { 
			ps = con.prepareStatement(sql);//전송 객체
			rs = ps.executeQuery();//전송객체 실행
			//System.out.println(rs.next());
			while(rs.next()) {
				MememberDTO dto = new MememberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));

				arr.add(dto);
			}
			/*
			System.out.println(rs.getString("id"));
			System.out.println(rs.getString("pwd"));
			System.out.println(rs.getString("name"));
			System.out.println(rs.getInt("age"));
			System.out.println("----------------------"); //DAO에서는 직접 출력하지는 않는다

			System.out.println(rs.next());
			System.out.println(rs.getString("id"));
			System.out.println(rs.getString("pwd"));
			System.out.println(rs.getString("name"));
			System.out.println(rs.getInt("age"));

			System.out.println(rs.next());
			System.out.println(rs.getString("id"));
			System.out.println(rs.getString("pwd"));
			System.out.println(rs.getString("name"));
			System.out.println(rs.getInt("age"));

			System.out.println(rs.next());
			System.out.println(rs.getString("id"));
			System.out.println(rs.getString("pwd"));
			System.out.println(rs.getString("name"));
			System.out.println(rs.getInt("age"));
			 */
		}catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	public MememberDTO selectOne(String userId) {
		String sql = "select*from member_test where Id='"+userId+"'";
		//DB에서는 문자를 작은따옴표로 묶어서 그게 없으면 오류남
		System.out.println(sql);
		MememberDTO dto = null; //이프문이 실행되지 않으면 dto는 null값이다
		try {
			ps = con.prepareStatement(sql); //트라이-캐치로 묶어줘야함
			rs = ps.executeQuery();
			//while(rs.next()) { //1개만 찾는거라 반복문이 필요없고 보통 이프문으로 한다
			if(rs.next()) {
				dto = new MememberDTO();
				dto.setAge(rs.getInt(("age")));
				dto.setId(rs.getString("id"));
				dto.setId(rs.getString("pwd"));
				dto.setId(rs.getString("name"));
				/*
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("pwd"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getInt("age"));
				 */
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int insert(MememberDTO dto) {
		String sql = 
				//"insert into member_test values('"+dto...)"
				"insert into member_test(id, pwd, name, age) values(?,?,?,?)";  //물음표도 순차적으로
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setInt(4, dto.getAge()); //테이블의 컬럼 순서대로 넣어야 함

			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void modify() {
		
	}
	public int delete(String delId) {
		String sql = "delete from member_test where Id=?";//나중에 값을 채운다는 의미의 ? // 완성된것은 아님
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, delId); //괄호 첫자리는 물음표의 위치(물음표가 여러개일수도 있으니까), 두번째값이 물음표에 넣을 값
			result = ps.executeUpdate();//값이 있으면 1, 없으면 0 \
			//DB에서 있는값을 지우면 1행이 삭제되었다고 하고, 없는값을 지우면 0행이 삭제되었다고 함 그값이 돌아오는것
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}

public class MainClass {
	public static void main(String[] args) {
		DB_con db = new DB_con();

		Scanner sc = new Scanner(System.in);
		int num;
		while(true) {
			System.out.println("1.모든 목록 보기");
			System.out.println("2.특정 사용자 보기");
			System.out.println("3.데이터 추가");
			System.out.println("4.데이터 수정");
			System.out.println("5.데이터 삭제");
			System.out.println(">>> : ");
			num = sc.nextInt();
			switch (num) {
			case 1: 
				ArrayList<MememberDTO> arr = db.select();
				System.out.println("--main--");
				for(MememberDTO dto : arr) {
					System.out.println("id : "+dto.getId());
					System.out.println("pwd : "+dto.getPwd());
					System.out.println("name : "+dto.getName());
					System.out.println("age : "+dto.getAge());
					System.out.println("-------------");
				}
				break;
				
			case 2: 
				System.out.println("검색 id 입력");
				String userId = sc.next();
				MememberDTO dto = db.selectOne(userId);
				System.out.println("dto : "+dto);
				if(dto == null) {
					System.out.println("존재하지 않는 id입니다");
				}else {
					System.out.println("---검색결과---");
					System.out.println("id : "+dto.getId());
					System.out.println("pwd : "+dto.getPwd());
					System.out.println("name : "+dto.getName());
					System.out.println("age : "+dto.getAge());
				}
				break;
				
			case 3:
				MememberDTO d = new MememberDTO();
				while(true) {
					System.out.println("가입할 id 입력");
					d.setId(sc.next());
					MememberDTO dd = db.selectOne(d.getId());
					if(dd == null)
						break;
					System.out.println("존재하는 id..다시 입력..");
				}
				
				System.out.println("가입할 id 입력");
				d.setId( sc.next());
				System.out.println("가입할 pwd 입력");
				d.setPwd( sc.next());
				System.out.println("가입할 name 입력");
				d.setName( sc.next());
				System.out.println("가입할 age 입력");
				d.setAge(sc.nextInt());
				
				int res = db.insert(d);
				if (res == 1) {
					System.out.println("회원가입 성공");
				}else {
					System.out.println("존재하는 아이디입니다.");
				}
				break;
				
			case 4: 
				System.out.println("수정 id 입력");
				String modId = sc.next();
				//MememberDTO d = new modify();
				
				break;
				
			case 5: 
				System.out.println("삭제 id 입력");
				String delId = sc.next();
				int re = db.delete(delId);
				if(re == 1) {
					System.out.println("삭제 성공");
				}else {
					System.out.println("존재하지 않는 아이디는 삭제할 수 없습니다.");
				}
				break;
			}
		}
	}
}