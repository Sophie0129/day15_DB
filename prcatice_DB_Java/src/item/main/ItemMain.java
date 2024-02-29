package item.main;

import java.util.Scanner;

import item.service.ItemServiceImpl;

public class ItemMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		ItemServiceImpl is = new ItemServiceImpl();
		while(true) {
			System.out.println("필요한 서비스 번호를 입력해주세요");
			System.out.println("1.아이템 전체 보기\n2.아이템 추가\n3.아이템 수정\n4.아이템 삭제");
			num = sc.nextInt();

			switch (num) {
			case 1: is.viewItem(); break;
			case 2: is.addItem(); break;
			case 3: //is.modItem(); break;
			case 4: //is.delItem(); break;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요");
				continue;
			}
		}
	}
}
//논리연산자 ||(or) 하나라도 참이면 참(모두가 거짓일때만 거짓),  &&(and) 하나라도 거짓이면 거짓(모두가 참일때만 참)