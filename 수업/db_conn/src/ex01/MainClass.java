package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

class DB_con{
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public DB_con() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클 기능 사용가능(드라이브 로드)");
			//18버전 이전 : xe, 19이상 : orcl
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "java";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("db 연결 성공 : "+con);
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> select() {
		String sql = "select * from member_test";
		ArrayList<MemberDTO> arr = new ArrayList<>();
		try {
			ps = con.prepareStatement( sql );
			rs = ps.executeQuery();
			while( rs.next() ) {
				MemberDTO dto = new MemberDTO();
				dto.setId( rs.getString("id") );
				dto.setPwd( rs.getString("pwd") );
				dto.setName( rs.getString("name") );
				dto.setAge( rs.getInt("age") );
				
				arr.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	public MemberDTO selectOne( String userId ) {
		String sql = 
			"select * from member_test where id='"+userId+"'";
		System.out.println( sql );
		MemberDTO dto = null;
		try {
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();
			if( rs.next() ) {
				dto = new MemberDTO();
				dto.setAge( rs.getInt("age") );
				dto.setId( rs.getString("id") );
				dto.setPwd(rs.getString("pwd") );
				dto.setName( rs.getString("name") );
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int delete(String delId) {
		String sql = "delete from member_test where id = ?";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, delId );
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int insert(MemberDTO dto) {
		String sql = 
		//"insert into member_test values('"+dto.getId()+"','"+dto.getPwd()+"')";
		"insert into member_test(id,pwd,name,age) values(?,?,?,?)";
		int result= 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId() );
			ps.setString(2, dto.getPwd() );
			ps.setString(3, dto.getName() );
			ps.setInt(4, dto.getAge() );
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("존재하는ididididi");
		}
		return result;
	}
}
public class MainClass {
public static void main(String[] args) {
	DB_con db = new DB_con();
	
	Scanner input = new Scanner(System.in);
	int num;
	while(true) {
		System.out.println("1.모든 목록 보기");
		System.out.println("2.특정 사용자 보기");
		System.out.println("3.데이터 추가");
		System.out.println("4.데이터 삭제");
		System.out.print(">>> : ");
		num = input.nextInt();
		switch(num) {
		case 1:
			ArrayList<MemberDTO> arr = db.select();
			System.out.println("--main---");
			for(MemberDTO dto : arr) {
				System.out.println("id : "+dto.getId());
				System.out.println("pwd : "+dto.getPwd() );
				System.out.println("name : "+dto.getName());
				System.out.println("age : "+dto.getAge());
				System.out.println("--------------");
			}
			break;
		case 2:
			System.out.println("검색 id 입력");
			String userId = input.next();
			MemberDTO dto = db.selectOne( userId );
			System.out.println("dto : "+dto);
			if( dto== null )
				System.out.println("존재하지 않는 id입니다!!");
			else {
				System.out.println("--- 검색 결과 ---");
				System.out.println("id : "+dto.getId() );
				System.out.println("pwd : "+dto.getPwd() );
				System.out.println("name : "+dto.getName() );
				System.out.println("age : "+dto.getAge() );
			}
			break;
		case 3:
			MemberDTO d = new MemberDTO();
			while(true) {
				System.out.println("가입할 id 입력");
				d.setId( input.next() );
				MemberDTO dd = db.selectOne( d.getId() );
				if( dd == null )
					break;
				System.out.println("존재하는 id..다시 입력..");
			}
			
			System.out.println("가입할 pwd 입력");
			d.setPwd( input.next() );
			System.out.println("가입할 name 입력");
			d.setName( input.next() );
			System.out.println("가입할 age 입력");
			d.setAge( input.nextInt() );
			
			int res = db.insert( d );
			if(res == 1)
				System.out.println("회원가입 성공!!!");
			else
				System.out.println("존재하는 id는 안됨!!!!");
			
			break;
		case 4:
			System.out.println("삭제 id 입력");
			String delId = input.next();
			int re = db.delete(delId);
			if(re == 1) {
				System.out.println("삭제 성공!!!!");
			}else {
				System.out.println("존재하지 않는 아이디 삭제 불가!!!");
			}
			break;
		}
	}
	
	
}
}












