package service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<Map<String, String>> selectBoardList();
	
	Map<String, String> selectBoard();
	
	int insertBoard(Map<String, String> hm);
	
	int deleteBoard(Map<String, String> hm);
	
	int updateBoard(Map<String, String> hm);
}
