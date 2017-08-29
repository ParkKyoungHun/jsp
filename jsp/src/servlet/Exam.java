package servlet;

import java.util.HashMap;

public class Exam {
	String str;
	public int insertBoard(HashMap hm) {
		System.out.println(hm.get("title") + "저장");
		System.out.println(hm.get("content") + "저장");
		System.out.println(hm.get("writer") + "저장");
		System.out.println("정상적으로 디비에 저장되었습니다.");
		return 0;
	}
	
	public static void main(String[] args) {
		Exam e = new Exam();
		String title= "게시판 제목";
		String content = "게시판 내용";
		String writer = "글쓴이";
		HashMap hm = new HashMap();
		hm.put("title", title);
		hm.put("content", content);
		hm.put("writer", writer);
		e.insertBoard(hm);
	}
}
