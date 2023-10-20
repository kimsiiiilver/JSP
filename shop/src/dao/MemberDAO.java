package dao;

import Common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO() {
		super();
	}
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pw=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setPhotoName(rs.getString(6));
			}
		} catch (Exception e) {
			System.out.println("db연결실패");
		}
		return dto;
		
	}
	public void addDTO(String id, String name, String pass, String phone, String address, String photoName) {
		String sql= "insert into member values(?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, pass);   
			psmt.setString(4, phone);   
			psmt.setString(5, address);  
			psmt.setString(6, photoName);   // 사용준비
			
			psmt.executeUpdate();
			System.out.println("회원 추가 성공");
		} catch (Exception e) {
			System.out.println("회원 추가 실패");
			e.printStackTrace(); // 오류 정보 띄워줌
		}
		
	}
	public void deleteDTO(String id) {
		String sql = "delete from member where id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteDTO실패");
		}
		
	
}
	public void editDTO(String id, String name, String pass, String phone, String address) {
		String sql = "update member set name=?, pw=?, phone=?, address=? where id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, pass);
			psmt.setString(3, phone);
			psmt.setString(4, address);
			psmt.setString(5, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("editDTO실패");
			e.printStackTrace();
		}
		
		
		
	}
	}
	
	
	
	
	

