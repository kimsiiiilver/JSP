package dao;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import Common.JDBConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBConnect {
	 
	public BoardDAO() {
		super();
	}
	
	
	//게시물의 개수 세기
	
	public int selectCount(String sel, String text) {   // 게시물 번호 사용을 위해 만듦
		int result=0;
		String query = "select count(*) from board";
		if (sel != null) {
			query += " where "+ sel +" like '%"+ text +"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs=stmt.executeQuery(query);   //실행
			rs.next();
			result = rs.getInt(1);
			
			System.out.println("게시물 개수 확인 성공");
		} catch (Exception e) {
			System.out.println("게시물 개수 확인 오류");
			e.printStackTrace();
		}
		
		return result;
	}

	// 게시물의 모든 내용 가져오기
	
	public List<BoardDTO> selectList(int start, String sel, String text) {
		List<BoardDTO> dto = new ArrayList<BoardDTO>();
		String query = "select * from board";
		if (sel != null) {
			query += " where "+ sel +" like '%"+ text +"%'";
		}
		query += " order by num desc";
		int limit = 0;
		
		try {
			stmt = con.createStatement();
			rs=stmt.executeQuery(query);
			rs.absolute(start-1);
			
			while(rs.next()) {
				BoardDTO bto = new BoardDTO();
				bto.setNum(rs.getString("num"));
				bto.setTitle(rs.getString("title"));
				bto.setContent(rs.getString("content"));
				bto.setId(rs.getString("id"));
				bto.setPostdate(rs.getString("postdate"));
				bto.setVisitcount(rs.getString("visitcount"));
				dto.add(bto);
				limit++;
				if(limit==20) {
					break;
				}
					
			}
			
			System.out.println("게시물 내용 가져오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 내용 가져오기 오류");
		}
	
		return dto;
	}
	
	//게시물 작성
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String query = "insert into board(title, content, id, postdate, visitcount) values(?,?,?,?,0)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPostdate());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 작성 성공");
		} catch (Exception e) {
			System.out.println("게시물 작성 오류");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	//게시글 세부내용 출력
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "select * from board join member on board.id = member.id where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
			System.out.println("세부내용 출력 성공");
		} catch (Exception e) {
			System.out.println("세부내용 출력 오류");
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	//조회수 증가
	public void updateVisitCount(String num) {
		String query = "update board set visitcount = visitcount + 1 where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
			
			System.out.println("조회수 증가 성공");
		} catch (Exception e) {
			System.out.println("조회수 증가 오류");
			e.printStackTrace();
		}
	}
	
	//게시물 수정
	public void EditBoard(String title, String content, String num) {
		String query = "update board set title=?, content=? where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, num);
			psmt.executeUpdate();
			
			System.out.println("게시물 수정 성공");
		} catch (Exception e) {
			System.out.println("게시물 수정 오류");
			e.printStackTrace();
		}
	}
	
	//게시물 삭제
	public void DeleteBoard(String num) {
		String query = "delete from board where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
			System.out.println("게시물 삭제 성공");
		} catch (Exception e) {
			System.out.println("게시물 삭제 오류");
			e.printStackTrace();
		}
		
	}
	
}
