package item.service;

import java.util.ArrayList;
import java.util.Scanner;

import item.dao.ItemDAO;
import item.dto.ItemDTO;

public class ItemServiceImpl implements ItemService{
	private ItemDAO dao;
	public ItemServiceImpl() {
		dao = new ItemDAO(); 
	}
	
	@Override
	public void viewItem() {
		System.out.println("아이템 목록 보기");
		ArrayList<ItemDTO> items = dao.viewitem();
		if(items.size() == 0) {
			System.out.println("등록된 아이템이 없습니다.");
		}else {
			for(ItemDTO d : items) {
				System.out.println("종류 : "+d.getType());
				System.out.println("이름 : "+d.getName());
				System.out.println("가격 : "+d.getPrice());
				System.out.println("--------------------");
			}
		}
	}
	@Override
	public void addItem() {
		System.out.println("아이템 추가 모드");
		int add = dao.additem();
		if(add >= 1) {
			System.out.println("아이템이 등록되었습니다");
		}else {
			System.out.println("같은 종류의 같은 이름 상품이 있습니다");
			System.out.println("종류나 이름을 수정해 주세요");
			dao.additem();
		}	
	}
	@Override
	public void modItem() {
		System.out.println("아이템 수정 모드");
		
	}
	@Override
	public void delItem() {
		System.out.println("아이템 삭제 모드");
		
	}
}
