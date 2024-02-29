package item.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import item.dto.ItemDTO;

public class ItemDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public ItemDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "c##java", pwd = "1234";

			con = DriverManager.getConnection(url, id, pwd);

		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	public ArrayList<ItemDTO> viewitem() {
		String sql = "select*from item";
		ArrayList<ItemDTO> arr = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));

				arr.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return arr;

	}
	public int additem() {
		String sql = "insert into item(type, name, price) values(?, ?, ?)";
		Scanner sc = new Scanner(System.in);
		String type=null, nameN=null;
		int i=0, tN, priceN=0, result=0;
		ItemDTO dto = new ItemDTO();
		try {
			ps = con.prepareStatement(sql);
			while(true){
				while(true) {
					System.out.println("등록할 아이템의 종류를 선택해주세요");
					System.out.println("1.상의\n2.하의\n3.아우터\n4.신발\n5.종료");
					tN = sc.nextInt();
					
					switch(tN) {
					case 1 : type = "상의"; dto.setType(type); break;
					case 2 : type = "하의"; dto.setType(type); break;
					case 3 : type = "아우터"; dto.setType(type); break;
					case 4 : type = "신발"; dto.setType(type); break;
					case 5 : i++; break;
					default : System.out.println("잘못된 번호입니다. 다시 입력해주세요"); continue;
					}
					if(i==1)
						break;
					
					System.out.println("등록할 아이템의 이름을 입력해주세요");
					nameN = sc.next(); dto.setName(nameN);
					System.out.println("등록할 아이템의 가격을 입력해주세요");
					priceN = sc.nextInt(); dto.setPrice(priceN);
					

					ps.setString(1, type);
					ps.setString(2, nameN);
					ps.setInt(3, priceN);

					rs = ps.executeQuery();
					
					if(rs.equals(type) || rs.equals(nameN)) {
						break;
					}
				}
				result = ps.executeUpdate();
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return result;

	}
	public void moditem() {

	}
	public void delitem() {

	}

}
